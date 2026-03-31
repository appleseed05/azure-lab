#################################
### F5 XC SMSv2 site creation ###
#################################

resource "volterra_securemesh_site_v2" "tf_f5xc_smsv2-site-name" {
  name                    = var.f5xc_smsv2-site-name
  namespace               = "system"
  block_all_services      = false
  logs_streaming_disabled = true
  enable_ha               = false

  labels = {
    "ves.io/provider" = "ves-io-AZURE"
  }

  re_select {
    geo_proximity = true
  }

  azure {
    not_managed {}
  }
  tunnel_type = "SITE_TO_SITE_TUNNEL_SSL"
  # in json view of console => "tunnel_type": "SITE_TO_SITE_TUNNEL_SSL"
}


##############################
### F5 XC SMSv2 site token ###
##############################

resource "volterra_token" "tf_f5xc_smsv2-site-token" {
  depends_on = [volterra_securemesh_site_v2.tf_f5xc_smsv2-site-name]
  name       = var.f5xc_smsv2-site-token
  namespace  = "system"
  type       = 1
  site_name  = volterra_securemesh_site_v2.tf_f5xc_smsv2-site-name.name
}

###########################
### F5 XC CE Cloud Init ###
###########################

# original token in cloud-init config data:
# token: ${replace(volterra_token.tf_f5xc_smsv2-site-token.id, "id=", "")}

data "cloudinit_config" "tf_f5xc_ce-config" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content = yamlencode({
      write_files = [
        {
          path        = "/etc/vpm/user_data"
          permissions = "0644"
          owner       = "root"
          content     = <<-EOT
            token: "${trimprefix(volterra_token.tf_f5xc_smsv2-site-token.id, "id=")}"
          EOT
        }
      ]
    })
  }
}
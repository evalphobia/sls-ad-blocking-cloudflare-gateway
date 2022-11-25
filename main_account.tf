resource "cloudflare_teams_account" "main" {
  account_id = var.cloudflare_account_id

  block_page {
    enabled          = true
    name             = "Block"
    header_text      = "This website is blocked by Cloudflare Gateway"
    footer_text      = "Ask to your internet owner"
    logo_path        = "https://www.cloudflare.com/img/cf-facebook-card.png"
    background_color = "#faccfa"
  }

  antivirus {
    enabled_download_phase = true
    enabled_upload_phase   = false
    fail_closed            = false
  }

  proxy {
    tcp = true
    udp = true
  }

  logging {
    redact_pii = true
    settings_by_rule_type {
      dns {
        log_all    = true
        log_blocks = false
      }
      http {
        log_all    = true
        log_blocks = false
      }
      l4 {
        log_all    = true
        log_blocks = false
      }
    }
  }

  activity_log_enabled = true
  tls_decrypt_enabled  = false
}

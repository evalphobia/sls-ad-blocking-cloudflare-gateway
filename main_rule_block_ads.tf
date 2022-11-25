resource "cloudflare_teams_rule" "block_ads" {
  account_id = var.cloudflare_account_id

  name        = "Block Ads"
  description = "Block Ads domains"

  enabled    = true
  precedence = 11

  # Block domain belonging to lists (defined below)
  filters = ["dns"]
  action  = "block"
  traffic = local.ad_filter

  rule_settings {
    block_page_enabled = false
  }

}

resource "cloudflare_teams_list" "domain_list" {
  account_id = var.cloudflare_account_id

  for_each = {
    for i in range(0, local.list_count) :
    i => element(local.aggregated_lists, i)
  }

  name  = "domain_list_${each.key}"
  type  = "DOMAIN"
  items = each.value
}

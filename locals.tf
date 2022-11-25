locals {
  # The full path of the list holding the domain list
  domain_list_file = "${path.module}/assets/adaway_list.txt"

  # Parse the file and create a list, one item per line
  domain_list = split("\n", file(local.domain_list_file))

  # Remove empty lines
  domain_list_clean = [for x in local.domain_list : x if x != ""]

  # Use chunklist to split a list into fixed-size chunks
  # It returns a list of lists
  aggregated_lists = chunklist(local.domain_list_clean, 1000)

  # Get the number of lists (chunks) created
  list_count = length(local.aggregated_lists)

  # Iterate through each domain_list resource and extract its ID
  domain_lists = [for k, v in cloudflare_teams_list.domain_list : v.id]

  # Format the values: remove dashes and prepend $
  domain_lists_formatted = [for v in local.domain_lists : format("$%s", replace(v, "-", ""))]

  # Create filters to use in the policy
  ad_filters = formatlist("any(dns.domains[*] in %s)", local.domain_lists_formatted)
  ad_filter  = join(" or ", local.ad_filters)
}


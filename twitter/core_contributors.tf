variable "hashicorp_core_contributors" {
  type = list(object({
    name        = string,
    description = string,
    members     = list(string),
  }))

  default = [
    {
      name        = "HashiCorp Core Contributors 2022"
      description = "A list of @HashiCorp Core Contributors for 2022. More information on hashicorp.com/ambassadors."

      members = [
        "DefolosDC",
        "DenysVitali",
        "Drewmullen",
        "JasonThe42nd",
        "Mathew_Est",
        "TiernanNV",
        "_shishir_m",
        "achubatiuk",
        "aristosvo",
        "attachmentgenie",
        "chenrui",
        "ddymko",
        "eltociear",
        "griffithsgrant",
        "ibisakh",
        "micahhenning",
        "minamijoyo",
        "mrkaran_",
        "nishkrishh",
        "nozaq",
        "shantanugadgil",
        "survivant",
        "teddylear",
        "tenthirtyam",
        "towe751",
        "vlazarenko",
        "wgjordan",
      ]
    }
  ]
}

# see https://registry.terraform.io/providers/paultyng/twitter/latest/docs/resources/list
resource "twitter_list" "hashicorp_core_contributors" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for list in var.hashicorp_core_contributors :
    list.name => list
  }

  name        = each.value.name
  mode        = "public"
  description = each.value.description
  members     = each.value.members
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "hashicorp_core_contributors_lists" {
  value = toset([for list in twitter_list.hashicorp_core_contributors : "${var.base_url}${list.uri}"])
}

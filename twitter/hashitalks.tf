variable "hashitalks" {
  type = list(object({
    name        = string,
    description = string,
    members     = list(string),
  }))

  default = [
    {
      name        = "HashiTalks: America Latina (2021)"
      description = "Speakers and contributors of HashiTalks: America Latina (2021)."

      members = [
        "aminespinoza",
        "alexisworking",
        "gnuowned",
        "joatmon08",
        "katiereese317",
        "mariogmd",
        "patoarvizu",
        "rmasabela",
        "yurynino",
      ]
    },
    {
      name        = "HashiTalks: Build (2021)"
      description = "Speakers and contributors of HashiTalks: Build (2021)."

      members = [
        "_shishir_m",
        "_spox",
        "amrtns",
        "arcdigital",
        "ASomesan",
        "bflad",
        "DSchmidt1992",
        "devopsjacquie",
        "enmand",
        "ericsmalling",
        "evanphx",
        "foobly",
        "HansHasselberg",
        "herrjulz",
        "im2nguyen",
        "JColeMorrison",
        "jcudit",
        "joatmon08",
        "jrasell",
        "JudithPatudith",
        "katiereese317",
        "ksatirli",
        "kmruddy",
        "kylepenfound",
        "marycutrali",
        "mildwonkey",
        "mr_paul_banks",
        "onlydole",
        "paddycarver",
        "phillebaba",
        "pst418",
        "stmcallister",
        "sweetpavement",
        "ThatMightBePaul",
        "tombuildsstuff",
        "tr0njavolta",
        "vlazarenko",
        "wilkenrivera",
        "YellsOld",
      ]
    }
  ]
}

# see https://registry.terraform.io/providers/paultyng/twitter/latest/docs/resources/list
resource "twitter_list" "hashitalks" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for list in var.hashitalks :
    list.name => list
  }

  name        = each.value.name
  mode        = "public"
  description = each.value.description
  members     = each.value.members
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "hashitalks_lists" {
  value = toset([for list in twitter_list.hashitalks : "${var.base_url}${list.uri}"])
}

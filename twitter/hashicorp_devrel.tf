variable "hashicorp_folks" {
  type = list(object({
    name        = string,
    description = string,
    members     = list(string),
  }))

  default = [
    {
      name        = "HashiCorp DAs and TCMs"
      description = "(current / former) developer advocates and community folks at @HashiCorp."

      members = [
        "amierchery",
        "build1point0",
        "christi3k",
        "c_r_w",
        "devops_rob",
        "devopsjacquie",
        "devopsjono",
        "erikveld",
        "HeddaMeow",
        "JColeMorrison",
        "joatmon08",
        "justinklztr",
        "katiereese317",
        "ksatirli",
        "nicolerenee3810",
        "onlydole",
        "sethvargo",
        "sheriffjackson",
        "SoFetchPhoto",
        "SolutionGeek",
        "tracypholmes",
        "XanderGrzy",
      ]
      }, {
      name        = "HashiCorp Education",
      description = "(current / former) edu folks at @HashiCorp.",

      members = [
        "acidprime",
        "classicwebdog",
        "derekstrickland",
        "DevRelChap",
        "im2nguyen",
        "JudithPatudith",
        "KendallStraut",
        "Lisa_Spooner",
        "robinnorwood",
        "suchwinston",
        "topfunky",
      ]
    }
  ]
}

# see https://registry.terraform.io/providers/paultyng/twitter/latest/docs/resources/list
resource "twitter_list" "hashicorp" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for list in var.hashicorp_folks :
    list.name => list
  }

  name        = each.value.name
  mode        = "public"
  description = each.value.description
  members     = each.value.members
}

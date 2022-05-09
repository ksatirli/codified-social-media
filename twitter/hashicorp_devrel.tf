variable "hashicorp_folks" {
  type = list(object({
    name        = string,
    description = string,
    members     = list(string),
  }))

  default = [
    {
      name        = "HashiCorp Community Team"
      description = "current Community Team folks at @HashiCorp."

      members = [
        "amierchery",
        "c_r_w",
        "dev_hulk",
        "devops_rob",
        "erikveld",
        "HeddaMeow",
        "JColeMorrison",
        "joatmon08",
        "jrsyo",
        "justinklztr",
        "ksatirli",
        "sheriffjackson",
        "SoFetchPhoto",
        "SolutionGeek",
        "white_jaz",
      ]
    }, {
      name        = "frm. HashiCorp Community"
      description = "former Community Team folks at @HashiCorp."
      members = [
        "build1point0",
        "christi3k",
        "devopsjacquie",
        "devopsjono",
        "katiereese317",
        "nicolerenee3810",
        "onlydole",
        "sethvargo",
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

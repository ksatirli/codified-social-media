# see https://registry.terraform.io/providers/paultyng/twitter/latest/docs/resources/list
resource "twitter_list" "hashicorp_das" {
  name = "HashiCorp DAs and TCMs"
  mode = "public"

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
    "heddameow",
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
}

# see https://registry.terraform.io/providers/paultyng/twitter/latest/docs/resources/list
resource "twitter_list" "hashicorp_edueng" {
  name = "HashiCorp Education Engineers"
  mode = "public"

  description = "(current / former) edu engineering folks at @HashiCorp."

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

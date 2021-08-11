resource "twitter_list" "hashicorp_das" {
  name = "HashiCorp DAs"
  mode = "public"

  description = "(current and former) developer advocates and community folks at @HashiCorp."

  members = [
    "JColeMorrison",
    "SoFetchPhoto",
    "SolutionGeek",
    "XanderGrzy",
    "build1point0",
    "christi3k",
    "devops_rob",
    "devopsjacquie",
    "devopsjono",
    "erikveld",
    "joatmon08",
    "katiereese317",
    "ksatirli",
    "nicolerenee3810",
    "onlydole",
    "sethvargo",
    "sheriffjackson",
    "tracypholmes"
  ]
}

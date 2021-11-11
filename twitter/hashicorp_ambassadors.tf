variable "hashicorp_ambassadors" {
  type = list(object({
    name        = string,
    description = string,
    members     = list(string),
  }))

  default = [
    {
      name        = "HashiCorp Ambassadors 21"
      description = "A list of @HashiCorp Ambassadors for 2021. More information on hashicorp.com/ambassadors."

      members = [
        "AdinErmie",
        "AmoweO",
        "Andrey9kin",
        "BhadaniPradeep",
        "CloudRss",
        "DevlinDuldulao",
        "DojoWithRenan",
        "GaryFlynnAU",
        "GreenReedTech",
        "HoussemDellai",
        "IaaSgeek",
        "JayQDe",
        "JoshArmi",
        "LachieWhite7",
        "LucyDavinhart",
        "LukeOrellana",
        "MentalAbduction",
        "MichaelCade1",
        "MijailR",
        "MikaelKrief",
        "Ned1313",
        "RebeccaFitzhugh",
        "RiaanNolan",
        "RoberthTweets",
        "ScottJWinkler",
        "SebbyCorp",
        "SysNet4ADM",
        "TheAprilEdwards",
        "TheNJDevOpsGuy",
        "_MarkoB",
        "anthonyspiteri",
        "antonbabenko",
        "bbaassssiiee",
        "btkrausen",
        "carlosrbcunha",
        "ch4mbr4s",
        "cloudposse",
        "coldbrewah",
        "danielbryantuk",
        "devopsv",
        "gmaentz",
        "gmusumeci",
        "gomex",
        "harsh_thakur_1",
        "homelaber",
        "jakewalsh90",
        "jantytgat",
        "jonnyshare",
        "karthik_prabu13",
        "kitenco1",
        "kymidd",
        "marcosnils",
        "mariogmd",
        "markg_msft",
        "mehdilaruelle",
        "mpoore",
        "mrlesmithjr",
        "nosceon",
        "nwoyesamuelc",
        "olufuwatayo",
        "patoarvizu",
        "pdtit",
        "phillipsj73",
        "redmind",
        "richburroughs",
        "riferrei",
        "rk",
        "rkleijwegt",
        "ryapric",
        "sarki247",
        "thiagonache",
        "tom_howarth",
        "tomtucka",
        "trentrosenbaum",
        "virtualhobbit",
      ]
      }, {
      name        = "HashiCorp Ambassadors 20"
      description = "A list of @HashiCorp Ambassadors for 2020. More information on hashicorp.com/ambassadors."

      members = [
        "AdinErmie",
        "BhadaniPradeep",
        "CloudRss",
        "IaaSgeek",
        "LachieWhite7",
        "LucyDavinhart",
        "MichaelCade1",
        "MikaelKrief",
        "Ned1313",
        "RebeccaFitzhugh",
        "ScottJWinkler",
        "SoFetchPhoto",
        "TheAprilEdwards",
        "anthonyspiteri",
        "antonbabenko",
        "bbaassssiiee",
        "btkrausen",
        "cloudposse",
        "coldbrewah",
        "danielbryantuk",
        "devops_rob",
        "gmusumeci",
        "gurayops",
        "harsh_thakur_1",
        "homelaber",
        "jruizjimenez",
        "karthik_prabu13",
        "katiereese317",
        "kikolanikola",
        "ksatirli",
        "kymidd",
        "martaarcones",
        "mehdilaruelle",
        "mrlesmithjr",
        "nwoyesamuelc",
        "patoarvizu",
        "phillipsj73",
        "ravsau",
        "redmind",
        "richburroughs",
        "rkleijwegt",
        "tom_howarth",
        "trentrosenbaum",
        "virtualhobbit",
      ]
    }
  ]
}

# see https://registry.terraform.io/providers/paultyng/twitter/latest/docs/resources/list
resource "twitter_list" "hashicorp_ambassadors" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for list in var.hashicorp_ambassadors :
    list.name => list
  }

  name        = each.value.name
  mode        = "public"
  description = each.value.description
  members     = each.value.members
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "hashicorp_ambassadors_lists" {
  value = toset([ for list in twitter_list.hashicorp_ambassadors : "${var.base_url}${list.uri}" ])
}

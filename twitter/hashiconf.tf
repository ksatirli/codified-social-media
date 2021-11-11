variable "hashiconf" {
  type = list(object({
    name        = string,
    description = string,
    members     = list(string),
  }))

  default = [
    {
      name        = "HashiConf Digital 21"
      description = "@HashiConf Digital (Global 2021) Speakers."

      members = [
        "_MarkoB",
        "acburdine",
        "btkrausen",
        "danielevazzola",
        "davidmcj",
        "davidyu_io",
        "evanphx",
        "HashiConf",
        "iamhantzo",
        "icalvn",
        "jazzyfreshcodes",
        "JeffDillonOps",
        "jezhalford",
        "kristalozada",
        "marcjleblanc",
        "mclaughlinct",
        "mengesb",
        "mgaffney",
        "mitchellh",
        "naaman",
        "PhilipSautter",
        "phinze",
        "preethaa",
        "robbiethng",
        "sheriffjackson",
      ]
      }, {
      name        = "HashiConf Digital (EU 21)"
      description = "@HashiConf Digital (Europe 2021) Speakers."

      members = [
        "austingebauer",
        "BeenzSyed",
        "blakecova",
        "build1point0",
        "devarshishah3",
        "devops_rob",
        "foobly",
        "HashiConf",
        "hgmnz",
        "jefferai",
        "jimlambrt",
        "jrasell",
        "kevholditch",
        "kmruddy",
        "LucyDavinhart",
        "mildwonkey",
        "MordorBernd",
        "pianotpot",
        "ppacent",
        "rustbeltrae",
        "sarki247",
        "sheriffjackson",
        "tracey_pooh"
      ]
    }
  ]
}

# see https://registry.terraform.io/providers/paultyng/twitter/latest/docs/resources/list
resource "twitter_list" "hashiconf" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for list in var.hashiconf :
    list.name => list
  }

  name        = each.value.name
  mode        = "public"
  description = each.value.description
  members     = each.value.members
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "hashiconf_lists" {
  value = toset([ for list in twitter_list.hashiconf : "${var.base_url}${list.uri}" ])
}

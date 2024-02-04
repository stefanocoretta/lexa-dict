#let dict(contents) = {
  for (entry, value) in contents [
    *#value.entry* /#value.phon/ #box(width: 1em)
    #emph[#value.part_of_speech]
    #let has_infl = value.at("inflectional_features", default: false)
    #if has_infl != false [(#value.inflectional_features.class)]
    #let sense_i = 1
    #for (i, y) in value.senses {
      box(
        // circle(fill: black, radius: 2pt),
        sym.circle.filled,
        inset: (left: 5pt, right: 2pt)
      ) + strong(str(sense_i) + ". ")
      y.definition
      " "
      sense_i = sense_i + 1
    }
    
  ]
}

#align(center)[
  #text(size: 30pt, weight: "bold")[A Thale dictionary]

  #text(size: 15pt, weight: "bold")[Stefano Coretta]
]

#v(40pt)

#show: doc => columns(2, doc)

#dict(
  yaml("lexicon.yaml")
)
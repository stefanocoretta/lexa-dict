#let dict(contents) = {
  show "noun": [n]
  show "verb": [v]
  show "adjective": [adj]
  show "adverb": [adv]
  show "particle": [ptc]
  show "numeral": [num]

  // Typeset each entry
  for (entry, value) in contents [
    // entry and phon
    *#value.entry* /#value.phon/ #box(width: 1em)
    // pos
    #emph[#value.part_of_speech]
    // inflectional classes
    #let has_infl = value.at("inflectional_features", default: false)
    #if has_infl != false [
      #show "reme": it => smallcaps()[r]
      #show "lapy": it => smallcaps()[l]
      (#value.inflectional_features.class)
    ]
    // senses
    #let senses_n = value.senses.len()
    #let sense_i = 1
    #for (i, y) in value.senses {
      // just insert the sense without numeric idx
      // if only one sense
      if senses_n == 1 {
        box(
          sym.circle.filled,
          inset: (left: 5pt, right: 2pt)
        )
        " " + y.definition
      } else {
        box(
          // circle(fill: black, radius: 2pt),
          sym.circle.filled,
          inset: (left: 5pt, right: 2pt)
        ) + strong(str(sense_i) + ". ")
        y.definition
        " "
        sense_i = sense_i + 1
      }
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
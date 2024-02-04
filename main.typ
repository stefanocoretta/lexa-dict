#let dict(contents) = {
  // define abbreviations
  show "noun": [n.]
  show "verb": [v.]
  show "adjective": [adj.]
  show "adverb": [adv.]
  show "particle": [ptc.]
  show "numeral": [num.]

  // Typeset each entry
  for (entry, value) in contents [
    // lexeme
    #let has_hom = value.at("homophone", default: false)
    #strong()[#value.entry#if has_hom != false [#sub()[#value.homophone]]]
    // phonetic/phonemic transcription
    #text(font: "Fira Sans", size: 0.8em)[/#value.phon/]
    // horizontal space between lexeme/phon and rest
    #box(width: 0.5em)
    //
    // senses
    #let senses_n = value.senses.len()
    #let sense_i = 1
    #for (i, y) in value.senses {
      // just insert the sense without numeric idx
      // if only one sense
      if senses_n > 1 {
        "• " + strong(str(sense_i) + ". ")
        sense_i = sense_i + 1
      }
      // pos
      text(fill: blue, style: "italic")[#value.part_of_speech]
      //
      // inflectional classes
      let has_infl = value.at("inflectional_features", default: false)
      if has_infl != false [
        // define classes abbreviations and styling
        #show "reme": it => smallcaps()[r]
        #show "lapy": it => smallcaps()[l]
        (#text(fill: maroon)[#value.inflectional_features.class])
      ]
      y.definition + " "
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
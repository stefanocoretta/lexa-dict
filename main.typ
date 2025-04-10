#let dict(contents) = {
  // define abbreviations
  show "noun": [n.]
  show "verb": [v.]
  show "adjective": [adj.]
  show "adverb": [adv.]
  show "particle": [ptc.]
  show "numeral": [num.]

  let graphemes = (
    "a", "ai", "au", "e", "ei", "o", "y",
    "p", "hp", "t", "ht", "k", "hk", "'",
    "f", "th", "s", "sh", "h",
    "m", "n", "l", "r"
  )

  let graphemes_regex = regex("^(" + graphemes.sorted(key: it => -it.len()).join("|") + ")")

  let grapheme_dict = (:)

  for g in graphemes {
    grapheme_dict.insert(g, (:))
  }

  // Extract initial grapheme from word
  let initial_grapheme(entry) = {
    let lower = lower(entry)
    lower.find(graphemes_regex)
  }

  // Create dictionary with graphemes as keys
  for (id, item) in contents {
    let entry_grapheme = initial_grapheme(item.entry)

    grapheme_dict.at(entry_grapheme).insert(item.id, item)
  }

  for (grapheme, entry_list) in grapheme_dict [

    // Grapheme heading
    #heading[#upper(grapheme)]

    // Typeset each entry in grapheme
    #for (entry, value) in entry_list [
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

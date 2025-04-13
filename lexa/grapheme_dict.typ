#let create_grapheme_dict(contents, graphemes) = {
  // Create regex from grapheme list.
  let graphemes_regex = regex("^(" + graphemes.sorted(key: it => -it.len()).join("|") + ")")

  // Initialise grapheme_dict. This will contain all the dictionary entries, grouped by
  // initial grapheme.
  let grapheme_dict = (:)

  for g in graphemes {
    grapheme_dict.insert(g, (:))
  }

  // Extract initial grapheme from word
  let initial_grapheme(entry) = {
    let lower = lower(entry)
    lower.find(graphemes_regex)
  }

  // Create dictionary object with graphemes as keys
  for (id, item) in contents {
    let entry_grapheme = initial_grapheme(item.entry)

    grapheme_dict.at(entry_grapheme).insert(item.id, item)
  }

  return grapheme_dict
}

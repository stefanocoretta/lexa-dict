// Customise the graphemes array with the list of graphemes in the language.
// The order of the graphemes in the array will be the order of sections in
// the dictionary.
// 
// MULTI-GRAPHEMES: If the language has graphemes made up of more than one character and you wish for
// them to be grouped separately, you can add them. 
// 
// TODO: As of now, only the sections are ordered, but not the items within the sections.

#let graphemes = (
  "a", "i", "u",
  "p", "t", "s", "th", "k"
)

// Import the lexa module
#import "lexa/lexa.typ": *

// Document-wide settings
// Set page numbering
#set page(numbering: "1")

// Title and author
#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 40pt,
)[
  #text(size: 40pt)[*A Thale dictionary*]\
  
  #text(size: 15pt)[Stefano Coretta]
]

// Typeset the dictionary
#dict(
  // The yaml file with the dictionary entries.
  // This file must follow the Lexa lexicon schema.
  // See https://stefanocoretta.github.io/lexa/articles/database-schema.html
  yaml("lexicon.yaml")
)

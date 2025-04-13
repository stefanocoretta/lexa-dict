#import "lexa/lexa.typ": *

#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 40pt,
)[
  #text(size: 40pt)[*A Thale dictionary*]\
  
  #text(size: 15pt)[Stefano Coretta]
]

#dict(
  yaml("lexicon.yaml")
)

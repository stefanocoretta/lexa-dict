#import "lexa.typ": *

#align(center)[
  #text(size: 30pt, weight: "bold")[A Thale dictionary]

  #text(size: 15pt, weight: "bold")[Stefano Coretta]
]

#v(40pt)

#show: doc => columns(2, doc)

#dict(
  yaml("lexicon.yaml")
)

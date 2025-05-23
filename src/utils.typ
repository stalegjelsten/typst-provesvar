#let svarUtil(it, flereAvsnitt: false, noUnderline: false, paddingISvarboks: 0.7em, doubleLinePadding: 0.4em, dobbelUnderstrek: true) = {
  let paddingLeft = paddingISvarboks
  if (flereAvsnitt) {
    paddingLeft = -marg + paddingISvarboks
  }
  if (noUnderline or dobbelUnderstrek == false) {
    rect(
      it,
      fill: color.hsl(0deg, 0%, 98.5%),
      inset: (left: paddingLeft, top: paddingISvarboks, right: paddingISvarboks, bottom: 1.5 * paddingISvarboks),
      radius: 0.3em,
      stroke: 0.8pt + gray,
      width: 100%,
    )
  } else {
    rect(
      underline(underline(text(it), offset: doubleLinePadding * 0.6, stroke: 0.3pt), offset: 0.4 * doubleLinePadding, stroke: 0.3pt),
      fill: color.hsl(0deg, 0%, 98.5%),
      inset: (left: paddingLeft, top: paddingISvarboks, right: paddingISvarboks, bottom: 1.5 * paddingISvarboks),
      radius: 0.3em,
      stroke: 0.8pt + gray,
      width: 100%,
    )
  }
}

#let eksempel(it) = {
  block([ #align(right, text(strong("Eksempel"), size: 1.2em, fill: color.hsv(220deg, 100%, 46%)))
  #block(it, above: -0.6em)], fill: color.hsv(220deg, 6%, 100%), radius: 3pt, stroke: (1pt + black), inset: 5pt, width: 100%)
}

#let kbd(it) = context {
  set text(fill: rgb("#1f2328"))
  let r = 3pt
  box(fill: rgb("#f6f8fa"), stroke: rgb("#d1d9e0b3"), outset: (y: r), inset: (x: r), radius: r, raw(it))
}

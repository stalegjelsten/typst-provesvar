#let prove(
  fag: "2PY",
  tittel: "Terminprøve",
  elev: "Kari Nordmann",
  marg: 1cm,
  padding: 0.4em,
  deloppgaveNivaa: (2, 3),
  spraak: "nb",
  dato: datetime.today(),
  doc,
) = {

  set par(justify: true)
  set text(lang: spraak)

  // make links stand out a bit
  show link: it => {
    underline(text(it, fill: color.hsv(220deg, 100%, 40%)), stroke: (dash: "dotted"))
  }

  // typst will pick the first available font from the list
  show math.equation: set text(font: ("Libertinus Math", "New Computer Modern Math"))

  // double underlines of display math
  show math.equation.where(label: <s>).and(math.equation.where(block: true)): it => {
    math.underline(math.underline(math.display(it)))
  }

  // double underline hack by using box for inline math
  show math.equation.where(label: <s>).and(math.equation.where(block: false)): it => {
    box(box(it, stroke: (bottom: 0.3pt), outset: (bottom: 0.4 * padding)), stroke: (bottom: 0.3pt), outset: (bottom: 0.6 * padding))
  }

  // pads an element by marg amount from the left margin
  let padElem(it) = context {
    let lastHeads = query(selector(heading).before(here()))
    if lastHeads.len() > 0 {
      if deloppgaveNivaa.any(it => { it == lastHeads.at(-1).level }) {
        pad(it, left: marg)
      } else {
        it
      }
    } else {
      it
    }
  }


  // hack to change all decimal points to decimal commas
  show math.equation: it => {
    show regex("\d+\.\d+"): num => num.text.replace(".", ",")
    it
  }

  // pads text below level deloppgaveNivaa headings with `innrykk` amount
  show par: it => padElem(it)
  show rect: it => padElem(it)
  show image: it => padElem(it)
  show list: it => padElem(it)
  show math.equation.where(block: true): it => padElem(it)
  show figure: it => context {
    let lastHeads = query(selector(heading).before(here()))
    if lastHeads.len() > 0 {
      if deloppgaveNivaa.any(it => { it == lastHeads.at(-1).level }) {
        it.body
        pad(it.caption, left: marg)
      } else {
        it
      }
    } else {
      it
    }
  }

  // moves the content below headings.where(level: delOppgaveNivaa) up to the same level as the heading
  // this makes it seem like the content is to the right of the heading
  let combined = if deloppgaveNivaa.len() > 1 {
    deloppgaveNivaa
    .slice(1, deloppgaveNivaa.len())
    .fold(
      heading.where(level: deloppgaveNivaa.at(0)),
      (acc, lvl) => acc.or(heading.where(level: lvl)),
    )
  } else {
    heading.where(level: deloppgaveNivaa.at(0))
  }

  show combined: it => {
    block(it, below: -measure(it.body).height)
  }

  /* Set metadata */
  set document(title: [#fag - #tittel], author: elev, date: dato)

  /* Set up page numbering and continued page headers */
  set page(
    numbering: "1",
    header: context {
      let venstreJustering = 0cm
      let lastHeads = query(selector(heading).before(here()))
      if lastHeads.len() > 0 {
        if (deloppgaveNivaa.any(it => { it == lastHeads.at(-1).level })) {
          venstreJustering = -marg
        }
      }
      if (counter(page).get().first() > 1) [
        #set text(style: "italic")
        #h(venstreJustering) #fag -- #tittel
        #h(1fr)
        #elev
        #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
      ]
    },
  )

  /* Add numbering and some color to code blocks */
  show raw.where(block: true): it => {
    block(width: 100% - 0.5em, radius: 0.3em, stroke: luma(30%), inset: 1em, fill: luma(95%))[
      #show raw.line: l => context {
        box(width: measure([#it.lines.last().count]).width, align(right, text(fill: luma(70%))[#l.number]))
        h(0.5em)
        l.body
      }
      #it
    ]
  }

  /* Make the title */
  align(
    center,
    {
      text(size: 1.6em, weight: "bold")[#fag -- #tittel \ ]
      text(size: 1.2em, weight: "semibold")[#elev \ ]
      emph[
        #dato.display("[day].[month].[year]")
      ]
      box(line(length: 100%, stroke: 1pt))
    },
  )

  doc
}

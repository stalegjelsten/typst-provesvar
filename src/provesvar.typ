#import "utils.typ": svarUtil, eksempel, kbd

#let prove(
  subject: "2PY",
  title: "Terminprøve",
  student: "Kari Nordmann",
  margin: 1cm,
  padding: 0.4em,
  subProblemLevels: (2, 3),
  language: "nb",
  fontSize: 11pt,
  doubleUnderline: true,
  date: datetime.today(),
  makeTitle: true,
  showHeaderText: true,
  doc,
) = {
  set par(justify: true)
  set text(lang: language, size: fontSize)

  // make links stand out a bit
  show link: it => {
    underline(text(it, fill: color.hsv(220deg, 100%, 40%)), stroke: (dash: "dotted"))
  }

  // typst will pick the first available font from the list
  show math.equation: set text(font: ("Libertinus Math", "New Computer Modern Math"))

  // double underlines of display math
  show math.equation.where(label: <s>).and(math.equation.where(block: true)): it => {
    if (doubleUnderline) {
      math.underline(math.underline(math.display(it)))
    } else {
      it
    }
  }

  // double underline hack by using box for inline math
  show math.equation.where(label: <s>).and(math.equation.where(block: false)): it => {
    if (doubleUnderline) {
      box(
        box(it, stroke: (bottom: 0.3pt), outset: (bottom: 0.4 * padding)),
        stroke: (bottom: 0.3pt),
        outset: (bottom: 0.6 * padding),
      )
    } else {
      it
    }
  }

  // pads an element by marg amount from the left margin
  let padElem(it) = context {
    let lastHeads = query(selector(heading).before(here()))
    if lastHeads.len() > 0 {
      if subProblemLevels.any(it => { it == lastHeads.at(-1).level }) {
        pad(it, left: margin)
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
      if subProblemLevels.any(it => { it == lastHeads.at(-1).level }) {
        it.body
        pad(it.caption, left: margin)
      } else {
        it
      }
    } else {
      it
    }
  }

  // this selector select all headings in deloppgaveNivaa
  let combined = if subProblemLevels.len() > 1 {
    subProblemLevels
    .slice(1, subProblemLevels.len())
    .fold(
      heading.where(level: subProblemLevels.at(0)),
      (acc, lvl) => acc.or(heading.where(level: lvl)),
    )
  } else {
    heading.where(level: subProblemLevels.at(0))
  }

  // moves the content below headings.where(level: delOppgaveNivaa) up to the same level as the heading
  // this makes it seem like the content is to the right of the heading
  // these might need adjustment according to the font chosen
  show combined: it => {
    if (it.at("level") == 2) {
      block(it, below: ( -2 * measure(it.body).height + fontSize - 1.2pt))
    } else if (it.at("level") == 1) {
      block(it, below: ( -2 * measure(it.body).height + fontSize + 1.7pt))
    } else if (it.at("level") >= 3) {
      block(it, below: ( -2 * measure(it.body).height + fontSize - 4pt))
    }
  }

  /* Set metadata */
  set document(title: [#subject - #title], author: student, date: date)

  /* Set up page numbering and continued page headers */
  set page(
    numbering: "1",
    header: context {
      if (showHeaderText) {
        let leftAdjustment = 0cm
        let lastHeads = query(selector(heading).before(here()))
        if lastHeads.len() > 0 {
          if (subProblemLevels.any(it => { it == lastHeads.at(-1).level })) {
            leftAdjustment = -margin
          }
        }
        if (counter(page).get().first() > 1) [
          #set text(style: "italic")
          #h(leftAdjustment) #subject -- #title
          #h(1fr)
          #student
          #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
        ]
      }
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
  if (makeTitle) {
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
  }

  /* Proceed with rest of document */

  doc
}

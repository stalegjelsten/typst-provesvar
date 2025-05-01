#let prove(
  klasse: "2PY",
  tittel: "Terminprøve",
  elev: "Kari Nordmann",
  innrykk: 1cm,
  deloppgaveNivaa: (2, 3),
  spraak: "nb",
  dato: datetime.today(),
  // subproblems: "1a i",
  doc,
) = {
  /* Problem + subproblem headings */
  // set heading(
  //   numbering: (..nums) => {
  //     nums = nums.pos()
  //     if (nums.len() == 1) {
  //       [#nums.at(0)]
  //     } else if (nums.len() > 1 and nums.len() < 4) { [] } else if (nums.len() == 4) {
  //       numbering(subproblems, nums.at(0), nums.at(3))
  //     } else if (nums.len() == 5) {
  //       numbering(subproblems, nums.at(0), nums.at(3), nums.at(4))
  //     } else {
  //       numbering(subproblems, ..nums)
  //     }
  //   },
  // )


  set par(justify: true)
  set text(lang: spraak)


  show math.equation.where(label: <s>).and(math.equation.where(block: true)): it => {
    math.underline(math.underline(text(it)))
  }

  show math.equation.where(label: <s>).and(math.equation.where(block: false)): it => {
    math.underline(math.underline(text(it)))
  }

  show math.equation: it => {
    // show regex("\d+\.\d+"): num => {
    //   show ".": math.class("normal", ",")
    //   num
    // }
    show regex("\d+\.\d+"): num => num.text.replace(".", ",")
    it
  }

  // pads text below level 2 headings with `innrykk` amount
  show par: it => context {
    let lastHeads = query(selector(heading).before(here()))
    if lastHeads.len() > 0 {
      if deloppgaveNivaa.any(it => { it == lastHeads.at(-1).level }) {
        pad(it, left: innrykk)
      } else {
        it
      }
    } else {
      it
    }
  }

  show rect: it => context {
    let lastHeads = query(selector(heading).before(here()))
    if lastHeads.len() > 0 {
      if deloppgaveNivaa.any(it => { it == lastHeads.at(-1).level }) {
        pad(it, left: innrykk)
      } else {
        it
      }
    } else {
      it
    }
  }

  show image: it => context {
    let lastHeads = query(selector(heading).before(here()))
    if lastHeads.len() > 0 {
      if deloppgaveNivaa.any(it => { it == lastHeads.at(-1).level }) {
        pad(it, left: innrykk)
      } else {
        it
      }
    } else {
      it
    }
  }

  show figure: it => context {
    let lastHeads = query(selector(heading).before(here()))
    if lastHeads.len() > 0 {
      if deloppgaveNivaa.any(it => { it == lastHeads.at(-1).level }) {
        it.body
        pad(it.caption, left: innrykk)
      } else {
        it
      }
    } else {
      it
    }
  }

  show math.equation.where(block: true): it => context {
    let lastHeads = query(selector(heading).before(here()))
    if lastHeads.len() > 0 {
      if deloppgaveNivaa.any(it => { it == lastHeads.at(-1).level }) {
        pad(it, left: innrykk)
      } else {
        it
      }
    } else {
      it
    }
  }

  // moves the content below headings.where(level: delOppgaveNivaa) up to the same level as the heading
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
  set document(title: [#klasse - #tittel], author: elev, date: dato)

  /* Set up page numbering and continued page headers */
  set page(
    numbering: "1",
    header: context {
      let venstreJustering = 0cm
      let lastHeads = query(selector(heading).before(here()))
      if lastHeads.len() > 0 {
        if (deloppgaveNivaa.any(it => { it == lastHeads.at(-1).level })) {
          venstreJustering = -innrykk
        }
      }
      if (counter(page).get().first() > 1) [
        #set text(style: "italic")
        #h(venstreJustering) #klasse -- #tittel
        #h(1fr)
        #elev
        #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
      ]
    },
  )


  /* Add numbering and some color to code blocks */
  show raw.where(block: true): it => {
    block(width: 100% - 0.5em, radius: 0.3em, stroke: luma(50%), inset: 1em, fill: luma(98%))[
      #show raw.line: l => context {
        box(width: measure([#it.lines.last().count]).width, align(right, text(fill: luma(50%))[#l.number]))
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
      text(size: 1.6em, weight: "bold")[#klasse -- #tittel \ ]
      text(size: 1.2em, weight: "semibold")[#elev \ ]
      emph[
        #dato.display("[day].[month].[year]")
      ]
      box(line(length: 100%, stroke: 1pt))
    },
  )


  doc
}

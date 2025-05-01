#let prove(
  class: "S2",
  title: "PSET 0",
  student: "Alyssa P. Hacker",
  date: datetime.today(),
  subproblems: "1a i",
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

  // i want to
  // - select the previous heading
  // - if not level 2: return. Else:
  // - 
  // - select all elements from this heading to the next heading
  //


  show par: it => context {
    let lastHeadSelector = selector(heading).before(here())
    let nextHeadSelector = selector(heading).after(here())


    // if ((lastHeadSelector != none) and (nextHeadSelector != none)) {
    //   let parSelector = selector(par).after(lastHeadSelector).before(nextHeadSelector)
    // }


    // query that selector (context implies location = here())
    let prevHeading = query(lastHeadSelector)
    let nextHeading = query(nextHeadSelector)

    let countPrev = prevHeading.len()

    // if ((prevHeading.len() > 0) and (nextHeading.len() > 0)) {
    //   let paragraphsInSection = query(selector(par).after(prevHeading.location()).before(nextHeading.location()))
    // }

    // grab the immediately preceding heading (or `none` if none)
    if (prevHeading.len() == 0) {
      it
    } else {
      let last = prevHeading.last()

      let firstColumn = ""

      if (prevHeading.len() > 1) {
        let secondToLastHeading = prevHeading.at(-2)
        if secondToLastHeading.body.text != last.body.text {
          firstColumn = last.body
        }
      } else if (prevHeading.len() == 1) {
        let firstColumn = last.body
      }

      // if it was an H3, indent:
      if last.level == 2 {
        // pad(left: 0.5in, it)
        // let headY = last.location().position().y
        // let parY = here().position().y
        // let dy = headY - parY
        let lastHeadingText = last.body.text

        grid(
          columns: (2em, 1fr),
          stroke: 1pt + red,
          align: start,
          column-gutter: 1.5em,
          heading(firstColumn, level: 2), it,
        )

        // block(inset: 8pt, it)
        // move(it, dx: 0.5in, dy: dy + 0.14em)
      } else if last.level == 3 {
        pad(left: 1in, it)
      } else {
        it
      }
    }
  }

  show heading.where(level: 2): it => context {
    let lastHeadSelector = selector(heading).before(here())

    let prevHeading = query(lastHeadSelector)

    // grab the immediately preceding heading (or `none` if none)
    if (prevHeading.len() == 0) {
      it
    } else {
      let last = prevHeading.last()

      let firstColumn = "test"

      if (prevHeading.len() > 1) {
        let secondToLastHeading = prevHeading.at(-2)
        if secondToLastHeading.body.text != last.body.text {
          firstColumn = last.body
        }
      } else if (prevHeading.len() == 1) {
        firstColumn = last.body
      }

      firstColumn
    }
  }


  /* Set metadata */
  set document(title: [#class - #title], author: student, date: date)

  /* Set up page numbering and continued page headers */
  set page(
    numbering: "1",
    header: context {
      if counter(page).get().first() > 1 [
        #set text(style: "italic")
        #class -- #title
        #h(1fr)
        #student
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
      text(size: 1.6em, weight: "bold")[#class -- #title \ ]
      text(size: 1.2em, weight: "semibold")[#student \ ]
      emph[
        #date.display("[year]-[month]-[day]")
      ]
      box(line(length: 100%, stroke: 1pt))
    },
  )


  doc
}

#import "@local/provesvar:0.1.0": prove


/* Endre på variablene i de neste 8 linjene */
#let fag = "S2"
#let elevNavn = "Kari Nordmann"
#let dokumentTittel = "Testprøve"
#let deloppgaveNivaaer = (4, 7)
#let dobbelUnderstrek = true
#let spraak = "nb"
#let dato = datetime.today()
#let marg = 1cm

/* ======== Her fra trenger du ikke endre noe ======== */
#let paddingISvarboks = 0.7em
#let doubleLinePadding = 0.4em
#let fontSize = 11pt

#show: prove.with(
  fag: fag,
  elev: elevNavn,
  tittel: dokumentTittel,
  deloppgaveNivaa: deloppgaveNivaaer,
  spraak: spraak,
  marg: marg,
  padding: doubleLinePadding,
  fontSize: fontSize,
  dato: datetime.today(),
)

#let svar(it, flereAvsnitt: false, noUnderline: false) = {
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


/* ======== Her begynner dokumentet ditt ↓ ======== */

= Oppgave 1
Overskriften *Oppgave 1* er en overskrift med nivå 1. Avsnitt som hører til under en slik overskrift ser normale ut, og de bruker hele bredden av arket.

==== 1a
Overskriften *1a* er en overskrift på nivå 2. Da skyves innholdet ut mot høyre slik at det er enkelt for sensor å følge med på hvilken deloppgave du svarer på.

Her er kommer utregninger, forklaringer og bilder, mens selve svaret på oppgaven skrives i en egen boks med dobbel understreking ved å skrive #raw("#svar[$f(x)$<s> har nullpunkt i $x = 2$<s>]", lang: "typ"). Resultatet vil se ut som dette ↓

#svar[$f(x)$<s> har nullpunkt i $x=2$<s>]

==== 1b
Her fortsetter vi på oppgave *1b*…
#svar(noUnderline: true)[$ I(x) = x dot p = x dot ( -100 ln ( x/300 ))  = underline(underline(-100x ln ( x/300 ))) $]

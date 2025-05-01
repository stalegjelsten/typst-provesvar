#import "provemal.typ": prove

#show: prove.with(
  klasse: "S2",
  elev: "Ståle Gjelsten",
  tittel: "Terminprøve",
  innrykk: 1cm,
  deloppgaveNivaa: (3, 4),
  spraak: "nb",
  dato: datetime.today(),
)

#let svar(it) = {
  rect(
    underline(underline(text(it)), offset: 2pt),
    fill: color.hsl(0deg, 0%, 98.5%),
    inset: 1em,
    radius: 0.5em,
    stroke: 1pt + gray,
    width: 100%,
  )
}

= Del 1
Something something infinitesimals something something. We can then define the derivative as the limit of the difference quotient as $Delta x arrow 0$:
$ lim_(Delta x arrow 0) (f(x + Delta x) - f(x)) / (Delta x). $<s>

== Oppgave 1
=== 1a

Hva skal vi si ?

#svar[#lorem(24)]

#figure(image("image.png", width: 50%), caption: [Her viser vi])

$ underline(underline(x^2 + integral_(-1)^2)) f(x) d x forall x in [2,4] $

#lorem(50)

==== 1a i

#lorem(50)

#lorem(100)

=== 1b
La oss se hva

= Oppgave
#lorem(50)

== 2b

#lorem(20)

#svar[svaret på denne oppgaven er $2x+3$<s>
  sdafjlasd fjkl
  asdfljkødasf løkas]

= Oppgave 3
$ F(31)=3.21 $<s>

= Dokumentasjon
== Typst syntaks
- `$2x dot 3y +3$` gir $2x dot 3y +3$
- `$ 2x+3 $`
- OBS! Hvis man skal skrive to variabler rett etter hverandre (implisitt multiplikasjon), for eksempel $x y$, så er man nødt til å ha et mellomrom mellom hver variabel: `$x y$`. Det er for å unngå konflikter med innbygde funksjoner i Typst.

== To streker under svar
- I matteformler skriver du `<s>` rett etter formelen slik som `$ 2x+3 $<s>`
- I tekst så skriver du `#svar[Her kommer svaret ditt]`

== Formatere tall
- I dette dokumentet er det en funksjon som gjør om alle desimaltall skrevet i mattemodus med desimalpunktum til tall med desimalkomma. Hvis du skriver `$6.31$` får du altså $6.31$. Hvis du skriver `$6,31$` så vil du få $6,31$ (med et stygt mellomrom som vi ønsker å unngå).

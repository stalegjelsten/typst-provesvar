#import "@local/provesvar:0.1.0": prove, eksempel, kbd, svarUtil

/* Endre på variablene i de neste 8 linjene */
#let fag = "Prøvesvar"
#let elevNavn = "Ståle Gjelsten"
#let dokumentTittel = "Dokumentasjon"
#let deloppgaveNivaaer = (4, 5)
#let dobbelUnderstrek = true
#let spraak = "nb"
#let dato = datetime.today()
#let marg = 1cm

/*  
* Dokumentasjon på bruk av Prøvesvar ligger på
* https://github.com/stalegjelsten/typst-provesvar/docs/readme.pdf
*/  

/* ======== 👇 Herfra trenger du ikke endre noe 👇 ======== */
#let paddingISvarboks = 0.7em
#let doubleLinePadding = 0.4em
#let fontSize = 11pt
#let makeTitle = false
#let showHeaderText = false

#show: prove.with(
  subject: fag,
  student: elevNavn,
  title: dokumentTittel,
  subProblemLevels: deloppgaveNivaaer,
  language: spraak,
  margin: marg,
  padding: doubleLinePadding,
  doubleUnderline: dobbelUnderstrek,
  fontSize: fontSize,
  makeTitle: makeTitle,
  showHeaderText: showHeaderText,
  date: dato, 
)

#let svar(it, noUnderline: false) = {
  svarUtil(it, noUnderline: noUnderline, paddingISvarboks: paddingISvarboks, dobbelUnderstrek: dobbelUnderstrek, marg: marg)
}
/* ======== 👆 Ikke endre på dette 👆 ======== */

/* ======== 👇 Her begynner dokumentet ditt 👇 ======== */

= Oppgave 1
Overskriften *Oppgave 1* er en overskrift med nivå 1. Avsnitt som hører til under en slik overskrift ser normale ut, og de bruker hele bredden av arket.

== 1a
Overskriften *1a* er en overskrift på nivå 2. Da skyves innholdet ut mot høyre slik at det er enkelt for sensor å følge med på hvilken deloppgave du svarer på.

Her er kommer utregninger, forklaringer og bilder, mens selve svaret på oppgaven skrives i en egen boks med dobbel understreking ved å skrive #raw("#svar[$f(x)$<s> har nullpunkt i $x = 2$<s>]", lang: "typ"). Resultatet vil se ut som dette ↓

#svar[$f(x)$<s> har nullpunkt i $x=2$<s>]

== 1b
Her fortsetter vi på oppgave *1b*…
#svar(noUnderline: true)[$ I(x) = x dot p = x dot ( -100 ln ( x/300 ))  = underline(underline(-100x ln ( x/300 ))) $]

== 1c
Her kommer et lite program i Python. Som standard vil disse ta opp hele bredden av arket slik at vi kan se så mye kode som mulig.

```python
a = 3
sum = 0
for i in range(10):
    sum += a
print(f\"Summen av de 10 første leddene er {sum}.\")
```

= Huskeregler for bruk
- Husk å endre på variablene i toppen av dokumentet!
- Overskrifter på nivå 2 og 3 vil automatisk gi ekstra marg for å skrive svar på deloppgaver.
- Bruk #raw("#svar[Her kommer svar]", lang:"typ") for å få dobbel understreking av tekst.
- Bruk #raw("$x=0$<s>", lang: "typ") for å få dobbel understrek under matematikk.
- Lim bilder rett inn i _Visual Studio Code_ med #kbd("ctrl") #kbd("V") for å sette dem inn i dokumentet. Endre størrelsen på bildet ved å sette _width_: #raw("#image(\"filnavn.png\", width: 60%)", lang: "typ").
- Skriv desimaltall i matematikkmodus ved å bruke punktum som desimalskilletegn for å unngå stygge mellomrom. Hvis du skriver `$6.31$` får du altså $6.31$.
- For å skrive måleenheter eller annen tekst bruker man anførselstegn (`""`). Da vil du se at teksten bli "stående" rett opp: #raw("$s = 0.5 \"h\" dot 20 \"km/h\" = 10 \"km\"$", lang: "typ") gir $s = 0.5 "h" dot 20 "km/h" = 10 "km"$

#import "src/provesvar.typ": prove, eksempel, svarUtil, kbd

/* Endre på variablene i de neste 8 linjene */
#let fag = "Prøvesvar"
#let elevNavn = "Ståle Gjelsten"
#let dokumentTittel = "Dokumentasjon"
#let deloppgaveNivaaer = (4, 5)
#let dobbelUnderstrek = true
#let spraak = "nb"
#let dato = datetime.today()
#let marg = 1cm

/* ======== Her fra trenger du ikke endre noe ======== */
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

/* ======== Her begynner dokumentet ditt ↓ ======== */

= Prøvesvar
Dette er en mal for dokumentspråket #link("https://typst.app/docs/tutorial/", "Typst") som er beregnet for elever og studenter. Denne malen skal hjelpe deg med å skrive svar på matteprøver og innleveringer. Hvis du bruker malen vil du få en god struktur på dokumentet, og resultatet kommer til være mye penere enn dokumenter skrevet i Microsoft Word.

Denne malen bruker to viktige funksjoner for å lage oversiktlige svardokumenter:
+ Når du skriver svar på en deloppgave, for eksempel oppgave _1a_, så legges det til en ekstra marg på venstre side av dokumentet. _1a_ blir stående i denne nye margen, mens dine beregninger og forklaringer vil vises på den høyre siden av arket. Se hvordan det ser ut i @fig:skjermbilde.
+ Du kan bruke funksjonen `#svar[]` for lage en svarboks slik som vist i @fig:skjermbilde. På den måten er det enkelt for leseren å oppfatte hva som er #underline(underline[_svaret_], offset: 0.4 * doubleLinePadding) ditt på oppgaven. I svarboksen vil tekst automatisk få dobbel understreking, og du kan legge til dobbel understreking på formler.

#figure(
  image("imgs/screenshot.png", width: 100%),
  caption: [Skjermbilde som viser venstremargen på deloppgaver og svarboksen],
) <fig:skjermbilde>

== Oppsett av malen

- Åpne programmet #link("https://code.visualstudio.com", [_Visual Studio Code_]).
- Sørg for at utvidelsen #link("https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist", [_Tynimist Typst_]) er installert i Visual Studio Code.
- Åpne kommandovinduet ved å trykke #kbd("ctrl") #kbd("⇧ Shift") #kbd("P") eller ved å velge _Vis_ → _Kommandopalett_ i verktøylinja.
- Skriv inn `typst initial` og velg _Typst: initialize a new Typst project based on a template_ ved å trykke på enter-knappen #kbd("⏎") .
- Skriv inn `@preview/provesvar:0.1.0` og trykk #kbd("⏎") .
- Du kan nå skrive i dokumentet, men husk å trykke på forhåndsvisningsknappen #box(image("imgs/preview.svg"), height: 0.8em, baseline: 10%) som du finner over tekstfeltet i Visual Studio Code, for å få en forhåndsvisning av det ferdige dokumentet.

Øverst i dokumentet ditt vil du se noen linjer med kode som justerer innstillingene for dokumentet ditt:

```typst
#let fag = "S2"                  // navnet på faget (eller klassen din)
#let elevNavn = "Kari Nordmann"  // ditt navn eller kandidatnummer
#let dokumentTittel = "Testprøve"// navnet på prøven
#let deloppgaveNivaaer = (2, 3)  // se forklaring nedenfor 
#let dobbelUnderstrek = true     // gir automatisk dobbel understrek i svarboks
#let spraak = "nb"               // setter språket. "nb"=bokmål", "nn"=nynorsk
#let dato = datetime.today()     // prøvedato settes automatisk til dagens dato
#let marg = 1cm                  // justerer størrelsen på ekstramargen
```

Denne malen vil automatisk gi ekstra marg på venstre side hver gang du skriver svaret på en deloppgave. I standardinnstillingene vil overskrifter med overskriftsnivå 2 og 3 bety at du svarer på en deloppgave og ønsker ekstra marg. Størrelsen på den ekstra margen er 1 cm, men dette kan du justere ved å endre på #raw("#let marg = 1cm", lang: "typ"). I @fig:skjermbilde er _Oppgave 1_ en overskrift med nivå 1, mens _1a_ er overskrift på nivå 2.

== Skrive med Typst
Typst er et program som leser teksten du skriver inn i `filnavn.typ`-dokumentet og lager et pent formatert PDF-dokument som du kan levere inn. I tillegg vises det hele tiden en forhåndsvisning av dokumentet ditt i Visual Studio Code.

=== Overskrifter
Du må bruke overskrifter for at dokumentet skal få struktur. I Typst skrives overskrifter ved å starte med ett eller flere #kbd("=")-tegn på samme linje og deretter skrive tittelen på overskriften. @kode:overskrifter viser hvordan du oppretter overskrifter på nivå 1 og 2.
#figure(align(left, raw("= Oppgave 1
== 1a
Her kommer beregninger, forklaringer, bilder og svaret på en deloppgave.
#svar[$f(x)$<s> har nullpunkt i $x=2$<s>]", lang: "typ", block: true)), caption: [Typst-kode som viser overskrifter på nivå 1 og 2], supplement: [Kodesnutt]) <kode:overskrifter>

=== Bruke overskrifter til å svare på deloppgaver
Bruk en overskrift på nivå 2 eller 3 til å svare på deloppgaver. Som standard vil begge disse overskriftene vises på venstre side av arket, mens all tekst, beregninger og bilder vises til høyre for overskriften. Koden i @kode:overskrifter vil gi deg utskrift slik som i eksempelet nedenfor.

#eksempel[

  = Oppgave 1

  ==== 1a
  Her kommer beregninger, forklaringer, bilder og svaret på en deloppgave.
  #svar[$f(x)$ <s> har nullpunkt i $x=2$ <s> .]

]

#heading("", level: 8)
#v(-1.5em)

Du velger selv hvilke overskriftsnivåer du bruker for deloppgaver ved å endre på #raw("#let deloppgaveNivaaer = (2, 3)", lang: "typ") i innstillingene.
For eksempel vil #raw("#let deloppgaveNivaaer = (3, 4, 5)", lang: "typ") gjøre at overskriftsnivå 3, 4 og 5 får ekstra marg.
#footnote[OBS! `deloppgaveNivaaer` *må* inneholde en liste med minst ett nivå (og et komma!), for eksempel skriver du #raw("#let deloppgaveNivaaer = (6,)", lang: "typ") for at kun overskrifter på nivå 6 skal gi ekstra marg.]

=== Bruke `#svar[]` for å få dobbel understreking
Når vi svarer på oppgaver bruker vi dobbel understreking under det endelige svaret. For å gjøre svarene ekstra tydelige så bruker denne malen også en grå rute som du kan se i eksempelet over. For å skrive et svar skriver du #raw("#svar[Her kommer svaret]", lang: "typ").

Matematikk og vanlig tekst behandles på to ulike måter i Typst. Hvis du skal skrive matematiske symboler i svaret ditt så er du derfor nødt til å først det matematiske uttrykket, for eksempel #raw("$f(x)$", lang: "typ") slik som i eksempelet, og deretter legger du til #raw("<s>", lang: "typ") rett etter det siste dollartegnet.

Hvis du ønsker at noe av teksten inne i svarboksen skal være uten understreking, mens andre deler skal ha understreking så kan du gjøre understrekingen manuelt. Du må da først deaktivere den automatiske understrekingen. Du kan gjøre dette for hele dokumentet ved å sette #raw("#let dobbelUnderstreking = false", lang: "typ") i toppen av dokumentet. Hvis du ønsker å skru av dobbel understreking for en spesifikk svarboks så skriver du #raw("#svar(noUnderline: true)[Her kommer svaret]", lang: "typ").

=== Skrive matematikk
Typst er et utrolig godt verktøy for å skrive matematikk. Alt som står mellom to dollartegn (`$`) tolkes som matematiske symboler. Typst kan vise matematikk på to ulike måter. Hvis du skal gjøre lengre beregninger eller ønsker at uttrykket ditt skal være godt synlig for leseren så legger du til mellomrom mellom dollartegnene og uttrykket ditt, for eksempel vil #raw("$ integral_1^e (ln x)/x dif x $", lang: "typ") vises som
$ integral_1^e (ln x) / x dif x $

Den andre måten Typst kan vise matematikk på er som en del av den løpende teksten ved å ikke ha mellomrom mellom dollartegnene og uttrykket. Dette vil gjøre størrelsen på matematikkuttrykkene mindre. For eksempel vil #raw("$u=ln x$", lang: "typ") vises som $u=ln x$.

Her kommer en oppsummering av de viktigste tipsene for å skrive matematikk.

- Funksjoner skrives som ord: `dot`, `sin`, `ln`, `integral, dif`
- For å skrive to variabler etter hverandre så må bruke mellomrom: #raw("$x y$", lang: "typ") gir $x y$. Hvis man skriver #raw("$xy$", lang: "typ") tolker Typst $x y$ som en funksjon og gir feilmelding.
- For å skrive måleenheter eller annen tekst bruker man anførselstegn (`""`). Da vil du se at teksten bli "stående" rett opp: #raw("$s = 0.5 \"h\" dot 20 \"km/h\" = 10 \"km\"$", lang: "typ") gir $s = 0.5 "h" dot 20 "km/h" = 10 "km"$
- Desimaltall skrives med punktum, men vises med desimalkomma: #raw("$3.14$", lang: "typ") gir $3.14$. _*Ikke* skriv desimaltall med komma_, da vil du få et stygt ekstra mellomrom: #raw("$3,14$", lang: "typ") gir $3,14$
- Når du vil dele opp matematikk over flere linjer så bruker du `\` for å lage linjeskift og `&`-tegnet for å fortelle Typst hvilket tegn du ønsker at linjene skal justeres etter. Se det første eksempelet i @tab:matte.

#figure(table(
  [#raw("$A &= g dot h \
  &=3 dot 2 = 6$", lang: "typ")],                                                                                       [$A &= g dot h \
      &=3 dot 2 = 6$],
  [#raw("$ f(x) = cases(x^2 &\"når\" 0<x<1, 
  1/2 x + 1/2 &\"når\" x>=1) $", lang: "typ")],                                                                         [$ f(x) = cases(x^2 &"når" 0<x<1, 1 / 2 x + 1 / 2 &"når" x>=1) $],
  [#raw("$ f(x) = x^2 + e^x \"for alle\" x>0 $", lang: "typ")],                                                            [$ f(x) = x^2 + e^x "for alle" x>0 $],
  [#raw("$ lim_(n->oo) sum_(i=1)^n f(x_i) dot Delta x  $", lang: "typ")],                                                  [$ lim_(n->oo) sum_(i=1)^n f(x_i) dot Delta x $],
  [#raw("$ integral_1^e 2 u / cancel(x) dot cancel(x) dif u = [u^2]_1^e = underline(underline(e^2 - 1)) $", lang: "typ")], [$ integral_1^e 2 u / cancel(x) dot cancel(x) space d u = [u^2]_1^e = underline(underline(e^2 - 1)) $],
  [#raw("$ x<0 => sqrt(x) in.not RR  $", lang: "typ")],                                                                    [$ x<0 => sqrt(x) in.not RR $],
  columns: (auto, auto),
  inset: 1em
), caption: [Avansert matematikk med Typst]) <tab:matte>

=== Bilder
Den enkleste måten å legge til bilder i Typst på er å først kopiere bildet til utklippstavlen. Det kan du gjøre ved å høyreklikke på et bilde og velge _Kopier_, og det skjer også automatisk dersom du tar skjermbilde i Windows med #kbd("PrtScr") eller #kbd("⊞") #kbd("⇧ Shift") #kbd("S"). For å sette inn bildet i dokumentet så limer du det inn ved å trykke #kbd("ctrl") #kbd("V") i Visual Studio Code. Da skal det automatisk dukke opp kode som ligner på #raw("#image(\"filnavn.png\")", lang: "typ").

Som standard vil bildet ta opp hele bredden av dokumentet, men du kan stille på dette ved endre på funksjonen som la inn bildet til #raw("#image(\"filnavn.png\", width: 60%)", lang: "typ").

For å gjøre dokumentet enda mer profesjonelt kan du velge å sette bildet inn i en _figur_. Hver figur har sin egen figurtekst, og du kan referere til figuren i besvarelsen din. For å lage en figur bruker kan du bruke #raw("#figure()", lang: "typ")-funksjonen, slik som vist i @kode:figurtekst.

#figure([ #align(left, ```typst
  #figure(image("filnavn.png", width: 60%), caption: [Figurtekst])<merkelapp>
  ```)], caption: [Sette inn figurtekst], supplement: [Kodesnutt]) <kode:figurtekst>

Legg gjerne merke til at jeg har lagt til #raw("<merkelapp>", lang: "typ") rett etter #raw("#figure()", lang: "typ")-funksjonen. Det gjør at jeg kan referere til akkurat denne figuren ved å skrive #raw("@merkelapp", lang: "typ") i teksten.

=== Kode
For å legge inn kode skriver du tre #link("https://no.wikipedia.org/wiki/Gravis", "graviser") (\`\`\`) etter hverandre og deretter skrive navnet på programmeringsspråket du bruker. Avslutt kodesnutten med tre nye graviser. Se @kode:kodeeks.

#figure(align(left, raw("```python
a = 3
sum = 0
for i in range(10):
    sum += a
print(f\"Summen av de 10 første leddene er {sum}.\")
```", lang: "python", block: true)), caption: [Skrive kodesnutter], supplement: [Kodesnutt]) <kode:kodeeks>

== Quirks
Typst er et relativt nytt dokumentspråk, og jeg kjenner det ikke veldig godt selv. Denne malen er derfor langt fra perfekt, og det er derfor sannsynlig at du kommer borti noen særegenheter (engelsk: _quirks_) mens du skriver svar her.

=== Formatere tall
I dette dokumentet er det en funksjon som gjør om alle desimaltall skrevet i mattemodus med desimalpunktum til tall med desimalkomma. Hvis du skriver `$6.31$` får du altså $6.31$. Hvis du skriver `$6,31$` så vil du få $6,31$ (med et stygt mellomrom som vi ønsker å unngå).

= Takk og kontaktinformasjon
Tusen takk for at du har testet ut denne malen! Tilbakemeldinger, ris og ros kan meldes til Ståle Gjelsten på e-postadressen #link("stalegjelsten@gmail.com", "stalegjelsten@gmail.com"), eller via #link("https://github.com/stalegjelsten/typst-provemal", "GitHub-repoet").

I tillegg skal #link("https://github.com/carreter", "Willow Carretero Chavez") ha en stor takk for å ha utviklet den #link("https://github.com/carreter/problemst", "opprinnelige malen").

Alle dokumentene i #link("https://github.com/stalegjelsten/typst-provemal", "GitHub-repoet") lisenseres med en MIT lisens.

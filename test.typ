#import "provemal.typ": prove

#show: prove.with(
  class: "6.100",
  student: "Alyssa P. Hacker",
  title: "PSET 0",
  date: datetime.today(),
)

#let svar(it) = {
  par(underline(underline(text(it, weight: 600)), offset: 2pt), leading: 0.5em)
}
#let deriv(num, dnm) = [$ (d num) / (d dnm) $]

= Oppgave
Something something infinitesimals something something. We can then define the derivative as the limit of the difference quotient as $Delta x arrow 0$:
$ deriv(f(x), x)&= lim_(Delta x arrow 0) (f(x + Delta x) - f(x)) / (Delta x). $

#let arr = (1, 2, 3, 4)

#arr.at(-2)

= Oppgave 2
== 2a

Hva skal vi si ?

#svar[Når skal vi sjekke et veldig kasdjfø asdj fdjsa løjfaslk jfdløkj aøsdlkjf ølsadkj løfkdjsa ølkjdas klfjøasdk jfasøl]

$ underline(underline(x^2 + integral_(-1)^2)) f(x) d x forall x in [2,4] $

#lorem(50)

#lorem(50)

#lorem(50)

== 2b

#lorem(80)
sdafjlasd fjkl
asdfljkødasf løkas

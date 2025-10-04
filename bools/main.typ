#set page("a4", margin: 2em)
#set text(size: 14pt)

#let ms  = $space.punct$ // math space

#let ir  = $ms \& ms$

#let X   = [$" " ms x ms " "$]
#let Y   = [$" " ms y ms " "$]
#let Z   = [$" " ms z ms " "$]
#let NOX = [$" " ms overline(x) ms " "$]
#let NOY = [$" " ms overline(y) ms " "$]
#let NOZ = [$" " ms overline(z) ms " "$]
#let OR  = [$x or y$]
#let AND = [$x ms amp ms y$]
#let XOR = [$x xor y$]
#let XIY = [$x => y$]
#let YIX = [$y => x$]
#let EQU = [$x <=> y$]
#let ARR = [$x arrow.b y$]
#let LIN = [$x | y$]

#let F = [0]
#let T = [1]

#let truth_table = data => {
  table(
    stroke: none,
    align: center,
    column-gutter: 3pt,
    columns: data.at(0).len(),
    ..data
      .map(row => {
        row.map(cell => {
          let the_text = if cell.has("text") { cell.text } else { cell.body }
          let make_cell = table.cell.with(fill: 
            if the_text == "1" { color.hsv(90deg, 50%, 98%) } else 
            if the_text == "0" { color.hsv( 0deg, 40%, 98%)  })
          [#make_cell(cell)]
        }).flatten()
      }).flatten(),
  )
}

#let data1 = (
  ( X ,  Y , NOX, NOY, OR,  AND, XOR, XIY, YIX, EQU, ARR, LIN, ),
  ( F ,  F ,  T ,  T ,  F ,  F ,  F ,  T ,  T ,  T ,  T ,  T , ),
  ( F ,  T ,  T ,  F ,  T ,  F ,  T ,  T ,  F ,  F ,  F ,  T , ),
  ( T ,  F ,  F ,  T ,  T ,  F ,  T ,  F ,  T ,  F ,  F ,  T , ),
  ( T ,  T ,  F ,  F ,  T ,  T ,  F ,  T ,  T ,  T ,  F ,  F , ),
)
#truth_table(data1)

= Teisingumo lentelės funkcijoms iš kelių operatorių
_Beje, operatorius $ms \&$ turi pirmenybę! 
Taigi: $" " x or y ms \& ms x = x or ( y ms \& ms x )$_

_Duotą funkciją:_
$f(x, y) = x xor (y => x) ms \& ms overline(y)$

_yra gerai išskaidyti (pradedant nuo skliaustelių, paneigimų, „$ms \&$“ ir einant iš kairės į dešinę):_
+ $(y => x)$
+ $overline(y)$
+ $#text(green)[$(y => x) ms$] \& #text(green)[$ms overline(y)$]$ _$"  " arrow.l$ žalias dalis jau turėsime_
+ $x xor #text(green)[$(y => x) ms \& ms overline(y)$]$

_ir tada sudaryti jos reikšmių lentelę:_
#let data2 = (
  ( X ,  Y , $y => x$, NOY, $#text(green)[$(y => x) ms$] \& #text(green)[$ms overline(y)$]$, $x xor #text(green)[$(y => x) ms \& ms overline(y)$]$ ),
  ( F ,  F ,  T ,  T , T , T , ),
  ( F ,  T ,  F ,  F , F , F , ),
  ( T ,  F ,  T ,  T , T , F , ),
  ( T ,  T ,  T ,  F , F , T , ),
)
#v(-1em)
#truth_table(data2)

taigi: $f(0, 0) = 1, f(0, 1) = 0, f(1, 0) = 0 "ir" f(1, 1) = 1$.


= Funkcijų lygumas

$f_1(x, y) = f_2(x, y)$, jei: 
+ jos yra (arba po pertvarkymų bus) užrašytos vienodai arba 
+ jei jų teisingumo lentelių paskutiniai\* stulpeliai yra vienodi.

Taigi, kai prašoma: „Rasti kaip funkcija yra žymima“ ir jūs jau turite lentelę,
tiesiog pažiūrėkite, kurio varianto lentelė atitinka tos funkcijos.

Pavyzdžiui: $f(x, y) = x xor (y => x) ms \& ms overline(y)$ 
gali būti žymima kaip: $f(x, y) = x <=> y$

= Tautologija

Nesvarbu kokie funkcijos argumentai, ji *visada duos $1$*.

Pavyzdžiui: $f(x) = x or overline(x)$ yra tautologija, \
nes: $" "f(0) = 0 or overline(0) = 0 or 1 = 1" "$ ir $" "f(1) = 1 or overline(0) = 1$

#pagebreak()
= Funkcijų dualumas

Funkcijai dualioji yra perrašyta funkcija, bet ir argumentai, ir rezultatas paneigti:

$f(x, y, z) = x or y ms \& ms z$ \
$f^"*" (x, y, z) = overline(overline(x) or overline(y) ms \& ms overline(z))$

Be to, dualiosios funkcijos reikšmių lentelė yra tiesiog:

1\. $f(x, y, ...)$ lentelė, bet #h(4em)
2\. apversta aukštyn kojom ir #h(2em)
3\. paneigta

#let data1 = (
  ( X ,  Y ,  Z , $x or y ms \& ms z$, [$" "$], NOX, NOY, NOZ, $overline(x) or overline(y) ms \& ms overline(z)$, [$" "$], $overline(overline(x) or overline(y) ms \& ms overline(z))$),
  ( F ,  F ,  F ,  F , [$" "$] , T ,  T ,  T , T , [$" "$], F , ),
  ( F ,  F ,  T ,  F , [$" "$] , T ,  T ,  F , T , [$" "$], F , ),
  ( F ,  T ,  F ,  F , [$" "$] , T ,  F ,  T , T , [$" "$], F , ),
  ( F ,  T ,  T ,  T , [$" "$] , T ,  F ,  F , T , [$" "$], F , ),
  ( T ,  F ,  F ,  T , [$" "$] , F ,  T ,  T , T , [$" "$], F , ),
  ( T ,  F ,  T ,  T , [$" "$] , F ,  T ,  F , F , [$" "$], T , ),
  ( T ,  T ,  F ,  T , [$" "$] , F ,  F ,  T , F , [$" "$], T , ),
  ( T ,  T ,  T ,  T , [$" "$] , F ,  F ,  F , F , [$" "$], T , ),
)
#v(-1em)
#truth_table(data1)


= Funkcijų klasės

*$T_0$ -- nekeičiančios nulio funkcijos. \
 $T_1$ -- nekeičiančios vieneto funkcijos.*

Jei visi funkcijos: $f(x, y, z, ...)$ argumentai yra $0$ 
ir funkcija duoda $0$, ji yra nekeičianti nulio. \
Jei visi funkcijos: $f(x, y, z, ...)$ argumentai yra $1$ 
ir funkcija duoda $1$, ji yra nekeičianti vieneto.

Pavyzdžiui: \
$f(x, y, z) = x or y ms \& ms z$ \
$f(0, 0, 0) = 0 or 0 ms \& ms 0 = 0 or 0 = 0$, taigi $f(x, y, z)$ yra nekeičianti nulio. \
$f(1, 1, 1) = 1 or 1 ms \& ms 1 = 1 or 1 = 1$, taigi $f(x, y, z)$ yra nekeičianti vieneto.

_Tiesiog įsistatykit nulius arba vienetus ir matysit..._

*$T_\*$ -- savidualiosios funkcijos.*

Jei $f(x, y, ...) = f^\* (x, y, ...)$ funkcija yra saviduali.

Pavyzdžiui: \
$f(x) = overline(x)$ yra saviduali, nes $f^\* (x) = overline(overline(overline(x))) = overline(x)$

#pagebreak()

*$T_"<"$ -- monotoniškos funkcijos.*

Monotoniškos funkcijos reikšmės, tipo, niekada nekrenta... \ 
Jeigu $f(x_1, x_2, .., x_n) <= f(y_1, y_2, .., y_n)$, kai $x_i <= y_i$ visoms šioms argumentų poroms, funkcija yra monotoniška.

Žodžiu tiesiog persibraižykit 3 diagramas apačioje ir jūsų funkcijos reikšmė kiekvienos rodiklytės pradžioje negali būti didesnė nei pabaigoje.
Jei bus, jūsų funkcija nėra monotoniška, nubraukite rodyklę. 

#align(center)[ #image("bool-graph.svg", width: 62.5%) ]

*$T_L$ -- tiesinės funkcijos.*

Funkcija yra tiesinė, kai ji gali būti žymima formule:
$f(x, y, z, ...) = c_0 xor c_1 ir x xor c_2 ir y xor c_3 ir z ms ... $

Čia $c_i$ yra konstantos, kurias reikės surasti.

Pavyzdžiui:

$f(x, y) = x or y$

1. Reikia ieškoti konstantų: _(beje „&“ pirmi!)_

$f(0, 0) = 0 or 0 = 0$ \
$f(0, 0) = 0 = c_0 xor c_1 ir 0 xor c_2 ir 0 = c_0 xor 0 xor 0 = c_0$ \
#text(color.hsv(45deg, 95%, 85%))[$c_0 xor 0 = c_0$, nes, #h(1em) jei $c_0 = 0$, $0 xor 0 = 0$ ir, #h(1em) jei $c_0 = 1$,  $1 xor 0 = 1$]

Gavom, kad $f(0, 0) = 0$ ir $f(0, 0) = c_0$, taigi *$c_0 = 0$*

$f(0, 1) = 0 or 1 = 1$ \
$f(0, 1) = 1 = #text(green)[0] xor c_1 ir 0 xor c_2 ir 1 = 0 xor 0 xor c_2 = c_2$, taigi *$c_2 = 1$* \
#text(color.hsv(45deg, 95%, 85%))[$c_2 ir 1 = c_2$, nes, #h(1em) jei $c_2 = 0$, $c_2 ir 1 = 0$ ir, #h(1em) jei $c_2 = 1$,  $c_2 ir 1 = 1$]

$f(1, 0) = 1 or 0 = 1$ \
$f(1, 0) = 1 = #text(green)[0] xor c_1 ir 1 xor #text(green)[1] ir 0 = 0 xor c_1 xor 0 = c_1$, taigi *$c_1 = 1$*

2. Patikrinti ar funkcija atitinka lygtį su rastomis konstantomis:

$f(1, 1) = 1 or 1 = 1$ \
$f(1, 1) = 0 xor 1 ir 1 xor 1 ir 1 = 0 xor 1 xor 1 = 1 xor 1 = 0$

Gavome, kad $f(1, 1) = 1$ ir $f(1, 1) = 0$, \
kadangi $1 != 0$, funkcija $f(x, y) = x or y$ nėra tiesinė

#pagebreak()
= Kaip aš darau lenteles (nebūtina)

Lentelėms sudaryti aš naudoju (visada geresnį) „Reverse Polish Notation“ užrašymą.
Čia visi operatoriai yra rašomi ne per vidurį (pvz. $x + 3$), o gale (pvz. $x ms 3 +$).

Kodėl? Šiaip matematikoje, tai atsikrato labai logiškai (pagal vibe-us) sugalvotosios operatorių pirmenybės ir skliaustelių. 
Programavimo kalbų kurėjų gyvenimą padaro lengvesniu. 
O teisingumo lentelėje reiškia, kad niekada nereikės perrašyti operacijų.

_Čia paneigimui naudosiu ir liniją virš_ -- „$overline(x)$_“, ir „` J` tetrominą“_ -- „$not ms x$“, _jie reiškia tą patį._

Taigi:

1. Gavus uždavinį, kaip, pavyzdžiui: \
$f(x, y) = overline(x arrow.b (overline(x) xor y) ir y) <=> x ir overline(y)$

Jį reikia paversti į RPN (Reverse Polish Notation) pradedant nuo operatoriaus su didžiausia pirmenybe ir baigiant mažiausia:

$#text(red)[$f(x, y) =$] x ms not ms y xor y ir x arrow.b not ms x ms y ms not ms \& <=> $ \

arba, su skliausteliais: 
$(((((((x ms not) ms y xor) y ms \&) x arrow.b) not) ms (x ms (y ms not) ms \&) <=>)$


#let data2 = (
  ( X ,  Y,   [$x ms not$], [$y xor$], [$y ms \&$], [$x ms arrow.b$], [$not$], [$y ms not$], [$x ms \&$], [$<=>$] ),
  ( F ,  F ,  T ,  T , F , T , F , T , F ,  F , ),
  ( F ,  T ,  T ,  F , F , T , F , F , F ,  T , ),
  ( T ,  F ,  F ,  F , F , F , T , T , T ,  T , ),
  ( T ,  T ,  F ,  F , F , F , T , F , F ,  F , ),
)
#truth_table(data2)
#v(-1em)
#h(15.66em) ^ panaudotas $<=>$

_Sąsiūvinyje aš paskiriu vieną/du langelius kintamajam (ir, jei noriu, perrašau reikšmes) ir vieną langelį operatoriui. Ten lentelės atrodo geriau._












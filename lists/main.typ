#set page("a4", margin: 2em, height: auto)
#set text(size: 12pt)

#let F = [0]
#let T = [1]

#show math.equation.where(block: true): e => align(left, 
  block(fill: rgb("#D5F5F9"), outset: 4pt, radius: 4pt, width: 100%, e))

#let textblock(body) = {block(fill: rgb("#FFE0E8"), outset: 4pt, radius: 4pt, width: 100%, body)}

= Aibės, kombinatorika ir sąryšiai.

== Aibės

Aibė - daiktų sąrašas, kur tvarka nesvarbi ir elementai negali kartotis, pvz.:
$A = { 1, 2, 3, 5, 4 }$,
$B = { ą, b, c, č }$ ar
$C = { { 1, 2, 3 }, { 4, 5 } }$.

Specialiosios aibės:
$
U        - "universalioji aibė" ("dažnai duota sąlygoje, naudinga ieškant aibės „papildinių“") \
diameter - "tuščia aibė" \
NN       - "naturalūs skaičiai" ("be kablelio, ne neigiami, ne nulis") \
ZZ       - "sveiki skaičiai" ("be kablelio") \
QQ       - "racionalūs skaičiai" ("galima išreikšti trupmena" #box($a/b$)", kai a ir b yra sveiki skaičiai") \
RR       - "realieji skaičiai" ("visi skaičiai*") \
PP       - "pirminiai skaičiai" ("dalinasi sveikai tik iš savęs ir 1") \ \

{ 2k: "     "k in ZZ } - "lyginiai skaičiai" \
{ 2k + 1: k in ZZ } - "nelyginiai skaičiai"
$

#let o(text) = { box($overline(text)$) }

Veiksmai su aibėmis/sąryšiais:
$
A union B               - "sąjunga" ("visi elementai iš abiejų aibių") \
A inter B               - "sankirta" ("visi BENDRI elementai iš abiejų aibių") \
A \\    B #h(0.3em)     - "skirtumas" ("pirmos aibės elementai, kurie nėra antroje") \
#o($A$)   #h(2.1em)     - "papildinys" ("elementai, kurių nėra aibėje (dažniausia, imti iš U aibės)") \
A times B               - "dekarto sandauga" ("aibė iš porų: {(a1,b1), (a1,b2), ...}, kur A pirmi, B antri") \
A " "circle.small" " B  - "kompozicija" ("aibių A ir B trazityvumo rezultatai sukišti į naują aibę")\
R^n       #h(1.6em)     - "sąryšio laipsnis" ("tik su sąryšiais; reikia atlikti kompozicija" n "kartų")
$

= Sąryšiai

Sąryšiai (žymimi „$R$“) yra aibės sudarytos iš porų, pvz.: $R = {(a, 1), (c, 5)}$ 

Sąryšio „apibrėžimo sritis“ -- $D(R)$ -- yra pirmi kiekvienos poros elementai. \
Sąryšio „reikšmių sritis“ -- $R(R)$ -- yra paskutiniai kiekvienos poros elementai. \

Sąryšių savybės:
#textblock[ ( $*$ = nesvarbu )\
  Refleksyvumas -- ${ (a, a), (b, b), (c, c) }$
  $mat(x, *, *; *, y, *; *, *, z)$ refleksyvus, jei: $mat("x = 1"; "y = 1"; "z = 1")$


  Simetriškumas -- ${ (a, b), (b, a) }$
  $mat(*, x, y; x, *, z; y, z, *)$ simetriškas, jei: $mat("x = x"; "y = y"; "z = z")$ 

  Tranzityvumas -- ${ (a, b), (b, c), (a, c) }$ \
  _Patikrinimui: paimti visas įmanomas porų kombinacijas, kur pirmos poros antras elementas = antros pirmam. \
  Čia būtų: $(a, b)$ ir $(b, c)$. Sudaryti naują porą iš: pirmosios poros pirmojo elemento ir antrosios antrojo -- $(a, c)$. \
  Patikrinti, ar naujas elementas yra sąryšyje. #h(0.5em) Kartoti su VISAIS elementais._

]

Sąryšis refleksyvus, jei visiems porų elementams turi: (a, a), (2, 2) ir t.t. ir antirefleksyvus, jei nei vienai. \
Sąryšis simetriškas, jei visos poros turi apkeistąsias sąryšyje ir antisimetriškos, jei nei viena. \
Sąryšis tranzityvus, jei visos galimos dviejų porų kombinacijos turi tuos ( $1_2$, $2_1$ ) elementus \
#h(1.27cm) (arba tokių kombinacijų iš viso nėra...)

#textblock[
  Ekvivalentumas -- refleksyvumas IR simetriškumas IR trazityvumas.

]

#textblock[
  Tvarkos sąryšis -- antisimetriškumas IR tranzityvumas.
  
  Jei dar refleksyvus, sąryšis yra „negriežtosios tvarkos.“ \
  Jei antirefleksyvus, sąryšis yra „griežtosios tvarkos.“

  Jei dar pilnasis, sąryšis yra „visiškos tvarkos.“ \
  O jei nepilnasis, sąryšis yra „dalinės tvarkos.“
]

#v(20em)

.


// Thanks to: snowc0de on Github
#let text-image(lefttext, rightimage, bottomtext: none, marginleft: 0em, margintop: 0.5em) = {
  set par(justify: true)
  grid(columns: 2, column-gutter: 1em, lefttext, rightimage)
  set par(justify: false)
  block(inset: (left: marginleft, top: -margintop), bottomtext)
}


#set page(margin: 2em)
#align(center)[= Integralai]

#let arctg = math.italic("arctg")
#let arcctg = math.italic("arcctg")

#let dx = math.italic("dx")
#let dt = math.italic("dt")
#let t  = math.italic("t")

Paprastas integravimas bus pagal lentelę. Gali tekti paversti $integral (x + 5)^2 dx => integral x^2 + 10x + 25 dx$

== Integravimas keičiant kintamąjį
_Sudėtinėms funkcijoms_

$integral f(x) dx = integral f(phi(t)) dot phi prime (t) "dt" $ 

$integral e^(5x) dx = #h(1cm) "[ " t = 5x, x = 1/5t, dx = (1/5t) prime dt, dx = 1/5 dt "]" #h(1cm)  
= integral 1/5 e^t "dt" = 1/5 e^(5x) + C$

== Dalinis integravimas
_Funkcijų daugybai ir ln $x$_

$integral "u" "dv" = "uv" - integral "v" "du" $ #h(4cm) arba #h(1cm) 
$integral f(x) g prime (x) = f(x) g(x) - integral g(x) f prime (x)$

Tipai (kuri funkcija yra „u“, kuri „v“):

#table(
    stroke: none,
    gutter: 2pt,
    columns: (auto, 1fr, 1fr),
    [], [ „u“ funkcija ], [ „v“ funkcija ],
    $integral$, $ln x, arcsin x, arccos x, arctg x, arcctg x $, $"..." dx $,
    $integral$, $"..." dx$, $e^(a x), sin a x, cos a x $,
    $integral$, $e^(a x), sin a x, cos a x #h(0.7cm) #text("( u ir v nesvarbu)") $, $e^(a x), sin a x, cos a x  dx $,
) 


== Kreivinės trapecijos

2D figūros plotui: #h(0.25cm) $S = integral_a^b y dx $

Čia, turbūt, reikės braižyti parabolę, taigi 
#image(width: 40%, "paraboles-piesimas.png")

_Kontrolinyje nebus:_
#v(-0.5em)
kai persmeigtas per x ašį: #h(1cm) $ V_x = pi integral_a^b y^2 dx$ #h(1cm) (tada reikės, pvz.: $y = 1 + 2 x + x^3$)
#v(-0.5em)
kai persmeigtas per y ašį: #h(1cm) $ V_y = pi integral_a^b x^2 dx$ #h(1cm) (tada reikės, pvz.: $x = 1 + 2 y + y^3$)

#v(1cm)
#text(size: 8pt)[_Racionaliųjų funkcijų integravimas yra kitame puslapyje_]

#pagebreak()

== Racionaliųjų funkcijų integravimas
_Trupmenos kur $x$ yra ir skaitiklyje, ir vardiklyje_

*Netaisyklingosios trupmenos* ($x$'ų laipsniai viršuje yra didesni arba vienodi apatiniams)

$ integral (x^2) / (x+1) dx $

Reikia „ilgąją dalyba“ dalinti viršų iš apačios.

#align(center)[ #image(width: 50%, "ilgoji-dalyba.png") ]

*Daugianarių* integralai

$ integral f(x) / (x plus.minus a)^k  dx $

Reikia išreikšti „paprasčiausių“ trupmenų suma. (trupmena -- paprasčiausia kai skačius vardiklyje)

$A_1 / (x plus.minus a) + A_2 / (x plus.minus a)^2 + ... + A_k / (x plus.minus a)^k 
eq.triple A_1(x plus.minus a)^(k-1) + A_1(x plus.minus a)^(k-2) + ... + A_1(x plus.minus a) + A_k$

$eq.triple$ yra „tapačiai“/proporcingai lygu


#text-image([
    Po to, pavyzdžiui: \
    $x eq.triple A_1(x + 1) + A_2 eq.triple A_1 x + A_1 + A_2 $ \ 
    #h(0.77cm) $A_1 x^1 + (A_1 + A_2) x^0 eq.triple x^1$ \
    $x^1": " A_1 = 1$ \
    $x^0": " A_1 + A_2 = 0, A_2 = x_0 - A_2 = -1$ ],
    image(width: 55%, "x-ams.png")
)


*Kvadratinės lygties* integralai

$ integral (m x + n) / (x^2 + p x + q) $

Išspręsti kvadratinę lygtį, gauti $x_1$ ir $x_2$, tada: 

$integral (m x + n) / ((x - x_1) (x - x_2)) = integral A_1 / (x - x_1) + A_2 / (x - x_2) = 
integral (A_1 (x - x_1) + A_2 (x - x_2)) / ((x - x_1)(x - x_2)) 
=> / => integral (A_1 x - A_1 x_1 + A_2 x - A_2 x_2) / (1 ("aš irgi nežinau")) -> $ daugianarių integralo pabaiga

arba, jei $D < 0$: $x^2 + p x + q = (x + p/2)^2 + (4q - p^2) / 4 $. Beje, $(4q - p^2) / 4$ bus tiesiog koks nors skaičius.


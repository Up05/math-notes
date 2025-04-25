
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

Paprastas integravimas bus pagal lentelę. Gali tekti paversti $integral (x + 5)^2 dx$ paversti $integral x^2 + 10x + 25 dx$

== Integravimas keičiant kintamąjį
_Sudėtinėms funkcijoms_

$integral f(x) dx = integral f(phi(t)) dot phi prime (t) "dt" $ 

#block(fill: rgb("e7ffc7"), inset: 8pt, radius: 4pt, width: 100%)[
    $integral e^(5x) dx = #h(1cm) "[ " t = 5x, x = 1/5t, dx = (1/5t) prime dt, dx = 1/5 dt "]" #h(1cm)  
    = integral 1/5 e^t "dt" = 1/5 e^(5x) + C$
]


== Dalinis integravimas
_Funkcijų daugybai ir ln $x$_


#table(
    stroke: none,
    gutter: -4pt,
    columns: (25em, 1fr),
    $integral "u" "dv" = "uv" - integral "v" "du" $, 
    text(gray)[$integral f(x) dot g prime (x) dx = f(x) g(x) - integral g(x) dot f prime (x) dx$] 
)

Tipai (kuri funkcija yra $u$, kuri $v$, _beje funkcija būna tada kai kas nors padaryta su $x$, pats $x$ irgi yra funkcija_):

#table(
    stroke: none,
    gutter: -4pt,
    columns: (1.75em, 23.25em, 1fr),
    [], [ $u$ funkcija ], [ $v$ funkcija ],
    $integral$, $ln x, arcsin x, arccos x, arctg x, arcctg x $, $"..." dx $,
    $integral$, $"..." dx$, $e^(a x), sin a x, cos a x $,
    $integral$, $e^(a x), sin a x, cos a x #h(0.7cm) #text("( u ir v nesvarbu)") $, $e^(a x), sin a x, cos a x  dx $,
) 

#block(fill: rgb("e7ffc7"), inset: 8pt, radius: 4pt, width: 100%)[
    $integral x^2 dot ln x dx = ln x dot x^3 / 3 - integral x^3/3 dot 1/x dx = (x^3 ln x)/3 - integral x^2 / 3 dx = (x^3 ln x) / 3 - x^3 / 9 $ 

    $[ u = ln x,  #linebreak()
    #h(0.5em) d v = x^2, #linebreak()
    #h(0.5em) v = #text(luma(127))[ $integral d v dx = integral x^2 dx =$] x^3/3, #linebreak()
    #h(0.5em) d u = #text(luma(127))[ $u prime = (ln x) prime =$] 1 / x ]$
]


== Kreivinės trapecijos

2D figūros plotui: #h(2.25cm) $S = integral_a^b y dx $
#text(luma(100))[
#v(-0.33em)
kai persmeigtas per x ašį: #h(1cm) $ V_x = pi integral_a^b y^2 dx$ #h(1cm) (tada reikės, pvz.: $y = 1 + 2 x + x^3$)
]
#text(gray)[
#v(-0.33em)
kai persmeigtas per y ašį: #h(1cm) $ V_y = pi integral_a^b x^2 dx$ #h(1cm) (tada reikės, pvz.: $x = 1 + 2 y + y^3$)
]


#block(fill: rgb("e7ffc7"), inset: 8pt, radius: 4pt, width: 100%)[
    Plotas figūros, kurią kerta: $-x^2 - 3x + 4 = 0$, $x = 0$, $y = -x$.

    #block(fill: rgb("0001"), inset: 6pt)[
        _Nubraižyti parabolę:_
        
        Iš šonų: $-x^2 - x + 2 = 0, D = b^2 - 4 a c = 1 - 4 (-1) 2 = 9, 
        x_(1, 2) = (-b plus.minus sqrt(D)) / (2a), x_1 = (1 - 3) / (-2) = 1, x_2 = 4/(-2) = -2$ #linebreak()
        centro/simetrijos/viršutinis taškas: $x_0 = -b / (2a) = - (-1)/(-2) = -0.5$ 
    ]

    #text-image([
        _Paskui reikia suskaičiuoti kur kertasi parabolė ir violetinė linija 
        (nes iš grafiko nesimato):_
        
        #math.cases( $y =-x^2 -x + 2$, $y = -x$ ) #h(3mm) $-->$ #h(3mm) $-x^2 -x + 2 = -x = -x^2 + 2 $
        
        $-x^2 + 2 = 0, -x^2 = -2, x^2 = 2, x = sqrt(2)$

    ], image("kreivinis-pavyzdys.jpg", width: 70%))
]







#pagebreak()

== Racionaliųjų funkcijų integravimas
_Trupmenos kur $x$ yra ir skaitiklyje, ir vardiklyje_

*Netaisyklingosios trupmenos* ($x$'ų laipsniai viršuje yra didesni arba vienodi apatiniams)

$ integral (x) / (x+1) dx = integral -1 + 1 / (x + 1) dx $

_Beje, mišrios trupmenos yra tiesiog praleista *sudėtis*, aš nežinau kodėl jos iš vis egzistuoja..._


Reikia „ilgąją dalyba“ dalinti viršų iš apačios.

#align(center)[ #image(width: 50%, "ilgoji-dalyba.png") ]

#block(fill: rgb("aaa1"), inset: 8pt, width: 100%)[
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

]

*Kvadratinės lygties* integralai

$ integral (m x + n) / (x^2 + p x + q) $

Išspręsti kvadratinę lygtį, gauti $x_1$ ir $x_2$, tada: 

$integral (m x + n) / ((x - x_1) (x - x_2)) = integral A_1 / (x - x_1) + A_2 / (x - x_2) = 
integral (A_1 (x - x_1) + A_2 (x - x_2)) / ((x - x_1)(x - x_2)) 
=> / => integral (A_1 x - A_1 x_1 + A_2 x - A_2 x_2) / (1 ("aš irgi nežinau")) -> $ daugianarių integralo pabaiga

arba, jei $D < 0$: $x^2 + p x + q = (x + p/2)^2 + (4q - p^2) / 4 $. Beje, $(4q - p^2) / 4$ bus tiesiog koks nors skaičius.


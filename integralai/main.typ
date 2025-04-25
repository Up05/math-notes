
// Thanks to: snowc0de on Github
#let text-image(lefttext, rightimage, bottomtext: none, marginleft: 0em, margintop: 0.5em) = {
  set par(justify: true)
  grid(columns: 2, column-gutter: 1em, lefttext, align(center, rightimage))
  set par(justify: false)
  block(inset: (left: marginleft, top: -margintop), bottomtext)
}

// integralo „rėžiai“
#let stulpelis(nuo: content, iki: content) = $ lr(| vec(delim: #none, iki, /*vidurys*/, nuo)) $

#set page(margin: 2em)
#align(center)[= Integralai]

#let arctg = math.italic("arctg")
#let arcctg = math.italic("arcctg")

#let dx = math.italic("dx")
#let dt = math.italic("dt")
#let t  = math.italic("t")

Be je, čia neįdėjau paprastų integralų lentelės. #h(1mm) Ir dar, per KD, gali tekti $integral (x + 5)^2 dx$ paversti $integral (x^2 + 10x + 25) dx$

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
    columns: (1.75em, 23.25em, 1fr), // Čia yra 3 stulpeliai ( em = šrifto aukštis (jei neklystu), fr = [f]raction [u]nit, lentelės dalis )
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
    Plotas figūros, kurią kerta: $-x^2 - 3x + 4 = 0$, $x = 0$, $y = 3x$.

    #block(fill: rgb("0001"), inset: 6pt)[
        _Nubraižyti parabolę:_
        
        Iš šonų: $-x^2 + 3x + 4 = 0, D = b^2 - 4 a c = 9 - 4 dot (-1) dot 4 = 25, 
        x_(1, 2) = (-b plus.minus sqrt(D)) / (2a), x_1 = (-3 - 5) / (-2) = 4, x_2 = 2/(-2) = -1$ #linebreak()
        centro/simetrijos/viršutinis taškas: $x_0 = -b / (2a) = - (-3)/(-2) = -1.5$ 
    ]

    #text-image([
        _Paskui reikia suskaičiuoti kur kertasi parabolė ir violetinė linija 
        (nes iš grafiko nesimato):_
        
        #math.cases( $y = -x^2 - 3x + 4$, $y = 3x$ ) #h(3mm)
        #math.cases( $3x = -x^2 - 3x + 4$, $y = 3x$ ) #h(3mm)
        #math.cases( $0 = -x^2 + 4$, $y = 3x$ ) #h(3mm)
        #math.cases( $x = sqrt(4) = 2$, $y = "nesvarbu"$)

        Tada, nes parabolė virš tiesės: $S_("visko") = S_("parabolė") - S_("tiesė")$

        $S &= integral_0^2 -x^2 + 3x + 4 dx - integral_0^2 3x dx = \
           &= (-x^3)/3 + 3/2 x^2 + 4x stulpelis(nuo: 0, iki: 2) #h(3mm) - #h(3mm) 3/2 x^2 stulpelis(nuo: 0, iki: 2) = \
           &= -8/3 + 6 + 8 - 6 = 8 - 2 2/3 = 5 1/3
        $

    ], image("kreivinis-pavyzdys.jpg", width: 93%), marginleft: -1em)
]





#pagebreak()

== Racionaliųjų funkcijų integravimas
_Trupmenos kur $x$ yra ir skaitiklyje, ir vardiklyje_

*Netaisyklingosios trupmenos* ($x$'ų laipsniai viršuje yra didesni arba vienodi apatiniams)



#block(fill: rgb("e7ffc7"), inset: 8pt, radius: 4pt, width: 100%)[

Reikia „ilgąją dalyba“ dalinti viršų iš apačios.
#align(horizon)[
#table(columns: (0.75fr, 0.25fr, 1fr, 0.25fr, 0.75fr), stroke: none)[ $ integral (x^2) / (x+1) dx $ ][ $ ==> $ ][ #align(center)[#image(width: 90%, "ilgoji-dalyba.png")] ][ $ ==> $ ][ $ integral ((x - 1) + 1 / (x + 1)) dx $ ]
]

_Beje, mišrios trupmenos yra tiesiog praleista *sudėtis*, aš nežinau kodėl jos iš vis egzistuoja..._
]
#block(fill: rgb("bbb1"), inset: 8pt, width: 100%, outset: (x: 4em))[

*Daugianarių* vardiklyje integralai

$ integral f(x) / (x plus.minus a)^k  dx $

Reikia išreikšti „paprasčiausių“ trupmenų suma. (trupmena -- paprasčiausia kai skačius vardiklyje)

$A_1 / (x plus.minus a) + A_2 / (x plus.minus a)^2 + ... + A_k / (x plus.minus a)^k 
eq.triple A_1(x plus.minus a)^(k-1) + A_1(x plus.minus a)^(k-2) + ... + A_1(x plus.minus a) + A_k$

#text-image([
    Po to, pavyzdžiui: \
    $x eq.triple A_1(x + 1) + A_2 eq.triple A_1 x + A_1 + A_2 $ \ 
    #h(0.77cm) $A_1 x^1 + (A_1 + A_2) x^0 eq.triple x^1$ \
    $x^1": " A_1 = 1$ \
    $x^0": " A_1 + A_2 = 0, A_2 = x_0 - A_2 = -1$ \ \ 
    _$eq.triple$ yra „tapačiai“ arba proporcingai lygu_
],
    image(width: 65%, "x-ams.png")
)

]

*Kvadratinės lygties* vardiklyje integralai

$ integral (m x + n) / (x^2 + p x + q) dx $

#block(fill: rgb("e7ffc7"), inset: 8pt, radius: 4pt, width: 100%)[
    $ integral (x + 4) / (x^2 - x - 2) dx $
    
    #table(columns: (1fr, 1fr, 3fr, 1fr), stroke: none)[
        $x^2 - x - 2 = 0$ \
        $D = 1 + 8 = 9$ \
    ][
        $x_1 = -1$, \ 
        $x_2 = 2$
    ][
        #align(left + horizon)[
        $ integral (x + 4) / ((x + 1)(x - 2)) dx, A / (x + 1) + B / (x - 2) = (A(x - 2) + B(x + 1)) / ((x + 1)(x - 2)) $
        ]
    ] 
    
    $x + 4 eq.triple A x - 2 A + B x + B$ \
    #math.cases($1 = A + B$, $4 = -2 A + B$) 
    #math.cases($1 - B = A$, $4 = -2 (1 - B) + B$) 
    #math.cases($A = 1 - B$, $4 = -2 - -2B + B$) 
    #math.cases($A = 1 - B$, $6 = 3B$) 
    #math.cases($A = -1$, $B = 2$) 

    $ integral A / (x + 1) dx + integral B / (x - 2) dx = 
      integral (-1) / (x + 1) dx + integral 2 / (x - 2) dx = $
    $ "Ats.: " = -1 dot 1 dot ln|x + 1| + 2 dot 1 dot ln x|x - 2| + C $

]








#pagebreak()


#block(fill: rgb("bbb1"), inset: 8pt, width: 100%, outset: (x: 4em))[

*Kvadratinės lygties* vardiklyje integralai $(D < 0)$

Gavus: $x^2 + p x + q$,

Suskaičiuokite diskriminantą ($D = b^2 - 4 a c$)

Jei $D >= 0$, sugrįžkite prie praeito žingsnio.

jei $D < 0$:

Įstatykite $p$ ir $q$ į formulę: *$(x + p/2)^2  + (4 q - p^2)/4$* \
_Turbūt gausite, ką nors panašaus į $(x + 3)^2 + 4$_

Tada, tiesiog suintegruokite ką gavote: $integral ... dx$
]

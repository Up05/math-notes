#set page("a4", margin: (x: 2em, top: 3em, bottom: 7.5cm), height: auto, fill: rgb("#f2f9fb"))
#set text(size: 14pt, fill: rgb("#141419"))

#show math.equation: set text(alternates: false)
#show math.equation.where(block: true): set align(left)

#show link: it => { underline(text(fill: rgb("0000FF"), it)) }

#let colors = (
    b0:         rgb("#9a9ddacc"),
    example_bg: rgb("#deebf4"),
)

#show heading: it => { 
    v(12pt)
    let border = ( right: colors.b0, bottom: colors.b0 + 0.5pt, left: rgb("#fff"), top: rgb("#fff") + 1.2pt )
    block(fill: rgb("#e1eef4"), stroke: border, outset: (left: 2em, rest: 5pt), width: 100% + 2em, it.body) 
    v(3pt)
}

#show image.where(alt: "graph"): it => {
    let border = ( right: colors.b0, bottom: colors.b0, left: rgb("#fff"), top: rgb("#fff") )
    block(fill: rgb("#e1eef4"), stroke: border, outset: 7pt, it) 
}

#let example = (content) => {
    let border = ( left: colors.b0, top: colors.b0, right: rgb("#fff"), bottom: rgb("#fff") )
    block(fill: colors.example_bg, width: 100%, stroke: border, inset: (x: 5pt, y: 7pt), content)
}

#let gray = (txt) => { text(txt, fill: rgb("#9193a1")) }

#let stulpelis(nuo, iki) = scale(75%, $ lr(| vec(delim: #none, iki, /*vidurys*/, nuo)) $)

// {{{
#let skirstinys3 = (xi, ..columns) => {
    grid(columns: (auto, auto), gutter: 0.25em, [
        #align(horizon)[#xi: ] ], [
        #show table.cell.where(x: int(columns.pos().len() / 2)): set text(fill: luma(80)) 
        #table(columns: int(columns.pos().len() / 2), inset: (x: 10pt, y: 5pt), stroke: luma(80) + 0.75pt,
            ..columns
        )
    ])
}
#let skirstinys2 = (xi, ..columns) => {
    grid(columns: (auto, auto), gutter: 0.25em, [
        #align(horizon)[#xi: ] ], [
        #let length = columns.pos().len()
        #let width  = int(columns.pos().len() / 2)
        #let a = columns.pos().slice(0, width)
        #let b = columns.pos().slice(width, length)
        #show table.cell.where(x: width): set text(fill: luma(80)) 
        #table(columns: width + 1, inset: (x: 10pt, y: 5pt), stroke: luma(80) + 0.75pt,
            ..a,
            table.cell(stroke: luma(150), [#scale(80%)[$sum_(i=1)^n p_i$]], align: center),
            ..b,
            table.cell(stroke: luma(150), [$1$], align: center),
        )
    ])
}
#let skirstinys = (..columns) => skirstinys2("𝜉", ..columns)
// }}}

#let  bad_cell = c => table.cell(fill: rgb("#ff8e8c88"), c)
#let good_cell = c => table.cell(fill: rgb("#c4f47588"), c)

// +  1. Diskretusis . ir jo charakteristika. lentelė, daugiakampis; vidurkis, dispensija, std. dev.
// -  2. Tolydusis ...^
// +  3. Sudėti ir sudauginti 2 diskrečiuosius .
// +? 4. Diskretusis dydis --> pasiskirstymo lentelė ir grafikas
= Atsitiktiniai dydžiai

// {{{

Visų įmanomų bandymo įvykių tyrinėjimas.

Jei nepagaunate, ką reiškia 𝜉 
(tariama: #text(tracking: 0.5pt, fill: rgb("#000077"), [/#underline(stroke: (dash: "dotted"), [`'`krɪnɡəlɪs])/)]), 
tai... aš irgi. Techniškai, čia simbolis visiems bandymo įvykiams..? Jį, turbūt, reikės naudoti tik $P(xi = "kažkoks įvykis")$ ir $xi + eta$.

Be to, čia kaip aš rašau visas graikiškas raides: 
#image("writing.png", width: 66.666%, alt: "graph")
#link("https://foundalis.com/lan/hw/grkhandw.htm")[Visa abėcėlė, mano šaltinis ir taisyklingesni pavyzdžiai yra čia.]

== Diskretieji atsitiktiniai dydžiai

Per kontrolinį, pirmoje užd., nebus duota lentelė, ją reikės suskaičiuoti patiems. 

Pavyzdyje yra nepriklausomas bandymas, kuriam nėra „arba.“ 
Jeigu gausit sąlygą su „tikimybė, kad tinka tik vienas #gray("(bet kuris)") daiktas? 
Du? Visi trys?“ tada... sėkmės!..

#v(-0.5em)
#example[
Loterijoje 1000 bilietų. 1 iš bilietų duoda 500 Lt,#h(0.25em) 5 -- 100 Lt,#h(0.25em) 10 -- 10 Lt,#h(0.25em) 20 -- 1 Lt. \
$𝜉$ --- kiek litų duoda 1 atsitiktinis bilietas.

1. Reikia surūšiuoti pačius įvykius (čia litus): \
    #gray("0. ") #gray("Jei gausit 2 vienodus įvykius, tiesiog sudėkit jų tikimybes (taip turbūt nebus)")
    + 0   Lt #gray("(964 vnt.") _#gray("= 1000 - 20 - 10 - 5 - 1 vnt.)")_
    + 1   Lt #gray("(20 vnt.)")
    + 10  Lt #gray("(10 vnt.)")
    + 100 Lt #gray("(5  vnt.)")
    + 500 Lt #gray("(1  vnt.)")
2. Suskaičiuoti tikimybes:
    + $P(xi = 0)  #h(17.5pt) = 964 / 1000 = 0.964 $
    + $P(xi = 1)  #h(17.5pt) = 20 / 1000 = 0.02 $ #h(1.5em) #gray("1 Lt duodančių bilietų skaičius / visų bilietų skaičiaus")
    + $P(xi = 10) #h(10.5pt) = 10 / 1000 = 0.01 $
    + $P(xi = 100) = 5 / 1000 = 0.005 $
    + $P(xi = 500) = 1 / 1000 = 0.001 $

#skirstinys(
    [$x_i$], [0 Lt],      [1 Lt],     [10 Lt],    [100 Lt],    [500 Lt],                 
    [$p_i$], [$ 0.964 $], [$ 0.05 $], [$ 0.02 $], [$ 0.005 $], [$ 0.001 $], 

)

#gray("Paskutinis stulpelis yra tik pasitikrinimui.") \
#gray("Sudėjus visas tikimybes turi gautis 1 (išskyrus apvalinimus): 0.05 + 0.02 + 0.005 + 0.001 = 1")
]
Gali būti, kad gausite tikimybes (pvz.: 0.964), tada jų skaičiuoti, aišku, nebereiks.

#v(1em)

#table(columns: (2.5fr, 1fr, 3.0fr), stroke: none,
[
    Gavus, pavyzdžiui, tokį skirstinį:
    #table(columns: 5, inset: (x: 10pt, y: 5pt), stroke: luma(80) + 0.75pt,
        [$x_i$], [$0$],   [$2$],   [$3$],   [$5$], 
        [$p_i$], [$0.1$], [$0.3$], [$0.5$], [$0.1$], 
    )

    Reikės nubraižyti „daugiakampį,“ kur tikimybės y ašyje, o $x_i$ -- x... \

    Čia tiesiog neužmirškit pavadinti ašių... 
    $p_i$ (viršuje) ir $x_i$ (dešinėje) 
    yra būtini. 
], [
    #v(2em)
    #image("arrow-1.png", width: 100%)
], [
    #image("graph-1.png", width: 100%, alt: "graph")
])

// }}}

== Diskrečiųjų dydžių charakteristikos

// {{{

#v(4pt)
#table(columns: (auto, auto, 1fr), inset: (x: 10pt, y: 7pt), stroke: none, align: horizon,
    [$M$], [Vidurkis],           [$M xi " " = " " sum_i x_i dot p_i $],
    [$D$], [Dispersija],         [$D xi " " = " " sum_i (x_i - M xi)^2 dot p_i " " = " " M(xi^2) - (M xi)^2 $],
    [$sigma$], [Std. nuokrypis], [$sigma xi " " = " " sqrt(#scale(90%, $D xi$)) $],
)
#v(-0.5em)
#gray("(Patarčiau kaip skaičiuoti ^^^ turėti ant savo špargalkės)")

#example[
    Norint suskaičiuoti vidurkį:

    #skirstinys(
        [$x_i$], [$0$],   [$2$],   [$3$],   [$5$], 
        [$p_i$], [$0.1$], [$0.3$], [$0.5$], [$0.1$], 
    )

    $ M xi = sum_i^n x_i dot p_i = \ 
      = ( x_1 dot p_1 ) + ( x_2 dot p_2 ) + ( x_3 dot p_3 ) + ( x_4 dot p_4 ) = \
      = ( 0 dot 0.1 )   + ( 2 dot 0.3 )   + ( 3 dot 0.5 )   + ( 5 dot 0.1 ) = \
      = 0 + 0.6 + 1.5 + 0.5 = underline(2.6) $
]

// $ "normalus tekstas" ( 1 / (limits(sum)_(x_i = 1)^3 p_i) ) $

#example[
Norint suskaičiuoti dispersiją ir standartinį nuokrypį:

#skirstinys(
    [$x_i$], [$0$],   [$2$],   [$3$],   [$5$], 
    [$p_i$], [$0.1$], [$0.3$], [$0.5$], [$0.1$], 
)
#gray("Pirmiausia, reikia vidurkio!") \
Iš anksčiau, $M xi = 2.6$

#v(0.5em)
Pirmas būdas:
#v(-0.3em)
$ D xi = sum_i^n (x_i - M xi)^2 dot p_i = $ #v(-0.75em)
$ &= (x_1 - M xi)^2 dot p_1 && + (x_2 - M xi)^2 dot p_2 && + (x_3 - M xi)^2 dot p_3 && + (x_4 - M xi)^2 dot p_4 && = \
  &= (0 - 2.6)^2 dot 0.1    && + (2 - 2.6)^2 dot 0.3    && + (3 - 2.6)^2 dot 0.5    && + (5 - 2.6)^2 dot 0.1    && = \
  &= 2.6^2 dot 0.1          && + 0.6^2 dot 0.3          && + 0.4^2 dot 0.5          && + 2.4^2 dot 0.1 && = \
  &= underline(1.44)
$
]
#example[
Antras būdas:

Čia reikės pakelti skirstinį kvadratu #gray("(t.y. pakelti pirmos eilutės skaičius kvadratu)"):
#v(-0.5em)
#skirstinys2([$xi^2$],
    [$x_i$], [$0^2$], [$2^2$], [$3^2$], [$5^2$], 
    [$p_i$], [$0.1$], [$0.3$], [$0.5$], [$0.1$], 
)
#v(-0.5em) #h(7em) $arrow.b.stroked$ #v(-0.5em)
#skirstinys2([$xi^2$],
    [$x_i$], [$0  $], [$4  $], [$9  $], [$25 $], 
    [$p_i$], [$0.1$], [$0.3$], [$0.5$], [$0.1$], 
)
Tada suskaičiuoti ir šio skirstinio vidurkį: #v(-0.8em)
$ M (xi^2) = sum_i^n x_i dot p_i = 0 dot 0.1 + 4 dot 0.3 + 9 dot 0.5 + 25 dot 0.1 = 8.2 $

Ir, galiausia, dispersiją: #v(-0.5em)
$ D xi = M(xi^2) - (M xi)^2 = 8.2 - 2.6^2 = underline(1.44) gray("vnt".^2) $


Standartinis nuokrypis: #v(-0.5em)
$ sigma xi = sqrt(D xi) = sqrt(1.44) = underline(1.2) $
]
// }}}

== Diskrečiųjų skirstinių sudėtis

// {{{
Reikia sudėti kiekvieną pirmos lentelės stulpelį su kiekvienu antros ir šita sudėtis atskirti į atskirus stulpelius. 

#example[
#skirstinys(
    $x_i$, $1$,   $2$,  
    $p_i$, $0.4$, $0.6$, 
)
#skirstinys2("𝜂",
    $y_i$, $-1$,  $0$,   $4$,  
    $q_i$, $0.3$, $0.6$, $0.1$,
)

#show table.cell.where(x: 0): set align(center)

1. Reikia sudėti pirmų eilučių skaičius ir sudauginti antrųjų:
#v(-0.6em)
#skirstinys3("𝜉 + 𝜂",
    $x_i + y_i$,     $1 + (-1)$,    $1 + 0$,       $1 + 4$,       $2 + (-1)$,    $2 + 0$,       $2 + 4$,
    $p_i dot q_i$, $0.4 dot 0.3$, $0.4 dot 0.6$, $0.4 dot 0.1$, $0.6 dot 0.3$, $0.6 dot 0.6$, $0.6 dot 0.1$
)

#v(-0.6em)
#skirstinys3("𝜉 + 𝜂",
    $x_i + y_i$,   $0$,    bad_cell($1$),    $5$,    bad_cell($1$),    $2$,    $6$,
    $p_i dot q_i$, $0.12$, bad_cell($0.24$), $0.04$, bad_cell($0.18$), $0.36$, $0.06$
)

2. Sudėti vienodų stulpelių tikimybes 
#v(-0.6em)
#skirstinys3("𝜉 + 𝜂",
    $x_i + y_i$,   $0$,    good_cell($1$),    $5$,    $2$,    $6$,
    $p_i dot q_i$, $0.12$, good_cell($0.42$), $0.04$, $0.36$, $0.06$
)

3. Surūšiuoti stulpelius
#v(-0.6em)
#skirstinys2("𝜉 + 𝜂",
    $x_i + y_i$,   $0$,    $1$,    $2$,    $5$,    $6$,
    $p_i dot q_i$, $0.12$, $0.42$, $0.36$, $0.04$, $0.06$
)
]

Jei reikės atimti skirstinius, prisiminkit, kad \
#v(-0.75em)
$ a - b = a + b dot (-1), $
#v(-0.75em)
taigi tiesiog padauginkit $eta$ iš $-1$ ir sudėkit...

== Diskrečiųjų skirstinių daugyba

Skirstinius galima:
+ Padauginti iš skaičiaus (tikimybių neliesti; padauginti pirmą eilutę iš to skaičių)
+ Pakelti laipsniu (tikimybių neliesti; pakelti pirmą eilutę tuo laipsniu)
+ Padauginti iš kitos lentelės..:

#example[
#skirstinys(
    $x_i$, $1$,   $2$,  
    $p_i$, $0.4$, $0.6$, 
)
#skirstinys2("𝜂",
    $y_i$, $-1$,  $0$,   $4$,  
    $q_i$, $0.3$, $0.6$, $0.1$,
)

1. Reikia sudauginti pirmų ir antrų eilučių skaičius:
#v(-0.6em)
#skirstinys3("𝜉" + $dot$ + " 𝜂",
    $x_i dot y_i$, $1 dot (-1)$,  $1 dot 0$,     $1 dot 4$,     $2 dot (-1)$,  $2 dot 0$,     $2 dot 4$, 
    $p_i dot q_i$, $0.4 dot 0.3$, $0.4 dot 0.6$, $0.4 dot 0.1$, $0.6 dot 0.3$, $0.6 dot 0.6$, $0.6 dot 0.1$
)

#v(-0.6em)
#skirstinys3("𝜉" + $dot$ + " 𝜂",
    $x_i dot y_i$, $-1$,   bad_cell($0$),    $4$,    $-2$,   bad_cell($0$),    $8$,
    $p_i dot q_i$, $0.12$, bad_cell($0.24$), $0.04$, $0.18$, bad_cell($0.36$), $0.06$
)

2. Sudėti vienodų stulpelių tikimybes 
#v(-0.6em)
#skirstinys3("𝜉" + $dot$ + " 𝜂",
    $x_i dot y_i$, $-1$,   good_cell($0$),    $4$,    $-2$,   $8$,
    $p_i dot q_i$, $0.12$, good_cell($0.60$), $0.04$, $0.18$, $0.06$
)

3. Surūšiuoti stulpelius
#v(-0.6em)
#skirstinys2("𝜉" + $dot$ + " 𝜂",
    $x_i dot y_i$, $-2$,   $-1$,   $0$,    $4$,    $8$,
    $p_i dot q_i$, $0.18$, $0.12$, $0.60$, $0.04$, $0.06$
)
]
// }}}

= Tolydieji atsitiktiniai dydžiai

//{{{
Diskretieji dydžiai gali būti apibrėžti lentelėmis, nes, pvz.: 
tikimybė, kad metant žaidimų kauliuką, tiesiog negali iškristi 1.5 akutės. 
Tikimybė, kad žmogaus ūgis bus _tiksliai_ 2#gray[.000#overline[0]] metrai yra 0% (pagal teoriją beje).
Taigi tokie -- tolydūs -- dydžiai yra nusakomi funkcijomis. 

„Tolydi funkcija“ reiškia, kad jos grafikas, tiesiog, niekur nenutrūksta... 
Siūlas yra tolydus, kol nepaėmi žirklių ir neperkerpi.

$F(x)$ -- tolydžiosios funkcijos -- nusako tikimybę, kad viena iš mažesnių (arba lygių) reikšmių bus gauta.
Tikimybė, kad ūgis mažesnis nei 1.5 m, 1.75 m, 2 m ir t.t. iki didžiausio galimo ūgio.
#grid(columns: (1fr, 1fr), [
    Todėl, $F(x)$ 
    1. iš kairės  -- $0$, 
    2. iš dešinės -- $1$, 
    3. o vidury turės: 
        1. kilančią tiesę, 
        2. kilantį įgaubtą lanką arba 
        3. kilantį išgaubtą lanką.

  #gray("Šitą grafiką reikės nupiešti. Galėsit nebūti tikslūs.")
],
[
    #set align(center)
    #image("skateboard.png", width: 75%, alt: "graph")
])
// }}}

= Tankio funkcija

// {{{
#let dx = "dx"

Tankio funkcija parodo F(x) tikimybę gauti konkretų\* $x$, palyginus su visais kitais įvykiais. \
Lyginant su pasiskirstymo lentelėmis, kad gautume $F(x$), reikia sudėti visas tikimybes iš $x_i$ kairės, o $p(x)$ reikšmės yra pačios $x_i$ tikimybės.

Tankio funkcija yra praktiškai tiesiog tikimybė. Šansas, kad pagaliukas bus apytiksliai 15 cm, 21.27cm ir t.t.
Čia jau tarp 0 ir 1 gali būti bet kokios formos funkcija.

$ p(x) = F prime(x) "    " F(a <= x <= b) = integral_a^b p(x) dx $

#align(left, image("graph-2.png", width: 50%, alt: "graph"))

#v(1.5em)

Uždaviniui su $p(x)$ reikės prisiminti kaip integruoti:
#v(-0.5em)
#grid(columns: (1fr,) * 3, column-gutter: 2pt,
example[
    Koeficientą reikia iškelti:
    
    $integral a dx = a dot integral 1 dx$

    Vieneto integralas yra $x$.

    $integral 1 dx = x$
],
example[
    x reikia pakelti 1 laipsniu \
    ir padalinti iš naujo laipsnio:

    $&integral x    && dx && = x^2/2  \
     &integral x^41 && dx && = x^42/42$
],
example[
    $a + b$ integruoti atskirai:

    $integral x - 5 dx = \
     integral x dx - integral 5 dx = \ 
     x^2/2 - 5 x $
])

#v(0.8em)
Dėstytoja sakė, kad nereikės integruoti sunkių funkcijų, tačiau gali būti kažkas panašaus į:
#v(-0.5em)
#example[
    $integral (x + 5)^2 dx = integral x^2 + 10 x + 25 dx gray(= x^3/3 + 5 x^2 + 25x)$

    #gray("Čia tiesiog greitosios daugybos formulė: " + $(a plus.minus b)^2 = a^2 plus.minus 2 a b + b^2$)
]
#v(-1.0em)
_#gray("Čia nėra „<...> + C,“ nes aš juos visus piktavališkai ištryniau! (˵ •̀ᴗ•́˵)و     (t.y. per KD nereikės)")_


#v(0.8em)
Per kontrolinį mums bus duota tankio funkcija su nežinomu koeficientu: $a$.
#v(-0.5em)
#example[
$ p(x) = cases(
    a x^2"," && "kai" 0 < x < 1,
    0","     && "kai" x < 0 "arba" x > 1
) $

#let EQ = $ = " " $

$ & integral_0^1 p(x) dx = 1  && #gray($<-$ + "pagal teoriją") \
  & integral_0^1 a x^2 dx = 1 && #gray($<-$ + "tarp 0 ir 1 (kitur dabar nesvarbu), " + $p(x) = a x^2$) \ 
  & integral_0^1 a x^2 dx EQ a dot (x^3/3""stulpelis(0, 1)) && EQ a dot (1^3/3 - 0^3/3) EQ a dot 1/3 \
  & 1/3 a = 1, " " underline(a = 3) $

$ p(x) = cases(
    3 x^2"," && "kai" 0 < x < 1,
    0","     && "kai" x < 0 "arba" x > 1
) $
]

Suradus konkretų $p(x)$ reikės apskaičiuoti vidurkį ir dispersiją:
#example[
$ p(x) = cases(
    3 x^2"," && "kai" 0 < x < 1,
    0","     && "kai" x < 0 "arba" x > 1
) $

#v(1.0em)

$ M xi = integral_a^b x dot p(x) dx "   " #gray($<-$ + "pagal teoriją") $
#v(-0.8em)
$ M xi = integral_0^1 x dot 3 x^2 dx = integral_0^1 3 x^3 dx = 3 x^4/4""stulpelis(0, 1) = 3 (1^4/4 - 0^4/4) = underline(3/4) $

#v(1.0em)

$ D xi = gray(integral_(-oo)^(0) #h(-0.9em) 0 dx +) integral_0^1 #h(-0.5em) (x - M xi)^2 p(x) dx gray(+ integral_(1)^(+oo) #h(-1.3em) 0 dx) 
  #gray("  " + $<-$ + "pagal mane (teorijoj yra" + $ #scale(90%, $integral_(-oo)^(+oo) #h(-0.8em) ... dx$) $ + ")") $
#v(-0.3em)
$ D xi = integral_0^1 #h(-0.3em) (x - 3/4)^2         #h(-0.3em) dot 3x^2 dx = 
         integral_0^1 #h(-0.3em) (x^2 - 3/2x + 9/16)            dot 3x^2 dx = 
         integral_0^1 #h(-0.3em) 3x^4 - 9/2 x^3 + 27/16 x^2 dx = \
 gray( = ( 3/5" "x^5 - 9/8" "x^4 + (9 dot cancel(3))/(16 dot cancel(3))" "x^3 )stulpelis(0, 1) = 
         3/5 - 9/8 + 9/16 = 0.6 + 1.125 + 0.5625) = underline(2.2875) $

#v(1.0em)

$ sigma xi = sqrt(D) = sqrt(2.2875) approx underline(1.51) $
]

Galiausia, reikės surasti tikimybę kažkokiame ruože $P(a < x < b)$ ir nubraižyti $p(x)$ grafiką:
#example[
$ p(x) = cases(
    3 x^2"," && "kai" 0 < x < 1,
    0","     && "kai" x < 0 "arba" x > 1
) $

$ P(a < x < b) = integral_a^b p(x) dx "   " #gray($<-$ + " pagal teoriją") $

#gray("0.2 ir 0.8 ir bet kokie skaičiai:")
#v(-1.0em)
$ P(0.2 < x < 0.8) = integral_0.2^0.8 3x^2 dx = (cancel(3) x^3)/cancel(3) stulpelis(0.2, 0.8) = 0.8^3 - 0.2^3 = underline(0.504) $

#gray[
    Čia, teoriškai, galėtų duoti neigiamą skaičių ir/arba daugiau nei 1.
    $ P(-0.3 < x < 1.2) = integral_(-0.3)^(0) #h(-0.75em) 0 dx + integral_0^1 3x^2 dx + integral_1^1.2 #h(-0.75em) 0 dx = 0 + integral_0^1 3x^2 dx + 0 = ... $
]


#grid(columns: (1fr, 1fr), [
    #gray("Tada grafikui, galit surasti 3 bet kokius \n taškus ir pravesti liniją... (kaip ir visada)")

    $ & p(0) = 3 dot 0^2 = 0,         "  " && (0; 0) \ 
      & p(1) = 3 dot 1^2 = 3,         "  " && (1; 3) \
      & p(1/2) = 3 dot (1/2)^2 = 3/4, "  " && (1/2; 3/4) \
    $
], [
    #align(left, image("graph-3.png", width: 80%, alt: "graph"))
])

#v(1.0em)
]
// }}}

= Pasiskirstymo lentelė į pasiskirstymo funkciją

// {{{
$ F(x) = sum_(x_i < x) P(xi = x_i) $

#example[
#let c = (color, body) => text(fill: rgb(color), body)
#let a = ( a: "#bca11f", b: "#f0a328", c: "#f3565d", d: "#f356a4")
#let b = ( a: "#9028f0", b: "#2d28f0", c: "#2880f0", d: "#0fa34e")

#let x0 = c(a.a, $0$)
#let x1 = c(a.b, $1$)
#let x2 = c(a.c, $3$)
#let x3 = c(a.d, $5$)

#let p0 = c(b.a, $0.1$)
#let p1 = c(b.b, $0.4$)
#let p2 = c(b.c, $0.3$)
#let p3 = c(b.d, $0.2$)

#let xi0 = c(a.a, $x_1$)
#let xi1 = c(a.b, $x_2$)
#let xi2 = c(a.c, $x_3$)
#let xi3 = c(a.d, $x_4$)

#skirstinys(
    $x_i$, x0, x1, x2, x3, 
    $p_i$, p0, p1, p2, p3, 
)

$ F(x) = cases(
    0","                                                                    && "kai"      -oo && < x < xi0,   
    #c(b.a, $p_1$)","                                                       && "kai" "  " xi0 && < x < xi1,   
    #c(b.a, $p_1$) + #c(b.b, $p_2$)","                                      && "kai" "  " xi1 && < x < xi2,   
    #c(b.a, $p_1$) + #c(b.b, $p_2$) + #c(b.c, $p_3$)","                     && "kai" "  " xi2 && < x < xi3,   
    #c(b.a, $p_1$) + #c(b.b, $p_2$) + #c(b.c, $p_3$) + #c(b.d, $p_4$)",  "  && "kai" "  " xi3 && < x < +oo,   
) $

#gray("Atsakymas:")

$ F(x) = cases(
    0                 && = 0","     && "kai"       -oo && < x <  x0,   
    p0                && = 0.1","   && "kai" "   "  x0 && < x <  x1,   
    p0 + p1           && = 0.5","   && "kai" "   "  x1 && < x <  x2,   
    p0 + p1 + p2      && = 0.8","   && "kai" "   "  x2 && < x <  x3,   
    p0 + p1 + p2 + p3 && = 1.0",  " && "kai" "   "  x3 && < x < +oo,   
) $

#gray("Grafikas:")

#block(inset: (left: 1.5em, bottom: 1.5em), image("graph-6.2.png", width: 60%, alt: "graph"))

#gray[...vidurkis ir t.t., skaitykit sąlygą!]
]
// }}}






























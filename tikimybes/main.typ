#import "@preview/mannot:0.3.2": *
#set page("a4", margin: (x: 2em, top: 2em, bottom: 15cm), height: auto)
#set text(size: 14pt)

#show raw.where(block: false): set text(font: "Libertinus Mono", tracking: -1pt, spacing: 25%, size: 13pt)
#show raw.where(block: false): it => { box(fill: rgb("#BDC"), outset: (x: 3pt, y: 2pt), radius: 15%, it) }

= Tikimybių teorija

== Klasikinė tikimybių teorija (skyriaus pradmenys)

Bandymas gali turėti kelis įvykius/baigtis, kurių tikimybę galima gauti pagal: $P(A) = m/n$
#table(columns: 3, stroke: none,
  [$A$   ], [ -- ], [  įvykis (elementarusis/sudėtinis) ], 
  [$m$   ], [ -- ], [  palankūs įvykiai ],
  [$n$   ], [ -- ], [  visi įvykiai ],
  [$P(A)$], [ -- ], [  įvykio $A$ tikimybė ], 
)

Metant lošimo kauliuką, tikimybę kad iškris 4 akutės galima gauti: 
1. išrašius visas galimas baigtis = ${ 1, 2, 3, 4, 5, 6 }$ ir visas palankias baigtis = ${ 4 }$;
2. suskaičiavus kiek yra visų ($n = 6$) ir palankių ($m = 1$) baigčių;
3. padalinus $m/n = 1/6$ (Ats.: $1/6$)

== Tikimybių sudėtis ir daugyba

Daugelyje uždavinių bus žodžiai: „ir,“ „arba“ ir „ne.“ \
Jie gali būti praleisti, pvz.: „Kokia tikimybė, kad metant du kauliukus iškris 6, 7 akutės?“ \ 
Ir gali būti pakeisti sinonimais: „A bei B,“ „A bet ne B“ ir t.t.

#let ov   = T => $ #h(1pt) #overline(T) #h(1pt) $
#let opt  = mark.with(color: orange)
#let bad  = mark.with(color: rgb("#D77"))
#let grey = mark.with(color: gray)
#let good = mark.with(color: green)

#let ne   = "ne"
#let ir   = "ir"
#let arba = "arba"

#table(columns: 3, stroke: none,
  [arba], [ $P(A + B) = P(A) + P(B) - opt(P(A) P(B))$ ], [ $opt(P(A)P(B) = 0)$, \ kai A ir B negali įvykti vienu metu ],                                 
  [ir  ], [ $P(A dot B) = P(A) P(B opt(|A))$ ], [ $opt(P(B|A) = P(B))$, \ kai A neturi pasekmių B tikimybei ],
  [ne  ], [ $P(ov("A")) = 1 - P(A)$ ],    [],
)

#table(columns: (85%, 15%), inset: 8pt,
  [ „Iškrito mažiau nei 3 akutės arba daugiau nei 5“ \
    $A - "mažiau  nei 3 akutės, " P(A) = 2/6 $ \
    $B - "daugiau nei 5 akutės, " P(B) = 1/6 $ \
    $markhl(P(A arba B) = P(A) + P(B) = 2/6 + 1/6 = 3/6 = 1/2, color: #rgb("#99FF77"))$ \ ], 
  [ $ 1 2 grey(3 4 5 6) \ grey(1 2 3 4 5) 6 \ good(1 2) grey(3 4 5) good(6) $ ],
  [ „Iškrito daugiau nei 2 akutės arba mažiau nei 4“ \
    $A - "daugiau nei 2 akutės, " P(A) = 4/6 $ \
    $B - "mažiau  nei 4 akutės, " P(A) = 3/6 $ \
    $markhl(P(A arba B) = P(A) + P(B) - P(A)P(B) = 4/6 + 3/6 - 4/6 dot 3/6 = dots = 5/6, color: #rgb("#99FF77"))$ \ ],
  [ $ grey(1 2) 3 4 5 6 \ 1 2 3 grey(4 5 6) \ good(1 2 underline(3) 4 5 6) $ ],
  [ „Iškrito 4 akutės ir kauliuką metė Petriukas, o ne vienas kitų 2 jo draugų“ \ 
    $A - "4 akutės,  " P(A) = 1/6 $ \
    $B - "Petriukas, " P(B) = 1/3 $ \
    $markhl(P(A ir B) = P(A) dot P(B) = 1/6 dot 1/3 = 1/18, color: #rgb("#99FF77")) $ ],
  [ $ grey(1 2 3) 4 grey(5 6) \ grey(J K) P \ good((4; P)) $ ],
  [ „Iškrito daugiau nei 2 akutės ir ne 4 akutės“ \
    $A - "daugiau nei 2 akutės, " P(A) = 4/6 $ \
    $B - "ne 4 akutės, "          P(B) = 3/4 $ _#text(fill: gray, [(ne $5/6$, nes 1 ir 2 akutės netinka jau A įvykiui)])_ \
    $markhl(P(A ir ne B) = P(A) dot P(B|A) = 4/6 dot 3/4 = 12/24 = 1/2, color: #rgb("#99FF77")) $ ], 
  [ $ grey(1 2) 3 4 5 6 \ bad(1 2) 3 grey(4) 5 6 \ grey(1 2) good(3) grey(4) good(5 6) $ ],
)

== Kombinatorika

== Kaip naudotis skaičiuotuvu

Per K.D. faktorialą suskaičiuoti turėsit tris būdus:
1. AI/kiti draugai...
2. Išskleisti, pvz.: $10! = 10 dot 9 dot 8 dot 7 dot 6 dot 5 dot 4 dot 3 dot 2 dot 1$
3. Skaičiuotuvo viršuj (dažniausia, dešinėje) būna mygtukas „2nd“ arba „shift“
   ir virš vieno iš kitų mygtukų bus (dažniausia, kita spalva) parašytas šauktukas. 
#image("calc-fac.png", width: 100%)

== Kombinatorikos pagrindai

„Kokia tikimybė, kad iš $n$ \_\_\_, bus po $k$ gerų \_\_\_“

#align(center)[
#table(columns: (1fr, ) * 3, stroke: none,
  [ Kėliniai  ], [ Gretiniai ], [ Deriniai ], 
  [ kai px ant gyvenimo ], [ kai tvarka svarbi ], [ kai tvarka nesvarbi ], 
  [ $ P_n = n! $ ], [ $ A^k_n = n! / ((n - k)!) $ ], [ $ C^k_n = n! / ((n - k)! dot k! ) $ ],
) ]

#table(columns: 1, stroke: none,
  [ „Kokia tikimybė, kad korteles `R, A, S, V, O` sudėliojus atsitiktinai gausis: `V O R A S`?“ \
    $A$ -- sudėliojus korteles R A S V O atsitikitine tvarka gausis žodis VORAS. \
    #table(columns: (27.5%, 30%), stroke: none, inset: (x: 0pt, y: -0.5em), [ $n = 5! = 120$ \ $m = 1$ ], [ $ P(A) = m/n = 1/120 = 0.83 % $ ])
    #block(fill: rgb("#EEE"), width: 100%, outset: 4pt)[
      #set text(fill: rgb("#113"))
      Mokykloje šitą uždavinį mes skaičiuotume su „dėžutėmis,“ kur į pirmą dėžutę galima įdėti bet kurią iš 5 kortų, antrajai dėžutei jau liko tik 4 kortos, trečiai 3, ketvirtai 2 ir paskutiniai tik 1 -- 
      #box(baseline: 1pt, table(inset: (x: 2pt, y: 1pt), stroke: 0.5pt, columns: 5, [5], [4], [3], [2], [1])).
      Taigi, vienos kombinacijos -- `O V S A R` -- išrinkimas galėtų atrodyti taip:
      #box( table(inset: 0pt, columns: (2.7em,) * 5, rows: 2.7em, align: center + horizon, [R A S V O], [R A \ S V], [R A S], [R A], [R]) )
    ]
    #v(0.5em)
  ],  // TODO patikrinti ar aš ne kvailas...
  table.hline(),
  [ #v(0.5em)
    „Kokia tikimybė, kad atspėsime visus 4 greičiausius bėgikus iš 6?“ \
    $A$ -- ... _perrašyti kas viršuj (nuo „atspėsime“ ...tolyn)_ \
    #table(columns: (27.5%, 30%), stroke: none, inset: (x: 0pt, top: -0.5em, bottom: 0.5em), [ $n = A^4_6 = 6! / (6 - 4)! = 360 $ \ $m = 1$ ], [ $ P(A) = m/n = 1/360 $ ])
  ],
  table.hline(),
  [ #v(0.5em)
    „Kokia tikimybė, kad iš 12 juodų ir 8 baltų kortelių ištrauksime po 2 juodas korteles?“ \
    $A$ -- _(nepamirškit parašyti per K.D.)_
    #table(columns: (50%, 30%), stroke: none, inset: (x: 0pt, y: -0.5em), [ 
    $n = C^2_20 = 20! / ((20 - 2)! dot 2!) = (cancel(18!) dot 19 dot 20) / (cancel(18!) dot 2! "    ") = 190$ \
    $m = C^2_12 = 12! / ((12 - 2)! dot 2!) = (cancel(10!) dot 11 dot 12) / (cancel(10!) dot 2! "    ") =  66$ ],
    [ $ P(A) = m/n = 66/190 approx 0.35 $ ]) #v(6pt)
    #block(fill: rgb("#EEE"), width: 100%, outset: 4pt)[
        Šitą uždavinį galima išspręsti dar vienu būdu (kadangi traukiame tik po dvi korteles): \
        $A$ -- Pirma kortelė juoda, $B$ -- Antra kortelė juoda \
        $P(A) #h(1.33em) = 12/20$, \
        $P(B|A)   = 11/19$ \ 
        $P(A B) #h(0.58em) = P(A) dot P(B|A) = 12/20 dot 11/19 = 132/380 = 66/190 approx 0.35 $
    ]
  ]
)


== Bernulio formulė

#block[
  #set align(left)
  $ P_n(k) = C^k_n dot p^k dot q^(n-k) $
]
#v(-1em)
#table(columns: 3, stroke: none, inset: 3pt,
  [$n$], [ -- ], [ kiek kartų vyksta bandymas ], 
  [$k$], [ -- ], [ kiek kartų turi įvykti įvykis ],
  [$p$], [ -- ], [ įvykio tikimybė po 1 bandymo ],
  [$q$], [ -- ], [ $q = 1 - p$, daugiau nesvarbu ], 
)

„Kokia tikimybė, kad metant monetą 20 kartų, herbas iškris 4 kartus?“ \
$n = 20, #h(2em) k = 4, #h(2em) p = 1/2, #h(2em) q = 1 - 1/2 = 1/2$
#v(-0.5em)
#block[
  #set align(left)
  $ P_20(4) = C^4_20 dot (1/2)^4 dot (1/2)^(20 - 4) 
  = (20! dot 1 dot 1) / ((20 - 4)! dot 4! dot 2^4 dot 2^16)
  = (cancel(16!) dot 17 dot 18 dot 19 dot 20) / (cancel(16!) dot 24 dot 16 dot 65536) approx 0.0046 $
]

„Kauliukas metamas 3 kartus. Kokia tikimybė, kad 1 kartą iškris nemažiau kaip 5 akutės?“
$n = 3, #h(2em) k = 1, #h(2em) p = 2/6, #h(2em) q = 1 - 2/6 = 4/6$
#v(-0.5em)
#block[
  #set align(left)
  $ P_3(1) = C^1_3 dot (2/6)^1 dot (4/6)^(3 - 1) = 3!/((3-1)! dot 1!) dot 2/6 dot 16/36 = cancel(6)/cancel(2) dot cancel(2)/cancel(6) dot 16/36 approx 0.44 $
]

„Kauliukas metamas 5 kartus. Kokia tikimybė, kad 4 akutės iškris ne daugiau kaip 2 kartus?“
$n = 5, #h(2em) k <= 2, #h(2em) p = 1/6, #h(2em) q = 1 - 1/6 = 5/6$
#block[
  #show math.equation: set align(left)
  $ P_5(0 <= k <= 2) = P_5(0) + P_5(1) + P_5(2) approx 0.402 + ... $
  $ P_5(0) = C^0_5 dot (1/6)^0 dot (5/6)^(5 - 0) = 5!/((5 - 0)! dot 0!) dot 1 dot (5/6)^5 = (5/6)^5 approx 0.402 $
  $ P_5(1) = ... $
  $ P_5(2) = ... $
]

== Bernulio formulių asimptotika

_Apytikslės formulės, kai Bernulio formulėje gaunasi per dideli skaičiai..._

#[
#show math.equation.where(block: true): set align(horizon)
#table(columns: 3, stroke: none,

  table.cell([Puasono formulės:], colspan: 3),
  [ $ P_n (k) approx grey((lambda^k e^(-lambda)) / k!) approx "1 PRIEDAS" $ $lambda = n dot p$ ], [ Kai n didelis (n > 69) \ ir #h(0.75em) p mažas (p < 0.1) ], [ jei $p > 0.9$, $p$ apkeisti su $q$ ir $P_n (k) approx 1 - "jūsų rezultatas" $ ],
  [ $ P_n (m <= k_0) approx "2 PRIEDAS" $ $lambda = n dot p$ ], [ Kai n didelis (n > 69) \ ir #h(0.75em) p mažas (p < 0.1) ], [ Čia reikia $m <= k_0$! \ Pvz.: $mark(5 < k_0, color: #red) grey(=>) good(6 <= k_0)$ ],

  table.cell([], colspan: 3),
  table.hline(stroke: 0.5pt),
  table.cell([], colspan: 3),

  table.cell([Lokalioji Muavro-Laplaso formulė:], colspan: 3),
  [ $ P_n (k) approx 1 / sqrt(n p q) dot phi(x) $ 
    $ x = (k - n p) / sqrt(n p q) $
    $phi(x) approx "3 PRIEDAS"$], [Kai n didelis (n > 69), \ o p nėra mažas], [Jei $x$ neigiamas, nekreipkit dėmesio, trečiame priede minusas yra tiesiog nesvarbus 
  ],

  table.cell([], colspan: 3),
  table.hline(stroke: 0.5pt),
  table.cell([], colspan: 3),

  table.cell([Integralinė Muavro-Laplaso formulė:], colspan: 3),
  [ $ P_n (k_1 <= k <= k_2) approx Phi(x_2) - Phi(x_1) $
    $ x_1 = (k_1 - n p)/(sqrt(n p q)), x_2 = (k_2 - n p)/(sqrt(n p q)) $
    $Phi(x_(1, 2)) approx "4 PRIEDAS"$
  ], [Kai n didelis (n > 69), \ o p nėra mažas], [ Čia jau atsargiai su minusais! \ $Phi(-x) = - Phi(x)$ ]
) 
]

== Kaip naudotis priedais

*Pirmas* ir *antras* priedai yra tiesiog įprastos lentelės...

*Ketvirtas* priedas yra tiesiog didžiulis sąrašas (padalintas į kelis stulpelius, kad spausdinimui nereiktų tualetinio popieriaus rulonėlių)
#image("priedai-4.png", width: 100%)

*Trečias* priedas:
#image("priedai-3.png", width: 100%)
  
Čia: 
1. eilutėse (vertikaliai) yra sveika $x$ dalis ir pirmasis skaičius po kablelio, pvz.: $markul(2","3)grey(456)$
2. stulpeliuose (horizontaliai) yra antrasis skaičiuos po kablelio, pvz.: $grey(2","3)markul(4)grey(56)$
3. pačioje lentelėje ($phi(x)$ reikšmėse) yra 4 skaičiai #underline("po kablelio", evade: false) ( ` 0,` tiesiog praleista...)

== Kontrolinyje nebus (mano žiniomis)

1. Pilnosios tikimybės formulių:
  + Nereikės hipotezių ir Bajeso formulės. 
  + Nereikės „suraskite labiausiai tikėtino įvykio tikimybę“ \
    Nereikės $n p - q <= k_0 <= n p + q$
2. Tik kombinacijų skaičiaus skaičiavimo, \ 
  taigi gretinys/kėlinys/derinys niekada nebus atsakymai (tik atsakymo dalis!!!) \
  Jei neklystu, visi atsakymai turėtų būti tarp $0$ ir $1$

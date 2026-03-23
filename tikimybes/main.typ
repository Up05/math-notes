#import "@preview/mannot:0.3.2": *
#set page("a4", margin: (x: 2em, top: 2em, bottom: 15cm), height: auto)
#set text(size: 14pt)

= Tikimybių teorija

== Klasikinė tikimybių teorija (skyriaus pradmenys)

Bandymas gali turėti kelis įvykius/baigtis, kurių tikimybę galima apskaičiuoti pagal: \
$P(A) = m/n$

#table(columns: 2, stroke: none,
  [$P(A)$], [  įvykio $A$ tikimybė ], 
  [$A$   ], [  įvykis (elementarusis/sudėtinis) ], 
  [$m$   ], [  palankūs įvykiai ],
  [$n$   ], [  visi įvykiai ],
)

Metant lošimą kauliuką, tikimybę kad iškris 4 akutes galima gauti: 
1. išrašius tą vieną palankęs ir visas galimas baigtis: \
  $M = { 4 }$ \
  $N = { 1, 2, 3, 4, 5, 6 }$
2. suskaičiavus kiek yra palankių ($m = 1$) ir bet kokių baigčių ($n = 6$)
3. padalinus $m$ iš $n$, $m/n = 1/6$

== Tikimybių sudėtis ir daugyba

Daugelyje uždavinių bus žodžiai: „ir,“ „arba“ ir „ne“ \
Jie gali būti praleisti, pvz.: „Kokia tikimybė, kad metus du kauliukus iškris 6, 7 akutės?“ $->$ „[...] 6 arba 7 akutės?“ Gali būti pakeisti sinonimais: „A bei B,“ „A bet ne B“ ir t.t.

#let ov   = T => $ #h(1pt) #overline(T) #h(1pt) $
#let opt  = mark.with(color: orange)
#let grey = mark.with(color: gray)
#let good = mark.with(color: green)

#let ne   = "ne"
#let ir   = "ir"
#let arba = "arba"

#table(columns: 3, stroke: none,
  [„arba“], [ $P(A + B) = P(A) + P(B) - opt(P(A) P(B))$ ], [ $opt(P(A)P(B) = 0)$, \ kai A ir B negali įvykti vienu metu ],                                 
  [„ir  “], [ $P(A dot B) = P(A) P(B opt(|A))$ ], [ $opt(P(B|A) = P(B))$, \ kai A neturi pasekmių B tikimybei ],
  [„ne  “], [ $P(ov("A")) = 1 - P(A)$ ],    [],
)

#table(columns: 2, inset: 8pt,
  [ „Iškrito mažiau nei 3 akutės arba daugiau nei 5“ \
    $A - "mažiau  nei 3 akutės, " P(A) = 2/6 $ \
    $B - "daugiau nei 5 akutės, " P(B) = 1/6 $ \
    $markhl(P(A arba B) = P(A) + P(B) = 2/6 + 1/6 = 3/6 = 1/2, color: #green)$ \ ], 
  [ $ 1 2 grey(3 4 5 6) \ grey(1 2 3 4 5) 6 \ good(1 2) grey(3 4 5) good(6) $ ],
  [ „Iškrito daugiau nei 2 akutės arba mažiau nei 4“ \
    $A - "daugiau nei 2 akutės, " P(A) = 4/6 $ \
    $B - "mažiau  nei 4 akutės, " P(A) = 3/6 $ \
    $markhl(P(A arba B) = P(A) + P(B) - P(A)P(B) = 4/6 + 3/6 - 4/6 dot 3/6 = dots = 5/6, color: #green)$ \ ],
  [ $ grey(1 2) 3 4 5 6 \ 1 2 3 grey(4 5 6) \ good(1 2 underline(3) 4 5 6) $ ],
  [ „Iškrito 4 akutės ir kauliuką metė Petriukas, o ne vienas kitų 2 jo draugų“ \ 
    $A - "4 akutės,  " P(A) = 1/6 $ \
    $B - "Petriukas, " P(B) = 1/3 $ \
    $markhl(P(A ir B) = P(A) dot P(B) = 1/6 dot 1/3 = 1/18, color: #green) $ ],
  [ $ grey(1 2 3) 4 grey(5 6) \ grey(J K) P \ good((4; P)) $ ],
  [ „Iškrito daugiau nei 2 akutės ir ne 4 akutės“ \
    $A - "daugiau nei 2 akutės, " P(A) = 4/6 $ \
    $B - "ne 4 akutės, "          P(B) = 5/6 $ \
    $markhl(P(A ir ne B) = P(A) dot P(B|A) = 4/6 dot 3/4 = 12/24 = 1/2, color: #green) $ ], 
  [ $ grey(1 2) 3 4 5 6 \ 1 2 3 grey(4) 5 6 \ grey(1 2) good(3) grey(4) good(5 6) $ ],
)


/*
* + 1. Klasikinis 
* 2. Kombinatorikos
* 3. Bernulio
* 4. Asimptotika
*
*
* nebus:
*   Pilnųjų daiktų
*
*/

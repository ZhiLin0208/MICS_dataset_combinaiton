*cm10改成cm11
generate byte cm11 = cm10, before(cm10)
drop cm10

*ma9改成ma11
generate byte ma11 = ma9, before(ma9)
drop ma9

*mn1改成mn2
generate byte mn2 = mn1, before(mn1)
drop mn1

*mn18改成mn20
generate byte mn20 = mn18, before(mn18)
drop mn18

*mn24以后的都改变
generate byte mn36 = mn24
generate byte mn37n = mn25n
generate byte mn37u = mn25u
generate byte mn38 = mn26
generate str mn39a = mn27a
generate str mn39b = mn27b
generate str mn39c = mn27c
generate str mn39d = mn27d
generate str mn39e = mn27e
generate str mn39f = mn27f
generate str mn39g = mn27g
generate str mn39h = mn27h
generate str mn39i = mn27i
generate str mn39q = mn27q
generate str mn39x = mn27x
generate byte mn5 = mn3
drop mn24 mn25n mn25u mn26 mn27a mn27b mn27c mn27d mn27e mn27f mn27g mn27h mn27i mn27q mn27x mn3

*mt改变
generate byte mt1 = mt2
drop mt2
generate byte mt2 = mt3
drop mt3
generate byte mt3 = mt4
drop mt4
generate byte mt4 = mt6
drop mt6

*pn改变(注意：pn23ab\pn22c\22e\22i\22j\\pn13c\13e\13i\13j暂未合并且pn子变量原本就有问题）
generate byte pn3u = pn2u
drop pn2u
generate byte pn3n = pn2n
drop pn2n
generate byte pn24 = pn23
drop pn23
generate long pn24a = pn23a
drop pn23a
generate int pn24ads = pn23ads
drop pn23ads
generate long pn24asp = pn23asp
drop pn23asp
generate str pn23x = pn22x
drop pn22x
generate str pn23q = pn22q
drop pn22q
generate str pn23nr = pn22nr
drop pn22nr
generate str pn23f = pn22f
drop pn22f
generate str pn23g = pn22g
drop pn22g
generate str pn23h = pn22h
drop pn22h
generate str pn23a = pn22a
drop pn22a
generate str pn23b = pn22b
drop pn22b
generate str pn23c = pn22d
drop pn22d
generate byte pn22n = pn21n
drop pn21n
generate byte pn22u = pn21u
drop pn21u
generate byte pn21 = pn20
drop pn20
generate byte pn20 = pn19
drop pn19
generate byte pn19 = pn18
drop pn18
generate byte pn17 = pn16
drop pn16
generate byte pn15 = pn14
drop pn14
generate long pn15a = pn14a
drop pn14a
generate str pn15ab = pn14ab
drop pn14ab
generate int pn15ads = pn14ads
drop pn14ads
generate long pn15asp = pn14asp
drop pn14asp
generate str pn14a = pn13a
drop pn13a
generate str pn14b = pn13b
drop pn13b
generate str pn14c = pn13d
drop pn13d
generate str pn14f = pn13f
drop pn13f
generate str pn14g = pn13g
drop pn13g
generate str pn14h = pn13h
drop pn13h
generate str pn14nr = pn13nr
drop pn13nr
generate str pn14q = pn13q
drop pn13q
generate str pn14x = pn13x
drop pn13x
generate byte pn13n = pn12n
drop pn12n
generate byte pn13u = pn12u
drop pn12u
generate byte pn12 = pn11
drop pn11
generate byte pn11 = pn10
drop pn10
generate byte pn10 = pn9
drop pn9
generate byte pn9 = pn8
drop pn8
generate byte pn8 = pn7
drop pn7
generate byte pn6 = pn5
drop pn5
generate byte pn5 = pn4
drop pn4
generate byte pn4 = pn3
drop pn3

**合并456并补充label
append using "/Users/linzhi/Desktop/mics/clean_mics45-变量名和6一致.dta"
label variable pn14q "Person checking on baby's health: Missing"
label variable pn15a "quel est le nom de la structure ou ce controle a eu lieu"
label variable pn15ab "quel est le nom de la structure ou ce controle a eu lieu"
label variable pn15ads "District sanitaire"
label variable pn15asp "Sous-prefecture"
label variable pn23q "Person checking on mother's health: Missing"
label variable pn24a "quel est le nom de la structure ou ce controle a eu lieu"
label variable pn24ads "District sanitaire"
label variable pn24asp "Sous-prefecture"


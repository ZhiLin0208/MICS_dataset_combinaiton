* 原变量94个

ssc install nmissing
*看缺失值
nmissing 
*windex5:看是否互斥，5包含51和55（编码不太一样），51和55互斥
tab windex5 windex51 windex5_5
compare windex5 windex51 
compare windex5 windex5_5
compare windex51 windex5_5 
*查看国家
tab country if windex5_5~=.
tab windex5 if country =="Uruguay", nolab
drop windex51 windex5_5

*无观测值，问卷里也无相应变量
drop mn27q

*pn12：三个变量互斥，有两个国家分别回答了pn12下的a\b两问，但问题其实都只是问了一次的情况，故可以整合成一个问题“How long after delivery did that check or first of these checks happen?“
tab country if pn12u~=.
tab country if pn12au~=.
tab country if pn12bu~=.
compare pn12au pn12bu
compare pn12u pn12bu
compare pn12u pn12au
tab country if pn12n~=.
tab country if pn12an~=.
tab country if pn12bn~=.
compare pn12an pn12bn
compare pn12n pn12bn
compare pn12n pn12an
*生成新变量pn12u_all和pn12n_all
generate pn12u_all = pn12u, before(pn12u)
label variable pn12u_all "How long after delivery did the check or the first check of baby happen? (unit)"
label values pn12u_all labels118
recast byte pn12u_all
format %1.0f pn12u_all
replace pn12u_all = pn12au if pn12au~=.
replace pn12u_all = pn12bu if pn12bu~=.
tab pn12u_all
tab country if pn12u_all~=.
generate pn12n_all = pn12n, before(pn12n) 
label variable pn12n_all "How long after delivery did the check or the first check of baby happen? (number)"
label values pn12n_all labels119
recast byte pn12n_all
format %2.0f pn12n_all
replace pn12n_all = pn12an if pn12an~=.
replace pn12n_all = pn12bn if pn12bn~=.
tab pn12n_all
tab country if pn12n_all~=.
*删除原变量
drop pn12u pn12n pn12au pn12an pn12bu pn12bn

*pn21：同理pn12
tab country if pn21u~=.
tab country if pn21au~=.
tab country if pn21bu~=.
compare pn21au pn21bu
compare pn21u pn21bu
compare pn21u pn21au
tab country if pn21n~=.
tab country if pn21an~=.
tab country if pn21bn~=.
compare pn21an pn21bn
compare pn21n pn21bn
compare pn21n pn21an
*生成新变量pn21u_all和pn21n_all
generate pn21u_all = pn21u, before(pn21u)
label variable pn21u_all "How long after delivery did the check or the first check of mother happen? (unit)"
label values pn21u_all labels130
recast byte pn21u_all
format %1.0f pn21u_all
replace pn21u_all = pn21au if pn21au~=.
replace pn21u_all = pn21bu if pn21bu~=.
tab pn21u_all
tab country if pn21u_all~=.
generate pn21n_all = pn21n, before(pn21n) 
label variable pn21n_all "How long after delivery did the check or the first check of mother happen? (number)"
label values pn21n_all labels131
recast byte pn21n_all
format %2.0f pn21n_all
replace pn21n_all = pn21an if pn21an~=.
replace pn21n_all = pn21bn if pn21bn~=.
tab pn21n_all
tab country if pn21n_all~=.
*删除原变量
drop pn21u pn21n pn21au pn21an pn21bu pn21bn

*hh6：
*hh6包含hh6a中的国家Ukraine，应该是将hh6a的1、2重新编到了hh6的1，3重新编到了2.
tab country if hh6a~=.
tab country if hh6~=.
tab hh6a if country == "Ukraine"
tab hh6 if country == "Ukraine"
generate hh6ukraine = hh6 if country=="Ukraine"
generate hh6aukr_ceshi = 1 if hh6a==3&hh6ukraine==2
tab hh6aukr_ceshi
replace hh6aukr_ceshi = 2 if hh6a==1&hh6ukraine==1, nopromote
replace hh6aukr_ceshi = 3 if hh6a==2&hh6ukraine==1, nopromote
drop hh6ukraine hh6aukr_ceshi
*hh6包含hh6a中所有国家，删去hh6a（和双瑜讨论过了）
drop hh6a

*种族hc1c: 包含ethnicity，ethnicity1的国家，观测值也相等，但是有些数值不等。为了和mics6命名统一，重命名为ethnicity
tab hc1c
tab ethnicity
tab ethnicity1
tab country if hc1c~=.
tab country if ethnicity ~=.
tab country if ethnicity1 ~=.
compare ethnicity ethnicity1 if country=="Saint Lucia"
compare ethnicity hc1c if country=="Saint Lucia"
compare ethnicity hc1c if country=="Moldova"
compare ethnicity hc1c if country=="Uruguay"
drop ethnicity ethnicity1
generate byte ethnicity:labels28 = hc1c, before(hc1c)
label variable ethnicity "Ethnic group of household head"
drop hc1c

*helevel:
tab helevel
tab helevel1
tab country if helevel1~=.
tab country if helevel~=.
compare helevel helevel1 if country=="Saint Lucia"
drop helevel1
*根据Qatar国家的原始数据库，猜测value label是这么编写的：label define labels100 1 "none" 2 "Primary" 3 "Preparatory" 4 "Secondary" 5 "University and above" 9 "Missing/DK", replace
*但是上一行没有运行

*最终mics4变量为79个


**统一变量名
*wb4改为wb6a
generate byte wb6a:labels10 = wb4, before(wb4)
label variable wb6a "Highest level of school attended"
format %1.0f wb6a
drop wb4

*wb2改为wb4
generate byte wb4 = wb2, before(wb2)
drop wb2

*pn12n_all\pn12u_all改为pn12n\pn12u
generate byte pn12n = pn12n_all, before(pn12n_all)
generate byte pn12u = pn12u_all, before(pn12u_all)
drop pn12n_all pn12u_all

*pn21n_all\pn21u_all改为pn21n\pn21u
generate byte pn21n = pn21n_all, before(pn21n_all)
generate byte pn21u = pn21u_all, before(pn21u_all)
drop pn21n_all pn21u_all

*wb2a改为wb2b
generate byte wb2b:labels8 = wb2a, before(wb2a)
label variable wb2b "Women’s ethnicity"
drop wb2a





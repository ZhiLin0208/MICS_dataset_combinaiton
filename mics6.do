*原变量198个

*wmweight: 包含变量wmweight_prov,但数值不太一样，删除wmweight_prov
tab country if wmweight~=.
tab country if wmweight_prov ~=.
compare wmweight wmweight_prov if country=="Mongolia"
drop wmweight_prov

*cm1:将cm1a的数据并入cm1,但怀疑cm1中value label是否符合题意，需要师兄和双瑜再确认一下
tab cm1
tab cm1a
tab country if cm1~=.
tab country if cm1a~=.
compare cm1a cm1 if country=="Belarus"
replace cm1 = cm1a if country=="Belarus", nopromote
drop cm1a

*cm11:将cm11a的数据并入cm11
tab cm11
tab cm11a
tab country if cm11~=.
tab country if cm11a~=.
compare cm11 cm11a if country=="Belarus"
replace cm11 = cm11a if country=="Belarus", nopromote
drop cm11a

*mn5:mn5中Algeria国家的值是mn5a\mn5b\mn5c的值的和，故删去mn5a\b\c
tab mn5
tab mn5a
tab mn5b
tab mn5c
tab country if mn5~=.
tab country if mn5a~=.
tab country if mn5b~=.
tab country if mn5c~=.
compare mn5 mn5a if country =="Algeria"
compare mn5 mn5b if country=="Algeria"
compare mn5 mn5c if country=="Algeria"
generate mn5abc = mn5a+mn5b+mn5c if country=="Algeria"
compare mn5 mn5abc if country=="Algeria"
drop mn5a mn5b mn5c mn5abc

*根据value label认为mn20和mn20a不是一个变量，未合并
tab mn20
tab mn20a
tab country if mn20~=.
tab country if mn20a~=.
tab mn20 if country=="Lesotho",nolab

*mn23:mn23a和mn23b是mn23的一部分，故删除
tab mn23
tab mn23a
tab mn23b
tab country if mn23~=.
tab country if mn23a~=.
tab country if mn23b~=.
compare mn23a mn23b if country=="Mongolia"
tab mn23 if country=="Mongolia"
tab mn23a if country=="Mongolia"
tab mn23b if country=="Mongolia"
tab mn23a if country=="Georgia"
tab mn23 if country=="Georgia"
drop mn23a mn23b

*mn31z:mn31y合并到mn31z
tab mn31z
tab mn31y
tab country if mn31z~=""
tab country if mn31y~=""
replace mn31z = mn31y if mn31y~="", nopromote
replace mn31z = "Z" if mn31z=="Y", nopromote
drop mn31y

*pn5:数据库有pn5下关于Argentina、Pakistan Khyber Pakhtunkhwa、Pakistan Punjab、Pakistan Sindh国家被并入pn5中了，故删去
tab pn5
tab pn5a
tab country if pn5a~=.
compare pn5 pn5a if country=="Argentina"
tab pn5ba
tab pn5bb
tab pn5bc
tab pn5bd
tab pn5be
tab pn5bf
tab pn5bg
tab pn5bh
tab pn5bi
tab pn5bx
tab pn5bnr
tab pn5aa
tab pn5ab
tab pn5ac
tab country if pn5aa~=.
tab country if pn5ab~=.
tab country if pn5ba~=""
tab country if pn5be~=""
drop pn5a pn5ba pn5bb pn5bc pn5bd pn5be pn5bf pn5bg pn5bh pn5bi pn5bx pn5bnr pn5aa pn5ab pn5ac

*pn6:包含pn6c(有部分数值不相等）,故删pn6c
tab pn6
tab pn6c
tab country if pn6~=.
tab country if pn6c~=.
compare pn6 pn6c if country=="Georgia"
drop pn6c

*pn9:包含子变量，故删去
tab pn9
tab pn9aa
tab pn9ab		
tab pn9ba
tab pn9bb
tab country if pn9~=.
tab country if pn9aa~=.
tab country if pn9ab~=.
tab pn9 if country=="Iraq"
drop pn9aa pn9ab pn9ac pn9ad pn9ae pn9ba pn9bb pn9bc pn9bd pn9be pn9be pn9bf

*pn17:包含pn17c的内容（数值有些不同），故删去
tab pn17
tab pn17c
tab country if pn17~=.
tab country if pn17c~=.
compare pn17 pn17c if country=="Georgia"
drop pn17c

*pn24的子变量（一些关于产后并发症的问题）只在Algeria国家有，但是和pn24没有关联；也和pn17\pn19\pn20做了比较，和他们无关
tab pn24
tab country if pn24~=.
tab pn24aa
tab country if pn24aa~=.
tab country if pn17~=.
tab country if pn19~=.
tab country if pn20~=.
tab country if pn24ab~=.
tab country if pn24ac~=.
tab country if pn24ad~=.
tab country if pn24ae~=.
tab country if pn24af~=.
tab country if pn24cu~=.
tab country if pn24cn~=.

*pn25a:包含pn25aa,故删去
tab pn25aa
tab pn25
tab country if pn25aa~=.
tab country if pn25~=.
drop pn25aa

*ma1: Algeria国家还有ma1a，绝大部分包含在ma1中，由于该变量缺乏可比性，故删去
tab ma1
tab ma1a
tab country if ma1~=.
tab country if ma1a~=.
tab ma1 if country=="Algeria"
drop ma1a

*hh6:整合了hh6a\hh6b\hh6r的内容，故删去
tab hh6
tab country if hh6~=.
tab hh6a
tab country if hh6a~=.
tab country if hh6b~=.
tab country if hh6r~=.
compare hh6 hh6a if country=="Laos"
compare hh6b hh6a if country=="Laos"
compare hh6b hh6 if country=="Laos"
drop hh6a hh6b hh6r

*hh7:整合了hh7a\hh7b\hh7c\hh7r\hh7new的内容，故删去
tab hh7
tab hh7a
tab hh7b
tab hh7c
tab hh7r
tab hh7new
tab country if hh7~=.
tab country if hh7a~=.
tab country if hh7r~=.
tab country if hh7b~=.
compare hh7a hh7 if country=="Tonga"
compare hh7b hh7 if country=="Tonga"
tab country if hh7c~=.
compare hh7b hh7c if country=="Tonga"
compare hh7b hh7c if country=="Nepal"
tab country if hh7new~=.
drop hh7a hh7b hh7c hh7r hh7new

*windex5:整合了windex5u\windex5r\windex2的内容，故删去
tab windex5
tab country if windex5~=.
tab windex5u
tab country if windex5u~=.
tab windex5r
compare windex5u windex5r
tab country if windex5u~=.
tab country if windex5r~=.
compare windex5u windex5r if country=="Algeria"
tab country if windex2~=.
compare windex5u windex5r if country=="Bangladesh"
compare windex5u windex5r if country=="Central African Republic"
compare windex5u windex5r if country=="Chad"
compare windex5u windex5r if country=="Fiji"
compare windex5u windex5r if country=="Zimbabwe"
drop windex5u windex5r windex2

*region_who:整合了region\nat_reg_lvl的内容，故删去
tab region_who
tab region
tab nat_reg_lvl
tab country if region~=.
tab country if region_who~=""
tab country if nat_reg_lvl~=.
compare nat_reg_lvl region if country=="State of Palestine"
compare region_who region if country=="State of Palestine"
drop region nat_reg_lvl

*宗教hc1a:包含hc1ar，故删去；再将hc1的内容并入到hc1a中
tab hc1a
tab country if hc1a~=.
tab country if hc1ar~=.
tab country if hc1~=.
compare hc1a hc1ar if country =="Kiribati"
compare ethnicity hc1ar if country =="Kiribati"
compare ethnicity hc1 if country =="Honudras"
drop hc1ar
replace hc1a = hc1 if hc1~=., nopromote
drop hc1

*hc1c需要师兄和双瑜再核对一下，value label（地区）和label（语言）代表的不是同一个东西
tab hc1c

*mt4包含mt4a代表的信息,mt4a包含mt4b代表的信息,考虑到国家之间的可比性，故删去只有一个国家的信息mt4a\mt4b
tab mt4
tab mt4a
tab mt4b
tab country if mt4~=.
tab country if mt4a~=.
tab country if mt4b~=.
tab mt4 if country=="Sao Tome"
tab mt4 if country=="Sao Tome"&mt4a~=.
tab mt4 if country=="Sao Tome"&mt4b~=.
compare mt4a mt4b 
compare mt4 mt4a if country=="Sao Tome"
drop mt4a mt4b

*helevel包含helevelisced\helevelx的国家，故删去helevelisced
tab helevel
tab helevelisced
tab helevelx
tab helevel1
tab helevel2
tab country if helevel ~=.
tab country if helevelisced ~=.
tab helevel if country=="Montenegro"
tab helevelisced if country=="Montenegro"
tab helevel if country=="Montenegro (Roma Settlements)"
tab helevelisced if country=="Montenegro (Roma Settlements)"
tab country if helevelx ~=.
tab helevel if country=="Tonga"
tab helevelx if country=="Tonga"
drop helevelisced helevelx
*helevel1包含helevel2，helevel包含两个子变量的DRCongo国家数据，但是Nepal国家未被包含
*试图将Nepal国家数据整合入helevel,但是不知道是选用helevel1还是helevel2的数据
tab country if helevel1~=.
tab helevel if country=="DRCongo"
tab helevel1 if country=="DRCongo"
tab helevel2 if country=="DRCongo"
tab country if helevel2~=.
compare helevel1 helevel2 if country=="DRCongo"
compare helevel helevel1 if country=="DRCongo"
compare helevel helevel2 if country=="DRCongo"
tab helevel1 if country=="Nepal"
tab helevel2 if country=="Nepal"
tab helevel if country=="Nepal"
compare helevel1 helevel2 if country=="Nepal"


*最终mics6变量为140个







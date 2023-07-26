*原变量116个

*wb2a/wb2b宗教和种族的问题，不是wb类型的，故未进行操作

*mn27q:将mn27nr并入
tab country if mn27nr=="?"
tab country if mn27q =="?"
replace mn27q = "?" if mn27nr=="?", nopromote
drop mn27nr

*mn18ads mn18asp mn18a mn18ab变量在问卷中无法找到对应题目，但猜测无法与mn18合并，故未进行操作

*pn14a和pn14asp都在Côte d'Ivoire国家有记录，但是不知道具体数值代表什么含义
 tab country if pn14asp~=.
 tab country if pn14a~=.
 compare pn14a pn14asp if country=="Côte d'Ivoire"
*pn14ab只有Côte d'Ivoire国家有，但不知道对应哪道题

*pn13和pn22一系列子变量合并出错，不是而分类变量了（和双瑜讨论过了），未进行操作

*ma9c包含ma9的数据，且数值不完全一样，为了是信息最大化，于是以ma9c的数据覆ma9中Kazakhstan国家的数值
tab country if ma9~=.
tab country if ma9c~=.
compare ma9 ma9c if country =="Kazakhstan"
replace ma9 = ma9c if ma9c~=., nopromote
drop ma9c

*hh7: hh7a2是hh7a1的一部分，hha1是hh7a的一部分，hh7a是hh7的一部分，且hh7最完整
tab hh7a1
tab hh7a2
tab country if hh7~=.
tab country if hh7a~=.
tab country if hh7a1~=.
tab country if hh7a2~=.
compare hh7a1 hh7a2 if country=="Guyana"
compare hh7a hh7a1 if country=="Guyana"
compare hh7 hh7a if country=="Guyana"
compare hh7 hh7a if country=="El Salvador"
compare hh7 hh7a if country=="Mexico"
drop hh7a hh7a1 hh7a2

*种族和国籍ethnicity包含hc1c的国家，部分数值不一样，则删除hc1c变量
tab country if hc1c~=.
tab country if ethnicity~=.
compare ethnicity hc1c if country=="Belize"
compare ethnicity hc1c if country=="Congo"
compare ethnicity hc1c if country=="Côte d'Ivoire"
compare ethnicity hc1c if country=="Guyana"
compare ethnicity hc1c if country=="Kazakhstan"
drop hc1c

*hc1b: hc1ba和hc1bb都是mexico国家定义的变量，但数值不同，无法取舍，且根据label无法和hc1b合并。
tab hc1b
tab hc1ba
tab hc1bb
tab country if hc1b~=.
tab country if hc1ba~=.
tab country if hc1bb~=.
compare hc1ba hc1bb

*最终mics5变量为110个


**统一变量名
*wb4改为wb6a
generate byte wb6a:labels8 = wb4, before(wb4)
label variable wb6a "Highest level of school attended"
format %1.0f wb6a
drop wb4

*wb2改为wb4
generate byte wb4 = wb2, before(wb2)
label variable wb4 "Age of woman"
format %2.0f wb4
drop wb2

**将mics4&5合并
append using "/Users/linzhi/Desktop/mics/clean_mics4-变量名和5一致.dta"




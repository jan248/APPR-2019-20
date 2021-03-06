source("lib/libraries.r")


#1 tabela-brezposelnost po statističnih regijah (ok)
brezposelnost.regije <- read.csv2(file="podatki/brezposelnost_po_statisticnih_regijah.csv", header=TRUE, skip = 3, dec = '.',
                                  col.names = c('leto', 'regija', 'stopnja_aktivnosti', "stopnja_delovne_aktivnosti", 'stopnja_brezposelnosti', 'delovna_aktivnost_glede_na_starostno_skupino'))

graf_regije <- brezposelnost.regije[,-6]
graf_regije <- graf_regije[,-4]
graf_regije <- graf_regije[,-3]
#graf_regije <- transform(graf_regije, stopnja_brezposelnosti=(stopnja_brezposelnosti*1000))

#2. tabela-brezposelnost glede na stopnjo dosežene izobrazbe (vzela spodaj boljšo tabelo, pustim za zdaj če bom še rabila)
brezposelnost.izobrazba <- read.csv2(file="podatki/brezposelnost_po_stopnji_izobrazbe.csv", header=TRUE, skip = 1, 
                                     col.names = c( "Kohezijska_regija", "Spol", "leto",  "brez_izobrazbe", 
                                                   "osnovnosolska_izobrazba",
                                                   "nizja_ali_srednja",
                                                   "srednja_strokovna",
                                                   "visjesolska_visokosolska"))
brezposelnost.izobrazba <- brezposelnost.izobrazba[,-1]

brezposelnost.izobrazba <- transform(brezposelnost.izobrazba, brez_izobrazbe = (brez_izobrazbe * 1000))
brezposelnost.izobrazba <- transform(brezposelnost.izobrazba, osnovnosolska_izobrazba = (osnovnosolska_izobrazba * 1000))
brezposelnost.izobrazba <- transform(brezposelnost.izobrazba, nizja_ali_srednja = (nizja_ali_srednja * 1000))
brezposelnost.izobrazba <- transform(brezposelnost.izobrazba, srednja_strokovna = (srednja_strokovna * 1000))
brezposelnost.izobrazba <- transform(brezposelnost.izobrazba, visjesolska_visokosolska = (visjesolska_visokosolska * 1000))


#4.tabela-brezposelnost po trajanju iskanja dela(ok za zemljevid)
brezposelnost.iskanje <- read.csv2(file="podatki/brezposelnost_iskanje_spol.csv", header=TRUE, skip = 2, na=c('N'),  
                                   col.names = c("nekaj", "spol", "leto",  "manj_kot_en_mesec", "od_1_do_5_mesecev", "od_6_do_11_mesecev", "od_12_do_23_mesecev", "vec_kot_24_mesecev"),)
brezposelnost.iskanje <- brezposelnost.iskanje[,-1]

brezposelnost.iskanje <- transform(brezposelnost.iskanje, en_mesec = (manj_kot_en_mesec * 1000))
brezposelnost.iskanje <- transform(brezposelnost.iskanje, pet_mesecev = (od_1_do_5_mesecev * 1000))
brezposelnost.iskanje <- transform(brezposelnost.iskanje, enajst_mesecev = (od_6_do_11_mesecev * 1000))
brezposelnost.iskanje <- transform(brezposelnost.iskanje, tridva_mesecev = (od_12_do_23_mesecev * 1000))
brezposelnost.iskanje <- transform(brezposelnost.iskanje, vec_mesecev = (vec_kot_24_mesecev * 1000))



#6.tabela-brezposelnost v Sloveniji
slovenija <- read.csv2(file="podatki/slovenija.csv", header=TRUE, skip = 1,  
                       col.names = c("kohezj", "skupine", "spol", "leto", "brezposelnost"))

slovenija <- slovenija[,-3]
slovenija <- slovenija[,-2]
slovenija <- slovenija[,-1]
#slovenija <- transform(slovenija, brezposelnost = (brezposelnost * 1000))

#tabela za zemljevid 2010
brezposelnost.2010 <-filter(graf_regije, leto == '2010')


#tabela za zemljevid
brezposelnost.2018 <- filter(graf_regije, leto == '2018')


#7.tabela-brezposelnost glede na stopnjo dosežene izobrazbe
izobrazba <- read.csv2(file="podatki/izobrazba.csv", header=TRUE, skip = 2, 
                                     col.names = c("leto", "Kohezijska_regija", "Spol", "izobrazbe", 
                                                   "meritve", "brezposelnost"))
izobrazba <- izobrazba[, -5]
izobrazba <- izobrazba[, -3]
izobrazba <- izobrazba[, -2]

#izobrazba <- transform(izobrazba, brezposelnost = (brezposelnost*1000))





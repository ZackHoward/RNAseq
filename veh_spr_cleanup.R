View(veh_spr)
complete.cases(veh_spr)
which(complete.cases(veh_spr))
which(!complete.cases(veh_spr))
na_vec <- which(!complete.cases(veh_spr))
na_vec
veh_spr_no_na <- veh_spr[-na_vec,]
veh_spr_no_na
View(veh_spr_no_na)
  
install.packages("writexl")
  
library("writexl")
write_xlsx(veh_spr_no_na,"C:\\Users\\zhowa\\Desktop\\veh_spr_no_na.xlsx")
  
veh_spr_no_rik <- veh_spr_no_na[!grepl("Rik", veh_spr_no_na$...1), ]
View(veh_spr_no_rik)


library("tidyverse")

rik_var <- gsub(" ", "", paste(str_c(0:9),"Rik"))
veh_spr_no_rik4 <- veh_spr_no_na[!grepl(paste(rik_var, collapse = "|"), veh_spr_no_na$...1), ]

View(veh_spr_no_rik4)

library("writexl")
write_xlsx(veh_spr_no_rik4,"C:\\Users\\zhowa\\Desktop\\veh_spr_no_rik4.xlsx")

loc_1 <- gsub(" ", "", paste("LOC", str_c(0:9)))
loc_2 <- 0:9
loc_3 <- as.vector(outer(loc_1, loc_2, paste, sep = ""))
print(loc_3)
veh_spr_no_rik_loc <- veh_spr_no_rik4[!grepl(paste(loc_3, collapse = "|"), veh_spr_no_rik4$...1), ]
library("writexl")
write_xlsx(veh_spr_no_rik_loc,"C:\\Users\\zhowa\\Desktop\\veh_spr_no_rik_loc.xlsx")


gm_1 <- gsub(" ", "", paste("Gm", str_c(0:9)))
gm_2 <- 0:9
gm_3 <- as.vector(outer(gm_1, gm_2, paste, sep = ""))
print(gm_3)
veh_spr_no_rik_loc_gm <- veh_spr_no_rik_loc[!grepl(paste(gm_3, collapse = "|"), veh_spr_no_rik_loc$...1), ]
library("writexl")
write_xlsx(veh_spr_no_rik_loc_gm,"C:\\Users\\zhowa\\Desktop\\veh_spr_no_rik_loc_gm.xlsx")

veh_spr_no_rik_loc_gm_ps <- veh_spr_no_rik_loc_gm[!grepl("-ps", veh_spr_no_rik_loc_gm$...1), ]
library("writexl")
write_xlsx(veh_spr_no_rik_loc_gm_ps,"C:\\Users\\zhowa\\Desktop\\veh_spr_no_rik_loc_gm_ps.xlsx")
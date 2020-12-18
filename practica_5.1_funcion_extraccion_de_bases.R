#######################################################################
################### FUNCIÓN PARA EXTRAER INFORMACIÓN ##################
#######################################################################


# Se asigna una nueva función al interior de un objeto:

extraccion_de_bases <- function() {
  

    
  base_de_bases <- list()

# La nueva función es un ciclo que lee las bases de datos desde una dirección web automatizada. Con la función paste0() se crea o compone la dirección web. A su vez, read.csv() lee el DataFrame con base en la dirección creada por la función paste0()
      
  for (i in 1:5) {
    
    base_de_bases[[i]] <- read.csv(paste0("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base", i, '.csv')) #La función paste0() sirve para unir vectores después que estos son convertidos a caracteres. A diferencia de paste(), paste0() quita los espacios entre las cadenas de caracteres.
    
    print(paste0("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base", i, '.csv'))
    
  }
  
  return(base_de_bases)
  
}


#######################################################################
#######################################################################
#######################################################################
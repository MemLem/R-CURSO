#######################################################################
############### PRÁCTICA 5. EXTRACCIÓN Y UNIÓN DE DATOS ###############
#######################################################################




########## Extracción de Bases de Datos desde una página web ##########


# La función read.csv() permite leer un archivo tipo .csv y crea un dataframe. 

base1 <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base1.csv")

base2 <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base2.csv")

base3 <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base3.csv")

base4 <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base4.csv")

base5 <- read.csv("https://raw.githubusercontent.com/AllanZamb/ProcesamientoR/main/BASES/base5.csv")




########### Unión de las bases de datos en un solo DataFrame ##########


# 1. Crear con las bases de datos anteiores una list() de DataFrames

base_lista <- list(base1, base2, base3, base4, base5)


# 2. Instalar / Llamar la librería "plyr" según sea el caso

library(plyr)


# 3. La función rbind.fill() de la paquetería plyr sirve para combinar DataFrames de una list()

pacientes_dataframe <- rbind.fill(base_lista)




##################### CREACIÓN DE FUNCIONES EN R ######################


# Función para realizar operaciones:

resultados <- function(numero1, numero2) {
  
  suma <- numero1+numero2
  resta <- numero1-numero2
  multipliacion <- numero1*numero2
  division <- numero1/numero2
  
  resultados <- list(suma, resta, multipliacion, division)
  
  return(resultados)
}


resultados <- resultados(5,20)


# Función para conectar otro archivo con el actual y llamar a otra función incluida en él.

# La función source() sirve para llamar y enlazar el código incluido en otro archivo al actual

source("practica_5.1_funcion_extraccion_de_bases.R")

extraccion_de_bases <- extraccion_de_bases()




#######################################################################
#######################################################################
#######################################################################

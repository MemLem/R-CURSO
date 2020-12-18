#######################################################################
############################## PRÁCTICA 1 #############################
#######################################################################



#################### Tipos de variables (atómicas) ####################


# 1. Caracter (character)

v_char <- "hola"


# 2. Númerica (numeric)

v_num <- 5.56


# 3. Entero (integer)

v_inter <- 10L #es diferente a:  

v_inter <- 10   # Sin la "L" se guarda el valor como una v. tipo númerica, es decir, como un 10.0 o más decimales


# 4. Lógicas (logic)

v.log <- T
  



################### ¿Qué tipo de dato es un objeto? ###################

# La función class() permite saber de quñe tipo es un objeto.

class(v_inter)




######################### Función Vector: c() #########################


# Vector: objeto que almacena una serie de elementos del mismo tipo.

# 1. Vector caracter:

vector_char <- c("a", "b", "c", "d", "e")


# 2. Vector númerico:

vector_num <- c(1, 2, 4, 6, 7.68)


# 3. Vector de enteros:

vector_inter <- c(10L, 3L, 100L, 45L, 5L)


# 4. Vector de lógicos:

vector_log <- c(T, F, T, F, F)


# Se utilizan los corchetes [] para llamar algún elemento en especifico del vector. Al interior de los corchetes se escribe la posición del elemento que se quiere llamar:

vector_num[4]


# La función length() se utiliza para saber la longitus de un vector u objeto, es decir, para conocer cuántos elementos tiene almacenados.

length(vector_num)  


# Nota 1: en vectores siempre se guardan el mismo tipo de datos (no números y letras, etc.)

# Nota 2: en caso de almacenar tipos de datos mixtos (números + letras + other) la función c() convierte los datos al tipo dominante character > numeric > logica. Por ejemplo:


vector_de_vectores <- c(vector_char, vector_inter, vector_log, vector_num)

class(vector_de_vectores)




######################## Función Lista: list() ########################


# list() permite guardar diferentes tipos de vectores en un único objeto sin cambiar el tipo de datos original. Al respetar el tipo de datos almacenado en cada vector es posible guardar gráficas, bases de datos, etc. en el mismo objeto.  

vector_de_vectores <- list(vector_char, vector_inter, vector_log, vector_num)

# Para llamar los valores de vector en especifico cnetnido en una lista se utiliza doble corchete [[]]:

vector_de_vectores[[1]]

# Para llamar una observación en especifica incluida en un vector determinado se utiliza doble corchetes [[]] seguidos de un par de corchetes [] donde se señala la ubicación del elemento a llamar:

vector_de_vectores[[1]][5]




#######################################################################
#######################################################################
#######################################################################
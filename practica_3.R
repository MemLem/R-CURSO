#######################################################################
############### PRACTICA 3. CONDICIONALES E ITERADORES ################
#######################################################################



# Forma básica de IF (sí, algo) ~ ELSE (de lo contrario haz otra cosa):


 if(condicion) {
  orden1
} else {
  orden2
}


# Ejemplo 1: 

if(4 > 5){
  print("Sí, es verdad")
  
} else {
  print("No, no es verdad")
}


# Ejemplo 2. Condición de dos variables:

num1 <- 15
num2 <- 20

if(num2 > num1){
  print("Es verdad")
  
} else {
  print("Es falso")
}


# Ejemplo 3. Condición de tres variables:

num3 <- 50

if((num2 > num1) | num3 < num2){  # | (pipe = OR) alguna de las dos condiciones se debe cumplir
  print("Es verdad")
  
} else {
  print("Es falso")
}



if((num2 > num1) & num3 < num2) { # & (ampersand = Y (AND)) Las condciones se deben cumplir, sí o sí
  print("Es verdad")
  
} else {print("Es falso")

}




########################## Ciclos de Control ##########################


# Forma básica de For:

for (variable in vector) {
  condicion1
}

# Crear vector pra utilizar en el ciclo

vector_numeros <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)


# Imprimir "Hola" las n veces que indica la dimensión de un vector:

for (i in vector_numeros) {
  print("Hola")
}


#  Imprimir "Iterador" las n veces que indica la secuencia:

for (i in 1:10) {
  print("Iterador")
}


# Imprimir "Iterador" las n veces que indica la secuencia:

for (iterador in 1:5) {
  print(paste("Iterador", iterador)) # La función paste() permite unir los elementos de un vector y los convierte en texto. 
}



#######################################################################
#######################################################################
#######################################################################
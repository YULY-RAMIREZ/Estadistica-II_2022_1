
###A continuación encontrará algunos elementos básicos para trabajar en R

#### limpiar el espacio de trabajo

rm(list = ls())

##### Operadores de asignación

x <- 5
x = 9
10 -> x


####Operadores aritméticos

x <- 15
y <- 17
x+y
x-y
x*y
x/y
x^2


#### operadores relacionales
x <- 5
x<y
x>y
x<=5
y>=20
y == 16
x != 5

##### Operadores lógicos
x <- c(TRUE,FALSE,0,6)
y <- c(FALSE,TRUE,FALSE,TRUE)
!x
x&y
x|y



##### Vectores
x <- c(1, 5, 4, 9, 0)
typeof(x)            ####los vectores numéricos son de tipo enteros. decimales o complejos
length(x)
x <- c(1, 5.4, TRUE, "hello")
typeof(x)

c
##Creación de vectores
x <- 1:7;x
y <- 2:-2;y
seq(1,3, by = 0.2)
seq(1, 5, length.out = 4)


#acceder a los elementos de un vector

x
x[3]
x[c(2,4)]
x[-1]
x[c(2,4)]    # No es posible mezclar enteros negativos con positivos
x[c(2.4, 3.54)] 

x[c(TRUE, FALSE, FALSE, TRUE)]
x[x < 0] 
x[x > 0] 

x <- c("first"=3, "second"=0, "third"=9)
names(x)
x["second"]
x[c("first", "third")]

####Operación en vectores.

x <- c(2,8,3)   #### c es la función concatenar
y <- c(6,4,1)
x+y
x>y


#### ¿Qué sucede cuando la longitud de los vectores no es igual?
x <- c(2,1,8,3)
y <- c(9,4)
x+y                   # Elemento de y es transformado a 9,4,9,4
x-1                   # El vector x menos el vector 1



##### Matrices #####
matrix(1:9, nrow = 3, ncol = 3)
matrix(1:9, nrow = 3)
matrix(1:9, nrow = 3, byrow = T)

x <- c(1,2,3,4,5,6)
class(x)
dim(x) <- c(2,3)
print(x)
class(x)

x <- matrix(1:9, nrow = 3, dimnames = list(c("X", "Y", "Z"), c("A", "B", "C")))
print(x)
colnames(x)
rownames(x)

colnames(x) <- c("C1", "C2", "C3")
rownames(x) <- c("R1", "R2", "R3")
print(x)



x[c(1,2),c(2,3)] 
x[c(3,2),] 
x[,]  
x[,]  

x[1,]  
class(x[1,]  )
x[1,,drop=FALSE]

x[x>5]   

##Modificar matrix

cbind(x, c(1, 2, 3)) 
rbind(x,c(1,2,3))
x <- x[1:2,]; x


##### Listas ####
x <- list("a" = 2.5, "b" = TRUE, "c" = 1:3)
str(x)  
x <- list(2.5,TRUE,1:3)

##### Data frame #####

x <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("John","Dora"))
str(x) 
x <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("John","Dora"), stringsAsFactors = F)
str(x) 

x["Name"]
x$Name
x[["Name"]]
x[[3]]


#### ejemplo

datos <- datasets::trees
View(datos)
str(datos)

summary(datos)
head(datos,n=3)
datos[2:3,] 


####### ¿Cómo se seleccionarán las filas con la variable Height mayores que 82?

#trees[trees$Height > 82,]


####¿Cómo se seleccionarán las filas 10 a 12 y la columna 2?

####datos[10:12, 2, drop = F]
?rnorm



####Generación de datos aleatorios 
x <- rnorm(10000, 500, 100) ### Genera 10000 números aletorios en una distribuci?n normal 
class(x)                    ###oberavar el tipo de variable
summary(x)                  ###Informacion desciptiva 
n <- floor(x)               ###Toma el dato como entero
t <- table(n)               ###Tabla de ocurrencias de cada valor                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

barplot(t)                  ###Graficar la tabla de frecuencias
barplot(table(floor(rnorm(10000, 500, 100))), xlab="Numbers", ylab="Frequencies")

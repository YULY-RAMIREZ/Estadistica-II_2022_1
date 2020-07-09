
## Intervalo de confianza para una muestra

# Parámetros poblacionales
Media <- 100
Desviación <- 20

curve(dnorm(x, mean = Media, sd = Desviación), xlim = c(10, 200))


## Obtener una muestra de tamaño 10

n <- 30 #tamaño de la muestra

muestra_1 <- rnorm(n, mean = Media, sd = Desviación)

mean(muestra_1)
sd(muestra_1)



## Construir el intervalo de confianza

# Nivel de confianza 95%

P_Z <- round(qnorm(1-0.05/2),2)

# Error estándar de la media
Desv.media <- Desviación/sqrt(n)

# Hallar el LIC y LSC

LIC <- mean(muestra_1)- P_Z*Desv.media
LSC <- mean(muestra_1)+ P_Z*Desv.media

# Intervalo

Intervalo <- as.matrix(c(round(LIC,2), round(LSC,2)))
class(Intervalo)


#Construir gráfica 

plot(1:100, type = "n",
    xlim = range(50, 120),
     ylab = "Muestreos")

abline(v = Media, lty = 2) ## la media poblacional.

segments(Intervalo[1,1],1, Intervalo[2,1], 1)



## Obtener varias muestras
set.seed(500)

Media <- 150
Desviación <- 10
cantidad_muestras <- 100
n <- 30 # Tamaño de la muestra

muestras <- replicate(cantidad_muestras,rnorm(n, mean = Media, sd = Desviación))



Calcular_Intervalos <- function(columna,Desviación,n,sig){
   
   muestra <- muestras[,columna]
   P_Z <- qnorm(1-sig/2)
   Desv.media <- Desviación/sqrt(n)
   
   # Hallar el LIC y LSC
   
   LIC <- mean(muestra)- P_Z*Desv.media
   LSC <- mean(muestra)+ P_Z*Desv.media  

   # Intervalo
   
   Intervalo <-c(round(LIC,2), round(LSC,2))
   
}

#Construir el listado de intervalos

listado_intervalos <- matrix(rep(0,200), nrow = 2)

for (i in 1:100) {
 listado_intervalos[,i] <-  Calcular_Intervalos(i,Desviación = Desviación,n = n,sig = 0.05)
}

#Construir gráfica 

plot(1:100, type = "n",
     xlim = range(130, 170),
     ylab = "Muestreos",
     xlab= "Media muestral")

abline(v = Media, lty = 2) ## la media poblacional.

for (i in 1:cantidad_muestras) {
   cubierto <- Media <= listado_intervalos[2,i] & Media >= listado_intervalos[1,i]
    color <- ifelse(cubierto,1,2)
    segments(listado_intervalos[1,i],i, listado_intervalos[2,i],i, col = color )
}

# Inspeccionar los intervalos que no contienen el parámetro poblacional


Transponer_lista <- as.data.frame(t(listado_intervalos))
class(Transponer_lista)
colnames(Transponer_lista) <- c("LIC", "LSC")
Intervalos_no <- Transponer_lista[Transponer_lista$LIC<=Media &  Transponer_lista$LSC <= Media  | Transponer_lista$LIC >=Media &  Transponer_lista$LSC >= Media,]
Intervalos_no

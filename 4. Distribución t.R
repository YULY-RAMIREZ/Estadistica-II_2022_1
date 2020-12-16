

# Gráfica de la distribución normal estándar

plot( dnorm, -7, 7, ylim = c( 0, 0.4 ), col="red", lwd=3 )


# t de Student
grados_de_libertad <- 29

for(i in 1:grados_de_libertad){
  plot( function(x) dt( x, df = i ), -7, 7, add = TRUE,
        lwd = 1, col = gray( 1 - i/grados_de_libertad ) )
  text( 0, dt( 0, df = i ), i)
}




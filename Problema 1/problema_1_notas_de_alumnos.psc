Algoritmo problema_1_notas_de_alumnos
	// definicion de variables
	Definir i, j, cantidad, aprobados, reprobados Como Entero
	Definir nombres, nombre, textoNota, letra Como Cadena
	Definir notas, promedio, sumaPromedios, promedioCurso Como Real
	Definir nombreValido, numeroValido Como Lógico
	aprobados <- 0
	reprobados <- 0
	sumaPromedios <- 0
	Escribir '*****************************'
	Escribir '* Analisis de Curso *'
	Escribir '*****************************'
	Escribir 'Ingrese la cantidad de alumnos: '
	Leer cantidad
	// vector nombres
	Dimensionar nombres(cantidad)
	// matriz notas, 4 columnas por alumno
	Dimensionar notas(cantidad,4)
	// bucle de alumnos
	Para i<-1 Hasta cantidad Hacer
		// VALIDAR NOMBRE
		nombreValido <- Falso
		Mientras nombreValido=Falso Hacer
			Escribir 'Nombre del Alumno ', i, ': '
			Leer nombre
			nombreValido <- Verdadero
			// validacion
			Para j<-1 Hasta Longitud(nombre) Hacer
				letra <- Subcadena(nombre,j,j)
				Si letra>='0' Y letra<='9' Entonces
					nombreValido <- Falso
				FinSi
			FinPara
			Si nombreValido=Falso Entonces
				Escribir 'Error: el nombre no puede contener numeros'
			FinSi
			nombres[i] <- nombre
		FinMientras
		// bucle para notas
		Para k<-1 Hasta 3 Hacer
			// validacion de nota ingresada
			numeroValido <- Falso
			Mientras numeroValido=Falso Hacer
				Escribir 'Nota ', k, ' (1 a 7): '
				Leer textoNota
				// validación para que sea número
				numeroValido <- Verdadero
				Para j<-1 Hasta Longitud(textoNota) Hacer
					letra <- Subcadena(textoNota,j,j)
					Si  NO (letra>='0' Y letra<='9' O letra='.') Entonces
						numeroValido <- Falso
					FinSi
				FinPara
				Si numeroValido Entonces
					nota <- ConvertirANumero(textoNota)
					Si nota<1 O nota>7 Entonces // conversión de string a número
						numeroValido <- Falso // validación si opción ingresada está en el rango
						Escribir 'Nota fuera de rango. Ingrese entre 1 y 7'
					FinSi
				SiNo
					Escribir 'Debe ingresar solo numeros'
				FinSi
				notas[i,k]<-nota
			FinMientras
		FinPara
		promedio <- (notas[i,1]+notas[i,2]+notas[i,3])/3
		notas[i,4]<-promedio
		Escribir 'Promedio: ', promedio
		sumaPromedios <- sumaPromedios+promedio
	FinPara
	// analisis
	promedioCurso <- sumaPromedios/cantidad
	Escribir '*****************************'
	Escribir '* Analisis de curso *'
	Escribir '*****************************'
	Escribir 'Cantidad de Alumnos:', cantidad
	Para i<-1 Hasta cantidad Hacer
		Escribir '*****************************'
		Escribir 'Nombre del Alumno ', i, ': ', nombres[i]
		Escribir 'Nota 1: ', notas[i,1]
		Escribir 'Nota 2: ', notas[i,2]
		Escribir 'Nota 3: ', notas[i,3]
		Si notas[i,4]>=4 Entonces
			Escribir 'Promedio: ', notas[i,4], ' APROBADO'
			aprobados <- aprobados+1
		SiNo
			Escribir 'Promedio: ', notas[i,4], ' REPROBADO'
			reprobados <- reprobados+1
		FinSi
	FinPara
	Escribir '*****************************'
	Escribir 'Cantidad de APROBADOS: ', aprobados
	Escribir 'Cantidad de REPROBADOS: ', reprobados
	Escribir '*****************************'
	Escribir 'Promedio del Curso: ', promedioCurso
	Escribir '¡Gracias!'
FinAlgoritmo

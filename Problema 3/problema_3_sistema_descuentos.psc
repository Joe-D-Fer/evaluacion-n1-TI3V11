Algoritmo problema_3_sistema_descuentos
	// definicion de variables
	Definir opc, cantidad, productos, clientes Como Cadena
	Definir opc_num, cantidad_num, precios, total_productos, total, subtotal, i, j Como Entero
	Definir cliente_frecuente, salir, numeroValido Como Lógico
	cliente_frecuente <- Falso
	salir <- Falso
	// matriz de clientes
	Dimensionar clientes(3,2)
	clientes[1,1]<-'20600609-9' // 3 filas, 2 columnas. columna 1 rut, columna 2 nombre
	clientes[1,2]<-'Joe Fernández'
	clientes[2,1]<-'18280607-2'
	clientes[2,2]<-'Ana Marchant'
	clientes[3,1]<-'16805594-3'
	clientes[3,2]<-'Claudio Villagran'
	// vector de productos
	Dimensionar productos(3)
	productos[1] <- 'Polera' // 3 filas
	productos[2] <- 'Pantalón'
	productos[3] <- 'Camisa'
	total_productos <- 3
	// matriz de precios
	Dimensionar precios(3,2)
	precios[1,1]<-20000 // 3 filas, 2 columnas. columna 1 precios, columna 2 cantidades
	precios[1,2]<-0
	precios[2,1]<-40000
	precios[2,2]<-0
	precios[3,1]<-60000
	precios[3,2]<-0
	Escribir 'ingrese su rut:'
	Leer rut
	// Consulta a matriz clientes para cliente frecuente
	i <- 1
	Mientras i<=3 Y clientes[i,1]<>rut Hacer
		i <- i+1
	FinMientras
	Si i<4 Entonces
		Escribir 'Bienvenido ', clientes[i,2]
		cliente_frecuente <- Verdadero
	FinSi
	// bucle de compra
	Mientras  NO salir Hacer
		// menu de compra
		Escribir '**************************'
		Escribir '*** Seleccione un item ***'
		Escribir '**************************'
		Para i<-1 Hasta total_productos Hacer
			Escribir '* ', i, '- ', productos[i]
		FinPara
		Escribir '* 0 - Finalizar Compra'
		// validacion de opcion ingresada por el usuario
		numeroValido <- Falso
		Mientras  NO numeroValido Hacer
			// validacion si es número
			Escribir 'Ingrese opción (1 a 3): '
			Leer opc
			numeroValido <- Verdadero
			Para j<-1 Hasta Longitud(opc) Hacer
				letra <- Subcadena(opc,j,j)
				Si  NO (letra>='0' Y letra<='9') Entonces
					numeroValido <- Falso
				FinSi
			FinPara
			Si numeroValido Entonces
				opc_num <- ConvertirANumero(opc)
				Si opc_num<0 O opc_num>3 Entonces // conversión de string a número
					numeroValido <- Falso // validación si opción ingresada está en el rango
					Escribir 'Opción no válida, 1 a 3'
				FinSi
			SiNo
				Escribir 'Debe ingresar solo numeros'
			FinSi
		FinMientras
		// Condicion de salida del menu de compra
		Si opc_num=0 Entonces
			salir <- Verdadero
		FinSi
		// validación cantidad de productos
		numeroValido <- Falso
		Mientras ( NO numeroValido) Y ( NO salir) Hacer
			// validación si es número
			Escribir 'ingrese la cantidad: '
			Leer cantidad
			numeroValido <- Verdadero
			Para j<-1 Hasta Longitud(cantidad) Hacer
				letra <- Subcadena(cantidad,j,j)
				Si  NO (letra>='0' Y letra<='9') Entonces
					numeroValido <- Falso
				FinSi
			FinPara
			// conversión a numero
			Si numeroValido Entonces
				cantidad_num <- ConvertirANumero(cantidad)
			SiNo
				Escribir 'Debe ingresar solo numeros'
			FinSi
			// actualización de cantidades en matriz de precios
			precios[opc_num,2]<-precios[opc_num,2]+cantidad_num
		FinMientras
	FinMientras
	// boleta
	Escribir '**************************'
	Escribir '* Tienda Feliz Comprando *'
	Escribir '**************************'
	Escribir '**************************'
	Escribir ''
	Escribir 'Detalle de la compra'
	i <- 1
	total <- 0
	// bucle de impresion de desgloce productos en boleta
	Mientras i<4 Hacer
		Si precios[i,2]>0 Entonces
			subtotal <- 0 // condicion para imprimir, si la cantidad es mayor a 0
			Escribir '**************************'
			Escribir 'Producto:', productos[i]
			Escribir 'Precio: $ ', precios[i,1]
			Escribir 'Cantidad: ', precios[i,2]
			subtotal <- precios[i,1]*precios[i,2]
			Escribir 'Subtotal = $ ', subtotal
			Escribir '**************************'
			Escribir ''
			total <- total+subtotal
		FinSi
		i <- i+1
	FinMientras
	Escribir 'Total Venta, sin descuentos: $ ', total, ' pesos'
	descuentos <- 0
	Si total>=100000 Entonces
		Escribir 'Aplicando descuento del 20%: $ ', total*0.2, ' pesos'
		descuentos <- descuentos+total*0.2
	SiNo
		Si total>=50000 Entonces
			Escribir 'Aplicando descuento del 10%: $ ', total*0.1, ' pesos'
			descuentos <- descuentos+total*0.1
		FinSi
	FinSi
	Si cliente_frecuente Entonces
		Escribir 'Aplicando descuento de cliente frecuente del 5%: $ ', total*0.05, ' pesos'
		descuentos <- descuentos+total*0.05
	FinSi
	total_menos_descuentos <- total-descuentos
	Escribir '*****************************'
	Escribir 'Total Venta, con descuentos: $ ', total_menos_descuentos, ' pesos'
	Escribir '*****************************'
	Escribir '¡Gracias por su compra!'
FinAlgoritmo

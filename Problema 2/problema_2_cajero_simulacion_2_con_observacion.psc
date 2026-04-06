Algoritmo problema_2_cajero_simulacion
	//observación: el bloque de "¿Desea realizar otra operación?" de las líneas 50-65, 85-100, 114-129 se repite innecesariamente debido a un bug de PSeInt que no permite dibujar el diagrama de flujo cuando hay instrucciones después del bloque "Segun" en línea 133
	// Variables principales
	Definir saldo, monto Como Real
	Definir opc Como Cadena
	Definir opc_num Como Entero
	Definir salir Como Lógico
	saldo <- 0
	salir <- Falso
	// bucle de proceso principal
	Mientras  NO salir Hacer
		// MENÚ PRINCIPAL
		Escribir '*******************************'
		Escribir '***** SISTEMA DE CAJERO ******'
		Escribir '*******************************'
		Escribir '* 1 - Consultar Saldo        *'
		Escribir '* 2 - Retirar Dinero         *'
		Escribir '* 3 - Depositar Dinero       *'
		Escribir '* 4 - Salir                  *'
		Escribir '*******************************'
		// Validación de opción
		numeroValido <- Falso
		Mientras numeroValido=Falso Hacer
			Escribir 'Ingrese una opción: '
			Leer opc
			// validación para que sea número
			numeroValido <- Verdadero
			Para j<-1 Hasta Longitud(opc) Hacer
				letra <- Subcadena(opc,j,j)
				Si  NO (letra>='0' Y letra<='9') Entonces
					numeroValido <- Falso
				FinSi
			FinPara
			Si numeroValido Entonces
				opc_num <- ConvertirANumero(opc)
				Si opc_num<1 O opc_num>4 Entonces // conversión de string a número
					numeroValido <- Falso // validación si opción ingresada está en el rango
					Escribir 'Opción no válida. Ingrese entre 1 y 4'
				FinSi
			SiNo
				Escribir 'Debe ingresar solo numeros'
			FinSi
		FinMientras
		Según opc_num Hacer
			1:
				// CONSULTAR SALDO
				Escribir '*******************************'
				Escribir 'Su saldo es: ', saldo
				Escribir '*******************************'
				//bloque ¿Desea realizar otra operación?
				Si  NO salir Entonces
					Escribir '*******************************'
					Escribir '¿Desea realizar otra operación?'
					Escribir '* 1 - Sí                      *'
					Escribir '* 2 - No                      *'
					Escribir '*******************************'
					Leer continuar
					Mientras continuar<1 O continuar>2 Hacer
						Escribir 'Opción inválida:'
						Leer continuar
					FinMientras
					Si continuar=2 Entonces
						salir <- Verdadero
					FinSi
				FinSi
			2:
				// RETIRAR DINERO
				Escribir '*******************************'
				Escribir 'Ingrese monto a retirar:'
				Leer monto
				// Validar monto positivo
				Mientras monto<=0 Hacer
					Escribir 'Ingrese un monto mayor a 0:'
					Leer monto
				FinMientras
				// Verificar saldo suficiente
				Si saldo-monto<0 Entonces
					Escribir 'Saldo insuficiente'
					Escribir 'Saldo actual: ', saldo
				SiNo
					saldo <- saldo-monto
					Escribir 'Retiro exitoso'
					Escribir 'Nuevo saldo: ', saldo
				FinSi
				//bloque ¿Desea realizar otra operación?
				Si  NO salir Entonces
					Escribir '*******************************'
					Escribir '¿Desea realizar otra operación?'
					Escribir '* 1 - Sí                      *'
					Escribir '* 2 - No                      *'
					Escribir '*******************************'
					Leer continuar
					Mientras continuar<1 O continuar>2 Hacer
						Escribir 'Opción inválida:'
						Leer continuar
					FinMientras
					Si continuar=2 Entonces
						salir <- Verdadero
					FinSi
				FinSi
			3:
				// DEPOSITAR DINERO
				Escribir '*******************************'
				Escribir 'Ingrese monto a depositar:'
				Leer monto
				// Validar monto positivo
				Mientras monto<=0 Hacer
					Escribir 'Ingrese un monto mayor a 0:'
					Leer monto
				FinMientras
				saldo <- saldo+monto
				Escribir 'Depósito exitoso'
				Escribir 'Nuevo saldo: ', saldo
				//bloque ¿Desea realizar otra operación?
				Si  NO salir Entonces
					Escribir '*******************************'
					Escribir '¿Desea realizar otra operación?'
					Escribir '* 1 - Sí                      *'
					Escribir '* 2 - No                      *'
					Escribir '*******************************'
					Leer continuar
					Mientras continuar<1 O continuar>2 Hacer
						Escribir 'Opción inválida:'
						Leer continuar
					FinMientras
					Si continuar=2 Entonces
						salir <- Verdadero
					FinSi
				FinSi
			4:
				// SALIR DEL SISTEMA
				salir <- Verdadero
		FinSegún
	FinMientras
FinAlgoritmo

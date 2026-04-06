Algoritmo problema_2_cajero_simulacion
	
	// Variables principales
	Definir saldo, monto Como Real
	Definir opc Como caracter
	definir opc_num como entero
	Definir salir Como Logico
	
	saldo <- 0
	salir <- Falso
	
	//bucle de proceso principal
	Mientras No salir Hacer
		
		// MENÚ PRINCIPAL
		Escribir "*******************************"
		Escribir "***** SISTEMA DE CAJERO ******"
		Escribir "*******************************"
		Escribir "* 1 - Consultar Saldo        *"
		Escribir "* 2 - Retirar Dinero         *"
		Escribir "* 3 - Depositar Dinero       *"
		Escribir "* 4 - Salir                  *"
		Escribir "*******************************"
		
		
		// Validación de opción
		numeroValido <- Falso
		Mientras numeroValido = Falso Hacer
			Escribir "Ingrese una opción: "
			Leer opc
			//validación para que sea número
			numeroValido <- Verdadero
			Para j <- 1 Hasta Longitud(opc) Hacer
				letra <- Subcadena(opc,j,j)
				Si No (letra >= "0" Y letra <= "9") Entonces
					numeroValido <- Falso
				FinSi
			FinPara
			Si numeroValido Entonces
				opc_num <- ConvertirANumero(opc)//conversión de string a número
				Si opc_num < 1 O opc_num > 4 Entonces//validación si opción ingresada está en el rango
					numeroValido <- Falso
					Escribir "Opción no válida. Ingrese entre 1 y 4"
				FinSi
			SiNo
				Escribir "Debe ingresar solo numeros"
			FinSi
		FinMientras
		
		Segun opc_num Hacer
			
			1:
				// CONSULTAR SALDO
				Escribir "*******************************"
				Escribir "Su saldo es: ", saldo
				Escribir "*******************************"
				
			2:
				// RETIRAR DINERO
				Escribir "*******************************"
				Escribir "Ingrese monto a retirar:"
				Leer monto
				
				// Validar monto positivo
				Mientras monto <= 0 Hacer
					Escribir "Ingrese un monto mayor a 0:"
					Leer monto
				FinMientras
				
				// Verificar saldo suficiente
				Si saldo - monto < 0 Entonces
					Escribir "Saldo insuficiente"
					Escribir "Saldo actual: ", saldo
				SiNo
					saldo <- saldo - monto
					Escribir "Retiro exitoso"
					Escribir "Nuevo saldo: ", saldo
				FinSi
				
			3:
				// DEPOSITAR DINERO
				Escribir "*******************************"
				Escribir "Ingrese monto a depositar:"
				Leer monto
				
				// Validar monto positivo
				Mientras monto <= 0 Hacer
					Escribir "Ingrese un monto mayor a 0:"
					Leer monto
				FinMientras
				
				saldo <- saldo + monto
				Escribir "Depósito exitoso"
				Escribir "Nuevo saldo: ", saldo
				
			4:
				// SALIR DEL SISTEMA
				salir <- Verdadero
				
		FinSegun
		Si No salir Entonces
			Escribir "*******************************"
			Escribir "¿Desea realizar otra operación?"
			Escribir "* 1 - Sí                      *"
			Escribir "* 2 - No                      *"
			Escribir "*******************************"
			Leer continuar
			
			Mientras continuar < 1 O continuar > 2 Hacer
				Escribir "Opción inválida:"
				Leer continuar
			FinMientras
			
			Si continuar = 2 Entonces
				salir <- Verdadero
			FinSi
		FinSi
	FinMientras
FinAlgoritmo
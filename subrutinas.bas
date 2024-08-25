



sub moverJugador ( Conexion AS STRING, Ubicacion AS UBYTE, Comando AS STRING)
  Border 0: Paper 0: Ink 7: Cls

  IF Comando = "NORTE" AND Conexion = "NORTE" THEN 
    LET Ubicacion = Ubicacion + 1 
    PRINT "Te mueves al norte." 
    ' getUbicacion() 
    RETURN
  END IF

  IF Comando = "SUR" AND Conexion = "SUR" THEN 
    LET Ubicacion = Ubicacion - 1 
    PRINT "Te mueves al sur." 
    ' getUbicacion() 
    RETURN
  END IF

  IF Comando = "ESTE" AND Conexion = "ESTE" THEN 
    LET Ubicacion = Ubicacion + 1 
    PRINT "Te mueves al este." 
    ' getUbicacion() 
    RETURN
  END IF

  IF Comando = "OESTE" AND Conexion = "OESTE" THEN 
    LET Ubicacion = Ubicacion - 1
    PRINT "Te mueves al oeste."
    ' getUbicacion()
    RETURN
  END IF

  PRINT "No puedes ir en esa dirección desde aquí."
END SUB

SUB ejecutarComando(Comando AS STRING)
  Border 0: Paper 0: Ink 7: Cls
  IF LEFT(Comando, 5) = "mirar" THEN 
    PRINT Comando
    ' getUbicacion() 
    RETURN
  ENDIF

  IF LEFT(Comando, 2) = "ir" THEN 
    LET Direccion = MID(Comando, 4, 30) ' el tercer parametro hay que revisar, es donde termina la cadena y deberia de ser variable
    moverJugador()
    RETURN
  ENDIF

  IF LEFT(Comando, 5) = "tomar" THEN 
    ' GOSUB TOMAR_OBJ 
    RETURN
  ENDIF

  PRINT "No entiendo ese comando."
END SUB
' ZX Ginjol-Adventure-Parser
' Descripción: Parser de aventuras gráficas escrito en Boriel BASIC
' Autor: Ginjol(Andrés Giménez)
' Versión: 0.0.1
' Fecha de creación: 24/08/2024

#include <input.bas>

Border 0: Paper 0: Ink 7: Cls
Bold 1

DIM Salas(3) 
DIM Descripciones(3)
DIM Conexiones(3,3)
DIM Objetos(3,3)
DIM Inventario(10)

LET Ubicacion = 1
LET NumObjetos = 0


' Definir Salas
Salas(0) = "habitación inicial"
Descripciones(0) = "Estás en una habitación pequeña y oscura. Hay una puerta al norte."
Conexiones(0,0) = "NORTE"
Conexiones(0,1) = "pasillo oscuro"

Salas(1) = "pasillo oscuro"
Descripciones(1) = "Un pasillo oscuro y largo, apenas puedes ver al frente. Al sur hay una puerta que conduce de regreso."
Conexiones(1,0) = "SUR"
Conexiones(1,1) = "habitación inicial"
Conexiones(1,2) = "ESTE"
Conexiones(1,3) = "biblioteca"

Salas(2) = "biblioteca"
Descripciones(2) = "Estás en una biblioteca polvorienta llena de libros viejos. Hay una puerta al oeste que conduce de regreso."
Conexiones(2,0) = "OESTE"
Conexiones(2,1) = "pasillo oscuro"

' Definir Objetos
Objetos(0, 0) = "linterna"
Objetos(0, 1) = "llave"
Objetos(1, 0) = "monstruo"
Objetos(2, 0) = "libro antiguo"

' Iniciar juego
PRINT "Bienvenido a la aventura."
GOSUB 600  ' Mostrar la descripción inicial
GOTO COMANDO_PRINCIPAL

' Loop principal
LOOP_PRINCIPAL:
PRINT "¿Qué quieres hacer? "
INPUT Comando
COMANDO_PRINCIPAL:
GOSUB 700  ' Ejecutar comando
GOTO LOOP_PRINCIPAL

' Describir la ubicación actual
UBICACION_ACTUAL:
PRINT Descripciones(Ubicacion)
FOR I = 1 TO 3
  IF Objetos(Ubicacion, I) <> "" THEN 
    PRINT "Ves un "+ Objetos(Ubicacion, I)
NEXT I
RETURN

' Mover al jugador
500:
IF Comando = "NORTE" AND Conexiones(Ubicacion,1) = "NORTE" THEN 
  LET Ubicacion = Ubicacion + 1 
  PRINT "Te mueves al norte." 
  GOSUB 600 
  RETURN
ENDIF

IF Comando = "SUR" AND Conexiones(Ubicacion,1) = "SUR" THEN 
  LET Ubicacion = Ubicacion - 1 
  PRINT "Te mueves al sur." 
  GOSUB 600 
  RETURN
ENDIF

IF Comando = "ESTE" AND Conexiones(Ubicacion,3) = "ESTE" THEN 
  LET Ubicacion = Ubicacion + 1 
  PRINT "Te mueves al este." 
  GOSUB 600 
  RETURN
ENDIF

IF Comando = "OESTE" AND Conexiones(Ubicacion,3) = "OESTE" THEN 
  LET Ubicacion = Ubicacion - 1
  PRINT "Te mueves al oeste."
  GOSUB 600
  RETURN
ENDIF

PRINT "No puedes ir en esa dirección desde aquí."
RETURN

' Mostrar la descripción de la ubicación actual
600:
GOSUB UBICACION_ACTUAL
RETURN

' Ejecutar comando
700:

IF LEFT(Comando, 5) = "MIRAR" THEN 
  GOSUB 600 
  RETURN
ENDIF

IF LEFT(Comando, 2) = "IR" THEN 
  LET Direccion = MID(Comando, 4)
  GOSUB 500
  RETURN
ENDIF

IF LEFT(Comando, 5) = "TOMAR" THEN 
  GOSUB TOMAR_OBJ 
  RETURN
ENDIF

PRINT "No entiendo ese comando."
RETURN

' Tomar un objeto
TOMAR_OBJ:
LET Objeto = MID(Comando, 6)
FOR I = 1 TO 3
  IF Objetos(Ubicacion, I) = Objeto THEN
    LET NumObjetos = NumObjetos + 1
    Inventario(NumObjetos) = Objeto
    PRINT "Has tomado el "; Objeto
    LET Objetos(Ubicacion, I) = ""
    RETURN
  END IF
NEXT I
PRINT "No hay un "; Objeto; " aquí para tomar."
RETURN
' ZX Ginjol-Adventure-Parser
' Descripcion: Parser de aventuras graficas escrito en Boriel BASIC
' Autor: Ginjol(Andres Gimenez)
' Version: 0.0.1
' Fecha de creacion: 24/08/2024

#include <input.bas>
#include <string.bas>
' #include "subrutinas.bas"


Border 1: Paper 0: Ink 10: Cls
Bold 3

DIM Salas(3) AS STRING
DIM Descripciones(3) AS STRING
DIM Conexiones(3,3) AS STRING
DIM Objetos(3,3) AS STRING
DIM Inventario(10) AS STRING

DIM Comando AS STRING
DIM Ubicacion AS UBYTE
DIM NumObjetos AS UBYTE

LET Ubicacion = 0 
LET NumObjetos = 0


' Definir Salas
Salas(0) = "habitacion inicial"
Descripciones(0) = "Estas en una habitacion pequena y oscura. Hay una puerta al norte."
Conexiones(0,0) = "NORTE"
Conexiones(0,1) = "pasillo oscuro"

Salas(1) = "pasillo oscuro"
Descripciones(1) = "Un pasillo oscuro y largo, apenas puedes ver al frente. Al sur hay una puerta que conduce de regreso."
Conexiones(1,0) = "SUR"
Conexiones(1,1) = "habitacion inicial"
Conexiones(1,2) = "ESTE"
Conexiones(1,3) = "biblioteca"

Salas(2) = "biblioteca"
Descripciones(2) = "Estas en una biblioteca polvorienta llena de libros viejos. Hay una puerta al oeste que conduce de regreso."
Conexiones(2,0) = "OESTE"
Conexiones(2,1) = "pasillo oscuro"

' Definir Objetos
Objetos(0, 0) = "linterna"
Objetos(0, 1) = "llave"
Objetos(1, 0) = "monstruo"
Objetos(2, 0) = "libro antiguo"


' Definicion de funciones 

' Describir la ubicación actual
SUB getUbicacion ()
   PRINT at 2,0; Descripciones(Ubicacion)
   
   DIM I AS UBYTE
   FOR I = 0 TO 2 STEP 1
     IF Objetos(Ubicacion,I) <> "" THEN 
      PRINT "Ves un "+ Objetos(Ubicacion,I)
     END IF
   NEXT I
   RETURN
END SUB


SUB ejecutarComando(Comando AS STRING)
  Border 1: Paper 0: Ink 10: Cls
  Bold 3
  IF LEFT(Comando, 5) = "mirar" THEN 
    PRINT Comando
    ' getUbicacion() 
    RETURN
  ENDIF

  IF LEFT(Comando, 2) = "ir" THEN 
    LET Direccion = MID(Comando, 4, 30) ' el tercer parametro hay que revisar, es donde termina la cadena y deberia de ser variable
    ' moverJugador()
    RETURN
  ENDIF

  IF LEFT(Comando, 5) = "tomar" THEN 
    ' GOSUB TOMAR_OBJ 
    RETURN
  ENDIF

  PRINT "No entiendo ese comando."
END SUB



' Iniciar juego
PRINT at 0,0; "Bienvenido a la aventura."

' Mostrar la descripcion inicial
getUbicacion()

' Loop principal
DO

  PRINT "Que quieres hacer? " ' TODO EN EL LITERAL mirar acentos - "Que quieres hacer? " 
  LET Comando = INPUT(20)
  ejecutarComando(Comando)

LOOP
#REGLAS
esta_en_trayectoria(T, ColumnaD, FilaD) :-
	torre(T),
	columna(ColumnaD),
	fila(FilaD),
	estaEnCasilla(T, ColumnaO, FilaO),
	\+ (FilaO = FilaD , ColumnaO = ColumnaD),
	(ColumnaD = ColumnaO ; FilaO = FilaD),		%Mov de torre
	(ColumnaD \= ColumnaO ; FilaO \= FilaD).	%Se mueva

esta_en_trayectoria(C, ColumnaD, FilaD) :-
	caballo(C),
	columna(ColumnaD),
	fila(FilaD),
	estaEnCasilla(C, ColumnaO, FilaO),
	\+ (FilaO = FilaD , ColumnaO = ColumnaD),
	numeroColumna(ColumnaO , X1),
	numeroColumna(ColumnaD , X2),
	(((abs(FilaD - FilaO)) =:= 2 , (abs(X1 - X2)) =:=1) ; 
	((abs(FilaD - FilaO)) =:= 1 , (abs(X1 - X2)) =:=2)).

esta_en_trayectoria(A, ColumnaD, FilaD) :-
	alfil(A),
	columna(ColumnaD),
	fila(FilaD),
	estaEnCasilla(A, ColumnaO, FilaO),
	\+ (FilaO = FilaD , ColumnaO = ColumnaD),
	numeroColumna(ColumnaO, NColO),
	numeroColumna(ColumnaD, NColD),
	((abs(NColD-NColO)) =:= (abs(FilaD-FilaO))).


esta_en_trayectoria(R, ColumnaD, FilaD) :-
	rey(R),
	columna(ColumnaD),
	fila(FilaD),
	estaEnCasilla(R, ColumnaO, FilaO),
	\+ (FilaO = FilaD , ColumnaO = ColumnaD),
	numeroColumna(ColumnaO, NColO),
	numeroColumna(ColumnaD, NColD),
	(((abs(NColD-NColO) =:= 1),(FilaD = FilaO)) ;
	((abs(FilaD-FilaO) =:= 1), (NColD = NColO))).




movimiento_legal(Ficha, Columna, Fila):-
	\+ caballo(Ficha),
	esta_en_trayectoria(Ficha, Columna, Fila),
	\+ (estaEnCasilla(Ficha2, Columna2, Fila2),
	esta_en_trayectoria(Ficha, Columna2, Fila2),
	(Columna2 \= Columna ; Fila2 \= Fila)),
	\+ (estaEnCasilla(Ficha2, Columna2, Fila2),
	esta_en_trayectoria(Ficha, Fila2, Columna2),
	(Columna2 \= Columna ; Fila2 \= Fila)),
	\+ (estaEnCasilla(Ficha2, Columna2, Fila2), esta_en_trayectoria(Ficha, Columna2, Fila2), (Columna2 \= Columna ; Fila2 \= Fila)),
	\+ (estaEnCasilla(Ficha3, Columna, Fila),
	color(Ficha, Color), color(Ficha3, Color)). 

contrario(Ficha1, Ficha2):-
	color(Ficha1, Color1),
	color(Ficha2, Color2),
	Color1 \= Color2.

%Hay que hacer un le estorba a cada ficha

le_estorba(Ficha1, Ficha2, Columna, Fila) :-
	torre(Ficha2),
	esta_en_casilla(Ficha1, Columna, Fila),
	%Fila2 \= Fila,
	%XXXXX hay que progrmá el que ehta entre mediah de loh doh

%HECHOS INDEPENDIENTES DEL CASO

fila(1).	
fila(2).	
fila(3).	
fila(4).	
fila(5).	
fila(6).	
fila(7).	
fila(8).	

columna(a).
columna(b).
columna(c).
columna(d).
columna(e).
columna(f).
columna(g).
columna(h).

numeroColumna(a,1).
numeroColumna(b,2).
numeroColumna(c,3).
numeroColumna(d,4).
numeroColumna(e,5).
numeroColumna(f,6).
numeroColumna(g,7).
numeroColumna(h,8).

torre(torreBlanca1).
torre(torreBlanca2).
torre(torreNegra1).
torre(torreNegra2).

alfil(alfilBlanco1).
alfil(alfilBlanco2).
alfil(alfilNegro1).
alfil(alfilNegro2).

caballo(caballoBlanco1).
caballo(caballoBlanco2).
caballo(caballoNegro1).
caballo(caballoNegro2).

rey(reyBlanco).
rey(reyNegro).

%HECHOS DEPENDIENTES DEL CASO
estaEnCasilla(torreBlanca1,a,1).
estaEnCasilla(torreBlanca2,h,1).
estaEnCasilla(caballoBlanco1,b,1).
estaEnCasilla(caballoBlanco2,g,1).
estaEnCasilla(alfilBlanco1,c,1).
estaEnCasilla(alfilBlanco2,f,1).
estaEnCasilla(alfilNegro1,c,8).
estaEnCasilla(alfilNegro2,f,8).
estaEnCasilla(reyBlanco, e, 1).
estaEnCasilla(reyNegro, d, 8).


color(torreBlanca1,blanco).
color(torreBlanca2 ,blanco).
color(caballoBlanco1 ,blanco).
color(caballoBlanco2 ,blanco).
color(alfilBlanco1 ,blanco).
color(alfilBlanco2 ,blanco).
color(reyBlanco ,blanco).
color(torreNegra1 ,negro).
color(torreNegra2 ,negro).
color(cablloNego1 ,negro).
color(cablloNegro2 ,negro).
color(alfilNegro1 ,negro).
color(alfilNegro2 ,negro).
color(reyNegro ,negro).



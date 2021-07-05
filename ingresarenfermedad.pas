Program proyecto;

uses
   crt;
type
    TRE = record // Registro de enfermedades
        enfermedad : string[20];
        alimentos : string[255];
        end;
    TFE = file of TRE;
var
   RE : TRE;
   FE : TFE;

BEGIN
{C:\Users\alumno\Desktop\programacion}
assign (FE, 'enfermedad.txt');
rewrite(FE);

RE.enfermedad:='Cancer';
RE.alimentos:='Es preciso contar con vitamina C, en este caso utilizamos como prioridad el "Morron", lo que hara esto es aprovechar al maximo las enzimas del cuerpo, se utilizara, "Limon", elimina celulas muertas del cuerpo(esto dejaria sin alimento al cancer).';
write(FE,RE);
RE.enfermedad:='Osteoporosis';
RE.alimentos:='Para evitar la disminucion de la densidad osea, mantener unos habitos de vida saludables, lo ms apropiado es mantener una buena alimentacion. Calcio: lacteos y cereales.Fosforo: frutos secos y legumbres.';
write(FE,RE);
RE.enfermedad:='Colesterol';
RE.alimentos:='utilizar jengibre, en te, mate o ensaladas. limpia la grasa de las arterias y mejora la respiracion';
write(FE,RE);
RE.enfermedad:='Infeccion';
RE.alimentos:='Alimentos que combaten las infecciones. Ajo: Su poder antibiotico elimina germenes y bacterias y ayuda a depurar profundamente intestinos y sangre. Ideal para combatir infecciones respiratorias y urinarias.';
write(FE,RE);
RE.enfermedad:='Presion alta';
RE.alimentos:='Coma menos sodio.Escoja frutas y vegetales.Elija menos alimentos altos en sodio.Use especias o hierbas. Use cubitos de caldo, salsa de soya y salsa de tomate. Llene el salero con una mezcla de hierbas y especias.';
write(FE,RE);

close(FE);
readkey;
END.

Program proyecto;

uses
   crt;
type
    TRA = record // Registro de alimentos
        Peso : real;
        Alimentos : string[255];
       end;
    TRE = record // Registro de enfermedades
        enfermedad : string[20];
        alimentos : string[255];
        end;
    TFE = file of TRE; // archivo de registro de enfermedades
    TFA = file of TRA; // archivo de registro de alimentos
var

   RE : TRE;
   FE : TFE;
   RA : TRA;
   FA : TFA;

function PesoIdeal (Peso:real ; altura:real): integer; //carga de datos para calcular el promedio
var
   i : real ;
begin
     i := altura * altura; //calculo para promediar el grado.
     i := peso / i ;
	if i < 18 then begin PesoIdeal := 0; end else begin //usamos las condiciones para medir el grado en que se encuentra la persona sobre el peso
	if i < 24.9 then begin PesoIdeal := 1; end else begin
	if i < 29.9 then begin PesoIdeal := 2; end else begin
	if i < 35 then begin PesoIdeal := 3; end else begin
	PesoIdeal := 4;
end; end; end; end; end;

function ValidarReal(s:string):real; //funcion para validar solo con el caracter correcto.
         var r:real; key:string; j:integer;
         begin
              writeln(s);
         repeat
               readln(key);
               val(key, r, j);
         until j=0;
               ValidarReal:=r;
         end;

function validar (): integer; //validamos por el hecho de no cerrar la pagina en caso que la tecla que coloquen sea incorrecta
         var
            key : char;
            begin
            repeat
                  key := readkey;
            until key in['0'..'9'];//in: Busca entre los dos numeros
                  validar := ord(key)-48;
            end;

Procedure VisualizarEnfermedad (var FE: TFE ; pag : integer); //llamamos los archivos de enfermedad al sistema
          var i:integer;
          Begin
               clrscr;
               writeln ('Menu Enfermedades');
               writeln ;
               reset(FE);
               seek(FE,7*pag);
               i:=0;
          while not (eof(FE)) and (i<7) do begin //solo si cumple la condicion se avanza en la respuesta
		        read(FE,RE);
		        writeln(chr(i+49)+'. '+RE.enfermedad); // Busca por la pagina
		        i:=i+1;
          end;
	         Close(FE);//Cierra el archivo
	         writeln;
	         writeln ('8. Pagina anterior');
	         writeln ('9. Pagina siguiente');
	         writeln;
	         writeln ('0. Salir');
end;

Procedure MenuEnfermedades (var FE: TFE); //proceso hecho para tener el menu de enfermedades ordenado.
          var
             key,pag: integer;
          begin
	           pag:= 0;
          repeat
		        visualizarEnfermedad(FE,pag);
		        key := Validar();
		        reset(FE);
		        case key of
		        1..7: begin
			             reset(FE);
			             Seek(FE,pag*7+key-1);
			             if not eof(FE) then begin
                               read(FE,RE);
                               writeln (RE.alimentos);
          end;
              close(FE);
              readkey;
          end;
		        8 : if pag > 0
		        then begin
			       pag := pag - 1;
          end;
		        9: if pag < 5
		        then begin
			       pag := pag + 1;
          end;
	         end;
	         until key=0;
end;
procedure Alimentos (var FA : TFA );  //procesos para ingresar los datos del paciente en peso y altura, para calcular el grado.
          var
             peso : real;
             altura : real;
             PI : integer;
          begin
	         clrscr;
	         peso := validarReal('Ingrese peso en KG:');
	         altura := validarReal('Ingrese altura en Metros:');
	         PI := PesoIdeal(peso, altura);
	         reset(FA);//abrir archivo
	         seek(FA,PI);//Busca en el archivo PesoIdeal
	         writeln('Lo que deberias comer seria:');
	         if not eof(FA) then begin
		        read(FA,RA);//leer el registro RA
		        writeln(RA.alimentos);//Muestra el alimento indicado segun su promedio
	         end;
	             close(FA);
	             readkey;
          end;
Procedure MainMenu; var key:integer; //Menu principal del sistema.
begin
   repeat
		 clrscr; // Menu de inicio
  		 writeln ('Menu Principal');
		 writeln ;
		 writeln ('1. Tratamiento de Enfermedad ');
		 writeln ('2. Tratamiento de Peso ');
		 writeln;
		 writeln ('0. Salir ');
		 key:=validar();
		 case key of
		 1: MenuEnfermedades(FE);
		 2: Alimentos(FA);
		 end;
   until key=0;
end;

BEGIN
assign (FA, 'alimento.txt'); //asignamos los archivos al programa.
assign (FE, 'enfermedad.txt');
MainMenu;
END.

{Desktop\programacion}


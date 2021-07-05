Program proyecto;

uses
   crt;
type
    TRA = record // Registro de alimentos
        Peso : real;
        Alimentos : string[255];
       end;
    TFA = file of TRA;
var
   RA : TRA;
   FA : TFA;
BEGIN
{C:\Users\alumno\Desktop\}
assign (FA, 'alimento.txt');
rewrite(FA);
RA.peso:=0;
RA.alimentos:='Tienes una delgadez severa. Tienes una cantidad baja de grasa en el cuerpo. Es necesario que consuma pastas acompañadas de carnes, y comer en lo posible cada 3 hs alimentos que generen grasas buenas y fuente de hierro (Higado, legumbres, nueces, pollo).';
write(FA,RA);
RA.peso:=1;
RA.alimentos:='Tienes un peso normal y saludable, tienes una cantidad sana de grasa en el cuerpo, que es asociado con una vida mas larga. mantener una alimentacion balanceada, con frutas y verduras, carnes acompañadas con una ensalada, alimentos con fuentes de calcio.';
write(FA,RA);
RA.peso:=2;
RA.alimentos:='Tienes un sobre peso preobeso, estas aumentando el riesgo de padecer enfermedades con tu peso actual. deberias perder peso cambiando de dieta y haciendo ejercicio, acompañado de un desayuno proteico y bajo grasas.';
write(FA,RA);
RA.peso:=3;
RA.alimentos:='Tienes obesidad emergente, con muchas probabilidades de padecer diferente tipos de enfermedades, lo mejor es hacer una buena rutina de alimentacion y gymnacia';
write(FA,RA);
RA.peso:=4;
RA.alimentos:='Tienes obesidad Morbida, tu exceso de peso te pone en problemas cardiacos, diabetes, hipertension y diferente tipo de canceres, has una rutina de alimentacion y Gimnacia adecuada ';
write(FA,RA);
close(FA);
readkey;
END.

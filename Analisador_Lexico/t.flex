import java.util.*;

%%
%class AnalisadoLexico
%standalone
%public

%{
    static Scanner scanner = new Scanner(System.in);

    static int some = 0;
    static int all = 0;
    static int erros = 0;
    static int only = 0;
    static int value = 0;
    static int min = 0;
    static int max = 0;
    static int exactly = 0;
    static int that = 0;
    static int not = 0;
    static int and = 0;
    static int or = 0;
    static int fecha_par = 0;
    static int abre_par = 0;
    static int maior = 0;
    static int menor = 0;
    static int num = 0;
    static int maior_ou_igual= 0;
    static int menor_ou_igual = 0;
    static int propriedade_has = 0;
    static int propriedade_is = 0;
    static int propriedade = 0;
    static int classe = 0;
    static int classeComposta = 0;
    static int classeUnderline = 0;
    static int valor_int = 0;
    static int valor_float = 0;

    public static class Compiler {
  
    //exibe a quantidade de tokens 
    public static void qnt_tokens(){
        System.out.println("\n--------------------------------------------");
        System.out.println("        TOKEN        |      QUANTIDADE      ");
        System.out.println("--------------------------------------------");

        if(some > 0){
            System.out.println("        SOME         |           " + some);
            System.out.println("--------------------------------------------");
        }
        if(only > 0){
            System.out.println("        ONLY         |           " + only);
            System.out.println("--------------------------------------------");
        }
        if(all > 0){
            System.out.println("         ALL         |           " + all);
            System.out.println("--------------------------------------------");
        }
        if(value > 0){
            System.out.println("        VALUE        |           " + value);
            System.out.println("--------------------------------------------");
        }
        if(min > 0){
            System.out.println("         MIN         |           " + min);
            System.out.println("--------------------------------------------");
        }
        if(max > 0){
            System.out.println("         MAX         |           " + max);
            System.out.println("--------------------------------------------");
        }
        if(exactly > 0){
            System.out.println("       EXACTLY       |           " + exactly);
            System.out.println("--------------------------------------------");
        }
        if(that > 0){
            System.out.println("        THAT         |           " + that);
            System.out.println("--------------------------------------------");
        }
        if(not > 0){
            System.out.println("         NOT         |           " + not);
            System.out.println("--------------------------------------------");
        }
        if(and > 0){
            System.out.println("         AND         |           " + and);
            System.out.println("--------------------------------------------");
        }
        if(or > 0){
            System.out.println("         OR          |           " + or);
            System.out.println("--------------------------------------------");
        }
        if(abre_par > 0){
            System.out.println("          (          |           " + abre_par);
            System.out.println("--------------------------------------------");
        }
        if(fecha_par > 0){
            System.out.println("          )          |           " + fecha_par);
            System.out.println("--------------------------------------------");
        }
        if(maior > 0){
            System.out.println("          >          |           " + maior);
            System.out.println("--------------------------------------------");
        }
        if(menor > 0){
            System.out.println("          <          |           " + menor);
            System.out.println("--------------------------------------------");
        }
        if(maior_ou_igual > 0){
            System.out.println("         >=          |           " + maior_ou_igual);
            System.out.println("--------------------------------------------");
        }
        if(menor_ou_igual > 0){
            System.out.println("         <=          |           " + menor_ou_igual);
            System.out.println("--------------------------------------------");
        }
        if(num > 0){
            System.out.println("       NÚMERO        |           " + num);
            System.out.println("--------------------------------------------");
        }
        if(propriedade_has > 0){
            System.out.println("  PROPRIEDADE (HAS)  |           " + propriedade_has);
            System.out.println("--------------------------------------------");
        }
        if(propriedade_is > 0){
            System.out.println("  PROPRIEDADE (IS)   |           " + propriedade_is);
            System.out.println("--------------------------------------------");
        }
        if(classe > 0){
            System.out.println("       Classe        |           " + classe);
            System.out.println("--------------------------------------------");
        }
        if(classeComposta > 0){
            System.out.println("   Classe Composta   |           " + classeComposta);
            System.out.println("--------------------------------------------");
        }
         if(classeUnderline > 0){
            System.out.println("  Classe Underline   |           " + classeUnderline);
            System.out.println("--------------------------------------------");
        }
        if(propriedade > 0){
            System.out.println("  Propriedades Total |           " + propriedade);
            System.out.println("--------------------------------------------");
        }
        if(valor_int > 0){
            System.out.println(" Valor para INTEGER  |           " + valor_int);
            System.out.println("--------------------------------------------");
        }
        if(valor_float > 0){
            System.out.println("  Valor para FLOAT   |           " + valor_float);
            System.out.println("--------------------------------------------");
        }
        if(erros > 0){
            System.out.println("     >> ERROS        |           " + erros);
            System.out.println("--------------------------------------------");
        }
    }
}
    
%}

// Macros
Letra           = [a-z]
Letra_maiuscula = [A-Z]
Maior           = >
Menor           = <
Maior_ou_igual  = (>=)
Menor_ou_igual  = (<=)
Abre_par        = \(
Fecha_par       = \)
Numero          = [0-9]+
NumeroFloat     = [0-9]+ \. [0-9]+
Valor_Variavel  = \[ ({Maior}|{Menor}|({Maior_ou_igual}|{Menor_ou_igual}) \" ({Numero} | {NumeroFloat}) \") \] 
EspacoBranco    = \r|\n|\r\n
Classe          = {Letra_maiuscula}{Letra}+{Numero}*
ClasseComposta  = {Classe}{Classe}+
ClasseUnderline = {Classe}(_({Classe}|{Numero}))+
has             = (has)({Classe}|{ClasseComposta}|{ClasseUnderline})
is              = (is)({Classe}|{ClasseComposta}|{ClasseUnderline})(Of)
erro            = ({Classe} | {Letra}+)(_({Letra}|{Numero})*)+ 

%%

{ClasseComposta} {System.out.println("> Encontrei uma Classe Composta {" + yytext() + "}");classeComposta++;}
{ClasseUnderline} {System.out.println("> Encontrei uma Classe_Underline {" + yytext() + "}"); classeUnderline++;}
{Classe} {System.out.println("> Encontrei uma Classe {" + yytext() + "}"); classe++;}
{has} {System.out.println("> Encontrei uma propriedade has {" + yytext() + "}");propriedade++;propriedade_has++;}
{is} {System.out.println("> Encontrei uma propriedade is {" + yytext() + "}");propriedade++;propriedade_is++;}
{Numero} {System.out.println("> Encontrei um Número {" + yytext() + "}"); num++;}
{Abre_par} {System.out.println("> Encontrei um Abre parentese"); abre_par++;}
{Fecha_par} {System.out.println("> Encontrei um Fecha parentese");fecha_par++;}
{Maior} {System.out.println("> Encontrei um Maior que");maior++;}
{Menor} {System.out.println("> Encontrei um Menor que");menor++;}
{Maior_ou_igual} {System.out.println("> Encontrei um Maior ou igual");maior_ou_igual++;}
{Menor_ou_igual} {System.out.println("> Encontrei um Menor ou igual");menor_ou_igual++;}
{erro} {System.out.println("> Encontrei um ERRO {" + yytext() + "}");erros++;}
{EspacoBranco} { }
. { }

"some" {System.out.println("> Encontrei a palavra reservada SOME");some++;}
"all" {System.out.println("> Encontrei a palavra reservada ALL");all++;}
"value" {System.out.println("> Encontrei a palavra reservada VALUE");value++;}
"min" {System.out.println("> Encontrei a palavra reservada MIN");min++;}
"max" {System.out.println("> Encontrei a palavra reservada MAX");max++;}
"exactly" {System.out.println("> Encontrei a palavra reservada EXACTLY");exactly++;}
"that" {System.out.println("> Encontrei a palavra reservada THAT");that++;}
"not" {System.out.println("> Encontrei a palavra reservada NOT");not++;}
"and" {System.out.println("> Encontrei a palavra reservada AND");and++;}
"or" {System.out.println("> Encontrei a palavra reservada OR");or++;}
"only" {System.out.println("> Encontrei a palavra reservada ONLY");only++;}
("integer"){Valor_Variavel} {System.out.println("> Encontrei uma condição: {" + yytext() + "}");valor_int++;}
("float"){Valor_Variavel} {System.out.println("> Encontrei uma condição: {" + yytext() + "}");valor_float++;}


{Letra}+ {System.out.println("> Encontrei um ERRO {" + yytext() + "}");erros++;}
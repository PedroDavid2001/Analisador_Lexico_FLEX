import java.util.*;

%%
%class AnalisadoLexico
%standalone
%public

%{
    static Scanner scanner = new Scanner(System.in);

    static int some = 0;
    static int all = 0;
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
Digito          = [0-9]
Palavra         = {Letra}*
Numero          = {Digito}+
EspacoBranco    = \r|\n|\r\n
Classe          = {Letra_maiuscula}{Letra}+
ClasseComposta  = {Classe}{Classe}+
ClasseUnderline = {Classe}(_{Classe})+
has             = (has([A-Z][a-z]+)+)
is              = (is([A-Z][a-z]+)+(Of))
erro            = {Classe}+_

%%

{ClasseComposta} {System.out.println("> Encontrei uma {Classe Composta}");classeComposta++;}
{ClasseUnderline} {System.out.println("> Encontrei uma {Classe Underline}"); classeUnderline++;}
{Classe} {System.out.println("> Encontrei uma {Classe}"); classe++;}
{erro} {System.out.println("> Encontrei uma {erro classe}");}
{has} {System.out.println("> Encontrei uma {Id has}");propriedade++;propriedade_has++;}
{is} {System.out.println("> Encontrei uma {Id is}");propriedade++;propriedade_is++;}
{Numero} {System.out.println("> Encontrei um {Numero}"); num++;}
{Abre_par} {System.out.println("> Encontrei um {Abre parentese}"); abre_par++;}
{Fecha_par} {System.out.println("> Encontrei um {Fecha parentese}");fecha_par++;}
{Maior} {System.out.println("> Encontrei um {Maior q}");maior++;}
{Menor} {System.out.println("> Encontrei um {Menor q}");menor++;}
{Maior_ou_igual} {System.out.println("> Encontrei um {Maior ou igual}");maior_ou_igual++;}
{Menor_ou_igual} {System.out.println("> Encontrei um {Menor ou igual}");menor_ou_igual++;}
{EspacoBranco} { }
. { }

"some" {some++;}
"all" {all++;}
"value" {value++;}
"min" {min++;}
"max" {max++;}
"exactly" {exactly++;}
"that" {that++;}
"not" {not++;}
"and" {and++;}
"or" {or++;}
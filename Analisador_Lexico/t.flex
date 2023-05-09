import java.util.*;

%%
%class AnalisadoLexico
%standalone
%line
%public
%{
    Scanner scanner = new Scanner(System.in);

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
    static int classe = 0;
    static int classeComposta = 0;
    static int classeUnderline = 0;
    

    public static class Compiler {
  
    // strings resultantes do split() to arquivo txt ou frase escrita pelo usuário
    public String [] lexemas = null;

    // booleans que indicam se o lexema no índice relativo disparou erro 
    // TRUE  = disparou erro
    // FALSE = gerou token válido
    public boolean    [] indices_dos_erros = null;  

    public Scanner sc = new Scanner(System.in);

    public void ler_frase(){
        System.out.println("Digite a frase: ");
        String frase = sc.nextLine();
        definir_lexemas(frase);
    }

    //configura o array de palavras
    public void definir_lexemas(String frase){
        lexemas = frase.split(" ");
        indices_dos_erros = new boolean [lexemas.length];
        Arrays.fill(indices_dos_erros, false); 
    }

    //exibe a quantidade de tokens 
    public void qnt_tokens(){
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
    }

    //exibe as palavras que dispararam erro
    public void erros(){
        System.out.println("\nPALAVRAS INVÁLIDAS: {");
        
        for(int i = 0; i < indices_dos_erros.length; i++){
            if(indices_dos_erros[i]){
                System.out.println("    " + lexemas[i]);
            }
        }
        System.out.println("}\n");
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
%%

{Classe} {System.out.println("> Encontrei um {Classe}"); classe++;}
{ClasseComposta} {System.out.println("> Encontrei um {ClasseComposta}");classeComposta++;}
{ClasseUnderline} {System.out.println("> Encontrei um {ClasseUnderline}"); classeUnderline++;}
{Numero} {System.out.println("> Encontrei um {numero}"); num++;}
{Abre_par} {System.out.println("> Encontrei um {abre parent}");}
{Fecha_par} {System.out.println("> Encontrei um {fecha parent}");}
{Maior} {System.out.println("> Encontrei um {maior q}");}
{Menor} {System.out.println("> Encontrei um {menor q}");}
{Maior_ou_igual} {System.out.println("> Encontrei um {maior ou igual}");}
{Menor_ou_igual} {System.out.println("> Encontrei um {menor ou igual}");}
{EspacoBranco} { }
. { System.out.println("erro: " + yytext());}

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

//{Compiler comp = new Compiler();}

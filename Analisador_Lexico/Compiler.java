/*
  Definições
  %{
    letra               | [a-z]+
    letra_maiuscula     | [A-Z]
    propriedade_has     | has {letra_maiuscula}{letra}+ 
    propriedade_is      | is {letra_maiuscula}{letra}+   
    classe              | {letra_maiuscula}{letra}  |  {letra_maiuscula}{letra}_{letra_maiuscula}{letra} | {letra_maiuscula}{letra}{letra_maiuscula}{letra}
    num                 | [0-9]+
    maior               | >
    menor               | <
    maior_ou_igual      | <=
    menor_ou_igual      | >=
    abre_par            | (
    fecha_par           | )
    entre_parenteses    | {abre_par} classe ({letra} classe)+ {fecha_par}
  }%

  Padrões e regras
  %%
    SOME            | some++
    ALL             | all++
    VALUE           | value++
    MIN             | min++
    MAX             | max++
    EXACTLY         | exactly++
    THAT            | that++
    NOT             | not++
    AND             | and++
    OR              | or++
    {classe}        | classe++
    {propriedade}   | propriedade++
    fecha_par       | fecha_par++
    abre_par        | abre_par++
    maior           | maior++
    menor           | menor++
    num             | num++
    maior_ou_igual  | maior_ou_igual++
    menor_ou_igual  | menor_ou_igual++
  %%
 */

import java.util.Arrays;
import java.util.Scanner;

public class Compiler {
  
    // strings resultantes do split() to arquivo txt ou frase escrita pelo usuário
    public static String [] lexemas = null;

    // booleans que indicam se o lexema no índice relativo disparou erro 
    // TRUE  = disparou erro
    // FALSE = gerou token válido
    public static boolean    [] indices_dos_erros = null;  
    
    // Objeto responsável por armazenar a quantidade de cada token na string lida
    public static Counters contador = new Counters();

    public static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        ler_frase();
        qnt_tokens();
        erros();
    }

    public static void ler_frase(){
        System.out.println("Digite a frase: ");
        String frase = sc.nextLine();
        definir_lexemas(frase);
    }

    //configura o array de palavras
    public static void definir_lexemas(String frase){
        lexemas = frase.split(" ");
        indices_dos_erros = new boolean [lexemas.length];
        Arrays.fill(indices_dos_erros, false); 
    }

    //exibe a quantidade de tokens 
    public static void qnt_tokens(){
        System.out.println("\n--------------------------------------------");
        System.out.println("        TOKEN        |      QUANTIDADE      ");
        System.out.println("--------------------------------------------");

        if(contador.some > 0){
            System.out.println("        SOME         |           " + contador.some);
            System.out.println("--------------------------------------------");
        }
        if(contador.all > 0){
            System.out.println("         ALL         |           " + contador.all);
            System.out.println("--------------------------------------------");
        }
        if(contador.value > 0){
            System.out.println("        VALUE        |           " + contador.value);
            System.out.println("--------------------------------------------");
        }
        if(contador.min > 0){
            System.out.println("         MIN         |           " + contador.min);
            System.out.println("--------------------------------------------");
        }
        if(contador.max > 0){
            System.out.println("         MAX         |           " + contador.max);
            System.out.println("--------------------------------------------");
        }
        if(contador.exactly > 0){
            System.out.println("       EXACTLY       |           " + contador.exactly);
            System.out.println("--------------------------------------------");
        }
        if(contador.that > 0){
            System.out.println("        THAT         |           " + contador.that);
            System.out.println("--------------------------------------------");
        }
        if(contador.not > 0){
            System.out.println("         NOT         |           " + contador.not);
            System.out.println("--------------------------------------------");
        }
        if(contador.and > 0){
            System.out.println("         AND         |           " + contador.and);
            System.out.println("--------------------------------------------");
        }
        if(contador.or > 0){
            System.out.println("         OR          |           " + contador.or);
            System.out.println("--------------------------------------------");
        }
        if(contador.abre_par > 0){
            System.out.println("          (          |           " + contador.abre_par);
            System.out.println("--------------------------------------------");
        }
        if(contador.fecha_par > 0){
            System.out.println("          )          |           " + contador.fecha_par);
            System.out.println("--------------------------------------------");
        }
        if(contador.maior > 0){
            System.out.println("          >          |           " + contador.maior);
            System.out.println("--------------------------------------------");
        }
        if(contador.menor > 0){
            System.out.println("          <          |           " + contador.menor);
            System.out.println("--------------------------------------------");
        }
        if(contador.maior_ou_igual > 0){
            System.out.println("         >=          |           " + contador.maior_ou_igual);
            System.out.println("--------------------------------------------");
        }
        if(contador.menor_ou_igual > 0){
            System.out.println("         <=          |           " + contador.menor_ou_igual);
            System.out.println("--------------------------------------------");
        }
        if(contador.num > 0){
            System.out.println("       NÚMERO        |           " + contador.num);
            System.out.println("--------------------------------------------");
        }
        if(contador.propriedade_has > 0){
            System.out.println("  PROPRIEDADE (HAS)  |           " + contador.propriedade_has);
            System.out.println("--------------------------------------------");
        }
        if(contador.propriedade_is > 0){
            System.out.println("  PROPRIEDADE (IS)   |           " + contador.propriedade_is);
            System.out.println("--------------------------------------------");
        }
        if(contador.pizza > 0){
            System.out.println("        PIZZA        |           " + contador.pizza);
            System.out.println("--------------------------------------------");
        }
        if(contador.topping > 0){
            System.out.println("       TOPPING       |           " + contador.topping);
            System.out.println("--------------------------------------------");
        }
    }

    //exibe as palavras que dispararam erro
    public static void erros(){
        System.out.println("\nPALAVRAS INVÁLIDAS: {");
        
        for(int i = 0; i < indices_dos_erros.length; i++){
            if(indices_dos_erros[i]){
                System.out.println("    " + lexemas[i]);
            }
        }
        System.out.println("}\n");
    }
}
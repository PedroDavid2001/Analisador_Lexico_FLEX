import java_cup.runtime.Scanner;

import java.io.*;

public class Analisador {

    public static void main(String[] args) throws FileNotFoundException {
        // "C:/Users/Felipe/Desktop/Compiler_with_JFLex_n_JCup/Analisador_Lexico/teste.txt"
       try{
            String fileName = "C:/Users/Felipe/Desktop/Compiler_with_JFLex_n_JCup/Analisador_Lexico/teste.txt";
            parser p = new parser(new AnalisadorLexico(new FileReader(fileName)));
            Object result = p.parse().value;
        }
       catch (Exception e) {
       }
    }
  }
  
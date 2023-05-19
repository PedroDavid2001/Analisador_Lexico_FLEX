import java.io.*;

public class Analisador {

    public static void main(String[] args) throws FileNotFoundException {
       try {
           // "C:/Users/Felipe/Desktop/Compiler_with_JFLex_n_JCup/Analisador_Lexico/teste.txt"
           System.out.println("rodando");

           Reader reader = new FileReader("C:/Users/Felipe/Desktop/Compiler_with_JFLex_n_JCup/Analisador_Lexico/teste.txt");
           parser p = new parser(new AnalisadoLexico(reader));

           System.out.println(p.parse().value);
       }catch (Exception e){
           e.printStackTrace();
       }
    }
  }
  
public class Counters {
    int some = 0;
    int all = 0;
    int value = 0;
    int min = 0;
    int max = 0;
    int exactly = 0;
    int that = 0;
    int not = 0;
    int and = 0;
    int or = 0;
    int fecha_par = 0;
    int abre_par = 0;
    int maior = 0;
    int menor = 0;
    int num = 0;
    int maior_ou_igual= 0;
    int menor_ou_igual = 0;
    int propriedade_has = 0;
    int propriedade_is = 0;

    /*
     * A diferença entre pizza e topping é que este 
     * último será o token relativo a lexemas que 
     * possuam "Topping" no final da string.
     */

    int pizza = 0;  
    int topping = 0;

    /*
     * EXEMEPLOS DE COMO O DFA RECONHECERÁ LEXEMAS
     * 
     * PizzaTopping  -> topping
     * Pizza         -> pizza
     * hasTopping    -> propriedade_has
     * isColdPizza   -> propriedade_is
     * ColdPizza     -> pizza
     * hasCheese     -> propriedade_has
     * CheesePizza   -> pizza
     * CheeseTopping -> topping
     */
    
    public Counters(){

    }
}
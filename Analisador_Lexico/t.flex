package cup.example;
import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.ComplexSymbolFactory.Location;
import java_cup.runtime.Symbol;
import java.lang.*;
import java.io.InputStreamReader;

%%

%class AnalisadoLexico
%line
%column
%debug
%unicode
%cup
%public

%{

    public AnalisadoLexico(ComplexSymbolFactory sf, java.io.InputStream is){
        this(is);
        symbolFactory = sf;
    }
    public AnalisadorLexico(ComplexSymbolFactory sf, java.io.Reader reader){
        this(reader);
        symbolFactory = sf;
    }

    private StringBuffer sb;
    private ComplexSymbolFactory symbolFactory;
    private int csline,cscolumn;

    public Symbol symbol(String name, int code){
        return symbolFactory.newSymbol(name, code,
                        new Location(yyline+1,yycolumn+1, yychar), 
                        new Location(yyline+1,yycolumn+yylength(), yychar+yylength())
                );
    }
    public Symbol symbol(String name, int code, String lexem){
    return symbolFactory.newSymbol(name, code,
                        new Location(yyline+1, yycolumn +1, yychar),
                        new Location(yyline+1,yycolumn+yylength(), yychar+yylength()), lexem);
    }

    protected void emit_warning(String message){
        System.out.println("scanner warning: " + message + " at : 2 "+
                (yyline+1) + " " + (yycolumn+1) + " " + yychar);
    }

    protected void emit_error(String message){
        System.out.println("scanner error: " + message + " at : 2" +
                (yyline+1) + " " + (yycolumn+1) + " " + yychar);
    }

%}

NovaLinha       = \r|\n|\r\n
EspacoBraco     = {NovaLinha} | [ \t\f]

Letra           = [a-z]
Letra_maiuscula = [A-Z]
Numero          = [0-9]+
NumeroFloat     = [0-9]+ \. [0-9]+
Maior           = >
Menor           = <
Maior_ou_igual  = (>=)
Menor_ou_igual  = (<=)
Valor_Variavel  = \[ ({Maior}|{Menor}|({Maior_ou_igual}|{Menor_ou_igual}) \" ({Numero} | {NumeroFloat}) \") \] 
Classe          = {Letra_maiuscula}{Letra}+{Numero}*
ClasseComposta  = {Classe}{Classe}+
ClasseUnderline = {Classe}(_({Classe}|{Numero}))+
has             = (has)({Classe}|{ClasseComposta}|{ClasseUnderline})
is              = (is)({Classe}|{ClasseComposta}|{ClasseUnderline})(Of)
integer         = (integer){Valor_Variavel}
float           = (float){Valor_Variavel}

%%

<YYINITIAL> {
    "some"              { return symbol("SOME", sym.SOME); }
    "all"               { return symbol("ALL", sym.ALL); }
    "value"             { return symbol("VALUE", sym.VALUE); }
    "min"               { return symbol("MIN", sym.MIN); }
    "max"               { return symbol("MAX", sym.MAX); }
    "exactly"           { return symbol("EXACTLY", sym.EXACTLY); }
    "that"              { return symbol("THAT", sym.THAT); }
    "not"               { return symbol("NOT", sym.NOT); }
    "and"               { return symbol("AND", sym.AND); }
    "or"                { return symbol("OR", sym.OR); }
    "only"              { return symbol("ONLY", sym.ONLY); }
    {Maior}             { return symbol("MAIOR", sym.MAIOR); }
    {Menor}             { return symbol("MENOR", sym.MENOR); }
    {Maior_ou_igual}    { return symbol("MAIORIG", sym.MAIORIG); }
    {Menor_ou_igual}    { return symbol("MENORIG", sym.MENORIG); }
    "("                 { return symbol("ABREPAR", sym.ABREPAR); }
    ")"                 { return symbol("FECHAPAR", sym.FECHAPAR); }
    "{"                 { return symbol("ABRECHAVE", sym.ABRECHAVE); }
    "}"                 { return symbol("FECHACHAVE", sym.FECHACHAVE); }
    ","                 { return symbol("VIRGULA", sym.VIRGULA); }
    {EspacoBraco}       { return symbol("NOVALINHA", sym.NOVALINHA); }

    {has}               { return symbol("HAS", sym.HAS, yytext()); }
    {is}                { return symbol("IS", sym.IS, yytext()); }
    {Numero}            { return symbol("NUMERO", sym.NUMERO, Integer.parseInt(yytext())); }
    {ClasseComposta}    { return symbol("CLASSECOMP", sym.CLASSECOMP, yytext()); }
    {ClasseUnderline}   { return symbol("CLASSEUNDER", sym.CLASSEUNDER, yytext()); }
    {Classe}            { return symbol("CLASSE", sym.CLASSE, yytext()); }
    {integer}           { return symbol("INT", sym.INT, yytext()); }
    {float}             { return symbol("FLOAT", sym.FLOAT, yytext()); }

    <<EOF>>             { return symbol(sym.EOF); }

}

/* Erro */
[^] { throw new Error("Caractere inválido <"+yytext()+">"); }
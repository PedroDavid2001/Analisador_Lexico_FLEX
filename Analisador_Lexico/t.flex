import java_cup.runtime.*;

/**
    * This class is a simple example lexer.
    */
%%

%class AnalisadorLexico
%unicode
%cup
%debug
%line

%{
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

PulaLinha       = \r|\n|\r\n
InputCharacter  = [^\r\n]
EspacoBranco    = {PulaLinha} | [ \t\f]

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
    "some"              { return symbol(sym.SOME); }
    "all"               { return symbol(sym.ALL); }
    "value"             { return symbol(sym.VALUE); }
    "min"               { return symbol(sym.MIN); }
    "max"               { return symbol(sym.MAX); }
    "exactly"           { return symbol(sym.EXACTLY); }
    "that"              { return symbol(sym.THAT); }
    "not"               { return symbol(sym.NOT); }
    "and"               { return symbol(sym.AND); }
    "or"                { return symbol(sym.OR); }
    "only"              { return symbol(sym.ONLY); }
    {Maior}             { return symbol(sym.MAIOR); }
    {Menor}             { return symbol(sym.MENOR); }
    {Maior_ou_igual}    { return symbol(sym.MAIORIG); }
    {Menor_ou_igual}    { return symbol(sym.MENORIG); }
    "("                 { return symbol(sym.ABREPAR); }
    ")"                 { return symbol(sym.FECHAPAR); }
    "{"                 { return symbol(sym.ABRECHAVE); }
    "}"                 { return symbol(sym.FECHACHAVE); }
    ","                 { return symbol(sym.VIRGULA); }
    " "                 {/* */}

    {EspacoBranco}      { return symbol(sym.NOVALINHA); }

    {Numero}            { return symbol(sym.NUMERO, Integer.valueOf(yytext())); }

    {has}               { return symbol(sym.HAS, yytext()); }
    {is}                { return symbol(sym.IS, yytext()); }
    {ClasseComposta}    { return symbol(sym.CLASSECOMP, yytext()); }
    {ClasseUnderline}   { return symbol(sym.CLASSEUNDER, yytext()); }
    {Classe}            { return symbol(sym.CLASSE, yytext()); }
    {integer}           { return symbol(sym.INT, yytext()); }
    {float}             { return symbol(sym.FLOAT, yytext()); }

}

/* Erro */
. { throw new Error("Caractere inválido <"+yytext()+">"); }
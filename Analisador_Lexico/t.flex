import java_cup.runtime.*;

%%

%class AnalisadoLexico
%line
%column
%cup
%public

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
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
    {EspacoBraco}       { return symbol(sym.VIRGULA); }

    {has}               { return symbol(sym.HAS, new String(yytext())); }
    {is}                {  return symbol(sym.IS, new String(yytext())); }
    {Numero}            { return symbol(sym.NUMERO, new Integer(yytext())); }
    {ClasseComposta}    { return symbol(sym.CLASSECOMP, new String(yytext())); }
    {ClasseUnderline}   { return symbol(sym.CLASSEUNDER, new String(yytext())); }
    {Classe}            { return symbol(sym.CLASSE, new String(yytext())); }
    {integer}           { return symbol(sym.INT, new String(yytext())); }
    {float}             { return symbol(sym.FLOAT, new String(yytext())); }
    
    <<EOF>>             { return symbol(sym.NOVALINHA); }

}

/* Erro */
[^] { throw new Error("Caractere inválido <"+yytext()+">"); }
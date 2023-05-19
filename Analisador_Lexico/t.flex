import java_cup.runtime.*;
%%
%class AnalisadoLexico
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

Letra           = [a-z]
Letra_maiuscula = [A-Z]
Numero          = [0-9]+
NumeroFloat     = [0-9]+ \. [0-9]+
Maior           = >
Menor           = <
Maior_ou_igual  = (>=)
Menor_ou_igual  = (<=)
Valor_Variavel  = \[ ({Maior}|{Menor}|({Maior_ou_igual}|{Menor_ou_igual}) \" ({Numero} | {NumeroFloat}) \") \] 
NovaLinha       = ((\r) | (\n) | ((\r)(\n)))
Classe          = {Letra_maiuscula}{Letra}+{Numero}*
ClasseComposta  = {Classe}{Classe}+
ClasseUnderline = {Classe}(_({Classe}|{Numero}))+
has             = (has)({Classe}|{ClasseComposta}|{ClasseUnderline})
is              = (is)({Classe}|{ClasseComposta}|{ClasseUnderline})(Of)
integer         = (integer){Valor_Variavel}
float           = (float){Valor_Variavel}

%%

LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]

"some" { return new Symbol(sym.SOME); }
"all" { return new Symbol(sym.ALL); }
"value" { return new Symbol(sym.VALUE); }
"min" { return new Symbol(sym.MIN); }
"max" { return new Symbol(sym.MAX); }
"exactly" { return new Symbol(sym.EXACTLY); }
"that" { return new Symbol(sym.THAT); }
"not" { return new Symbol(sym.NOT); }
"and" { return new Symbol(sym.AND); }
"or" { return new Symbol(sym.OR); }
"only" { return new Symbol(sym.ONLY); }
{Maior} { return new Symbol(sym.MAIOR); }
{Menor} { return new Symbol(sym.MENOR); }
{Maior_ou_igual} { return new Symbol(sym.MAIORIG); }
{Menor_ou_igual} { return new Symbol(sym.MENORIG); }
"(" { return new Symbol(sym.ABREPAR); }
")" { return new Symbol(sym.FECHAPAR); }
"{" { return new Symbol(sym.ABRECHAVE); }
"}" { return new Symbol(sym.FECHACHAVE); }
"," { return new Symbol(sym.VIRGULA); }
{has} { return new Symbol(sym.HAS, yyline, yycolumn, yytext()); }
{is} { return new Symbol(sym.IS, yyline, yycolumn, yytext()); }
{Numero} { 
    int aux = Integer.parseInt(yytext());
    return new Symbol(sym.NUMERO, yyline, yycolumn, aux);
}
{ClasseComposta} { return new Symbol(sym.CLASSECOMP, yyline, yycolumn, yytext()); }
{ClasseUnderline} { return new Symbol(sym.CLASSEUNDER, yyline, yycolumn, yytext()); }
{Classe} { return new Symbol(sym.CLASSE, yyline, yycolumn, yytext()); }
{integer} { return new Symbol(sym.INT, yyline, yycolumn, yytext()); }
{float} { return new Symbol(sym.FLOAT, yyline, yycolumn, yytext()); }
{NovaLinha} { return new Symbol(sym.NOVALINHA); }
[\t\r\f] {}
[\n] {}
” ” {}

[^] { throw new Error("Illegal character <"+yytext()+">"); }
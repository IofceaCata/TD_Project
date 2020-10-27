    
import java_cup.runtime.Symbol;
    
%%

%class Lexer
%implements symbols 
%unicode
%cup
%line
%column

%{
	
	public static final int endTag = 1;
    public static final int bodyOpen = 2;
    public static final int bodyClose = 3;
    public static final int frame = 4;
    public static final int framesetOpen = 5;
    public static final int framesetClose = 6;
    public static final int noframesOpen = 7;
    public static final int noframesClose = 8;
    public static final int formOpen = 9;
    public static final int formClose = 10;
    public static final int input = 11;
    public static final int selectOpen = 12;
    public static final int selectClose = 13;
    public static final int optionOpen = 14;
    public static final int optionClose = 15;
    public static final int tableOpen = 16;
    public static final int tableClose = 17;
    public static final int trOpen = 18;
    public static final int trClose = 19;
    public static final int tdOpen = 20;
    public static final int tdClose = 21;
    public static final int thOpen = 22;
    public static final int thClose = 23;
    public static final int thread = 24;
    public static final int tbody = 25;
    public static final int img = 26;
    public static final int aOpen = 27;
    public static final int aClose = 28;
    public static final int ulOpen = 29;
    public static final int ulClose = 30;
    public static final int liOpen = 31;
    public static final int liClose = 32;
    public static final int olOpen = 33;
    public static final int olClose = 34;
    public static final int pOpen = 35;
    public static final int pClose = 36;
    public static final int iOpen = 37;
    public static final int iClose = 38;
    public static final int uOpen = 39;
    public static final int uClose = 40;
    public static final int smallOpen = 41;
    public static final int smallClose = 42;
    public static final int supOpen = 43;
    public static final int supClose = 44;
    public static final int subOpen = 45;
    public static final int subClose = 46;
    public static final int center = 47;
    public static final int fontOpen = 48;
    public static final int fontClose = 49;
    public static final int h1Open = 50;
    public static final int h1Close = 51;
    public static final int h2Open = 52;
    public static final int h2Close = 53;
    public static final int h3Open = 54;
    public static final int h3Close = 55;
    public static final int h4Open = 56;
    public static final int h4Close = 57;
    public static final int h5Open = 58;
    public static final int h5Close = 59;
    public static final int h6Open = 60;
    public static final int h6Close = 61;
    public static final int hr = 62;
    public static final int br = 63;
	
    public Lexer(ComplexSymbolFactory sf, java.io.InputStream is){
		this(is);
        symbolFactory = sf;
    }
	public Lexer(ComplexSymbolFactory sf, java.io.Reader reader){
		this(reader);
        symbolFactory = sf;
    }
    
    private StringBuffer sb;
    private ComplexSymbolFactory symbolFactory;
    private int csline,cscolumn;

    public Symbol symbol(String name, int code){
		return symbolFactory.newSymbol(name, code,
						new Location(yyline+1,yycolumn+1, yychar), // -yylength()
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
Comment = "<!--" [^*] ~"-->" 
   
%%

    <YYINITIAL> {

      /* Tags */
      ">"                         { return symbolFactory.newSymbol("endTag", endTag); }
      "<body"                     { return symbolFactory.newSymbol("bodyOpen", bodyOpen); }
      "</body"			              { return symbolFactory.newSymbol("bodyClose",bodyClose); }
      "<frame"			              { return symbolFactory.newSymbol("frame",frame); }
      "<frameset"		              { return symbolFactory.newSymbol("framesetOpen",framesetOpen); }
      "</frameset"		            { return symbolFactory.newSymbol("framesetClose", framesetClose); }
      "<noframes"		              { return symbolFactory.newSymbol("noframesOpen",noframesOpen); }
      "</noframes"		            { return symbolFactory.newSymbol("noframesClose",noframesClose); }
      "<form"			                { return symbolFactory.newSymbol("formOpen", formOpen); }
      "</form"			              { return symbolFactory.newSymbol("formClose", formClose); }
      "<input"			              { return symbolFactory.newSymbol("input", input); }
      "<select"			              { return symbolFactory.newSymbol("selectOpen", selectOpen); }
      "</select"		              { return symbolFactory.newSymbol("selectClose", selectClose); }
      "<option"			              { return symbolFactory.newSymbol("optionOpen",optionOpen); }
      "</option"		              { return symbolFactory.newSymbol("optionClose", optionClose); }
      "<table"		  	            { return symbolFactory.newSymbol("tableOpen", tableOpen); }
      "</table"			              { return symbolFactory.newSymbol("tableClose", tableClose); }
      "<tr"			                  { return symbolFactory.newSymbol("trOpen", trOpen); }
      "</tr"			                { return symbolFactory.newSymbol("trClose",trClose); }
      "<td"			                  { return symbolFactory.newSymbol("tdOpen", tdOpen); }
      "</td"			                { return symbolFactory.newSymbol("tdClose", tdClose); }
      "<th"			                  { return symbolFactory.newSymbol("thOpen", thOpen); }
      "</th"			                { return symbolFactory.newSymbol("thClose", thClose); }
      "<thead"			              { return symbolFactory.newSymbol("thread", thread); }
      "<tbody"			              { return symbolFactory.newSymbol("tbody",tbody); }
      "<img"			                { return symbolFactory.newSymbol("img", img); }
      "<a"			                  { return symbolFactory.newSymbol("aOpen", aOpen); }
      "</a"			                  { return symbolFactory.newSymbol("aClose", aClose); }
      "<ul"			                  { return symbolFactory.newSymbol("ulOpen", ulOpen); }
      "</ul"			                { return symbolFactory.newSymbol("ulClose", ulClose); }
      "<li"			                  { return symbolFactory.newSymbol("liOpen",liOpen); }
      "</li"			                { return symbolFactory.newSymbol("liClose", liClose); }
      "<ol"			                  { return symbolFactory.newSymbol("olOpen",olOpen); }
      "</ol"			                { return symbolFactory.newSymbol("olClose",olClose); }
      "<p"			                  { return symbolFactory.newSymbol("pOpen", pOpen); }
      "</p>"			                { return symbolFactory.newSymbol("pClose",pClose); }
      "<i"			                  { return symbolFactory.newSymbol("iOpen", iOpen); }
      "</i"			                  { return symbolFactory.newSymbol("iClose", iClose); }
      "<u"			                  { return symbolFactory.newSymbol("uOpen", uOpen); }
      "</u"			                  { return symbolFactory.newSymbol("uClose",uClose); }
      "<small"			              { return symbolFactory.newSymbol("smallOpen", smallOpen); }
      "</small"			              { return symbolFactory.newSymbol("smallClose",smallClose); }
      "<sup"			                { return symbolFactory.newSymbol("supOpen", supOpen); }
      "</sup"			                { return symbolFactory.newSymbol("supClose", supClose); }
      "<sub"			                { return symbolFactory.newSymbol("subOpen", subOpen); }
      "</sub"			                { return symbolFactory.newSymbol("subClose",subClose); }
      "center"			              { return symbolFactory.newSymbol("center",center); }
      "<font"			                { return symbolFactory.newSymbol("fontOpen", fontOpen); }
      "</font"			              { return symbolFactory.newSymbol("fontClose", fontClose); }
      "<h1"			                  { return symbolFactory.newSymbol("h1Open", h1Open); }
      "</h1"			                { return symbolFactory.newSymbol("h1Close", h1Close); }
      "<h2"			                  { return symbolFactory.newSymbol("h2Open", h2Open); }
      "</h2"			                { return symbolFactory.newSymbol("h2Close", h2Close); }
      "<h3"			                  { return symbolFactory.newSymbol("h3Open", h3Open); }
      "</h3"			                { return symbolFactory.newSymbol("h3Close", h3Close); }
      "<h4"			                  { return symbolFactory.newSymbol("h4Open",h4Open); }
      "</h4"			                { return symbolFactory.newSymbol("h4Close", h4Close); }
      "<h5"			                  { return symbolFactory.newSymbol("h5Open",h5Open); }
      "</h5"			                { return symbolFactory.newSymbol("h5Close",h5Close); }
      "<h6"			                  { return symbolFactory.newSymbol("h6Open", h6Open); }
      "</h6"			                { return symbolFactory.newSymbol("h6Close", h6Close); }
      "<hr"			                  { return symbolFactory.newSymbol("hr", hr); }
      "<br"			                  { return symbolFactory.newSymbol("br", br); }

      /* Global Attributes */
      
      "class"			                { return symbolFactory.newSymbol("accesskey", accesskey); }
      "dir"			                  { return symbolFactory.newSymbol("accesskey", accesskey); }
      "id"			                  { return symbolFactory.newSymbol("accesskey", accesskey); }
      "lang"			                { return symbolFactory.newSymbol("accesskey", accesskey); }
      "onclick"			              { return symbolFactory.newSymbol("accesskey", accesskey); }
      "ondblclick"                { return symbolFactory.newSymbol("accesskey", accesskey); }
      "onkeydown"                 { return symbolFactory.newSymbol("accesskey", accesskey); }
      "onkeypress"                { return symbolFactory.newSymbol("accesskey", accesskey); }
      "onkeyup"                   { return symbolFactory.newSymbol("accesskey", accesskey); }
      "onmousedown"               { return symbolFactory.newSymbol("accesskey", accesskey); }
      "onmousemove"               { return symbolFactory.newSymbol("accesskey", accesskey); }
      "onmouseout"                { return symbolFactory.newSymbol("accesskey", accesskey); }
      "onmouseover"               { return symbolFactory.newSymbol("accesskey", accesskey); }
      "onmouseup"                 { return symbolFactory.newSymbol("accesskey", accesskey); }
      "contenteditable"			      { return symbolFactory.newSymbol("accesskey", accesskey); }
      "contextmenu"			          { return symbolFactory.newSymbol("accesskey", accesskey); }
      "data"			                { return symbolFactory.newSymbol("accesskey", accesskey); }
      "draggable"			            { return symbolFactory.newSymbol("accesskey", accesskey); }
      "dropzone"	                { return symbolFactory.newSymbol("accesskey", accesskey); }
      "hidden"	                  { return symbolFactory.newSymbol("accesskey", accesskey); }
      "spellcheck"			          { return symbolFactory.newSymbol("accesskey", accesskey); }
      "style"			                { return symbolFactory.newSymbol("accesskey", accesskey); }
      "tabindex"			            { return symbolFactory.newSymbol("accesskey", accesskey); }
      "title"			                { return symbolFactory.newSymbol("accesskey", accesskey); }

      /* Attributes */

      "accesskey", accesskey                 { return symbolFactory.newSymbol("accesskey", accesskey); }
      "charset"                   { return symbolFactory.newSymbol("accesskey", accesskey); }
      "charset"                   { return symbolFactory.newSymbol("accesskey", accesskey); }
      "href"                      { return symbolFactory.newSymbol("accesskey", accesskey); }
      "hreflang"                  { return symbolFactory.newSymbol("accesskey", accesskey); }
      "name"                      { return symbolFactory.newSymbol("accesskey", accesskey); }
      "rel"                       { return symbolFactory.newSymbol("accesskey", accesskey); }
      "rev"                       { return symbolFactory.newSymbol("accesskey", accesskey); }
      "shape"                     { return symbolFactory.newSymbol("accesskey", accesskey); }
      "tabindex"                  { return symbolFactory.newSymbol("accesskey", accesskey); }
      "target"                    { return symbolFactory.newSymbol("accesskey", accesskey); }
      "type"                      { return symbolFactory.newSymbol("accesskey", accesskey); }
      "align"                     { return symbolFactory.newSymbol("accesskey", accesskey); }
      "alt"                       { return symbolFactory.newSymbol("accesskey", accesskey); }
      "archive"                   { return symbolFactory.newSymbol("accesskey", accesskey); }
      "code"                      { return symbolFactory.newSymbol("accesskey", accesskey); }
      "codebase"                  { return symbolFactory.newSymbol("accesskey", accesskey); }
      "height"                    { return symbolFactory.newSymbol("accesskey", accesskey); }
      "hspace"                    { return symbolFactory.newSymbol("accesskey", accesskey); }
      "mayscript"                 { return symbolFactory.newSymbol("accesskey", accesskey); }
      "name"                      { return symbolFactory.newSymbol("accesskey", accesskey); }
      "vspace"                    { return symbolFactory.newSymbol("accesskey", accesskey); }
      "width"                     { return symbolFactory.newSymbol("accesskey", accesskey); }
      "loop"                      { return symbolFactory.newSymbol("accesskey", accesskey); }
      "background"                { return symbolFactory.newSymbol("accesskey", accesskey); }
      "bgcolor"                   { return symbolFactory.newSymbol("accesskey", accesskey); }
      "bgproperties"              { return symbolFactory.newSymbol("accesskey", accesskey); }
      "leftmargin"                { return symbolFactory.newSymbol("accesskey", accesskey); }
      "clear"                     { return symbolFactory.newSymbol("accesskey", accesskey); }
    }
    
    

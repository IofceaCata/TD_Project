    
import java_cup.runtime.Symbol;
    
%%

%class Lexer
%implements sym
%unicode
%cup
%line
%column

%{
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

Comment = "<!--" [^*] ~"-->" 
   
%%

    <YYINITIAL> {

      /* HTML Tags */
      ">"                         { return symbol(sym.endTag); }
      "<body"                     { return symbol(sym.bodyOpen); }
      "</body"			              { return symbol(sym.bodyClose); }
      "<frame"			              { return symbol(sym.frameOpen); }
      "<frameset"		              { return symbol(sym.framesetOpen); }
      "</frameset"		            { return symbol(sym.framesetClose); }
      "<noframes"		              { return symbol(sym.noframesOpen); }
      "</noframes"		            { return symbol(sym.noframesClose); }
      "<form"			                { return symbol(sym.formOpen); }
      "</form"			              { return symbol(sym.formClose); }
      "<input"			              { return symbol(sym.input); }
      "<select"			              { return symbol(sym.selectOpen); }
      "</select"		              { return symbol(sym.selectClose); }
      "<option"			              { return symbol(sym.optionOpen); }
      "</option"		              { return symbol(sym.optionClose); }
      "<table"		  	            { return symbol(sym.tableOpen); }
      "</table"			              { return symbol(sym.tableClose); }
      "<tr"			                  { return symbol(sym.trOpen); }
      "</tr"			                { return symbol(sym.trClose); }
      "<td"			                  { return symbol(sym.tdOpen); }
      "</td"			                { return symbol(sym.tdClose); }
      "<th"			                  { return symbol(sym.thOpen); }
      "</th"			                { return symbol(sym.thClose); }
      "<thead"			              { return symbol(sym.thread); }
      "<tbody"			              { return symbol(sym.tbody); }
      "<img"			                { return symbol(sym.img); }
      "<a"			                  { return symbol(sym.aOpen); }
      "</a"			                  { return symbol(sym.aClose); }
      "<ul"			                  { return symbol(sym.ulOpen); }
      "</ul"			                { return symbol(sym.ulClose); }
      "<li"			                  { return symbol(sym.liOpen); }
      "</li"			                { return symbol(sym.liClose); }
      "<ol"			                  { return symbol(sym.olOpen); }
      "</ol"			                { return symbol(sym.olClose); }
      "<p"			                  { return symbol(sym.pOpen); }
      "</p>"			                { return symbol(sym.pClose); }
      "<i"			                  { return symbol(sym.iOpen); }
      "</i"			                  { return symbol(sym.iClose); }
      "<u"			                  { return symbol(sym.uOpen); }
      "</u"			                  { return symbol(sym.uClose); }
      "<b"			                  { return symbol(sym.bOpen); }
      "</b"			                  { return symbol(sym.bClose); }
      "<small"			              { return symbol(sym.smallOpen); }
      "</small"			              { return symbol(sym.smallClose); }
      "<sup"			                { return symbol(sym.supOpen); }
      "</sup"			                { return symbol(sym.supClose); }
      "<sub"			                { return symbol(sym.subOpen); }
      "</sub"			                { return symbol(sym.subClose); }
      "<center"			              { return symbol(sym.centerOpen); }
      "</center"			              { return symbol(sym.centerClose); }
      "<font"			                { return symbol(sym.fontOpen); }
      "</font"			              { return symbol(sym.fontClose); }
      "<h1"			                  { return symbol(sym.h1Open); }
      "</h1"			                { return symbol(sym.h1Close); }
      "<h2"			                  { return symbol(sym.h2Open); }
      "</h2"			                { return symbol(sym.h2Close); }
      "<h3"			                  { return symbol(sym.h3Open); }
      "</h3"			                { return symbol(sym.h3Close); }
      "<h4"			                  { return symbol(sym.h4Open); }
      "</h4"			                { return symbol(sym.h4Close); }
      "<h5"			                  { return symbol(sym.h5Open); }
      "</h5"			                { return symbol(sym.h5Close); }
      "<h6"			                  { return symbol(sym.h6Open); }
      "</h6"			                { return symbol(sym.h6Close); }
      "<hr"			                  { return symbol(sym.hr); }
      "<br"			                  { return symbol(sym.br); }

      /* HTML Core Attributes */
      
      "class="			                { return symbol(sym.cls); }
      "dir="			                  { return symbol(sym.dir); }
      "id="			                  { return symbol(sym.id); }
      "lang="			                { return symbol(sym.lang); }
      "onclick="			              { return symbol(sym.onclick); }
      "ondblclick="                { return symbol(sym.ondblclick); }
      "onkeydown="                 { return symbol(sym.onkeydown); }
      "onkeypress="                { return symbol(sym.onkeypress); }
      "onkeyup="                   { return symbol(sym.onkeyup); }
      "onmousedown="               { return symbol(sym.onmousedown); }
      "onmousemove="               { return symbol(sym.onmousemove); }
      "onmouseout="                { return symbol(sym.onmouseout); }
      "onmouseover="               { return symbol(sym.onmouseover); }
      "onmouseup="                 { return symbol(sym.onmouseup); }
      "style="			                { return symbol(sym.style); }
      "title="			                { return symbol(sym.title); }

     
      /* HTML Tag Attributes */


      "alink="                 { return symbol(sym.alink); }
      "background="                 { return symbol(sym.background); }
      "bgcolor="                 { return symbol(sym.bgcolor); }
      "bgproperties="                 { return symbol(sym.bgproperties); }
      "leftmargin="                 { return symbol(sym.leftmargin); }
      "link="                 { return symbol(sym.link); }
      "onblur="                 { return symbol(sym.onblur); }
      "onfocus="                 { return symbol(sym.onfocus); }
      "onload="                 { return symbol(sym.onload); }
      "onunload="                 { return symbol(sym.onunload); }
      "text="                 { return symbol(sym.text); }
      "topmargin="                 { return symbol(sym.topmargin); }
      "vlink="                 { return symbol(sym.vlink); }

      "bordercolor="                 { return symbol(sym.bordercolor); }
      "longdesc="                 { return symbol(sym.longdesc); }
      "marginheight="                 { return symbol(sym.marginheight); }
      "marginwidth="                 { return symbol(sym.marginwidth); }
      "name="                 { return symbol(sym.name); }
      "noresize"                 { return symbol(sym.noresize); }
      "scrolling="                 { return symbol(sym.scrolling); }
      "src="                 { return symbol(sym.src); }

      "border="                 { return symbol(sym.border); }
      "framespacing="                 { return symbol(sym.framespacing); }
      "rows="                 { return symbol(sym.rows); }

      "accept-charlist="          { return symbol(sym.acceptcharlist); }
      "action="                 { return symbol(sym.action); }
      "enctype="                 { return symbol(sym.enctype); }
      "method="                 { return symbol(sym.method); }
      "onreset="                 { return symbol(sym.onreset); }
      "onsubmit="                 { return symbol(sym.onsubmit); }
      "target="                 { return symbol(sym.target); }

      "disabled"                 { return symbol(sym.disabled); }
      "multiple"                 { return symbol(sym.multiple); }
      "onchange="                 { return symbol(sym.onchange); }
      "size="                 { return symbol(sym.size); }
      "tabindex="                 { return symbol(sym.tabindex); }

      "label="                 { return symbol(sym.label); }
      "selected"                 { return symbol(sym.selected); }
      "value="                 { return symbol(sym.value); }

      "align="                 { return symbol(sym.align); }
      "bordercolordark="                 { return symbol(sym.bordercolordark); }
      "bordercolorlight="                 { return symbol(sym.bordercolorlight); }
      "cellpadding="                 { return symbol(sym.cellpadding); }
      "cellspacing="                 { return symbol(sym.cellspacing); }
      "cols="                 { return symbol(sym.cols); }
      "frame="                 { return symbol(sym.frame); }
      "height="                 { return symbol(sym.height); }
      "hspace="                 { return symbol(sym.hspace); }
      "nowrap"                 { return symbol(sym.nowrap); }
      "rules="                 { return symbol(sym.rules); }
      "summary="                 { return symbol(sym.summary); }
      "valign="                 { return symbol(sym.valign); }
      "vspace="                 { return symbol(sym.vspace); }
      "width="                 { return symbol(sym.width); }

      "char="                 { return symbol(sym.chr); }
      "abbr="                 { return symbol(sym.abbr); }
      "axis="                 { return symbol(sym.axis); }
      "charoff="                 { return symbol(sym.charoff); }
      "colspan="                 { return symbol(sym.colspan); }
      "headers="                 { return symbol(sym.headers); }
      "rowspan="                 { return symbol(sym.rowspan); }
      "scope="                 { return symbol(sym.scope); }

      "alt="                 { return symbol(sym.alt); }
      "controls"                 { return symbol(sym.controls); }
      "dynsrc="                 { return symbol(sym.dynsrc); }
      "ismap"                 { return symbol(sym.ismap); }
      "loop="                 { return symbol(sym.loop); }
      "lowsrc="                 { return symbol(sym.lowsrc); }
      "onabort="                 { return symbol(sym.onabort); }
      "onerror="                 { return symbol(sym.onerror); }
      "start="                 { return symbol(sym.start); }
      "usemap="                 { return symbol(sym.usemap); }

      "accesskey="                 { return symbol(sym.accesskey); }
      "charset="                   { return symbol(sym.charset); }
      "coords="                 { return symbol(sym.coords); }
      "href="                      { return symbol(sym.href); }
      "hreflang="                  { return symbol(sym.hreflang); }
      "rel="                       { return symbol(sym.rel); }
      "rev="                       { return symbol(sym.rev); }
      "shape="                     { return symbol(sym.shape); }
      "tabindex="                  { return symbol(sym.tabindex); }
      "target="                    { return symbol(sym.target); }
      "type="                 { return symbol(sym.type); }

      "compact"                 { return symbol(sym.compact); }
      "face="                 { return symbol(sym.face); }
      "color="                 { return symbol(sym.color); }
      "noshade"                 { return symbol(sym.noshade); }
      "clear="                 { return symbol(sym.clear); }
	" "                     { return symbol(sym.space); }

    }
    
    

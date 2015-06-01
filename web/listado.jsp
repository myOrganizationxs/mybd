<%-- 
    Document   : listado
    Created on : 18/02/2015, 07:18:50 PM
    Author     : sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<body>
<input type="submit" value="Enviar Formulario Lindo!" onclick="abrir();" />
 
<script type="text/javascript">
function abrir()
{
 var w=window.open("","","height=200,width=400,menubar=no,scrollbars=no,directories=0, menubar=0, scrollbars=no, resizable=yes, location=0,toolbar=no");
 w.document.open();
 w.document.write("<h1>Sus datos han sido enviados de maravialla!</h1>");
 w.document.close();
}
</script>
</body>
scrollbars=no, scrollbars=no, resizable=yes, 
     toolbars=0, location=0, directories=0, 
     menubar=0, width=400, height=350
</html>
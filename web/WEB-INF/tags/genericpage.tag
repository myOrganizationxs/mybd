<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<link rel="stylesheet" href="css/bootstrap.min.css">
<html>
  <body>
    <div id="pageheader">
      <jsp:invoke fragment="header"/>
      <h1>Éste mensaje sale en todas las páginas</h1>
    </div>
    <div id="body">
      <jsp:doBody/>
    </div>
    <div id="pagefooter">
      <jsp:invoke fragment="footer"/>
    </div>
  </body>
</html>
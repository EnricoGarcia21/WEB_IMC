<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Página de Erros</title>
</head>
<body style="background: red; color: white">
   <p>Erro inesperado. Contacte o desenvolvedor</p>
   <p>Erro:
       <%
           out.print(exception.getMessage());
       %>
   </p>
</body>
</html>

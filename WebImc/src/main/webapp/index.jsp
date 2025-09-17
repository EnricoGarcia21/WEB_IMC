<%@ page import="java.io.RandomAccessFile" %>
<%@ page import="com.example.webimc.IMC" %>
<%@ page import="com.example.webimc.Pessoa" %>
<%@ page import="com.example.webimc.Usuario" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="erro.jsp" %>
<!DOCTYPE html>
<html>
<%
    Usuario usuario;
    usuario=(Usuario)session.getAttribute("usuario");
    if(usuario==null){
        response.sendRedirect(".");
        return;
    }
%>
<head>
    <link rel="stylesheet" href="estilo.css"/>
    <title>com.example.webimc.IMC Web Calculator</title>
</head>
<body>
<%
    int peso=0;
    int altura=0;
    try{
        peso=Integer.parseInt(request.getParameter("peso"));
        altura=Integer.parseInt(request.getParameter("altura"));

    }catch (Exception e){
//        out.print("<p>Dados não informados. Utilizamos valores default para o cálculo</p>");
        peso=70;
        altura=170;
//        response.sendRedirect(".");
    }
    session.setAttribute("pessoa",new Pessoa(peso,altura));
%>
<%!
   double imc=0;
   double calcImc(double altura, double peso){
       return peso/Math.pow(altura/100.,2);
   }
%>
<h3>IMC Calculator</h3>
<h5>Usuario:<%=usuario.getLogin()%></h5>
<div>
    <form action="">
        <label for="fpeso">Seu Peso</label>
        <input type="number" id="fpeso" name="peso" value="<%=peso%>">

        <label for="laltura">Sua altura em centimetros</label>
        <input type="number" id="laltura" name="altura" value="<%=altura%>">
        <input type="submit" value="Calcular o IMC">
    </form>
</div>

<!-- comentario do HTML -->
<%-- comentário do JSP --%>
<hr>
<div style="background: orange; font-size: 30px">
    <%
       imc=calcImc(altura,peso);
       //provocando um erro de execução
       //RandomAccessFile raf=new RandomAccessFile("teste","r");
       //out.print("<p style=\"font-size:48px\">Seu com.example.webimc.IMC: "+imc+"</p>");
    %>
    <p>
        Seu Imc:<br> <%=String.format("%.2f",imc)%>
        <br>
        <%= IMC.getCondicaoFisica(imc) %>
    </p>
</div>
<a href="tabela.jsp">Veja a análise de seu peso</a>
</body>
</html>
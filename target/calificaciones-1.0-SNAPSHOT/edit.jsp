<%@page import="com.emergentes.Calificacion"%>
<%
    Calificacion cal= (Calificacion)request.getAttribute("calificacion");
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">

    </head>
    <body>
        <center>
        <h1>Nuevo registro</h1> 
        <form action="MainServlet", method="post">
            <input type="hidden" name="id" value"<%= cal.getId()%>">
            <table border="0">
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" value="<%= cal.getNombre()%>"></td>
                </tr>
                <tr>
                    <td>Primer parcial</td>
                    <td><input type="text" name="p1" value="<%= cal.getP1()%>"></td>
                </tr>
                <tr>
                    <td>Segundo parcial</td>
                    <td><input type="text" name="p2" value="<%= cal.getP2()%>"></td>
                </tr>
                <tr>
                    <td>Examen final</td>
                    <td><input type="text" name="ef" value="<%= cal.getEf()%>"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit"></td>
                </tr>
            </table>
        </form>
                </center>
    </body>
</html>

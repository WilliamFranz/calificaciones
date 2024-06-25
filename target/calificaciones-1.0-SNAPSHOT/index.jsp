
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Calificacion"%>
<%
    if(session.getAttribute("lista")==null);{
ArrayList<Calificacion> listaAux = new ArrayList<Calificacion>();
session.setAttribute("lista",listaAux);
}
    List<Calificacion> lista = (ArrayList<Calificacion>)session.getAttribute("lista");
    
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
        <h1>registro de calificaciones</h1>
        <p><<a href="MainServlet?action=nuevo">nuevo</a></p>
        <<table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Parcial 1</th>
                <th>Parcial 2</th>
                <th>Ex. final</th>
                <th>Nota</th>
                <th></th>
                <th></th>
            </tr>
            <% 
            for(Calificacion cal : lista){
            %>
            <tr>
                <td><%= cal.getId() %></td>
                <td><%= cal.getNombre() %></td>
                <td><%= cal.getP1() %></td>
                <td><%= cal.getP2() %></td>
                <td><%= cal.getEf() %></td>
                <td><%= cal.getNota() %></td>
                <td><a href="MainServlet?action=editar&id=<%= cal.getId() %>">editar</a></td>
                <td><a href="MainServlet?action=eliminar&id=<%= cal.getId() %>">eliminar</a></td>
            </tr>
           <%
               }
%>

        </table>
</center>
    </body>
</html>

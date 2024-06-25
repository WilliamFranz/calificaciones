
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
String action = request.getParameter("action")!= null? request.getParameter("action"):"view";
switch (action){
    case "view":
        response.sendRedirect("index.jsp");
        break;
    case "nuevo":
        Calificacion c= new Calificacion();
        request.setAttribute("calificacion", c);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
        break;
    case "editar":
        break;
    case "eliminar":
        break;
}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre= request.getParameter("nombre");
        int p1= Integer.parseInt(request.getParameter("p1"));
        int p2= Integer.parseInt(request.getParameter("p2"));
        int ef= Integer.parseInt(request.getParameter("ef"));
        
        
        HttpSession ses=request.getSession();
        List<Calificacion> lista= (ArrayList<Calificacion>) ses.getAttribute("lista");
        
        Calificacion c= new Calificacion();
        int idNuevo = obtenerNuevoId(lista);
        c.setId(idNuevo);
        c.setNombre(nombre);
        c.setP1(p1);
        c.setP2(p2);
        c.setEf(ef);
        c.setNota(p1+p2+ef); 
      lista.add(c);
      
      response.sendRedirect("index.jsp");
    }
private int obtenerNuevoId(List<Calificacion>lista){
    int nuevoId = 1;
    for (Calificacion item :lista){
    if(item.getId()>=nuevoId){
    nuevoId = item.getId()+1;
    }
    }
    return nuevoId;
}

}

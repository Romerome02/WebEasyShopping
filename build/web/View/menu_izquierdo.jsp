<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Obtener el módulo desde el request (asignado por el controlador)
    String modulo = (String) request.getAttribute("modulo");

    if (modulo == null) {
        modulo = "home"; // Valor por defecto
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menú de Navegación</title> 
    </head>
    <body>
        <ul class="nav nav-pills nav-stacked side-navigation">
            <li>
                <h3 class="navigation-title">Administración</h3>
            </li>
            <li <% if ("estantes".equals(modulo)) { %> class="active"<% } %>>
                <a href="<%= request.getContextPath() %>/View/home.jsp?modulo=estantes"><i class="fa fa-share-alt"></i> <span>Estantes</span></a>
            </li>
            <li <% if ("categorias".equals(modulo)) { %> class="active"<% } %>>
                <a href="home.jsp?modulo=categorias"><i class="fa fa-list"></i> <span>Categorías</span></a>
            </li>
            <li <% if ("productos".equals(modulo)) { %> class="active"<% } %>>
                <a href="home.jsp?modulo=productos"><i class="fa fa-shopping-cart"></i> <span>Productos</span></a>
            </li>
            <li>
                <h3 class="navigation-title">Usuarios</h3>
            </li>
            <li <% if ("administradores".equals(modulo)) { %> class="active"<% } %>>
                <a href="home.jsp?modulo=administradores"><i class="fa fa-user"></i> <span>Administradores</span></a>
            </li>
            <li <% if ("clientes".equals(modulo)) { %> class="active"<% }%>>
                <a href="home.jsp?modulo=clientes"><i class="fa fa-users"></i> <span>Clientes</span></a>
            </li>
        </ul>
    </body>
</html>

<%@page import="entidad.Usuario" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style>
</style>
<title>Inicio - Admin</title>
</head>
<body>
<script>
		<%
 			Usuario usuario = new Usuario();
		 	if(session.getAttribute("Usuario")!=null){	
		 		usuario = (Usuario)session.getAttribute("Usuario");
			}
		 	else {
		 	response.sendRedirect("/TPINT_GRUPO_2_LAB4/index.jsp");
		 	}
		
		%>
</script>

<header  style=" padding: 25px;">
  <nav style="" class="navbar navbar-expand-lg navbar-light bg-white fixed-top" >
    <div class="container-fluid">
      <div class="collapse navbar-collapse" id="navbarExample01">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
   			 <li class="nav-item active" style="background-color: highlight;">
        		<a class="nav-link" aria-current="page" href="index.jsp">
            		<i class="fas fa-arrow-left"></i> 
            		<!-- Icono de flecha -->
           				Cerrar Sesion
       				 </a>
    		</li>
			</ul>

        	<div class="alert alert-info ml-auto">
               <i class="fas fa-user"></i>
               <span><%=usuario.getUsuario()%></span>
            </div>
      </div>
    </div>
  </nav>
</header>

<div class="container-fluid menu">
    <div class="row">
        <div class="col-md-2">
            <a href="index.jsp" class="volver">
                <span class="volverIcon fas fa-times-circle"></span>Salir
            </a>
        </div>
        <div class="col-md-8 text-center">
        	<br>
            <h1>Panel Administrador</h1>
            <p>Seleccione la opción deseada:</p>
        </div>
        <div class="col-md-2">
            <!-- Puedes dejar este espacio vacío o personalizar según necesites -->
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-md-12">
            <div class="list-group opcionesMenu">
                <a href="adminClientes.jsp" class="list-group-item list-group-item-action">Administrar Clientes</a>
                <a href="adminCuentas.jsp" class="list-group-item list-group-item-action">Administrar Cuentas</a>
                <a href="/TPINT_GRUPO_2_LAB4/ServletPrestamosxAutorizar?getPrestamos" class="list-group-item list-group-item-action">Administrar Préstamos</a>
                <a href="/TPINT_GRUPO_2_LAB4/ServletMovimientos?getMovimientos" class="list-group-item list-group-item-action">Reportes</a>
            </div>
        </div>
    </div>
</div>


</body>
</html>
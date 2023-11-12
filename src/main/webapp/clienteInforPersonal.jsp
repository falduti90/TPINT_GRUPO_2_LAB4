<%@page import="entidad.Pais" %>
<%@page import="entidad.Localidad" %>
<%@page import="entidad.Usuario" %>
<%@page import="entidad.Cliente" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Modificar Cliente - Admin</title>
</head>
<body>

<% 

	
	Usuario usuario = new Usuario();
 	if(session.getAttribute("Usuario")!=null){	
 		usuario = (Usuario)session.getAttribute("Usuario");
 		
 	}
	Cliente cliente = usuario.getcliente();	

	
	%>
 
  
 <header class="header bg-warning"> 
	<div>
		<a href="inicioClientes.jsp">
			<img style = "float: left; margin: 2px 20px 10px 0; ; " src="img/logo.jpg"  alt="logo" width="50" height="50"  />
		</a>
	</div>
	<div class="logged">
		<span>Usuario/a: <%=usuario.getUsuario()%></span>
	<a class="btn btn-danger" href="index.jsp"> <span class="fas fa-times-circle "></span> Cerrar sesión</a>
	</div>
</header>
<div style="display:flex; justify-content: space-around; align-items: center; flex-direction: column">


	<div class="">
	<h1 class="fs-1 mt-5  text-center bold"><%=	cliente.getApellido()%> <%=cliente.getNombre() %> </h1>
	<p class="fs-4 mt-4 pt-1">Datos personales:</p>
	<div> 
	
			<table class="table table-primary table-striped-columns table-hover text-center fs-5">
				<tr>
					<th>Número de documento</th>
					<td><%=cliente.getDni() %></td>
				</tr>
				<tr>
			  		<th>Apellido</th>					
					<td><%=cliente.getApellido()%></td>
				</tr>
				<tr>
			  		<th>Nombre/s</th>					
					<td><%=cliente.getNombre()%></td>
				</tr>
				<tr>
			  		<th>CUIL</th>					
					<td><%=cliente.getCuil()%></td>
				</tr>
				
				<tr>
					<th>Sexo</th>
					<td><%=cliente.getSexo() %></td>
				</tr>
				<tr>
					<th>Nacionalidad</th>
					<td><%=cliente.getNacionalidad().getPais() %></td>
				</tr>
				<tr>
					<th>Domicilio</th>
					<td><%=cliente.getDireccion() %></td>
				</tr>
				<tr>
					<th>Localidad</th>
					<td><%= cliente.getLocalidad().getLocalidad()%>,
					<%= cliente.getProvincia().getProvincia()%>,
					<%= cliente.getPais().getPais()%>
					</td>
				</tr>
			
				<tr>
					<th>Fecha de nacimiento</th>
					<td><%=cliente.getFecha_nac() %></td>
				</tr>
			
				<tr>
					<th>Correo electrónico</th>
					<td><%= cliente.getCorreo_electronico() %></td>
				</tr>			
			</table>		
	<a href="inicioClientes.jsp" class="btn btn-warning text-center"> <span class="fa fa-arrow-left"></span> Volver</a>
	</div>
</div>
</div>
</body>
</html>

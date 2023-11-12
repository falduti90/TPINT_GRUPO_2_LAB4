<%@page import="entidad.Usuario" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	<style type="text/css">
		<jsp:include page="css/style.css"></jsp:include>
	</style>
	<title>Inicio - Cliente</title>
</head>
<body onLoad="bienvenido/a();">
<script>
		<%	Usuario usuario = new Usuario();
		 	if(session.getAttribute("Usuario")!=null){	
		 		usuario = (Usuario)session.getAttribute("Usuario");
		%>
	
			function bienvenida(){alert("Bienvenido <%=usuario.getcliente().getNombre()%> <%=usuario.getcliente().getApellido()%>");}
		<%
			}
		 	else {
		 %>
		 //alert("INICIE SESION PARA CONTINUAR.");
		 <%
		 	response.sendRedirect("/index.jsp");
		 	}
		%>
	</script>
	
<header class="header"> 
<div>
	<a href="#">
		<img style = "float: left; margin: 2px 20px 10px 0; ; " src="img/logo.jpg"  alt="logo" width="50" height="50"  />
	</a>
</div>
<div class="logged">
	<span>Usuario/a: <%=usuario.getUsuario()%></span>
	<a class="btn btn-primary" href="index.jsp"> <span class="fas fa-times-circle fa fa-bath"></span>Cerrar sesión</a>

</div>
</header>

	<div class="menu">

	<h1>Panel Cliente</h1>
	<span>Seleccione la opción deseada: </span>
			<div class="opcionesMenu">
				<a href="gestionarCuentas.jsp"> Mis Cuentas </a>  
				<a href="clienteInforPersonal.jsp"> Información personal </a>
			</div>
	</div>
</section>
</body>
</html>

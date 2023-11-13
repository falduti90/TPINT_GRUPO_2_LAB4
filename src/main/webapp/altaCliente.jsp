<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Pais" %>
<%@page import="entidad.Localidad" %>
<%@page import="entidad.Usuario" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!-- Bootstrap icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Alta Cliente - Admin</title>
</head>
<body>

<% 
	
	ArrayList<String> sexo = new ArrayList<String>();
	sexo.add("F");
	sexo.add("M");
	sexo.add("X");
	ArrayList<Pais> listaPaises = null;
	String dni = null;
	String mensaje = "";
	Boolean existe = false;
	
	if(request.getAttribute("nacionalidad") != null)
	{
		listaPaises = (ArrayList<Pais>) request.getAttribute("nacionalidad");
	}
	
	ArrayList<Localidad> listaLocalidades = null;
	if(request.getAttribute("localidad") != null)
	{
		listaLocalidades = (ArrayList<Localidad>) request.getAttribute("localidad");
	}
	
	boolean agregado = false;
	if( request.getAttribute("agregado") != null) {
		agregado = (boolean)request.getAttribute("agregado");
		dni = (String) request.getAttribute("dni");
		mensaje = (String) request.getAttribute("mensaje");
	}
	
	if( request.getAttribute("existe") != null) {
		existe = (boolean)request.getAttribute("existe");
		mensaje = (String) request.getAttribute("mensaje");
	}
		
	Usuario usuario = new Usuario();
 	if(session.getAttribute("Usuario")!=null){	
 		usuario = (Usuario)session.getAttribute("Usuario");
 	}
	
%>
 
 <header  style=" padding: 50px;">
  <nav style="" class="navbar navbar-expand-lg navbar-light bg-white fixed-top" >
    <div class="container-fluid">
      <div class="collapse navbar-collapse" id="navbarExample01">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
   			 <li class="nav-item active" style="background-color: highlight;">
        		<a class="nav-link" aria-current="page" href="adminClientes.jsp">
            		<i class="volverIcon fa fa-home"></i> 
            			Volver
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
 

<div class="container">

<div class="row">
<h1>Alta nuevo cliente</h1>
  <%  if( agregado == false && existe == false)	{ %>
<span>Por favor complete todos los datos </span>
</div>

<div class="ABM">

<form class="form " method="get" action="ServletCliente">
    <fieldset>
      <legend>Nuevo cliente</legend>
      <div class="form-floating">
        <input id="dni" type="text" required maxlength=10 name="txtDNI"  class="form-control mb-2" placeholder="Numero de DNI" value= ${txtDni}>
        <label for="floatingInput">DNI</label>
      </div>
      
      <div class="form-floating">
        <input id="nombres" type="text" maxlength=50 required  class="form-control mb-2" placeholder="Nombre" name="txtNombre">
        <label for="floatingInput">Nombre</label>
      </div>
      
      <div class="form-floating">
        <input id="apellidos" type="text" maxlength=50 required class="form-control mb-2" placeholder="Apellido" name="txtApellido">
        <label for="floatingInput">Apellido</label>
      </div>  
          
      <div class="form-floating">
        <input id="cuil" type="text" required class="form-control mb-2" placeholder="CUIL" name="txtCuil" maxlength=13>
        <label for="floatingInput">CUIL</label>
      </div>
      
      <div class="form-floating">
        <select  class="form-select mb-2" id="sexo" name="sexo" required>
         <%
		 	if(sexo!=null)
				for(String s:sexo){
			%>
				<option value="<%= s %>" > <%= s %></option>
			<%	} %>
        </select>
        <label for="floatingInput">Sexo</label>
      </div>

      <div class="form-floating">
        <select class="form-select mb-2" id="nacionalidad" name="nacionalidad" required>
		  <%
		 	if(listaPaises!=null)
				for(Pais p:listaPaises)
				{
			%>
			<option value="<%=p.getCodPais()%>" > <%=p.getPais()%></option>
			<%	}%>
        </select>
        <label for="floatingInput">Nacionalidad</label> 
      </div>
      
      <div class="form-floating">
        <input id="fecha_nac" type="date" required class="form-control mb-2" name="txtFecha_nac">
        <label for="floatingInput">Fecha de nacimiento</label>
      </div>   
        
      <div class="form-floating">
        <input id="direccion" type="text" required class="form-control mb-2" name="txtDireccion" maxlength=200>
        <label for="floatingInput">Direcci�n</label>
      </div>
      
      <div class="form-floating">
        <select id="localidad" name="localidad" required class="form-control mb-2">
		  <%
		 	if(listaLocalidades!=null)
				for(Localidad l:listaLocalidades)
				{
			%>
			<option value="<%=l.getCodLocalidad()%>" > <%=l.getLocalidad()%></option>
			<%	}%>
        </select>
        <label for="floatingInput">Localidad</label> 
      </div>
      
      <div class="form-floating">
        <input id="email" type="email" required class="form-control mb-2" name="txtEmail" maxlength=200>
        <label for="floatingInput">E-mail</label>
      </div>
      
      <div class="form-floating">
        <input id="telefonos" type="text" required class="form-control mb-2" name="txtTelefonos" maxlength=200>
        <label for="floatingInput">Tel�fonos</label>
      </div>
      
      <p class="button">
        <input id="btnRegistrar" type="submit" value="Registrar" name="btnAltaCliente">
      </p>
    </fieldset>

</form>		

</div>
  <%	}%>
<div style="display:flex; flex-direction: column; align-items: center;">
<% if( agregado == true || existe == true ) { %>	
	<div>
		<p style="font-size: 1.5rem;"><%=mensaje %> <p>
	</div>
	<div>
	<% if(request.getAttribute("resultado") != null) {%>
		<%=request.getAttribute("resultado")%>
	<%}%>
	</div>
	<%} %>
	<% if( agregado == true) { %>	
	<form method="get" action="ServletUsuario">
	  <p class="button">
        <input id="btnRegistrar" type="submit" value="Alta Usuario Home Banking" name="btnAltaUsuario">
        <input type="hidden" name="dni" value=<%= dni %> >
      </p>
	</form>
<%} %>
</div>

</div>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="entidad.Cuenta" %>
<%@page import="entidad.Usuario" %>
<%@page import="entidad.TipoCuenta" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!-- Bootstrap icons -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Baja Cuenta - Admin</title>
</head>
<body >

<% 
	ArrayList<Cuenta> listaCuentas= null;
	ArrayList<TipoCuenta> listaTC= null;
	String dni=null;
	String resString=null;
	Boolean resBoolean=false;
	if(request.getAttribute("Cuentas")!=null)
	{
		listaCuentas = (ArrayList<Cuenta>) request.getAttribute("Cuentas");
	}
	if(request.getAttribute("listaTC")!=null)
	{
		listaTC = (ArrayList<TipoCuenta>) request.getAttribute("listaTC");
	}
	if(request.getAttribute("dni")!=null)
	{
		dni =  request.getAttribute("dni").toString();
	}
	if(request.getAttribute("resString")!=null)
	{
		resString =  request.getAttribute("resString").toString();
	}
	if(request.getAttribute("resBoolean")!=null)
	{
		resBoolean =  Boolean.parseBoolean( request.getAttribute("resBoolean").toString());
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
        		<a class="nav-link" aria-current="page" href="inicioAdmin.jsp">
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



<div class="menu">
	<h2>Baja de Cuenta</h2>
	<%
		if(resString!= null && !resString.equals("go"))
		{
		if(!resBoolean){%>
	<br>
	 <h2 style="color:red;"><%=resString%></h2>
	<%}
		else
		{%>
			<br>
	 	<h2 style="color:green;"><%=resString%></h2>
		<%}
		}
	%>
	 
	 <div class="container mt-5">
  <form method="get" action="ServletCuenta" class="w-50">
    <div class="form-group row">
      <div class="col-sm-3 text-right">
        <label for="txtdni" class="col-form-label col-form-label-lg mb-0">Buscar DNI:</label>
      </div>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="txtdni" name="txtdni" required>
      </div>
      <div class="col-sm-3">
        <button type="submit" class="btn btn-primary" name="btnBuscarBaja">Buscar</button>
      </div>
    </div>
  </form>
</div>
	 	<script>
		<%
		 	if(resString!= null && resBoolean!= null){	
		 		if(!resString.equals("go"))
		 		{
		 			%>
					function resultado(){alert("<%=resString%>");}
				<%}}
		 	%>
		
			
			</script>
		<% if(listaCuentas != null && resBoolean != null && resBoolean) { %>
    <div class="container mt-5">
        <div class="table-responsive" style="background-color: #34495E; padding: 15px; border: 2px solid #000; border-radius: 10px;">
           <h4 class="mb-4" style="color: #FFFFFF;">Cuentas Activas para el DNI <%=dni%></h4>
            <table class="table table-bordered" style="color: #FFFFFF;">
                <thead class="thead-dark">
                    <tr>
                        <th>Numero de cuenta</th>
                        <th>CBU</th>
                        <th>Fecha Creación</th>
                        <th>Tipo de cuenta</th>
                        <th>Saldo</th>
                        <th colspan="2"></th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Cuenta c : listaCuentas) { 
                        if(c.isEstado()) { %>
                            <form method="get" action="ServletCuenta">
                                <tr>
                                    <td><%= c.getNroCuenta() %></td>
                                    <td><%= c.getCbu() %></td>
                                    <td><%= c.getFecha_creacion() %></td>
                                    <td><%= c.getTipoCuenta().getTipoCuenta() %></td>
                                    <td>$<%= c.getSaldo() %></td>
                                    <input type="hidden" name="cuenta" value="<%= c.getNroCuenta() %>">
                                    <td>
                                        <input type="submit" class="btn btn-danger" value="Baja" name="btnBaja">
                                    </td>
                                </tr>
                            </form>
                    <% } } %>
                </tbody>
            </table>
        </div>
    </div>
<% } %>
			


	 </div>
</body>
</html>
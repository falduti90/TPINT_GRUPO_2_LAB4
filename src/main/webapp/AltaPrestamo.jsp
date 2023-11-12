<%@page import="java.util.ArrayList"%>
<%@page import="entidad.PrestamoxAutorizar" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Usuario" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
 <style>
</style>

<title>Administrar Prestamos - Admin</title>
</head>
<body>
<% 
	ArrayList<PrestamoxAutorizar> listaPrestamos= null;
	String resString=null;
	Boolean resBoolean=false;
	if(request.getAttribute("Prestamos")!=null)
	{
		listaPrestamos = (ArrayList<PrestamoxAutorizar>) request.getAttribute("Prestamos");
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
 	//Para paginado:
 		int pag = 0;
 		int cantPag = 0;
 	    //Al momento de dar siguiente o presionar otro botón, manda como parametro "pag" con el número de página.
 	    if (request.getAttribute("pag") != null) {
 	        pag = (int) request.getAttribute("pag");
 	        cantPag = (int) request.getAttribute("cantPag");
 	    } 
 		
%>
	

<header  style=" padding: 25px;">
  <nav style="" class="navbar navbar-expand-lg navbar-light bg-white fixed-top" >
    <div class="container-fluid">
      <div class="collapse navbar-collapse" id="navbarExample01">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
   			 <li class="nav-item active" style="background-color: highlight;">
        		<a class="nav-link" aria-current="page" href="inicioAdmin.jsp">
            		<i class="fas fa-arrow-left"></i> 
            		<!-- Icono de flecha -->
           				 Menu Principal
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
<br><br>
<h2 style="color: #007bff; font-family: 'Arial', sans-serif; text-align: center;">Autorización de Préstamos</h2>

<%
		if(!resBoolean && resString!= null){%>
	<br>
	 <h2 style="color:red;"><%=resString%></h2>
	<%}
	else
	{ 
		if(resString!= null)
		{
			if( !resString.equals("go")){
	%>
		
		<br>
	 <h2 style="color:green;"><%=resString%></h2>
		
	<%}}
		}

	%>
<script>
		<%
		 	if(resString!= null && resBoolean){	
		 		if(!resString.equals("go"))
		 		{
		 			%>
					function resultado(){alert("<%=resString%>");}
				<%}}
		 	%>
	</script>
<%if(listaPrestamos!=null && resBoolean){ %>

 <table class="table" >
			<caption>Prestamos disponibles para aprobacion</caption>
			
	<thead class="thead-dark">			
			   
		<tr>
			<th>Codigo de prestamo pendiente</th>
		    <th>Numero de cuenta</th>
		    <th>Importe Solicitado</th>
		    <th>Cuotas</th>
		    <th>Fecha Alta</th>
		    <th>Estado</th>
		    <th colspan="2">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;  Autorizacion</th>
		</tr>
	</thead>			
<%

		for(PrestamoxAutorizar p:listaPrestamos)
		{%>
		
		<tr>
		 <form method="get" action="ServletPrestamosxAutorizar">
			<td><%=p.getCodPrestamoPendiente() %></td>
			<td><%=p.getNroCuenta() %></td>
			<td><%=p.getImporte() %></td>
			<td><%=p.getCantidad_cuotas()%></td>
			<td><%=p.getFecha_creacion() %></td>
			<%
			switch(p.getEstado())
			{
			case 0:%>
				<td>Desaprobado</td>
				<%break;
			case 1:%>
				<td>Pendiente de aprobacion</td>
			<%break;
			case 2:%>
			<td>Aprobado</td>
		<%break;
			 default: %>
				<td>Error</td>
			<%break;
			}%>
			
		
			<td><input type="submit" value="Aprobar" name="btnAutorizar"></td>
			<td><input type="submit" value="Rechazar" name="btnRechazar"></td>
			<input type="hidden" name="codPrestamo" value="<%=p.getCodPrestamoPendiente()%>">

		</form>
	</tr>
		<%}%>
</table>

<%}
		else
		{%>
			<br>
			 <h3 style="color:red;"> <No disponible></h3>
		<%}%>
		
		
		<!---Empieza PAginado---->
<div class="paginado d-flex justify-content-center mt-3" style="background-color: #f0f0f0; padding: 10px; border-radius: 5px;">
		 <%	if (cantPag >= 1) {
            //Si la página diferente a uno, si agrega el botón anterior.
               if(pag!=1){%>
                   <a href="ServletPrestamosxAutorizar?pag=<%=pag - 1%>">&lt;</a>
                      <%  }  //Calcula la cant de páginas a mostrar.
                            for (int i = 0; i < cantPag; i++) {
                         
                                if(i+1==pag){  //Si la página es igual a la página actual, muestra la etiqueta active.
                        %>
                            <span><%=i+1%></span>
                      
                      <%  } else { //Si no, sigue mostrando las etiquetas normales con la opción para desplazarse. %>
                             <a href="ServletPrestamosxAutorizar?pag=<%=i+1%>"><%=i+1%></a>
                        <%} }
                        //Sí pagina es diferente al número máximo de páginas, muestra la opción siguiente.
                        if(pag!=cantPag){%>
                            <a href="ServletPrestamosxAutorizar?pag=<%=pag + 1%>">&gt;</a>
                <%} }  else { //Si el máximo de páginas no es mayor a 1, muestra solo una página %>
                   			<span>1</span>
                <% }  %>						
	</div>
</div>	
		 
		 

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		 
</body>
</html>
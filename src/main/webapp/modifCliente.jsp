<%@page import="entidad.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidad.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!-- Bootstrap icons -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<style type="text/css">
<
jsp
:include
 
page
="css/style
.css
"
>
</
jsp
:include
>
</style>
<title>Modificar Cliente - Admin</title>
</head>
<body>

	<% 
	ArrayList<Cliente> listaClientes = null;
	ArrayList<Cliente> clientesPaginados = null;
	if(request.getAttribute("clientes") != null)
	{
		listaClientes = (ArrayList<Cliente>) request.getAttribute("clientes");
		clientesPaginados = (ArrayList<Cliente>) request.getAttribute("clientesPaginados");
		
	}

	//Para paginado:
	int pag = 0;
	int cantPag = 0;
    //Al momento de dar siguiente o presionar otro botón, manda como parametro "pag" con el número de página.
    if (request.getAttribute("pag") != null) {
        pag = (int) request.getAttribute("pag");
        cantPag = (int) request.getAttribute("cantPag");
    } 
	
	
    Usuario usuario = new Usuario();
 	if(session.getAttribute("Usuario")!=null){	
 		usuario = (Usuario)session.getAttribute("Usuario");
 	}
	
	%>


	<header style="padding: 60px;">

		<nav style=""
			class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
			<div class="container-fluid">
				<div class="collapse navbar-collapse" id="navbarExample01">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item active" style="background-color: highlight;">
							<a class="nav-link" aria-current="page" href="adminClientes.jsp">
								<i class="volverIcon fa fa-home"></i> Volver
						</a>
						</li>
					</ul>

					<div class="alert alert-info ml-auto">
						<i class="fas fa-user"></i> <span><%=usuario.getUsuario()%></span>
					</div>
				</div>
			</div>
		</nav>
	</header>

	<div class="container">
	
	<div class="container d-flex flex-column align-items-center">
    <h1 class="mb-3">Modificar cliente</h1>

    <span style="margin-bottom: 0.5rem;">Por favor seleccione el cliente que desea modificar</span>

	<div class="row">
    <form method="get" action="ServletCliente" class="d-flex justify-content-between">
        <div class="mx-2  mb-2">
            <select name="clienteSeleccionado" class="form-select">
                <% if(listaClientes!=null)
                    for(Cliente clFil : listaClientes) { 
                        if(clFil.isEstado()) {
                %>
                <option value="<%=clFil.getDni()%>">
                    <%= clFil.getApellido() %>,
                    <%= clFil.getNombre() %> - DNI:
                    <%=clFil.getDni()%>
                </option>
                <% } }%>
            </select>
        </div>

        <div class="mr-2 mb-2">
            <input type="submit" value="Filtrar" name="btnFiltrar" class="btn btn-primary">
            <input type="submit" value="Limpiar filtro" name="btnLimpiar" class="btn btn-outline-primary">
        </div>
    </form>
</div>


</div>


		<div class="row">
			<div class="col-12">
				<table class="table table-striped table-hover">
					<thead >
						<tr class="table-dark">
							<th>DNI</th>
							<th>Nombre</th>
							<th>Sexo</th>
							<th>Localidad</th>
							<th>Email</th>
							<th>Acción</th>
						</tr>
					</thead>
					<tbody>
						<%  if(clientesPaginados != null)
		for(Cliente cl : clientesPaginados) 
		{			
			if(cl.isEstado()) {   //Así solo muestra los que tienen el estado en true
	%>
						<tr>
							<form name="listadoClientes" action="ServletCliente" method="get">
								<td><%= cl.getDni() %> <input type="hidden" name="dni"
									value=<%=cl.getDni()%>></td>
								<td><%= cl.getApellido() %>, <%= cl.getNombre() %></td>
								<td><%= cl.getSexo()%></td>
								<td><%= cl.getLocalidad().getLocalidad() %>, <%= cl.getLocalidad().getProvincia().getProvincia() %>,
									<%= cl.getLocalidad().getPais().getPais() %></td>
								<td><%= cl.getCorreo_electronico() %></td>
								<td>
									<div style="display: flex; justify-content: space-evenly;">
										<input type="submit" name="btnModificar" value="Modificar" class="btn btn-warning">
										<input type="submit" name="btnEliminar" value="Eliminar" class="btn btn-danger">
									</div>
								</td>

							</form>
						</tr>
						<% } } %>

					</tbody>
				</table>
			</div>
		</div>

		<div class="row justify-content-center mt-4">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <% if (cantPag >= 1) {
                    // Si la página es diferente a uno, agrega el botón anterior.
                    if (pag != 1) { %>
                        <li class="page-item">
                            <a class="page-link" href="ServletCliente?pag=<%=pag - 1%>" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        </li>
                    <% }
                    // Calcula la cantidad de páginas a mostrar.
                    for (int i = 0; i < cantPag; i++) {
                        if (i + 1 == pag) { // Si la página es igual a la página actual, muestra la etiqueta active.
                    %>
                            <li class="page-item active" aria-current="page">
                                <span class="page-link"><%=i + 1%><span class="visually-hidden">(current)</span></span>
                            </li>
                        <% } else { // Si no, sigue mostrando las etiquetas normales con la opción para desplazarse. %>
                            <li class="page-item">
                                <a class="page-link" href="ServletCliente?pag=<%=i + 1%>"><%=i + 1%></a>
                            </li>
                        <% }
                    }
                    // Si la página es diferente al número máximo de páginas, muestra la opción siguiente.
                    if (pag != cantPag) { %>
                        <li class="page-item">
                            <a class="page-link" href="ServletCliente?pag=<%=pag + 1%>" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        </li>
                    <% } } else { // Si el máximo de páginas no es mayor a 1, muestra solo una página %>
                    <li class="page-item active" aria-current="page">
                        <span class="page-link">1<span class="visually-hidden">(current)</span></span>
                    </li>
                <% } %>
            </ul>
        </nav>
    </div>
	</div>
</body>
</html>
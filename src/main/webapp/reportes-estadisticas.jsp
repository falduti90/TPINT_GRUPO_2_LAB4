<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!-- Bootstrap icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Estadísticas</title>
</head>
<body id="page-top">
 <header  style="padding: 50px;" >
  <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top" >
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
               <span>usuario</span>
            </div>
      </div>
    </div>
  </nav>
</header>
     <div class="container text-center">

         <!-- Page Heading -->
         <div class=" mb-4 text-center">
             <h1 class="h3 mb-0 text-gray-800 ">Estadísticas</h1>
         </div>

         <div class="row">

             <!-- Earnings (Monthly) Card Example -->
             <div class="col-xl-3 col-md-6 mb-4">
                 <div class="card border-left-primary shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                     Earnings (Monthly)</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-calendar fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

             <!-- Earnings (Annual) Card Example -->
             <div class="col-xl-3 col-md-6 mb-4">
                 <div class="card border-left-success shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                     Earnings (Annual)</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

             <!-- Tasks Card Example -->
             <div class="col-xl-3 col-md-6 mb-4">
                 <div class="card border-left-info shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                 </div>
                                 <div class="row no-gutters align-items-center">
                                     <div class="col-auto">
                                         <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                     </div>
                                     <div class="col">
                                         <div class="progress progress-sm mr-2">
                                             <div class="progress-bar bg-info" role="progressbar"
                                                 style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                 aria-valuemax="100"></div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

             <!-- Pending Requests Card Example -->
             <div class="col-xl-3 col-md-6 mb-4">
                 <div class="card border-left-warning shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                     Pending Requests</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-comments fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>

         <div class="row">

             <div class="col-lg-6">

                 <!-- Default Card Example -->
                 <div class="card mb-4">
                     <div class="card-header">
                         Default Card Example
                     </div>
                     <div class="card-body">
                         This card uses Bootstrap's default styling with no utility classes added. Global
                         styles are the only things modifying the look and feel of this default card example.
                     </div>
                 </div>

                 <!-- Basic Card Example -->
                 <div class="card shadow mb-4">
                     <div class="card-header py-3">
                         <h6 class="m-0 font-weight-bold text-primary">Tipos de movimientos registrados</h6>
                     </div>
                     <div class="card-body">
                         <table class="table">
							  <thead>
							  </thead>
							  <tbody>
							    <tr>
							      <td>Alta prestamo</td>
							      <td>Pago prestamo</td>
							      <td>Alta de cuenta</td>
							      <td>Transferencia</td>
							    </tr>
							    <tr>
							      <td>15</td>
							      <td>10</td>
							      <td>8</td>
							      <td>6</td>
							    </tr>
							  </tbody>
							</table>
                     </div>
                 </div>

             </div>

             <div class="col-lg-6">

                 <!-- Dropdown Card Example -->
                 <div class="card shadow mb-4">
                     <!-- Card Header - Dropdown -->
                     <div
                         class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                         <h6 class="m-0 font-weight-bold text-primary">Dropdown Card Example</h6>
                         <div class="dropdown no-arrow">
                             <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                             </a>
                             <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                 aria-labelledby="dropdownMenuLink">
                                 <div class="dropdown-header">Dropdown Header:</div>
                                 <a class="dropdown-item" href="#">Action</a>
                                 <a class="dropdown-item" href="#">Another action</a>
                                 <div class="dropdown-divider"></div>
                                 <a class="dropdown-item" href="#">Something else here</a>
                             </div>
                         </div>
                     </div>
                     <!-- Card Body -->
                     <div class="card-body">
                         <table class="table">
							  <thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">First</th>
							      <th scope="col">Last</th>
							      <th scope="col">Handle</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">1</th>
							      <td>Mark</td>
							      <td>Otto</td>
							      <td>@mdo</td>
							    </tr>
							    <tr>
							      <th scope="row">2</th>
							      <td>Jacob</td>
							      <td>Thornton</td>
							      <td>@fat</td>
							    </tr>
							    <tr>
							      <th scope="row">3</th>
							      <td colspan="2">Larry the Bird</td>
							      <td>@twitter</td>
							    </tr>
							  </tbody>
							</table>
                     </div>
                 </div>

                 <!-- Collapsable Card Example -->
                 <div class="card shadow mb-4">
                     <!-- Card Header - Accordion -->
                     <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
                         role="button" aria-expanded="true" aria-controls="collapseCardExample">
                         <h6 class="m-0 font-weight-bold text-primary">Collapsable Card Example</h6>
                     </a>
                     <!-- Card Content - Collapse -->
                     <div class="collapse show" id="collapseCardExample">
                         <div class="card-body">
                             <table class="table">
								  <thead>
								    <tr>
								      <th scope="col">#</th>
								      <th scope="col">First</th>
								      <th scope="col">Last</th>
								      <th scope="col">Handle</th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      <th scope="row">1</th>
								      <td>Mark</td>
								      <td>Otto</td>
								      <td>@mdo</td>
								    </tr>
								    <tr>
								      <th scope="row">2</th>
								      <td>Jacob</td>
								      <td>Thornton</td>
								      <td>@fat</td>
								    </tr>
								    <tr>
								      <th scope="row">3</th>
								      <td colspan="2">Larry the Bird</td>
								      <td>@twitter</td>
								    </tr>
								  </tbody>
								</table>
                         </div>
                     </div>
                 </div>

             </div>

         </div>

     </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
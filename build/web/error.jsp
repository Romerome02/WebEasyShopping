<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Admin Template">
    <meta name="keywords" content="admin dashboard, admin, flat, flat ui, ui kit, app, web app, responsive">
    <link rel="shortcut icon" href="img/ico/favicon.png">
    <title>easyShopping - 500 Error</title>

    <!-- Base Styles -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->


</head>

<body class="body-500">

<div class="container">

    <section class="error-wrapper">
        <i class="icon-500"></i>
        <div class="text-center">
            <h2 class="">Algo salió mal</h2>
           <%
                // Manejo correcto del tipo Throwable
                Throwable ex = exception != null ? exception : (Throwable) request.getAttribute("javax.servlet.error.exception");
            %>
            <h2><%= ex != null ? ex.getMessage() : "No hay detalles del error disponibles" %></h2>
        </div>
        <div class="center">
            <p>Intenta iniciar sesión o contáctanos para obtener ayuda.</p>
            <a href="index.html" class="btn btn-success">Ir a Inicio de sesión</a>
            <a href="#" class="btn btn-warning">Contactar Soporte</a>
        </div>
        
    </section>

</div>


</body>
</html>

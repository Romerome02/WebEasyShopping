<%@page import="Model.EasyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%    // Verificar si el usuario tiene sesión activa
    EasyUser usuario = (EasyUser) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="slick, flat, dashboard, bootstrap, admin, template, theme, responsive, fluid, retina">

        <!--link rel="shortcut icon" href="<%= request.getContextPath()%>javascript:;" type="image/png"-->
        <link rel="shortcut icon" href="<%= request.getContextPath()%>/image/ico/favicon.png">

        <title>easyShopping - Administracion</title>

        <!--right slidebar-->
        <link href="<%= request.getContextPath()%>/css/slidebars.css" rel="stylesheet">

        <!--switchery-->
        <link href="<%= request.getContextPath()%>/js/switchery/switchery.min.css" rel="stylesheet" type="text/css" media="screen" />

        <!--?php include 'php/visuales/css_selectivos.php' ?-->

        <!--common style-->
        <link href="<%= request.getContextPath()%>/css/style.css" rel="stylesheet">
        <link href="<%= request.getContextPath()%>/css/style-responsive.css" rel="stylesheet">
        <link href="<%= request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">       

        <!--theme color layout-->
        <link href="<%= request.getContextPath()%>/css/layout-theme-three.css" rel="stylesheet">
    </head>

    <body class="sticky-header">

        <section>
            <!-- sidebar left start-->
            <div class="sidebar-left">
                <!--responsive view logo start-->
                <div class="logo bg-warning visible-xs-* visible-sm-*">
                    <a href="#">
                        <img src="<%= request.getContextPath()%>/image/logo-icon.png" alt="">
                        <span class="brand-name">easyShopping</span>
                    </a>
                </div>
                <!--responsive view logo end-->

                <!-- sidebar left end-->
                <div class="sidebar-left-info">
                    <jsp:include page="menu_izquierdo.jsp" />
                </div>
            </div>
            <!-- sidebar left end-->

            <!-- body content start-->
            <div class="body-content" style="min-height: 1000px;">
                <!-- header section start-->
                <div class="header-section">
                    <!--logo and logo icon start-->
                    <div class="logo bg-warning hidden-xs hidden-sm">
                        <a href="<%= request.getContextPath()%>/View/home.jsp">
                            <img src="<%= request.getContextPath()%>/image/logo-icon.png" alt="">
                            <!--<i class="fa fa-maxcdn"></i>-->
                            <span class="brand-name">easyShopping</span>
                        </a>
                    </div>
                    <div class="icon-logo bg-warning hidden-xs hidden-sm">
                        <a href="<%= request.getContextPath()%>/View/home.jsp">
                            <img src="<%= request.getContextPath()%>/image/logo-icon.png" alt="">
                            <!--<i class="fa fa-maxcdn"></i>-->
                        </a>
                    </div>
                    <!--logo and logo icon end-->

                    <!--toggle button start-->
                    <a class="toggle-btn"><i class="fa fa-outdent" ></i></a>
                    <!--toggle button end-->

                    <div class="notification-wrap">
                        <!--right notification start-->
                        <div class="right-notification">
                            <ul class="notification-menu">                        
                                <li>                                   
                                    <a href="" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        <img src="<%= request.getContextPath()%>/image/avatar-mini.jpg" alt="">${sessionScope.usuario.name} ${sessionScope.usuario.surnames}


                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu purple pull-right">
                                        <!-- <li><a href="javascript:;">  Perfil</a></li> -->
                                        <li><a href="<%= request.getContextPath()%>/logout"><i class="fa fa-sign-out pull-right"></i> Cerrar sesión</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!--right notification end-->
                    </div>
                </div>
                <!-- header section end-->

                <!-- Plano del Supermercado -->
                <div class="container">
                    <h2 class="text-center">Plano del Supermercado</h2>
                    <jsp:include page="shelves.jsp"/>
                </div>

                <!--footer section start-->
                <footer>
                    2025 &copy; easyShopping.
                </footer>
                <!--footer section end-->


                <!-- Right Slidebar start -->

                <!-- Right Slidebar end -->

            </div>
            <!-- body content end-->
        </section>
        <!-- JS para configuraciones del plano -->

        <!-- Placed js at the end of the document so the pages load faster -->
        <script src="<%= request.getContextPath()%>/js/jquery-1.10.2.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery-migrate.js"></script>
        <script src="<%= request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/modernizr.min.js"></script>

        <!--Nice Scroll-->
        <script src="<%= request.getContextPath()%>/js/jquery.nicescroll.js" type="text/javascript"></script>

        <!--right slidebar-->
        <script src="<%= request.getContextPath()%>/js/slidebars.min.js"></script>

        <!--switchery-->
        <script src="<%= request.getContextPath()%>/js/switchery/switchery.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/switchery/switchery-init.js"></script>

        <!--Sparkline Chart-->
        <script src="<%= request.getContextPath()%>/js/sparkline/jquery.sparkline.js"></script>
        <script src="<%= request.getContextPath()%>/js/sparkline/sparkline-init.js"></script>


        <!--common scripts for all pages-->
        <script src="<%= request.getContextPath()%>/js/scripts.js"></script>

        <!-- CUSTOM JS -->



    </body>
</html>

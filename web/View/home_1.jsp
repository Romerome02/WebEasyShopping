<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String modulo = request.getParameter("modulo");
    if (modulo == null) {
        modulo = "";
    }
    request.setAttribute("modulo", modulo); // Pasamos 'modulo' como atributo a la JSP incluida
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="slick, flat, dashboard, bootstrap, admin, template, theme, responsive, fluid, retina">

        <link rel="shortcut icon" href="javascript:;" type="image/png">
        <link rel="shortcut icon" href="img/ico/favicon.png">

        <title>easyShopping - Administracion</title>

        <!--right slidebar-->
        <link href="css/slidebars.css" rel="stylesheet">

        <!--switchery-->
        <link href="js/switchery/switchery.min.css" rel="stylesheet" type="text/css" media="screen" />

        <!--?php include 'php/visuales/css_selectivos.php' ?-->

        <!--common style-->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet">
        <!--theme color layout-->
        <link href="css/layout-theme-three.css" rel="stylesheet">
    </head>

    <body class="sticky-header">

        <section>
            <!-- sidebar left start-->
            <div class="sidebar-left">
                <!--responsive view logo start-->
                <div class="logo bg-warning visible-xs-* visible-sm-*">
                    <a href="#">
                        <img src="img/logo-icon.png" alt="">
                        <!--<i class="fa fa-maxcdn"></i>-->
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
                        <a href="#">
                            <img src="img/logo-icon.png" alt="">
                            <!--<i class="fa fa-maxcdn"></i>-->
                            <span class="brand-name">easyShopping</span>
                        </a>
                    </div>

                    <div class="icon-logo bg-warning hidden-xs hidden-sm">
                        <a href="index.html">
                            <img src="img/logo-icon.png" alt="">
                            <!--<i class="fa fa-maxcdn"></i>-->
                        </a>
                    </div>
                    <!--logo and logo icon end-->

                    <!--toggle button start-->
                    <a class="toggle-btn"><i class="fa fa-outdent"></i></a>
                    <!--toggle button end-->


                    <div class="notification-wrap">



                        <!--right notification start-->
                        <div class="right-notification">
                            <ul class="notification-menu">                        
                                <li>
                                    <a href="javascript:;" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        <img src="img/avatar-mini.jpg" alt=""><!--?php echo $_SESSION["nombre_completo"]; ?-->
                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu purple pull-right">
                                        <!-- <li><a href="javascript:;">  Perfil</a></li> -->
                                        <li><a href="#"><i class="fa fa-sign-out pull-right"></i> Cerrar sesión</a></li>
                                    </ul>
                                </li>

                            </ul>
                        </div>
                        <!--right notification end-->
                    </div>

                </div>
                <!-- header section end-->




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

        <!-- Placed js at the end of the document so the pages load faster -->
        <script src="js/jquery-1.10.2.min.js"></script>
        <script src="js/jquery-migrate.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/modernizr.min.js"></script>

        <!--Nice Scroll-->
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>

        <!--right slidebar-->
        <script src="js/slidebars.min.js"></script>

        <!--switchery-->
        <script src="js/switchery/switchery.min.js"></script>
        <script src="js/switchery/switchery-init.js"></script>

        <!--Sparkline Chart-->
        <script src="js/sparkline/jquery.sparkline.js"></script>
        <script src="js/sparkline/sparkline-init.js"></script>


        <!--common scripts for all pages-->
        <script src="js/scripts.js"></script>

        <!-- CUSTOM JS -->



    </body>
</html>

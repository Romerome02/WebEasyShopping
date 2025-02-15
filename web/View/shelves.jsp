<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
    <div class="page-head">
        <h3 class="m-b-less">Configuración de Estantes</h3>
        <div class="state-information">
            <ol class="breadcrumb m-b-less bg-less">
                <li><a href="#">easyShopping</a></li>
                <li><a href="#">Administración</a></li>
                <li class="active">Estantes</li>
            </ol>
        </div>
    </div>
    <div class="wrapper">
        <div class="col-md-12">
            <section class="panel">
                <div class="panel-body">
                    <div class="col-md-8">
                        <section class="panel">
                            <div class="panel-body" style="padding:0">
                                <div tabindex="0" id="disena" style="height: 500px; overflow: hidden; border: 1px gray dashed"></div>
                                <div class="text-right" style="margin: -35px 5px 0 0">
                                    <form id="form_plano" method="post" enctype="multipart/form-data">
                                        <button id="delete-graph" onclick="return false;" class="btn btn-sm btn-danger addon-btn">
                                            <i class="fa fa-trash"></i> Limpiar
                                        </button>
                                        <button id="cambiar_plano" class="btn btn-sm btn-info addon-btn">
                                            <i class="fa fa-file-image-o"></i> Cambiar plano...
                                        </button>
                                        <input type="file" id="imagen_plano" name="imagen_plano" style="display: none;" />
                                        <input type="hidden" name="modulo" value="estantes" />
                                        <input type="hidden" name="accion" value="cambiar_plano" />
                                    </form>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div class="col-md-4">
                        <section class="panel">
                            <header class="panel-heading head-border">Plano actual</header>
                            <div class="panel-body">
                                <button id="guardar_plano" type="button" class="btn btn-warning btn-block" disabled>
                                    <i class="fa fa-save"></i> Guardar cambios
                                </button>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <script src="js/d3.v3.js" charset="utf-8"></script>
    <script src="js/FileSaver.min.js"></script>
    <script src="js/graph-creator.js"></script>
    <script>
        $(document).ready(function() {
            var svg = d3.select("#disena").append("svg")
                .attr("width", '100%')
                .attr("height", '100%');
            var graph = new GraphCreator(svg);

            $.post('php/api.php', {modulo: 'estantes', accion: 'obtener'}, function(data) {
                var estantes = JSON.parse(data);
                graph.nodes = estantes.nodos;
                graph.setIdCt(estantes.nodos.length);
                graph.edges = estantes.aristas.map(e => ({
                    source: graph.nodes.find(n => n.id == e.id_nodo_origen),
                    target: graph.nodes.find(n => n.id == e.id_nodo_destino)
                }));
                graph.updateGraph();
                $('#guardar_plano').prop('disabled', true);
            });

            $('#guardar_plano').click(function() {
                $('#guardar_plano').prop('disabled', true);
                $.post('php/api.php', {
                    modulo: 'estantes',
                    accion: 'agregar',
                    nodos: JSON.stringify(graph.nodes),
                    aristas: JSON.stringify(graph.edges)
                }, function(data) {
                    console.log(data);
                });
            });

            $('#cambiar_plano').click(function(event) {
                event.preventDefault();
                $('#imagen_plano').click();
            });

            $("#imagen_plano:file").change(function() {
                $('#form_plano').submit();
            });

            $("form#form_plano").submit(function(e) {
                e.preventDefault();
                $.ajax({
                    url: 'php/api.php',
                    type: 'POST',
                    data: new FormData(this),
                    processData: false,
                    contentType: false
                }).done(function(resultado) {
                    location.reload();
                });
            });
        });
    </script>


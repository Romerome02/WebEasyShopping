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
                                    <button id="delete-graph" onclick="return false;" class="btn btn-sm btn-danger addon-btn"><i class="fa fa-trash"></i>Limpiar</button> <button id="cambiar_plano" class="btn btn-sm btn-info addon-btn"><i class="fa fa-file-image-o"></i>Cambiar plano...</button>
                                    <input type="file" id="imagen_plano" name="imagen_plano" style="display: none;" />
                                    <input type="hidden" name="modulo" value="estantes" />
                                    <input type="hidden" name="accion" value="cambiar_plano" />
                                </form>
                            </div>
                            <div class="row earning-chart-info" style="padding: 10px 10px 5px 10px">
                                <div class="col-sm-3 col-xs-6">
                                    <div><i class="fa fa-circle-o"></i> shift+click</div>
                                    <small class="text-muted"> para crear un nodo.</small>
                                </div>
                                <div class="col-sm-3 col-xs-6">
                                    <div><i class="fa fa-long-arrow-right"></i> shift+arrastrar</div>
                                    <small class="text-muted">de un nodo a otro para conectarlos.</small>
                                </div>
                                <div class="col-sm-3 col-xs-6">
                                    <div><i class="fa fa-times"></i> click en nodo o arista</div>
                                    <small class="text-muted">luego tecla suprimir para eliminarlo.</small>
                                </div>
                                <div class="col-sm-3 col-xs-6">
                                    <div><i class="fa fa-arrows"></i> <i class="fa fa-search-plus"></i> acercar/arrastrar</div>
                                    <small class="text-muted">acercar, alejar y arrastrar con el raton.</small>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-md-4">
                    <section class="panel">
                        <header class="panel-heading head-border">Plano actual</header>
                        <div class="panel-body">
                            <button id="guardar_plano" type="button" class="btn btn-warning btn-block" disabled><i class="fa fa-save"></i> Guardar cambios</button>
                        </div>
                    </section>
                    <section class="panel" id="detalles_nodo" style="display: none">
                        <header class="panel-heading head-border">
                            Detalle del nodo
                        </header>
                        <div class="panel-body">
                            <form role="form">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>ID</label>
                                            <input id="id_nodo" name="id_nodo" type="text" class="form-control" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>Tipo:</label>
                                            <select id="tipo_nodo" name="tipo_nodo" class="form-control m-b-10">
                                                <option value="estante">Estante</option>
                                                <option value="entrada">Entrada</option>
                                                <option value="punto_vertice">Punto vertice</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Nombre (descriptor):</label>
                                    <input id="descriptor_nodo" name="descriptor_nodo" type="text" class="form-control">
                                </div>
                                <button id="aplicar_nodo" type="button" class="btn btn-default pull-right">Aplicar</button>
                            </form>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</div>
<script src="<%= request.getContextPath()%>/js/d3.v3.js" charset="utf-8"></script>
<script src="<%= request.getContextPath()%>/js/FileSaver.min.js"></script>
<script src="<%= request.getContextPath()%>/js/graph-creator.js"></script>
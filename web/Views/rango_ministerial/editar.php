<div class="box-rango-ministerial">
	<h3> Rangos Ministeriales</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h1 class="panel-title">Edicion de Rango Ministerial</h1>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label for="rango_ministerial" class="control-label"><h5>Nuevo Nombre de Rango Ministerial:<b><?php echo $datos['rango_ministerial']; ?></b>
								
							</h5></label>
							<input type="text" name="rango_ministerial" id="rango_ministerial" class="form-control"  value="<?php echo $datos['rango_ministerial']; ?>" required autocomplete="off">
							<input type="text" name="cod_rango" id="cod_rango" class="form-control"  value="<?php echo $datos['cod_rango']; ?>" required autocomplete="off">
							<input type="hidden" id="id_rango" name="id_rango" value="<?php echo $datos['id_rango']; ?>">
						</div>
						<div class="form-group">
							<button class="btn btn-success" type="submit">Editar</button>
							<button class="btn btn-warning" type="rseset">Limpiar</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

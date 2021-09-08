TYPE=VIEW
query=select `i`.`iglesia` AS `iglesia`,`s`.`servicio` AS `servicio`,`s`.`id_servicio` AS `id_servicio`,date_format(`a`.`fecha`,\'%Y%m\') AS `mes_numerico`,`a`.`fecha` AS `fecha`,elt((weekday(`a`.`fecha`) + 1),\'02 Lunes\',\'03 Martes\',\'04 Miercoles\',\'05 Jueves\',\'06 Viernes\',\'07 Sabado\',\'01 Domingo\') AS `dia_semana`,dayofmonth(`a`.`fecha`) AS `dia`,elt(month(`a`.`fecha`),\'01 Enero\',\'02 Febrero\',\'03 Marzo\',\'04 Abril\',\'05 Mayo\',\'06 Junio\',\'07 Julio\',\'08 Agosto\',\'09 Septiembre\',\'10 Octubre\',\'11 Noviembre\',\'12 Diciembre\') AS `mes`,year(`a`.`fecha`) AS `anio`,concat(`p`.`nombres`,\' \',`p`.`apellidos`) AS `nombre` from ((((`iglesias`.`asistencia` `a` join `iglesias`.`personas_clasificacion` `pc` on((`a`.`id_clasificacion` = `pc`.`id_clasificacion`))) join `iglesias`.`personas` `p` on((`a`.`id_persona` = `p`.`id_persona`))) join `iglesias`.`servicios` `s` on((`a`.`id_servicio` = `s`.`id_servicio`))) join `iglesias`.`iglesias` `i` on((`s`.`id_iglesia` = `i`.`id_iglesia`))) order by `i`.`iglesia`,`s`.`servicio`,date_format(`a`.`fecha`,\'%Y%m\'),`a`.`fecha`
md5=bf7fd558406bae95d50c19fc83445df8
updatable=1
algorithm=0
definer_user=root
definer_host=%
suid=1
with_check_option=0
timestamp=2019-05-15 13:15:49
create-version=1
source=select `i`.`iglesia` AS `iglesia`,`s`.`servicio` AS `servicio`,`s`.`id_servicio` AS `id_servicio`,date_format(`a`.`fecha`,\'%Y%m\') AS `mes_numerico`,`a`.`fecha` AS `fecha`,elt(weekday(`a`.`fecha`) + 1,\'02 Lunes\',\'03 Martes\',\'04 Miercoles\',\'05 Jueves\',\'06 Viernes\',\'07 Sabado\',\'01 Domingo\') AS `dia_semana`,dayofmonth(`a`.`fecha`) AS `dia`,elt(month(`a`.`fecha`),\'01 Enero\',\'02 Febrero\',\'03 Marzo\',\'04 Abril\',\'05 Mayo\',\'06 Junio\',\'07 Julio\',\'08 Agosto\',\'09 Septiembre\',\'10 Octubre\',\'11 Noviembre\',\'12 Diciembre\') AS `mes`,year(`a`.`fecha`) AS `anio`,concat(`p`.`nombres`,\' \',`p`.`apellidos`) AS `nombre` from ((((`asistencia` `a` join `personas_clasificacion` `pc` on(`a`.`id_clasificacion` = `pc`.`id_clasificacion`)) join `personas` `p` on(`a`.`id_persona` = `p`.`id_persona`)) join `servicios` `s` on(`a`.`id_servicio` = `s`.`id_servicio`)) join `iglesias` `i` on(`s`.`id_iglesia` = `i`.`id_iglesia`)) order by `i`.`iglesia`,`s`.`servicio`,date_format(`a`.`fecha`,\'%Y%m\'),`a`.`fecha`
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `i`.`iglesia` AS `iglesia`,`s`.`servicio` AS `servicio`,`s`.`id_servicio` AS `id_servicio`,date_format(`a`.`fecha`,\'%Y%m\') AS `mes_numerico`,`a`.`fecha` AS `fecha`,elt((weekday(`a`.`fecha`) + 1),\'02 Lunes\',\'03 Martes\',\'04 Miercoles\',\'05 Jueves\',\'06 Viernes\',\'07 Sabado\',\'01 Domingo\') AS `dia_semana`,dayofmonth(`a`.`fecha`) AS `dia`,elt(month(`a`.`fecha`),\'01 Enero\',\'02 Febrero\',\'03 Marzo\',\'04 Abril\',\'05 Mayo\',\'06 Junio\',\'07 Julio\',\'08 Agosto\',\'09 Septiembre\',\'10 Octubre\',\'11 Noviembre\',\'12 Diciembre\') AS `mes`,year(`a`.`fecha`) AS `anio`,concat(`p`.`nombres`,\' \',`p`.`apellidos`) AS `nombre` from ((((`iglesias`.`asistencia` `a` join `iglesias`.`personas_clasificacion` `pc` on((`a`.`id_clasificacion` = `pc`.`id_clasificacion`))) join `iglesias`.`personas` `p` on((`a`.`id_persona` = `p`.`id_persona`))) join `iglesias`.`servicios` `s` on((`a`.`id_servicio` = `s`.`id_servicio`))) join `iglesias`.`iglesias` `i` on((`s`.`id_iglesia` = `i`.`id_iglesia`))) order by `i`.`iglesia`,`s`.`servicio`,date_format(`a`.`fecha`,\'%Y%m\'),`a`.`fecha`
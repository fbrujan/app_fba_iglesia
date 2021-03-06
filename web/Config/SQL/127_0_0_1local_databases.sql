-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2018 at 05:00 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;


--
-- Database: `aic`
--
DROP DATABASE IF EXISTS `aic`;
CREATE DATABASE IF NOT EXISTS `aic` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE aic;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `cargos_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_buscar` (IN `_id_cargo` INT(10))  BEGIN
SELECT * FROM cargos WHERE  id_cargo =  _id_cargo ;
END$$

DROP PROCEDURE IF EXISTS `cargos_comite_temporero_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_comite_temporero_buscar` (IN `_cargo_comite` VARCHAR(100))  BEGIN
SELECT * FROM cargos_comite_temporero WHERE  cargo_comite_temporero LIKE  CONCAT('%',_cargo_comite,'%') ;
END$$

DROP PROCEDURE IF EXISTS `cargos_comite_temporero_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_comite_temporero_eliminar` (IN `_id_cargo_comite` INT)  BEGIN
DELETE FROM cargos_comite_temporero WHERE id_cargo_comite = _id_cargo_comite;
END$$

DROP PROCEDURE IF EXISTS `cargos_comite_temporero_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_comite_temporero_insertar` (IN `_cargo_comite` VARCHAR(100))  BEGIN
INSERT INTO cargos_comite_temporero (cargo_comite_temporero) VALUES(_cargo_comite);
END$$

DROP PROCEDURE IF EXISTS `cargos_comite_temporero_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_comite_temporero_modificar` (IN `_id_cargo_comite` INT, `_cargo_comite` VARCHAR(100))  BEGIN
UPDATE cargos_comite_temporero SET cargo_comite_temporero = _cargo_comite WHERE id_cargo_comite = _id_cargo_comite;
END$$

DROP PROCEDURE IF EXISTS `cargos_comite_temporero_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_comite_temporero_mostrar` ()  BEGIN
SELECT * FROM cargos_comite_temporero;
END$$

DROP PROCEDURE IF EXISTS `cargos_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_eliminar` (IN `_id_cargo` INT)  BEGIN
DELETE FROM cargos WHERE id_cargo = _id_cargo;
END$$

DROP PROCEDURE IF EXISTS `cargos_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_insertar` (IN `_cargo` VARCHAR(100))  BEGIN
INSERT INTO cargos (cargo) VALUES(_cargo);
END$$

DROP PROCEDURE IF EXISTS `cargos_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_mostrar` ()  BEGIN
SELECT * FROM cargos;
END$$

DROP PROCEDURE IF EXISTS `cargos_renombrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `cargos_renombrar` (IN `_id_cargo` INT, `_cargo` VARCHAR(100))  BEGIN
UPDATE cargos SET cargo = _cargo WHERE id_cargo = _id_cargo;
END$$

DROP PROCEDURE IF EXISTS `circuitos_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `circuitos_buscar` (IN `_id_circuito` INT)  BEGIN
SELECT d.id_pais, pa.pais, c.id_distrito, d.distrito, c.id_provincia, p.provincia,
		c.id_circuito, c.circuito
FROM circuitos c 
			INNER JOIN distritos d ON c.id_distrito = d.id_distrito
			INNER JOIN provincias p ON c.id_provincia = p.id_provincia
			INNER JOIN paises pa ON d.id_pais = pa.id_pais
WHERE  id_circuito = _id_circuito ;
END$$

DROP PROCEDURE IF EXISTS `circuitos_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `circuitos_eliminar` (IN `_id_circuito` INT)  BEGIN
DELETE FROM circuitos WHERE id_circuito = _id_circuito;
END$$

DROP PROCEDURE IF EXISTS `circuitos_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `circuitos_insertar` (IN `_id_distrito` INT, `_id_provincia` INT, `_circuito` VARCHAR(100))  BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_circuito)+1,1) INTO nextID FROM circuitos ; 
INSERT INTO circuitos (id_distrito, id_provincia, id_provincia2, id_circuito, circuito) 
				VALUES(_id_distrito, _id_provincia, NULL, nextID, _circuito);
END$$

DROP PROCEDURE IF EXISTS `circuitos_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `circuitos_mostrar` ()  BEGIN
SELECT d.id_pais, pa.pais, c.id_distrito, d.distrito, c.id_provincia, p.provincia,
		c.id_circuito, c.circuito
FROM circuitos c 
			INNER JOIN distritos d ON c.id_distrito = d.id_distrito
			INNER JOIN provincias p ON c.id_provincia = p.id_provincia
			INNER JOIN paises pa ON d.id_pais = pa.id_pais
ORDER BY c.circuito ASC
			;
END$$

DROP PROCEDURE IF EXISTS `circuitos_renombrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `circuitos_renombrar` (IN `_id_circuito` INT, `_circuito` VARCHAR(100))  BEGIN
UPDATE circuitos 
	SET circuito = _circuito
	WHERE id_circuito = _id_circuito;
END$$

DROP PROCEDURE IF EXISTS `comite_temporero_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `comite_temporero_buscar` (IN `_id_comite` INT(10))  BEGIN
SELECT * FROM comite_temporero WHERE  id_comite_temporero =  _id_comite ;
END$$

DROP PROCEDURE IF EXISTS `comite_temporero_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `comite_temporero_eliminar` (IN `_id_comite` INT)  BEGIN
DELETE FROM comite_temporero WHERE id_comite_temporero = _id_comite;
END$$

DROP PROCEDURE IF EXISTS `comite_temporero_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `comite_temporero_insertar` (IN `_comite` VARCHAR(100))  BEGIN
INSERT INTO comite_temporero (comite_temporero) VALUES(_comite);
END$$

DROP PROCEDURE IF EXISTS `comite_temporero_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `comite_temporero_modificar` (IN `_id_comite` INT, IN `_comite` VARCHAR(100))  BEGIN
UPDATE comite_temporero SET comite_temporero = _comite WHERE id_comite_temporero = _id_comite;
END$$

DROP PROCEDURE IF EXISTS `comite_temporero_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `comite_temporero_mostrar` ()  BEGIN
SELECT * FROM comite_temporero;
END$$

DROP PROCEDURE IF EXISTS `departamentos_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_buscar` (IN `_id_departamento` INT(10))  BEGIN
SELECT * FROM departamentos WHERE  id_departamento =_id_departamento ;
END$$

DROP PROCEDURE IF EXISTS `departamentos_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_eliminar` (IN `_id_departamento` INT)  BEGIN
DELETE FROM departamentos WHERE id_departamento = _id_departamento;
END$$

DROP PROCEDURE IF EXISTS `departamentos_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_insertar` (IN `_cod_departamento` VARCHAR(15), IN `_departamento` VARCHAR(100), IN `_descripcion` VARCHAR(200))  BEGIN
INSERT INTO departamentos (cod_departamento, departamento, descripcion) VALUES(_cod_departamento, _departamento, _descripcion);
END$$

DROP PROCEDURE IF EXISTS `departamentos_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_modificar` (IN `_id_departamento` INT, IN `_cod_departamento` VARCHAR(15), IN `_departamento` VARCHAR(100), IN `_descripcion` VARCHAR(200))  BEGIN
UPDATE departamentos SET 
	cod_departamento = _cod_departamento, 
    departamento = _departamento, 
	descripcion = _descripcion 
WHERE id_departamento = _id_departamento;
END$$

DROP PROCEDURE IF EXISTS `departamentos_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `departamentos_mostrar` ()  BEGIN
SELECT * FROM departamentos;
END$$

DROP PROCEDURE IF EXISTS `distritos_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `distritos_buscar` (IN `_id_distrito` INT)  BEGIN
SELECT d.*, p.pais
FROM distritos d INNER JOIN paises p ON d.id_pais = p.id_pais
WHERE  id_distrito = _id_distrito ;
END$$

DROP PROCEDURE IF EXISTS `distritos_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `distritos_eliminar` (IN `_id_distrito` INT)  BEGIN
DELETE FROM distritos WHERE id_distrito = _id_distrito;
END$$

DROP PROCEDURE IF EXISTS `distritos_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `distritos_insertar` (IN `_id_pais` INT, `_distrito` VARCHAR(100))  BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_distrito)+1,1) INTO nextID FROM distritos; 
INSERT INTO distritos (id_distrito, id_pais, distrito) VALUES(nextID, _id_pais, _distrito);
END$$

DROP PROCEDURE IF EXISTS `distritos_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `distritos_mostrar` ()  BEGIN
SELECT d.*, p.pais 
	FROM distritos d 
	INNER JOIN paises p ON d.id_pais = p.id_pais ;
END$$

DROP PROCEDURE IF EXISTS `distritos_renombrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `distritos_renombrar` (IN `_id_distrito` INT, `_distrito` VARCHAR(100))  BEGIN
UPDATE distritos 
	SET distrito = _distrito
	WHERE id_distrito = _id_distrito;
END$$

DROP PROCEDURE IF EXISTS `estado_condicion_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `estado_condicion_buscar` (IN `_id_estado_condicion` INT(10))  BEGIN
SELECT * FROM estado_condicion WHERE  id_estado_condicion =_id_estado_condicion ;
END$$

DROP PROCEDURE IF EXISTS `estado_condicion_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `estado_condicion_eliminar` (IN `_id_estado_condicion` INT)  BEGIN
DELETE FROM estado_condicion WHERE id_estado_condicion = _id_estado_condicion;
END$$

DROP PROCEDURE IF EXISTS `estado_condicion_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `estado_condicion_insertar` (IN `_estado_condicion` VARCHAR(100), `_elegible_lider` INT)  BEGIN
INSERT INTO estado_condicion (estado_condicion, elegible_lider) VALUES(_estado_condicion, _elegible_lider);
END$$

DROP PROCEDURE IF EXISTS `estado_condicion_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `estado_condicion_modificar` (IN `_id_estado_condicion` INT, `_estado_condicion` VARCHAR(100), `_elegible_lider` INT)  BEGIN
UPDATE estado_condicion SET estado_condicion = _estado_condicion, elegible_lider = _elegible_lider WHERE id_estado_condicion = _id_estado_condicion;
END$$

DROP PROCEDURE IF EXISTS `estado_condicion_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `estado_condicion_mostrar` ()  BEGIN
SELECT id_estado_condicion, estado_condicion, elegible_lider,
	CASE elegible_lider
		WHEN 1 then "SI"
		WHEN 0 then "NO"
		END AS elegible_cargos
FROM  estado_condicion;
END$$

DROP PROCEDURE IF EXISTS `iglesias_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_buscar` (IN `_id_circuito` INT, `_iglesia` VARCHAR(100))  BEGIN
SELECT  d.id_pais, pa.pais, c.id_distrito, d.distrito, i.id_circuito, c.circuito,
		i.id_provincia, p.provincia, i.iglesia, i.direccion, i.telefono, i.fundador,
		i.fecha_fundada, i.imagen
FROM iglesias i 
		INNER JOIN circuitos c ON i.id_circuito = c.id_circuito
		INNER JOIN provincias p ON i.id_provincia = p.id_provincia
		INNER JOIN distritos d ON c.id_distrito = d.id_distrito
		INNER JOIN paises pa ON d.id_pais = pa.id_pais
WHERE  i.id_circuito= _id_circuito and iglesia LIKE  CONCAT('%',_iglesia,'%') ;
END$$

DROP PROCEDURE IF EXISTS `iglesias_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_eliminar` (IN `_id_circuito` INT, `_id_iglesia` INT, `_id_provincia` INT)  BEGIN
DELETE FROM iglesias WHERE id_circuito = _id_circuito AND id_iglesia = _id_iglesia AND id_provincia=_id_provincia; 
END$$

DROP PROCEDURE IF EXISTS `iglesias_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_insertar` (IN `_id_circuito` INT, `_id_provincia` INT, `_iglesia` VARCHAR(100), `_direccion` VARCHAR(200), `_telefono` VARCHAR(15), `_fundador` VARCHAR(100), `_fecha_fundada` DATE, `_imagen` VARCHAR(100))  BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_iglesia)+1,1) INTO nextID FROM iglesias; 
INSERT INTO iglesias (iglesia, id_circuito, id_provincia, direccion, telefono, fundador, fecha_fundada,imagen) 
	 VALUES(_iglesia, _id_circuito, _id_provincia, _direccion, _telefono, _fundador, _fecha_fundada, _imagen);
END$$

DROP PROCEDURE IF EXISTS `iglesias_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_mostrar` ()  BEGIN
SELECT d.id_pais, pa.pais, c.id_distrito, d.distrito, i.id_circuito, c.circuito,
		i.id_provincia, p.provincia, i.iglesia, i.direccion, i.telefono, i.fundador,
		i.fecha_fundada, i.imagen
FROM iglesias i 
		INNER JOIN circuitos c ON i.id_circuito = c.id_circuito
		INNER JOIN provincias p ON i.id_provincia = p.id_provincia
		INNER JOIN distritos d ON c.id_distrito = d.id_distrito
		INNER JOIN paises pa ON d.id_pais = pa.id_pais
;
END$$

DROP PROCEDURE IF EXISTS `iglesias_renombrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `iglesias_renombrar` (IN `_id_distrito` INT, `_id_iglesia` INT, `_iglesia` VARCHAR(100))  BEGIN
UPDATE iglesias 
	SET iglesia = _iglesia
	WHERE id_circuito = _id_circuito AND id_iglesia = _id_iglesia AND id_provincia=_id_provincia;
END$$

DROP PROCEDURE IF EXISTS `lideres_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_buscar` (IN `_id_lider` INT)  BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.sexo,
		i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, 
		cir.circuito, dis.distrito,
		CASE
			WHEN l.fecha_fin>=NOW()
				THEN CONCAT(year(l.fecha_inicio),'-Actual')
			WHEN year(l.fecha_inicio) = year(l.fecha_fin)
				THEN year(l.fecha_inicio)
			ELSE CONCAT(year(l.fecha_inicio),'-',year(l.fecha_fin))
		END AS periodo
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado_condicion = ec.id_estado_condicion
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
WHERE   l.id_lider = _id_lider;
END$$

DROP PROCEDURE IF EXISTS `lideres_buscarCargo`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_buscarCargo` (IN `_cargo` VARCHAR(100))  BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		p.nombres, p.apellidos,p.imagen, p.fecha_nacimiento, p.telefono, p.sexo,
		i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, 
		cir.circuito, dis.distrito
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado_condicion = ec.id_estado_condicion
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
WHERE   c.cargo LIKE CONCAT('%', _cargo, '%') ;
END$$

DROP PROCEDURE IF EXISTS `lideres_buscarDepartamento`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_buscarDepartamento` (IN `_depart` VARCHAR(100))  BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		p.nombres, p.apellidos,p.imagen, p.fecha_nacimiento, p.telefono, p.sexo,
		i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, 
		cir.circuito, dis.distrito
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado_condicion = ec.id_estado_condicion
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
WHERE   d.departamento LIKE CONCAT('%', _depart, '%');
END$$

DROP PROCEDURE IF EXISTS `lideres_buscarNombre`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_buscarNombre` (IN `_nombre` VARCHAR(100))  BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		p.nombres, p.apellidos,p.imagen, p.fecha_nacimiento, p.telefono, p.sexo,
		i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, 
		cir.circuito, dis.distrito
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado_condicion = ec.id_estado_condicion
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito
WHERE   CONCAT(p.nombres,' ', p.apellidos) LIKE CONCAT('%', _nombre, '%');
END$$

DROP PROCEDURE IF EXISTS `lideres_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_eliminar` (IN `_id_lider` INT)  BEGIN
DELETE FROM lideres WHERE id_lider = _id_lider; 
END$$

DROP PROCEDURE IF EXISTS `lideres_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_insertar` (IN `_id_depart` INT, `_id_miembro` INT, `_id_cargo` INT, `_fch_ini` DATE, `_fch_fin` DATE)  BEGIN
DECLARE _vigente INT;
SET _vigente = if(_fch_fin <= NOW(),0,1);
	INSERT INTO lideres (id_departamento, id_miembro, id_cargo, fecha_inicio, fecha_fin,
 				vigente) 
	 		VALUES(_id_depart, _id_miembro, _id_cargo, _fch_ini, _fch_fin, _vigente);

END$$

DROP PROCEDURE IF EXISTS `lideres_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_modificar` (IN `_id_lider` INT, `_id_miembro` INT, `_fch_ini` DATE, `_fch_fin` DATE)  BEGIN
DECLARE _vigente INT;
SET _vigente = if(_fch_fin <= NOW(),0,1);
UPDATE lideres 
	SET id_miembro = _id_miembro,
		fecha_inicio = _fch_ini,
		fecha_fin = _fch_fin,
		vigente= _vigente
	WHERE id_lider = _id_lider;
END$$

DROP PROCEDURE IF EXISTS `lideres_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `lideres_mostrar` ()  BEGIN
SELECT l.*, d.departamento, m.fecha_conversion, m.fecha_bautismo, c.cargo,
		CONCAT(p.nombres, ' ',p.apellidos) AS lider ,p.imagen, p.fecha_nacimiento, p.telefono, p.sexo,
		i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, 
		cir.circuito, dis.distrito,
		CASE
			WHEN l.fecha_fin>=NOW()
				THEN CONCAT(year(l.fecha_inicio),'-Actual')
			WHEN year(l.fecha_inicio) = year(l.fecha_fin)
				THEN year(l.fecha_inicio)
			ELSE CONCAT(year(l.fecha_inicio),'-',year(l.fecha_fin))
		END AS periodo
FROM lideres l 
			INNER JOIN departamentos d ON l.id_departamento = d.id_departamento
			INNER JOIN miembros m ON l.id_miembro = m.id_miembro
			INNER JOIN cargos c ON l.id_cargo = c.id_cargo
			INNER JOIN personas p ON m.id_persona = p.id_persona
			INNER JOIN iglesias i ON m.id_iglesia = i.id_iglesia
			INNER JOIN sociedades s ON m.id_sociedad = s.id_sociedad
			INNER JOIN estado_condicion ec ON m.id_estado_condicion = ec.id_estado_condicion
			INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
			INNER JOIN circuitos cir ON i.id_circuito = cir.id_circuito
			INNER JOIN distritos dis ON cir.id_distrito = dis.id_distrito


				;
END$$

DROP PROCEDURE IF EXISTS `miembros_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_buscar` (IN `_miembro` VARCHAR(100))  BEGIN
SELECT m.*, i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, p.nombres, p.apellidos
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado_condicion=ec.id_estado_condicion
				INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
WHERE   CONCAT(p.nombres,' ', p.apellidos) LIKE CONCAT('%', _miembro, '%');
END$$

DROP PROCEDURE IF EXISTS `miembros_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_eliminar` (IN `_id_miembro` INT)  BEGIN
DELETE FROM miembros WHERE id_miembro = _id_miembro; 
END$$

DROP PROCEDURE IF EXISTS `miembros_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_insertar` (IN `_id_persona` INT, `_id_iglesia` INT, `_id_sociedad` INT, `_id_estado_condicion` INT, `_fch_conv` DATE, `_fch_baut` DATE, `_id_rango` INT)  BEGIN
DECLARE fechaini DATE;
DECLARE fechafin DATE;
DECLARE existe INT;

SET fechaini = NOW();
SET fechafin = '3333-12-31';
SET existe = (SELECT COUNT(1) FROM miembros WHERE id_persona = _id_persona);

	INSERT INTO miembros (id_persona, id_iglesia, id_sociedad, id_estado_condicion, fecha_conversion, fecha_bautismo,
 				id_rango_ministerial, fecha_inicio, fecha_fin, ultimo_registro) 
	 		VALUES(_id_persona, _id_iglesia, _id_sociedad, _id_estado_condicion, _fch_conv, _fch_baut, 
	 	_id_rango, fechaini, fechafin, 1);

END$$

DROP PROCEDURE IF EXISTS `miembros_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_modificar` (IN `_id_miembro` INT, `_id_persona` INT, `_id_iglesia` INT, `_id_sociedad` INT, `_id_estado_condicion` INT, `_fch_conv` DATE, `_fch_baut` DATE, `_id_rango` INT, `_fch_ini` DATE, `_fch_fin` DATE, `_ult_reg` INT)  BEGIN
UPDATE miembros 
	SET id_persona = _id_persona,
		id_iglesia = _id_iglesia,
		id_sociedad = _id_sociedad,
		id_estado_condicion = _id_estado_condicion,
		fecha_conversion = _fch_conv,
		fecha_bautismo = _fch_baut,
		id_rango_ministerial = _id_rango,
		fecha_inicio = _fch_ini,
		fecha_fin = _fch_fin,
		ultimo_registro = _ult_reg
	WHERE id_miembro = _id_miembro;
END$$

DROP PROCEDURE IF EXISTS `miembros_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `miembros_mostrar` ()  BEGIN
SELECT m.*, i.iglesia, s.sociedad, ec.estado_condicion, rm.rango_ministerial, p.nombres, p.apellidos
FROM miembros m INNER JOIN personas p ON m.id_persona = p.id_persona 
				INNER JOIN iglesias i ON m.id_iglesia=i.id_iglesia
				INNER JOIN sociedades s ON m.id_sociedad= s.id_sociedad
				INNER JOIN estado_condicion ec ON m.id_estado_condicion=ec.id_estado_condicion
				INNER JOIN rango_ministerial rm ON m.id_rango_ministerial = rm.id_rango
				;
END$$

DROP PROCEDURE IF EXISTS `paises_buscar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `paises_buscar` (IN `_id_pais` INT(10))  BEGIN
SELECT * FROM paises WHERE  id_pais =_id_pais ;
END$$

DROP PROCEDURE IF EXISTS `paises_eliminar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `paises_eliminar` (IN `_id_pais` INT)  BEGIN
DELETE FROM paises WHERE id_pais = _id_pais;
END$$

DROP PROCEDURE IF EXISTS `paises_insertar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `paises_insertar` (IN `_pais` VARCHAR(100))  BEGIN
INSERT INTO paises (pais) VALUES(_pais);
END$$

DROP PROCEDURE IF EXISTS `paises_mostrar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `paises_mostrar` ()  BEGIN
SELECT * FROM paises;
END$$

DROP PROCEDURE IF EXISTS `paises_renombrar`$$
CREATE DEFINER=`aicrd`@`%` PROCEDURE `paises_renombrar` (IN `_id_pais` INT, `_pais` VARCHAR(100))  BEGIN
UPDATE paises SET pais = _pais WHERE id_pais = _id_pais;
END$$

DROP PROCEDURE IF EXISTS `personas_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_buscar` (IN `_nombres_apellidos` VARCHAR(100))  BEGIN
SELECT p.*, pr.provincia, pa.pais 
FROM personas p
	INNER JOIN provincias pr ON p.id_provincia = pr.id_provincia
	INNER JOIN paises pa ON p.id_pais = pa.id_pais
WHERE  p.nombres LIKE  CONCAT('%',_nombres_apellidos,'%') 
	 OR p.apellidos LIKE  CONCAT('%',_nombres_apellidos,'%')
	 OR CONCAT(p.nombres,' ', p.apellidos) LIKE CONCAT('%',_nombres_apellidos,'%');
END$$

DROP PROCEDURE IF EXISTS `personas_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_eliminar` (IN `_id_persona` INT)  BEGIN
DELETE FROM personas WHERE id_persona = _id_persona;
END$$

DROP PROCEDURE IF EXISTS `personas_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_insertar` (IN `_nombres` VARCHAR(100), `_apellidos` VARCHAR(100), `_fch_nac` DATE, `_telefono` VARCHAR(15), `_direccion` VARCHAR(100), `_sexo` VARCHAR(10), `_tipo_documento` VARCHAR(15), `_nro_documento` VARCHAR(20), `_imagen` VARCHAR(100), `_id_provincia` INT, `_id_pais` INT)  BEGIN
INSERT INTO personas (nombres, apellidos, fecha_nacimiento, telefono, direccion, sexo, 
						tipo_documento_identidad, nro_documento_identidad, imagen, id_provincia, id_pais) 
			VALUES(_nombres, _apellidos, _fch_nac, _telefono, _direccion, _sexo, 
				_tipo_documento, _nro_documento, _imagen, _id_provincia, _id_pais);
END$$

DROP PROCEDURE IF EXISTS `personas_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_modificar` (IN `_id_persona` INT, `_nombres` VARCHAR(100), `_apellidos` VARCHAR(100), `_fch_nac` DATE, `_telefono` VARCHAR(15), `_direccion` VARCHAR(100), `_sexo` VARCHAR(10), `_tipo_documento` VARCHAR(15), `_nro_documento` VARCHAR(20), `_imagen` VARCHAR(100), `_id_provincia` INT, `_id_pais` INT)  BEGIN
UPDATE personas 
	SET nombres = _nombres, apellidos = _apellidos, fecha_nacimiento=_fch_nac, 
	telefono = _telefono, direccion = _direccion, sexo = _sexo, 
	tipo_documento_identidad =_tipo_documento, nro_documento_identidad = _nro_documento, 
	imagen = _imagen, id_provincia = _id_provincia, id_pais = _id_pais
WHERE id_persona = _id_persona;
END$$

DROP PROCEDURE IF EXISTS `personas_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `personas_mostrar` ()  BEGIN
SELECT p.*, pr.provincia, pa.pais 
FROM personas p 
	INNER JOIN provincias pr ON p.id_provincia = pr.id_provincia
	INNER JOIN paises pa ON p.id_pais = pa.id_pais
	;
END$$

DROP PROCEDURE IF EXISTS `provincias_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `provincias_buscar` (IN `_id_provincia` INT)  BEGIN
SELECT pr.*, pa.pais
FROM provincias pr 
	 INNER JOIN paises pa ON pr.id_pais = pa.id_pais
WHERE  id_provincia = _id_provincia 
ORDER BY pr.id_pais, pr.provincia ASC;
END$$

DROP PROCEDURE IF EXISTS `provincias_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `provincias_eliminar` (IN `_id_provincia` INT)  BEGIN
DELETE FROM provincias WHERE  id_provincia = _id_provincia;
END$$

DROP PROCEDURE IF EXISTS `provincias_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `provincias_insertar` (IN `_provincia` VARCHAR(100), `_ciudad_cabecera` VARCHAR(100), `_id_pais` INT)  BEGIN
DECLARE nextId INT;
SELECT IFNULL(MAX(id_provincia)+1,1) INTO nextID FROM provincias ; 
INSERT INTO provincias (id_provincia,provincia, ciudad_cabecera, id_pais) VALUES(nextID, _provincia, _ciudad_cabecera, _id_pais);
END$$

DROP PROCEDURE IF EXISTS `provincias_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `provincias_modificar` (IN `_id_provincia` INT, `_provincia` VARCHAR(100), `_ciudad_cabecera` VARCHAR(100))  BEGIN
UPDATE provincias 
	SET provincia = _provincia,
	    ciudad_cabecera = _ciudad_cabecera
	WHERE id_provincia = _id_provincia;
END$$

DROP PROCEDURE IF EXISTS `provincias_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `provincias_mostrar` ()  BEGIN
SELECT pr.*, pa.pais
FROM provincias pr 
	 INNER JOIN paises pa ON pr.id_pais = pa.id_pais
ORDER BY pr.id_pais, pr.provincia ASC;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_buscar` (IN `_id_rango` INT(10))  BEGIN
SELECT * FROM rango_ministerial WHERE  id_rango =_id_rango ;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_eliminar` (IN `_id_rango` INT)  BEGIN
DELETE FROM rango_ministerial WHERE id_rango = _id_rango;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_insertar` (IN `_rango` VARCHAR(100))  BEGIN
INSERT INTO rango_ministerial (rango_ministerial) VALUES(_rango);
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_mostrar` ()  BEGIN
SELECT * FROM rango_ministerial;
END$$

DROP PROCEDURE IF EXISTS `rango_ministerial_renombrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `rango_ministerial_renombrar` (IN `_id_rango` INT, IN `_rango` VARCHAR(100))  BEGIN
UPDATE rango_ministerial SET rango_ministerial = _rango WHERE id_rango = _id_rango;
END$$

DROP PROCEDURE IF EXISTS `registro_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `registro_buscar` (IN `_id_registro` INT)  BEGIN
SELECT    r.id_registro, r.id_servicio, s.nombre_servicio, r.id_distrito, d.distrito 
		, r.id_circuito, c.circuito, r.id_iglesia, i.iglesia, r.id_persona 
		, (SELECT CONCAT(p.nombres, ' ', p.apellidos) FROM personas p WHERE p.id_persona = r.id_persona) AS persona 
		, r.es_miembro_iglesia, r.id_miembro
		, r.es_lider, r.id_lider
		, r.es_miembro_ministerial, r.id_rango_ministerial
		, (SELECT rango_ministerial FROM rango_ministerial WHERE id_rango_ministerial = r.id_rango_ministerial) AS rango_ministerial
		, r.es_pastor, r.es_presbitero, r.es_delegado, r.es_visita, r.es_miembro_comite_temp, r.id_comite_temporero
		, (SELECT comite_temporero FROM comite_temporero WHERE id_comite_temporero = r.id_comite_temporero) AS comite_temporero
		, r.id_cargo_comite
		, (SELECT cargo FROM cargos WHERE id_cargo = r.id_cargo_comite) AS cargo_comite
		, r.es_exonerado, r.razon_exonerado 
		, r.fecha_registro, r.hora_registro
FROM registro r
			INNER JOIN servicios s ON r.id_servicio = s.id_servicio
			INNER JOIN distritos d ON r.id_distrito = d.id_distrito
			INNER JOIN circuitos c ON r.id_circuito = c.id_circuito
			INNER JOIN iglesias i ON r.id_iglesia = i.id_iglesia
			
WHERE   r.id_registro = _id_registro;
END$$

DROP PROCEDURE IF EXISTS `registro_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `registro_eliminar` (IN `_id_registro` INT)  BEGIN
DELETE FROM registro WHERE id_registro = _id_registro; 
END$$

DROP PROCEDURE IF EXISTS `registro_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `registro_insertar` (IN `_id_servicio` INT, `_id_distrito` INT, `_id_circuito` INT, `_id_iglesia` INT, `_id_persona` INT, `_es_miembro_iglesia` INT, `_id_miembro` INT, `_es_lider` INT, `_id_lider` INT, `_es_miembro_ministerial` INT, `_id_rango_ministerial` INT, `_es_pastor` INT, `_es_delegado` INT, `_trabaja_comite` INT, `_id_comite_temporero` INT, `_id_cargo_comite` INT, `_es_exonerado` INT, `_razon_exonerado` VARCHAR(200), `_fecha_registro` DATE, `_hora_registro` TIME, `_es_presbitero` INT, `_es_visita` INT)  BEGIN
	INSERT INTO registro (id_servicio, id_distrito,id_circuito, id_iglesia, id_persona, es_miembro_iglesia, 
							id_miembro, es_lider, id_lider, es_miembro_ministerial, id_rango_ministerial, es_pastor,
							es_delegado, es_miembro_comite_temp, id_comite_temporero, id_cargo_comite, 
							es_exonerado, fecha_registro, hora_registro,es_presbitero, es_visita,razon_exonerado) 
	 		VALUES(_id_servicio, _id_distrito,_id_circuito, _id_iglesia, _id_persona, _es_miembro_iglesia, 
							_id_miembro, _es_lider, _id_lider, _es_miembro_ministerial, _id_rango_ministerial, 
							_es_pastor, _es_delegado, _trabaja_comite, _id_comite_temporero, _id_cargo_comite, 
							_es_exonerado, _fecha_registro, _hora_registro, _es_presbitero, _es_visita,_razon_exonerado);

END$$

DROP PROCEDURE IF EXISTS `registro_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `registro_modificar` (IN `_id_registro` INT, `_id_servicio` INT, `_id_distrito` INT, `_id_circuito` INT, `_id_iglesia` INT, `_id_persona` INT, `_es_miembro_iglesia` INT, `_id_miembro` INT, `_es_lider` INT, `_id_lider` INT, `_es_miembro_ministerial` INT, `_id_rango_ministerial` INT, `_es_pastor` INT, `_es_delegado` INT, `_trabaja_comite` INT, `_id_comite_temporero` INT, `_id_cargo_comite` INT, `_es_exonerado` INT, `_razon_exonerado` VARCHAR(200), `_fecha_registro` DATE, `_hora_registro` TIME, `_es_presbitero` INT, `_es_visita` INT)  BEGIN
UPDATE registro 
	SET id_servicio = _id_servicio,
	    id_distrito = _id_distrito,
	    id_circuito = _id_circuito,
	    id_iglesia = _id_iglesia,
	    id_persona = _id_persona,
	    es_miembro_iglesia = _es_miembro_iglesia,
	    id_miembro = _id_miembro,
	    es_lider = _es_lider,
	    id_lider = _id_lider,
	    es_miembro_ministerial =_es_miembro_ministerial,
	    id_rango_ministerial =_id_rango_ministerial,
	    es_pastor =_es_pastor,
	    es_presbitero = _es_presbitero,
	    es_delegado = _es_delegado,
	    es_visita = _es_visita,
	    es_miembro_comite_temp = _trabaja_comite,
	    id_comite_temporero = _id_comite_temporero,
	    id_cargo_comite = _id_cargo_comite,
	    es_exonerado = _es_exonerado,
	    razon_exonerado = _razon_exonerado,
	    fecha_registro = _fecha_registro,
	    hora_registro = _hora_registro
	WHERE id_registro = _id_registro;
END$$

DROP PROCEDURE IF EXISTS `registro_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `registro_mostrar` ()  BEGIN
SELECT    r.id_registro, r.id_servicio, s.nombre_servicio, r.id_distrito, d.distrito 
		, r.id_circuito, c.circuito, r.id_iglesia, i.iglesia, r.id_persona 
		, (SELECT CONCAT(p.nombres, ' ', p.apellidos) FROM personas p WHERE p.id_persona = r.id_persona) AS persona 
		, r.es_miembro_iglesia, r.id_miembro
		, r.es_lider, r.id_lider
		, r.es_miembro_ministerial, r.id_rango_ministerial
		, (SELECT rango_ministerial FROM rango_ministerial WHERE id_rango_ministerial = r.id_rango_ministerial) AS rango_ministerial
		, r.es_pastor, r.es_presbitero, r.es_delegado, r.es_visita, r.es_miembro_comite_temp, r.id_comite_temporero
		, (SELECT comite_temporero FROM comite_temporero WHERE id_comite_temporero = r.id_comite_temporero) AS comite_temporero
		, r.id_cargo_comite
		, (SELECT cargo FROM cargos WHERE id_cargo = r.id_cargo_comite) AS cargo_comite
		, r.es_exonerado, r.razon_exonerado
		, r.fecha_registro, r.hora_registro
FROM registro r
			INNER JOIN servicios s ON r.id_servicio = s.id_servicio
			INNER JOIN distritos d ON r.id_distrito = d.id_distrito
			INNER JOIN circuitos c ON r.id_circuito = c.id_circuito
			INNER JOIN iglesias i ON r.id_iglesia = i.id_iglesia
			;
END$$

DROP PROCEDURE IF EXISTS `servicios_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `servicios_buscar` (IN `_id_servicio` INT)  BEGIN
SELECT s.id_iglesia, i.iglesia, s.id_departamento, d.departamento, d.cod_departamento,s.id_lider
		, (SELECT CONCAT(p.nombres,' ',p.apellidos) 
			FROM lideres li  
				INNER JOIN miembros m ON li.id_miembro = m.id_miembro
				INNER JOIN personas p ON m.id_persona = p.id_persona 
			WHERE li.id_lider = s.id_lider) as lider 
		, s.cod_servicio
		, s.nombre_servicio
		, s.id_tipo_servicio
		, ts.tipo_servicio
		, ts.cod_tipo_servicio
		, s.descripcion, s.fecha_inicio,s.hora_inicio, s.fecha_fin,s.hora_fin, s.costo 
FROM servicios s
			INNER JOIN departamentos d ON s.id_departamento = d.id_departamento
			INNER JOIN lideres l ON s.id_lider = l.id_lider
			INNER JOIN tipo_servicios ts ON s.id_tipo_servicio = ts.id_tipo_servicio
			INNER JOIN iglesias i ON s.id_iglesia = i.id_iglesia
WHERE   s.id_servicio = _id_servicio;
END$$

DROP PROCEDURE IF EXISTS `servicios_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `servicios_eliminar` (IN `_id_servicio` INT)  BEGIN
DELETE FROM servicios WHERE id_servicio = _id_servicio; 
END$$

DROP PROCEDURE IF EXISTS `servicios_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `servicios_insertar` (IN `_nombre_servicio` VARCHAR(100), `_id_tipo_servicio` INT, `_cod_servicio` VARCHAR(30), `_desc_servicio` VARCHAR(200), `_fch_ini` DATE, `_hora_ini` TIME, `_fch_fin` DATE, `_hora_fin` TIME, `_id_depart` INT, `_id_lider` INT, `_id_iglesia` INT, `_costo` INT)  BEGIN
	INSERT INTO servicios (nombre_servicio, id_tipo_servicio,cod_servicio, descripcion, fecha_inicio, hora_inicio, fecha_fin, hora_fin, 
							id_departamento, id_lider, id_iglesia, costo) 
	 		VALUES(_nombre_servicio, _id_tipo_servicio,_cod_servicio, _desc_servicio, _fch_ini,_hora_ini, _fch_fin,_hora_fin,
	 				_id_depart, _id_lider, _id_iglesia,_costo);

END$$

DROP PROCEDURE IF EXISTS `servicios_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `servicios_modificar` (IN `_id_servicio` INT, `_id_tipo_servicio` INT, `_nombre_servicio` VARCHAR(100), `_cod_servicio` VARCHAR(30), `_desc_servicio` VARCHAR(200), `_fch_ini` DATE, `_hora_ini` TIME, `_fch_fin` DATE, `_hora_fin` TIME, `_id_depart` INT, `_id_lider` INT, `_id_iglesia` INT, `_costo` INT)  BEGIN
UPDATE servicios 
	SET nombre_servicio = _nombre_servicio,
		id_departamento = _id_depart,
		id_lider = _id_lider,
		id_iglesia = _id_iglesia,
		cod_servicio = _cod_servicio,
		ID_TIPO_SERVICIO = _id_tipo_servicio,
		descripcion = _desc_servicio,
		fecha_inicio = _fch_ini,
		hora_inicio = _hora_ini,
		fecha_fin = _fch_fin,
		hora_fin = _fch_fin,
		costo= _costo
	WHERE id_servicio = _id_servicio;
END$$

DROP PROCEDURE IF EXISTS `servicios_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `servicios_mostrar` ()  BEGIN
SELECT s.id_iglesia, i.iglesia, s.id_departamento, d.departamento, d.cod_departamento,s.id_lider
		, (SELECT CONCAT(p.nombres,' ',p.apellidos) 
			FROM lideres li  
				INNER JOIN miembros m ON li.id_miembro = m.id_miembro
				INNER JOIN personas p ON m.id_persona = p.id_persona 
			WHERE li.id_lider = s.id_lider) as lider 
		, s.cod_servicio
		, s.nombre_servicio
		, s.id_tipo_servicio
		, ts.tipo_servicio
		, ts.cod_tipo_servicio
		, s.descripcion, s.fecha_inicio,s.hora_inicio, s.fecha_fin,s.hora_fin, s.costo 
FROM servicios s
			INNER JOIN departamentos d ON s.id_departamento = d.id_departamento
			INNER JOIN lideres l ON s.id_lider = l.id_lider
			INNER JOIN tipo_servicios ts ON s.id_tipo_servicio = ts.id_tipo_servicio
			INNER JOIN iglesias i ON s.id_iglesia = i.id_iglesia;
END$$

DROP PROCEDURE IF EXISTS `sociedades_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_buscar` (IN `_id_sociedad` INT)  BEGIN
SELECT * FROM sociedades WHERE  id_sociedad = _id_sociedad ;
END$$

DROP PROCEDURE IF EXISTS `sociedades_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_eliminar` (IN `_id_sociedad` INT)  BEGIN
DELETE FROM sociedades WHERE id_sociedad = _id_sociedad;
END$$

DROP PROCEDURE IF EXISTS `sociedades_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_insertar` (IN `_siglas` VARCHAR(10), `_sociedad` VARCHAR(100), `_lema` VARCHAR(100), `_descripcion` VARCHAR(200))  BEGIN
INSERT INTO sociedades (siglas, sociedad, lema, descripcion) VALUES(_siglas, _sociedad, _lema, _descripcion);
END$$

DROP PROCEDURE IF EXISTS `sociedades_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_modificar` (IN `_siglas` VARCHAR(10), `_sociedad` VARCHAR(100), `_lema` VARCHAR(100), `_descripcion` VARCHAR(200), `_id_sociedad` INT)  BEGIN
UPDATE sociedades 
	SET sociedad = _sociedad, 
	siglas = _siglas,
	lema = _lema,
	descripcion = _descripcion
WHERE id_sociedad = _id_sociedad;
END$$

DROP PROCEDURE IF EXISTS `sociedades_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `sociedades_mostrar` ()  BEGIN
SELECT * FROM sociedades;
END$$

DROP PROCEDURE IF EXISTS `tandas_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tandas_buscar` (IN `_tanda` VARCHAR(100))  BEGIN
SELECT * FROM tandas WHERE  tanda LIKE  CONCAT('%',_tanda,'%') ;
END$$

DROP PROCEDURE IF EXISTS `tandas_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tandas_eliminar` (IN `_id_tanda` INT)  BEGIN
DELETE FROM tandas WHERE id_tanda = _id_tanda;
END$$

DROP PROCEDURE IF EXISTS `tandas_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tandas_insertar` (IN `_tanda` VARCHAR(100))  BEGIN
INSERT INTO tandas (tanda) VALUES(_tanda);
END$$

DROP PROCEDURE IF EXISTS `tandas_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tandas_modificar` (IN `_id_tanda` INT, `_tanda` VARCHAR(100))  BEGIN
UPDATE tandas SET tanda = _tanda WHERE id_tanda = _id_tanda;
END$$

DROP PROCEDURE IF EXISTS `tandas_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tandas_mostrar` ()  BEGIN
SELECT * FROM tandas;
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_buscar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_buscar` (IN `_id_tipo_servicio` INT(10))  BEGIN
SELECT * FROM tipo_servicios 
WHERE  id_tipo_servicio =_id_tipo_servicio ;
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_eliminar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_eliminar` (IN `_id_tipo_servicio` INT)  BEGIN
DELETE FROM tipo_servicios WHERE id_tipo_servicio = _id_tipo_servicio;
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_insertar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_insertar` (IN `_cod_tipo_servicio` VARCHAR(100), IN `_tipo_servicio` VARCHAR(100))  BEGIN
INSERT INTO tipo_servicios (cod_tipo_servicio, tipo_servicio) VALUES(_cod_tipo_servicio, _tipo_servicio);
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_modificar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_modificar` (IN `_id_tipo_servicio` INT, IN `_cod_tipo_servicio` VARCHAR(100), IN `_tipo_servicio` VARCHAR(100))  BEGIN
UPDATE tipo_servicios 
SET tipo_servicio = _tipo_servicio, 
    cod_tipo_servicio = _cod_tipo_servicio
WHERE id_tipo_servicio = _id_tipo_servicio;
END$$

DROP PROCEDURE IF EXISTS `tipo_servicios_mostrar`$$
CREATE DEFINER=`aicrd`@`localhost` PROCEDURE `tipo_servicios_mostrar` ()  BEGIN
SELECT * FROM tipo_servicios;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `asistencias`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `asistencias`;
CREATE TABLE `asistencias` (
  `id_asistencia` int(10) NOT NULL,
  `id_registro` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `id_tanda` int(10) NOT NULL,
  `fecha_transaccion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cargos`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE `cargos` (
  `id_cargo` int(10) NOT NULL,
  `cargo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `cargo`) VALUES
(28, 'Asesor(a)'),
(10, 'Co-Pastor(a)'),
(24, 'Cuarto(a) Diacono'),
(19, 'Cuarto(a) Vocal'),
(15, 'Director(a)'),
(9, 'Pastor(a)'),
(11, 'Presbitero'),
(26, 'Presidente'),
(21, 'Primer(a) Diacono'),
(16, 'Primer(a) Vocal'),
(25, 'Quinto(a) Diacono'),
(20, 'Quinto(a) Vocal'),
(7, 'Relacionador Publico'),
(2, 'Secretario/a'),
(22, 'Segundo(a) Diacono'),
(17, 'Segundo(a) Vocal'),
(4, 'Sub-Secretario(a)'),
(6, 'Sub-Tesorero(a)'),
(12, 'Superintendente'),
(23, 'Tercer(a) Diacono'),
(18, 'Tercer(a) Vocal'),
(5, 'Tesorero(a)'),
(1, 'Vice-Presidente');

-- --------------------------------------------------------

--
-- Table structure for table `circuitos`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `circuitos`;
CREATE TABLE `circuitos` (
  `id_distrito` int(10) NOT NULL,
  `id_circuito` int(10) NOT NULL,
  `circuito` varchar(100) NOT NULL,
  `id_provincia` int(10) NOT NULL,
  `id_provincia2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `circuitos`
--

INSERT INTO `circuitos` (`id_distrito`, `id_circuito`, `circuito`, `id_provincia`, `id_provincia2`) VALUES
(1, 1, 'Higuey', 1, NULL),
(1, 2, 'Bani-Azua', 10, NULL),
(1, 3, 'San Cristobal Centro', 7, NULL),
(1, 4, 'San Cristobal Oeste', 7, NULL),
(1, 5, 'Haina', 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comite_temporero`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `comite_temporero`;
CREATE TABLE `comite_temporero` (
  `id_comite_temporero` int(10) NOT NULL,
  `comite_temporero` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comite_temporero`
--

INSERT INTO `comite_temporero` (`id_comite_temporero`, `comite_temporero`) VALUES
(1, 'Registro');

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `id_departamento` int(10) NOT NULL,
  `cod_departamento` varchar(15) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `cod_departamento`, `departamento`, `descripcion`) VALUES
(2, 'ACAIC', 'Caballeros', 'Mujeres Casadas o mayores de 35 a&ntilde;os'),
(3, 'EBAIC', 'Escuela Biblica', 'Educacion Cristiana'),
(5, 'ANAIC', 'Ninos', 'Ninios menores de 12 anios'),
(6, 'AJUVAIC', 'Juveniles', 'Para las actividades dirigidas por las personas miembros de la sociedad de juveniles');

-- --------------------------------------------------------

--
-- Table structure for table `distritos`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `distritos`;
CREATE TABLE `distritos` (
  `id_pais` int(10) NOT NULL,
  `id_distrito` int(10) NOT NULL,
  `distrito` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distritos`
--

INSERT INTO `distritos` (`id_pais`, `id_distrito`, `distrito`) VALUES
(1, 1, 'Republica Dominicana');

-- --------------------------------------------------------

--
-- Table structure for table `estado_condicion`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `estado_condicion`;
CREATE TABLE `estado_condicion` (
  `id_estado_condicion` int(10) NOT NULL,
  `estado_condicion` varchar(100) NOT NULL,
  `elegible_lider` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estado_condicion`
--

INSERT INTO `estado_condicion` (`id_estado_condicion`, `estado_condicion`, `elegible_lider`) VALUES
(1, 'Bautizado Activo', 1),
(2, 'Visita', 0),
(5, 'Bautizado Pasivo', 1),
(6, 'En Disciplina', 0),
(7, 'Descarriado', 0);

-- --------------------------------------------------------

--
-- Table structure for table `iglesias`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `iglesias`;
CREATE TABLE `iglesias` (
  `id_iglesia` int(10) NOT NULL,
  `iglesia` varchar(100) NOT NULL,
  `id_circuito` int(10) NOT NULL,
  `id_provincia` int(10) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fundador` varchar(100) DEFAULT NULL,
  `fecha_fundada` date DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iglesias`
--

INSERT INTO `iglesias` (`id_iglesia`, `iglesia`, `id_circuito`, `id_provincia`, `direccion`, `telefono`, `fundador`, `fecha_fundada`, `imagen`) VALUES
(1, 'Iglesia Evangelica Fraternal', 1, 1, 'Calle Principal No. 18, Los Molina', '8095287401', 'Federico Claudio Alvarez', '1990-01-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lideres`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `lideres`;
CREATE TABLE `lideres` (
  `id_lider` int(15) NOT NULL,
  `id_departamento` int(10) NOT NULL,
  `id_miembro` int(10) NOT NULL,
  `id_cargo` int(10) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `vigente` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lideres`
--

INSERT INTO `lideres` (`id_lider`, `id_departamento`, `id_miembro`, `id_cargo`, `fecha_inicio`, `fecha_fin`, `vigente`) VALUES
(1, 2, 1, 1, '2018-01-01', '2019-12-31', 1),
(2, 1, 1, 1, '2015-01-01', '2016-12-31', 0),
(3, 1, 1, 1, '2017-01-01', '2018-12-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `miembros`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `miembros`;
CREATE TABLE `miembros` (
  `id_miembro` int(15) NOT NULL,
  `id_persona` int(10) NOT NULL,
  `id_iglesia` int(10) NOT NULL,
  `id_sociedad` int(10) NOT NULL,
  `id_estado_condicion` int(10) NOT NULL,
  `fecha_conversion` date DEFAULT NULL,
  `fecha_bautismo` date DEFAULT NULL,
  `id_rango_ministerial` int(10) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL DEFAULT '3333-12-31',
  `ultimo_registro` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miembros`
--

INSERT INTO `miembros` (`id_miembro`, `id_persona`, `id_iglesia`, `id_sociedad`, `id_estado_condicion`, `fecha_conversion`, `fecha_bautismo`, `id_rango_ministerial`, `fecha_inicio`, `fecha_fin`, `ultimo_registro`) VALUES
(1, 1, 1, 1, 1, '1990-03-19', '1992-10-19', 1, '2018-04-28', '3333-12-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paises`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE `paises` (
  `id_pais` int(10) NOT NULL,
  `pais` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paises`
--

INSERT INTO `paises` (`id_pais`, `pais`) VALUES
(1, 'Republica Dominicana'),
(5, 'Estados Unidos de America'),
(6, 'Espana');

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `personas`;
CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `id_provincia` int(10) NOT NULL,
  `id_pais` int(10) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `tipo_documento_identidad` varchar(15) DEFAULT NULL,
  `nro_documento_identidad` varchar(20) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` (`id_persona`, `nombres`, `apellidos`, `fecha_nacimiento`, `telefono`, `direccion`, `id_provincia`, `id_pais`, `sexo`, `tipo_documento_identidad`, `nro_documento_identidad`, `imagen`) VALUES
(1, 'Francisco', 'Brujan Arias', '1977-04-06', '8094232642', 'calle 19 Marzo No. 16, Los Molina', 1, 1, 'Masculino', 'Cedula', '002-0097492-1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `id_provincia` int(10) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `ciudad_cabecera` varchar(200) DEFAULT 'NULL',
  `id_pais` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provincias`
--

INSERT INTO `provincias` (`id_provincia`, `provincia`, `ciudad_cabecera`, `id_pais`) VALUES
(1, 'La Altagracia', 'Salvaleon de Higuey', 1),
(2, 'Santiago', '', 1),
(3, 'Puerto Plata', '', 1),
(4, 'Santo Domingo Este', '', 1),
(5, 'Santo Domingo Oeste', '', 1),
(6, 'San Pedro Macoris', '', 1),
(7, 'San Cristobal', 'San Cristobal', 1),
(8, 'Chicago', 'Chicago', 5),
(9, 'San Jose de Ocoa', 'San Jose de Ocoa', 1),
(10, 'Peravia', 'Bani', 1),
(11, 'San Juan', 'San Juan de la Maguana', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rango_ministerial`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `rango_ministerial`;
CREATE TABLE `rango_ministerial` (
  `id_rango` int(10) NOT NULL,
  `rango_ministerial` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rango_ministerial`
--

INSERT INTO `rango_ministerial` (`id_rango`, `rango_ministerial`) VALUES
(1, 'Miembro Laico');

-- --------------------------------------------------------

--
-- Table structure for table `registro`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE `registro` (
  `id_registro` int(10) NOT NULL,
  `id_servicio` int(10) NOT NULL,
  `id_distrito` int(10) NOT NULL,
  `id_circuito` int(10) NOT NULL,
  `id_iglesia` int(10) NOT NULL,
  `id_persona` int(10) NOT NULL,
  `es_miembro_iglesia` int(1) NOT NULL DEFAULT '0',
  `id_miembro` int(10) DEFAULT NULL,
  `es_lider` int(1) NOT NULL DEFAULT '0',
  `id_lider` int(10) DEFAULT NULL,
  `es_miembro_ministerial` int(1) NOT NULL DEFAULT '0',
  `id_rango_ministerial` int(10) DEFAULT NULL,
  `es_pastor` int(1) NOT NULL DEFAULT '0',
  `es_presbitero` int(11) NOT NULL DEFAULT '0',
  `es_delegado` int(1) NOT NULL DEFAULT '0',
  `es_visita` int(11) NOT NULL DEFAULT '0',
  `es_miembro_comite_temp` int(1) NOT NULL DEFAULT '0',
  `id_comite_temporero` int(10) DEFAULT NULL,
  `id_cargo_comite` int(10) DEFAULT NULL,
  `es_exonerado` int(1) NOT NULL DEFAULT '0',
  `razon_exonerado` varchar(200) DEFAULT 'NULL',
  `fecha_registro` date NOT NULL,
  `hora_registro` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registro`
--

INSERT INTO `registro` (`id_registro`, `id_servicio`, `id_distrito`, `id_circuito`, `id_iglesia`, `id_persona`, `es_miembro_iglesia`, `id_miembro`, `es_lider`, `id_lider`, `es_miembro_ministerial`, `id_rango_ministerial`, `es_pastor`, `es_presbitero`, `es_delegado`, `es_visita`, `es_miembro_comite_temp`, `id_comite_temporero`, `id_cargo_comite`, `es_exonerado`, `razon_exonerado`, `fecha_registro`, `hora_registro`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 'Trabaja en Comite', '2018-01-01', '20:18:00'),
(4, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 'Trabaja en Comite', '2018-01-01', '20:18:00'),
(5, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 'Trabaja en comite Temporero', '2018-01-01', '20:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `servicios`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `id_servicio` int(15) NOT NULL,
  `id_tipo_servicio` int(10) NOT NULL,
  `nombre_servicio` varchar(100) NOT NULL,
  `cod_servicio` varchar(30) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_departamento` int(10) NOT NULL,
  `id_lider` int(10) NOT NULL,
  `id_iglesia` int(10) NOT NULL,
  `costo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `id_tipo_servicio`, `nombre_servicio`, `cod_servicio`, `descripcion`, `fecha_inicio`, `fecha_fin`, `hora_inicio`, `hora_fin`, `id_departamento`, `id_lider`, `id_iglesia`, `costo`) VALUES
(1, 1, 'Culto de Sociedad de Damas', 'ORAC-ADAIC-2018-05-03', 'Culto dirigido por la sociedad de damas', '2018-05-03', '2018-05-03', '19:00:00', '22:00:00', 1, 1, 1, 200),
(3, 1, 'Culto de Sociedad de Caballeros', 'ORAC-ACAIC-2018-05-04', 'Culto dirigido por la sociedad de caballeros', '2018-05-04', '2018-05-04', '19:00:00', '22:00:00', 2, 1, 1, 200);

-- --------------------------------------------------------

--
-- Table structure for table `sociedades`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `sociedades`;
CREATE TABLE `sociedades` (
  `id_sociedad` int(10) NOT NULL,
  `siglas` varchar(10) NOT NULL,
  `sociedad` varchar(100) NOT NULL,
  `lema` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sociedades`
--

INSERT INTO `sociedades` (`id_sociedad`, `siglas`, `sociedad`, `lema`, `descripcion`) VALUES
(1, 'ADAIC', 'Sociedad de Damas', 'Portadoras de Luz', 'Mujeres casadas o mayores de 35 a&ntilde;os'),
(2, 'ACAIC', 'Sociedad de Caballeros', 'Embajadores del Rey', 'Formada por hombres casados, viudos, divorciados o mayores de 35 a&ntilde;os de edad'),
(5, 'ANAIC', 'Sociedad de Ni????os', 'Joyas de Cristo', 'Ni????os');

-- --------------------------------------------------------

--
-- Table structure for table `tandas`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `tandas`;
CREATE TABLE `tandas` (
  `id_tanda` int(10) NOT NULL,
  `tanda` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tandas`
--

INSERT INTO `tandas` (`id_tanda`, `tanda`) VALUES
(1, 'Matutina');

-- --------------------------------------------------------

--
-- Table structure for table `tblalumno`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `tblalumno`;
CREATE TABLE `tblalumno` (
  `id` int(11) NOT NULL,
  `matricula` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `paterno` varchar(50) NOT NULL,
  `materno` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblalumno`
--

INSERT INTO `tblalumno` (`id`, `matricula`, `nombre`, `paterno`, `materno`) VALUES
(1, '13-sisn-1-056', 'Francisco', 'Brujan', 'Arias'),
(2, '12-mist-1-057', 'Clarivel Jacqueline', 'Batel', 'Ramirez');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_servicios`
--
-- Creation: May 14, 2018 at 02:58 PM
--

DROP TABLE IF EXISTS `tipo_servicios`;
CREATE TABLE `tipo_servicios` (
  `id_tipo_servicio` int(10) NOT NULL,
  `cod_tipo_servicio` varchar(6) NOT NULL,
  `tipo_servicio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo_servicios`
--

INSERT INTO `tipo_servicios` (`id_tipo_servicio`, `cod_tipo_servicio`, `tipo_servicio`) VALUES
(3, 'CONF', 'Conferencia'),
(4, 'CONC', 'Concierto'),
(5, 'CONV', 'Convencion');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD UNIQUE KEY `asistencia` (`id_registro`,`fecha`,`id_tanda`);

--
-- Indexes for table `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id_cargo`),
  ADD UNIQUE KEY `cargo` (`cargo`);

--
-- Indexes for table `circuitos`
--
ALTER TABLE `circuitos`
  ADD PRIMARY KEY (`id_circuito`),
  ADD UNIQUE KEY `circuito` (`id_distrito`,`circuito`);

--
-- Indexes for table `comite_temporero`
--
ALTER TABLE `comite_temporero`
  ADD PRIMARY KEY (`id_comite_temporero`),
  ADD UNIQUE KEY `comite_temporero` (`comite_temporero`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_departamento`),
  ADD UNIQUE KEY `departamento` (`departamento`);

--
-- Indexes for table `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`id_distrito`),
  ADD UNIQUE KEY `distrito` (`id_pais`,`distrito`);

--
-- Indexes for table `estado_condicion`
--
ALTER TABLE `estado_condicion`
  ADD PRIMARY KEY (`id_estado_condicion`),
  ADD UNIQUE KEY `estado` (`estado_condicion`);

--
-- Indexes for table `iglesias`
--
ALTER TABLE `iglesias`
  ADD PRIMARY KEY (`id_iglesia`),
  ADD UNIQUE KEY `iglesia` (`iglesia`,`id_circuito`,`id_provincia`);

--
-- Indexes for table `lideres`
--
ALTER TABLE `lideres`
  ADD PRIMARY KEY (`id_lider`),
  ADD UNIQUE KEY `id_departamento` (`id_departamento`,`id_miembro`,`id_cargo`,`fecha_inicio`);

--
-- Indexes for table `miembros`
--
ALTER TABLE `miembros`
  ADD PRIMARY KEY (`id_miembro`),
  ADD UNIQUE KEY `miembro_persona` (`id_persona`);

--
-- Indexes for table `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indexes for table `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `persona` (`nombres`,`apellidos`,`id_provincia`,`id_pais`) USING BTREE;

--
-- Indexes for table `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id_provincia`),
  ADD UNIQUE KEY `provincia` (`id_pais`,`provincia`);

--
-- Indexes for table `rango_ministerial`
--
ALTER TABLE `rango_ministerial`
  ADD PRIMARY KEY (`id_rango`),
  ADD UNIQUE KEY `rango_ministerial` (`rango_ministerial`);

--
-- Indexes for table `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id_registro`),
  ADD UNIQUE KEY `id_servicio` (`id_servicio`,`id_persona`);

--
-- Indexes for table `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD UNIQUE KEY `nombre_servicio` (`nombre_servicio`,`fecha_inicio`,`id_iglesia`,`hora_inicio`);

--
-- Indexes for table `sociedades`
--
ALTER TABLE `sociedades`
  ADD PRIMARY KEY (`id_sociedad`),
  ADD UNIQUE KEY `sociedad_siglas` (`siglas`),
  ADD UNIQUE KEY `sociedad_nombre` (`sociedad`);

--
-- Indexes for table `tandas`
--
ALTER TABLE `tandas`
  ADD PRIMARY KEY (`id_tanda`),
  ADD UNIQUE KEY `tanda` (`tanda`);

--
-- Indexes for table `tblalumno`
--
ALTER TABLE `tblalumno`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD UNIQUE KEY `nombre` (`nombre`,`paterno`,`materno`);

--
-- Indexes for table `tipo_servicios`
--
ALTER TABLE `tipo_servicios`
  ADD PRIMARY KEY (`id_tipo_servicio`),
  ADD UNIQUE KEY `tipo_servicio` (`tipo_servicio`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `id_asistencia` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id_cargo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `comite_temporero`
--
ALTER TABLE `comite_temporero`
  MODIFY `id_comite_temporero` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id_departamento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `estado_condicion`
--
ALTER TABLE `estado_condicion`
  MODIFY `id_estado_condicion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `iglesias`
--
ALTER TABLE `iglesias`
  MODIFY `id_iglesia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lideres`
--
ALTER TABLE `lideres`
  MODIFY `id_lider` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `miembros`
--
ALTER TABLE `miembros`
  MODIFY `id_miembro` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `paises`
--
ALTER TABLE `paises`
  MODIFY `id_pais` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `rango_ministerial`
--
ALTER TABLE `rango_ministerial`
  MODIFY `id_rango` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `registro`
--
ALTER TABLE `registro`
  MODIFY `id_registro` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sociedades`
--
ALTER TABLE `sociedades`
  MODIFY `id_sociedad` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tandas`
--
ALTER TABLE `tandas`
  MODIFY `id_tanda` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tblalumno`
--
ALTER TABLE `tblalumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tipo_servicios`
--
ALTER TABLE `tipo_servicios`
  MODIFY `id_tipo_servicio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;--
-- Database: `aicrd`
--
DROP DATABASE IF EXISTS `aicrd`;
CREATE DATABASE IF NOT EXISTS `aicrd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE aicrd;

-- --------------------------------------------------------

--
-- Table structure for table `aic_actividad`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_actividad`;
CREATE TABLE `aic_actividad` (
  `id_actividad` varchar(30) NOT NULL,
  `id_tipo_actividad` varchar(40) NOT NULL,
  `id_asociacion` varchar(20) DEFAULT NULL,
  `distrito` int(2) NOT NULL,
  `titulo` varchar(40) NOT NULL,
  `descripcion` varchar(70) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `costo` int(7) NOT NULL DEFAULT '0',
  `usuario` varchar(15) NOT NULL
) ENGINE=MyISAM AVG_ROW_LENGTH=16384 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_actividad`
--

INSERT INTO `aic_actividad` (`id_actividad`, `id_tipo_actividad`, `id_asociacion`, `distrito`, `titulo`, `descripcion`, `direccion`, `desde`, `hasta`, `costo`, `usuario`) VALUES
('CONV-ACAIC-2012', 'CONV', 'ACAIC', 1, 'Convencion Caballeros 2012', 'Convencion Asociacion de Caballeros Republica Dominicana 2012', 'Centro Conferencial MICMAS Escondido Bani', '2012-04-25', '2012-04-25', 500, 'fbrujan'),
('CONV-ADAIC-2012', 'CONV', 'ADAIC', 1, 'Convencion Nacional de Damas 2012', 'Convencion Asociacion de Damas Republica Dominicana 2012', 'Centro Conferencial MICMAS Escondido Bani', '2012-04-21', '2012-04-24', 0, ''),
('CONV-AICINC-2012', 'CONV', 'AICINC', 1, 'Convencion Nacional AICINC 2012', 'Convencion ASAMBLEA DE IGLESIAS CRISTIANAS Republica Dominicana 2012', 'Centro Conferencial MICMAS Escondido Bani', '2012-05-09', '2012-05-12', 750, 'fbrujan'),
('CAMP-AICINC-2012', 'CAMP', 'AICINC', 1, 'Taller Asociaciones', 'Campamento ASAMBLEA DE IGLESIAS CRISTIANAS Republica Dominicana 2012', 'Bona', '2012-06-09', '2012-06-12', 1500, 'fbrujan'),
('SIMPOSIO-2012', 'CAMP', 'AICINC', 1, 'Simposio Nacional de Escuelas Biblicas', 'Campamento ASAMBLEA DE IGLESIAS CRISTIANAS Republica Dominicana 2012', 'Iglesia Luz de la Esperanza', '2012-10-20', '2012-10-21', 500, 'fbrujan'),
('CONV-AICINC-2013', 'CONV', 'AICINC', 1, 'Convencion General 2013', 'Convencion ASAMBLEA DE IGLESIAS CRISTIANAS Republica Dominicana 2012', 'Iglesia Luz de la Esperanza Puerto Plata', '2012-12-03', '2012-12-05', 800, 'fbrujan'),
('CONV-AJAIC-2013', 'CONV', 'AJAIC', 1, 'Convencion Nacional Jovenes 2013', 'Convencion Asociacion de Jovenes Republica Dominicana 2013', 'Campamento MICMAS, Escondido, Bani', '2013-01-11', '2013-01-12', 500, 'fbrujan'),
('CAMP-AICINC-2016', 'CAMP', 'AICINC', 1, 'Campamento Juvenil 2015', 'Campamento ASAMBLEA DE IGLESIAS CRISTIANAS Republica Dominicana 2016', 'bayaguana repu', '2016-03-29', '2016-03-31', 500, 'fbrujan');

-- --------------------------------------------------------

--
-- Table structure for table `aic_asistencia`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_asistencia`;
CREATE TABLE `aic_asistencia` (
  `id_asistencia` int(8) NOT NULL,
  `id_actividad` varchar(20) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `id_registro` int(10) DEFAULT NULL,
  `fecha_asistencia` date NOT NULL,
  `tanda` varchar(10) DEFAULT NULL,
  `usuario` varchar(15) DEFAULT NULL
) ENGINE=MyISAM AVG_ROW_LENGTH=227 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_asistencia`
--

INSERT INTO `aic_asistencia` (`id_asistencia`, `id_actividad`, `fecha_registro`, `id_registro`, `fecha_asistencia`, `tanda`, `usuario`) VALUES
(29, 'CONV-ADAIC-2012', '2012-04-24', 5, '2012-04-26', 'Ma????????ana', 'fbrujan'),
(30, 'CONV-ADAIC-2012', '2012-04-24', 5, '2012-04-26', 'Tarde', 'fbrujan'),
(31, 'CONV-ADAIC-2012', '2012-04-24', 5, '2012-04-27', 'Ma????????ana', 'fbrujan'),
(32, 'CONV-ADAIC-2012', '2012-04-24', 5, '2012-04-26', 'Noche', 'fbrujan'),
(33, 'CONV-ADAIC-2012', '2012-04-21', 1, '2012-04-26', 'Ma????????ana', 'fbrujan'),
(34, 'CONV-ADAIC-2012', '2012-04-21', 1, '2012-04-26', 'Tarde', 'fbrujan'),
(35, 'CONV-ADAIC-2012', '2012-04-21', 1, '2012-04-26', 'Noche', 'fbrujan'),
(36, 'CONV-ADAIC-2012', '2012-04-21', 4, '2012-04-26', 'Ma????????ana', 'fbrujan'),
(37, 'CONV-ADAIC-2012', '2012-04-21', 4, '2012-04-26', 'Tarde', 'fbrujan'),
(38, 'CONV-ADAIC-2012', '2012-04-21', 1, '2012-04-27', 'Ma????????ana', 'fbrujan'),
(39, 'CONV-ADAIC-2012', '2012-04-26', 7, '2012-04-26', 'Matutina', 'fbrujan'),
(40, 'CONV-ADAIC-2012', '2012-04-26', 8, '2012-04-26', 'Vespertina', 'fbrujan'),
(41, 'CONV-ADAIC-2012', '2012-04-27', 9, '2012-04-27', 'Matutina', 'fbrujan'),
(42, 'CONV-ACAIC-2012', '2012-04-27', 10, '2012-04-27', 'Matutina', 'cbatel'),
(43, 'CONV-ACAIC-2012', '2012-04-27', 10, '2012-04-27', 'Ma????????ana', 'cbatel'),
(44, 'CONV-ACAIC-2012', '2012-04-27', 10, '2012-04-27', 'Tarde', 'cbatel'),
(45, 'CONV-ACAIC-2012', '2012-04-27', 10, '2012-04-27', 'Noche', 'cbatel'),
(48, 'CONV-ACAIC-2012', '2012-04-27', 10, '2012-04-28', 'Ma????????ana', 'cbatel'),
(49, 'CONV-ADAIC-2012', '2012-04-21', 5, '2012-04-30', 'Ma????????ana', 'splacencio'),
(50, 'CONV-ADAIC-2012', '2012-04-30', 11, '2012-04-30', 'Ma????????ana', 'fbrujan'),
(51, 'CONV-ADAIC-2012', '2012-04-30', 12, '2012-04-30', 'Ma????????ana', 'fbrujan'),
(52, 'CONV-ADAIC-2012', '2012-04-30', 13, '2012-04-30', 'Ma????????ana', 'fbrujan'),
(53, 'CONV-ADAIC-2012', '2012-04-30', 14, '2012-04-30', 'Ma????????ana', 'benita'),
(54, 'CONV-ADAIC-2012', '2012-04-30', 14, '2012-04-30', 'Tarde', 'benita'),
(55, 'CONV-ADAIC-2012', '0000-00-00', 4, '2012-04-30', 'Tarde', 'benita'),
(56, 'CONV-ADAIC-2012', '2012-04-30', 5, '2012-04-30', 'Tarde', 'benita'),
(57, 'CONV-ADAIC-2012', '2012-04-30', 12, '2012-05-02', 'Matutina', 'fbrujan'),
(58, 'SIMPOSIO-2012', '2012-10-20', 15, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(59, 'SIMPOSIO-2012', '2012-10-20', 16, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(60, 'SIMPOSIO-2012', '2012-10-20', 17, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(61, 'SIMPOSIO-2012', '2012-10-20', 18, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(62, 'SIMPOSIO-2012', '2012-10-20', 19, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(63, 'SIMPOSIO-2012', '2012-10-20', 20, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(64, 'SIMPOSIO-2012', '2012-10-20', 21, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(65, 'SIMPOSIO-2012', '2012-10-20', 22, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(66, 'SIMPOSIO-2012', '2012-10-20', 23, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(67, 'SIMPOSIO-2012', '2012-10-20', 24, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(68, 'SIMPOSIO-2012', '2012-10-20', 25, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(69, 'SIMPOSIO-2012', '2012-10-20', 26, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(70, 'SIMPOSIO-2012', '2012-10-20', 27, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(71, 'SIMPOSIO-2012', '2012-10-20', 28, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(72, 'SIMPOSIO-2012', '2012-10-20', 29, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(73, 'SIMPOSIO-2012', '2012-10-20', 30, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(74, 'SIMPOSIO-2012', '2012-10-20', 31, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(75, 'SIMPOSIO-2012', '2012-10-20', 32, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(76, 'SIMPOSIO-2012', '2012-10-20', 33, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(77, 'SIMPOSIO-2012', '2012-10-20', 34, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(78, 'SIMPOSIO-2012', '2012-10-20', 35, '2012-10-20', 'Ma????????ana', 'fbrujan'),
(79, 'CONV-AICINC-2013', '2012-12-03', 36, '2012-12-03', 'Ma????????ana', 'fbrujan'),
(80, 'CONV-AJAIC-2013', '2013-01-11', 37, '2013-01-11', 'Ma????????ana', 'fbrujan'),
(81, 'CONV-AJAIC-2013', '2013-01-11', 38, '2013-01-11', 'Ma????????ana', 'fbrujan'),
(82, 'CONV-AICINC-2013', '2013-05-21', 39, '2013-05-21', 'Ma????????ana', 'fbrujan'),
(83, 'CONV-AICINC-2013', '2013-05-21', 40, '2013-05-21', 'Ma????????ana', 'fbrujan'),
(84, 'CONV-AICINC-2012', '0000-00-00', 5, '2016-02-19', 'Vespertina', 'fbrujan'),
(85, 'CAMP-AICINC-2016', '2016-03-29', 41, '2016-03-29', 'Ma????????ana', 'fbrujan'),
(86, 'CAMP-AICINC-2016', '2016-03-29', 41, '2016-03-30', 'Vespertina', 'fbrujan');

-- --------------------------------------------------------

--
-- Table structure for table `aic_asociaciones`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_asociaciones`;
CREATE TABLE `aic_asociaciones` (
  `id_asociacion` varchar(10) DEFAULT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `Lema` varchar(40) DEFAULT NULL
) ENGINE=MyISAM AVG_ROW_LENGTH=2048 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_asociaciones`
--

INSERT INTO `aic_asociaciones` (`id_asociacion`, `nombre`, `Lema`) VALUES
('ADAIC', 'Asociacion de Damas', 'Portadoras de Luz'),
('ACAIC', 'Asociacion de Caballeros', 'Embajadores del Rey'),
('ANAIC', 'Asaociacion de Ni????os', 'Joyas de Cristo'),
('AJAIC', 'Asociacion de Jovenes', 'Paladines de Cristo'),
('AJUVAIC', 'Asociacion de Juveniles', NULL),
('AICINC', 'ASAMBLEA DE IGLESIAS CRISTIANAS', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aic_cargos`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_cargos`;
CREATE TABLE `aic_cargos` (
  `id_cargo` int(8) NOT NULL,
  `cargo` varchar(40) DEFAULT NULL
) ENGINE=MyISAM AVG_ROW_LENGTH=862 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_cargos`
--

INSERT INTO `aic_cargos` (`id_cargo`, `cargo`) VALUES
(1, 'Director'),
(2, 'Asistente al Director'),
(3, 'Supervisor'),
(4, 'Asistente al Supervisor'),
(5, 'Presidente'),
(6, 'Asistente al Presidente'),
(7, 'Secretario'),
(8, 'Sub-Secretario'),
(9, 'Tesorero'),
(10, 'Sub-Tesorero'),
(11, 'Vocal'),
(12, 'Colaborador'),
(13, 'Relacionador Publico'),
(14, 'Consejero'),
(15, 'Pastor'),
(16, 'Presbitero'),
(17, 'Miembro'),
(18, 'Obispo Y Presidente'),
(19, 'Delegado Internacional'),
(20, 'Delegado (a)');

-- --------------------------------------------------------

--
-- Table structure for table `aic_circuitos`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_circuitos`;
CREATE TABLE `aic_circuitos` (
  `id_circuito` int(2) NOT NULL,
  `id_pais` int(2) NOT NULL,
  `id_provincia` int(2) NOT NULL,
  `nombre_circuito` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_circuitos`
--

INSERT INTO `aic_circuitos` (`id_circuito`, `id_pais`, `id_provincia`, `nombre_circuito`) VALUES
(5, 1, 3, 'Barahona'),
(15, 1, 5, 'Santo Domingo Este'),
(6, 1, 13, 'Higuey'),
(7, 1, 14, 'La Romana'),
(8, 1, 19, 'Monte Plata'),
(1, 1, 21, 'Bani'),
(9, 1, 22, 'Puerto Plata'),
(10, 1, 22, 'Sosua'),
(4, 1, 24, 'Haina'),
(2, 1, 24, 'San Cristobal Centro'),
(3, 1, 24, 'San Cristobal Oeste'),
(11, 1, 25, 'San Jose de Ocoa'),
(12, 1, 26, 'San Juan De la Maguana'),
(13, 1, 27, 'San Pedro de Macoris'),
(14, 1, 29, 'Santiago'),
(16, 1, 31, 'Santo Domingo Oeste');

-- --------------------------------------------------------

--
-- Table structure for table `aic_comite`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_comite`;
CREATE TABLE `aic_comite` (
  `id_comite` varchar(10) DEFAULT NULL,
  `nombre_comite` varchar(40) DEFAULT NULL
) ENGINE=MyISAM AVG_ROW_LENGTH=780 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_comite`
--

INSERT INTO `aic_comite` (`id_comite`, `nombre_comite`) VALUES
('REG', 'Registro y Admision'),
('FIN', 'Finanzas'),
('ESC', 'Escrutinio'),
('ACT', 'Actas'),
('COC', 'Cocina'),
('EMG', 'Enfermeria y Salud'),
('HOS', 'Hospedaje y Alojamiento'),
('CAD', 'Orden y Cadetes'),
('PAR', 'Parlamentaria'),
('GEN', 'Asambleista en General'),
('EJE', 'Comite Ejecutivo'),
('EST', 'Estadisticas'),
('INT1', 'Intercesion'),
('RED', 'Redaccion de Actas'),
('MIN', 'Ministerial'),
('ORN', 'Ornato y Decoracion'),
('MUS', 'Musica y Sonido'),
('CONS', 'Conserjeria y Limpieza'),
('PRO', 'Etiqueta y Protocolo'),
('RES', 'Resoluciones');

-- --------------------------------------------------------

--
-- Table structure for table `aic_iglesia`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_iglesia`;
CREATE TABLE `aic_iglesia` (
  `id_iglesia` int(4) NOT NULL,
  `id_circuito` int(2) NOT NULL,
  `id_provincia` int(3) NOT NULL,
  `nombre_iglesia` varchar(60) NOT NULL,
  `fundador` varchar(60) NOT NULL,
  `fch_fundada` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_iglesia`
--

INSERT INTO `aic_iglesia` (`id_iglesia`, `id_circuito`, `id_provincia`, `nombre_iglesia`, `fundador`, `fch_fundada`) VALUES
(1, 1, 21, 'Segunda Genesaret', '', '0000-00-00'),
(2, 1, 21, 'Segunda Puerta de Refugio', '', '0000-00-00'),
(3, 1, 21, 'Centro de Renovacion Shadday ', '', '0000-00-00'),
(4, 1, 21, 'Centro Evangelistico Shalon', '', '0000-00-00'),
(5, 1, 21, 'Erec Salvatore ', '', '0000-00-00'),
(7, 1, 21, 'Faro de Luz', '', '0000-00-00'),
(8, 1, 1, 'Filadelfia', '', '0000-00-00'),
(9, 1, 21, 'Genesaret', '', '0000-00-00'),
(10, 1, 21, 'Jesus la Unica Esperanza', '', '0000-00-00'),
(11, 1, 21, 'La Chequinac de Jehov???????? ', '', '0000-00-00'),
(12, 1, 21, 'Monte Sinai', '', '0000-00-00'),
(13, 1, 21, 'Puerta de la Misericordia ', '', '0000-00-00'),
(14, 1, 21, 'Puerta de la Misericordia 2da', '', '0000-00-00'),
(15, 1, 21, 'Vida Eterna', '', '0000-00-00'),
(16, 5, 3, 'Bethania', '', '0000-00-00'),
(18, 5, 3, 'Bethel', '', '0000-00-00'),
(19, 5, 12, 'Getsemani', '', '0000-00-00'),
(20, 5, 3, 'La Hermosa', '', '0000-00-00'),
(21, 5, 3, 'Tesalonica', '', '0000-00-00'),
(22, 5, 3, 'Tesalonica Segunda', '', '0000-00-00'),
(24, 4, 24, 'El Nuevo Nacimiento', 'Sra. Maria Gutierrez', '1992-04-18'),
(25, 4, 24, 'El Refugio', '', '0000-00-00'),
(26, 4, 24, 'El Refugio II', 'Rev. Julio Cesar Uribe', '0000-00-00'),
(27, 4, 24, 'Faro De Luz', 'Rey. Aurelio D????????az', '1967-07-01'),
(28, 4, 24, 'Faro De Luz II', 'Exh. Socrates valdez', '1997-01-01'),
(29, 4, 24, 'Fuente de Vida', 'Exh. Bella Zoila Uribe de Ciprian', '1987-01-01'),
(30, 4, 24, 'La Nueva Jerusal????????n', 'Domingo Mariano P????????rez Mora', '1996-09-01'),
(32, 6, 7, '2da Asamblea de Iglesias Cristianas', '', '0000-00-00'),
(33, 6, 13, 'Unci????????n de Jehov???????? 2da', '', '0000-00-00'),
(34, 6, 13, 'AIC Fe en Oraci????????n 3era', '', '0000-00-00'),
(35, 6, 13, 'Llama Pentecostal 3era', '', '0000-00-00'),
(36, 6, 13, '4ta Asamblea de Iglesias Cristianas', '', '0000-00-00'),
(37, 6, 10, 'Asamblea de Iglesias Cristianas', '', '0000-00-00'),
(38, 6, 13, 'Cordero de Dios 6ta', '', '0000-00-00'),
(39, 6, 13, 'Dios es Bueno', '', '0000-00-00'),
(40, 6, 13, 'Jehov???????? Jireh', '', '0000-00-00'),
(42, 6, 7, 'Jehova Shal????????n', '', '0000-00-00'),
(43, 6, 13, 'Llama Pentecostal', '', '0000-00-00'),
(44, 6, 13, 'Puerta de Si????????n', '', '0000-00-00'),
(45, 7, 14, 'Buena Nueva de Salvaci????????n 2da', 'Marina Laureano De P????????rez', '2002-03-05'),
(46, 7, 14, 'Fuente de Agua Viva 2da', '', '0000-00-00'),
(47, 7, 14, 'Canaan 4ta', 'Rev. Virgilio Hernandez Santana', '1993-01-01'),
(48, 7, 14, 'Valle de Bendici????????n 7mo', '', '0000-00-00'),
(49, 7, 14, 'Enhacored', 'Florentina Leonardo', '1995-07-24'),
(50, 7, 14, 'Filadelfia', 'Adriano Olivo', '1999-01-01'),
(51, 7, 14, 'Fuente De Agua Viva', '', '0000-00-00'),
(52, 7, 14, 'Pe????????a de Horeb', '', '0000-00-00'),
(53, 7, 14, 'Tabern????????culo de Gracia', '', '0000-00-00'),
(54, 7, 14, 'Trino Dios', 'Exh. Felipe rodriguez Alvarez', '1992-01-01'),
(55, 7, 14, 'Valle de Bendici????????n', '', '0000-00-00'),
(56, 8, 19, 'Asamblea de Iglesias Cristianas', '', '0000-00-00'),
(57, 8, 19, 'Puerta Del Cielo', '', '0000-00-00'),
(58, 11, 25, 'Asamblea de Iglesias Cristianas', '', '0000-00-00'),
(59, 11, 25, 'Fuente de Amor', '', '0000-00-00'),
(60, 11, 25, 'Puerta de Refugio', '', '0000-00-00'),
(61, 11, 25, 'Puerta del Cielo 3era', '', '0000-00-00'),
(62, 11, 25, 'Puerta Del Cielo 5ta', '', '0000-00-00'),
(63, 11, 25, 'Puerta del Cielo la Hermosa', '', '0000-00-00'),
(64, 12, 26, 'Asamblea De iglesias Cristianas Central', 'F????????lix de la Cruz.', '1960-01-01'),
(65, 12, 26, 'Casa de Dios', 'Enerio Romero', '1962-01-01'),
(66, 12, 26, 'El Buen Pastor', '', '0000-00-00'),
(67, 12, 26, 'El Refugio 1ero', 'Jorge de los Santos', '1975-01-01'),
(68, 12, 26, 'Genezaret', 'Ismael Mateo del Carmen', '1990-10-12'),
(69, 12, 26, 'Luz de Salvaci????????n', 'Isaura S????????nchez', '1970-01-01'),
(70, 12, 26, 'Luz en el Desierto', '', '0000-00-00'),
(71, 12, 26, 'Refugio 2do', 'Susana Rosado', '0000-00-00'),
(72, 13, 27, 'Bethania', '', '0000-00-00'),
(73, 13, 27, 'Camino al Cielo', '', '0000-00-00'),
(74, 13, 27, 'Eben-Ezer 2da', '', '0000-00-00'),
(76, 13, 27, 'Faro de Luz', '', '0000-00-00'),
(77, 13, 27, 'Fuente de Salvaci????????n', '', '0000-00-00'),
(78, 13, 27, 'Fundada Sobre la Roca', '', '0000-00-00'),
(79, 13, 27, 'Jehov???????? Jireh', '', '0000-00-00'),
(80, 13, 27, 'Jehov???????? Nisi', '', '0000-00-00'),
(81, 13, 27, 'Monte Carmelo', '', '0000-00-00'),
(82, 13, 27, 'Nueva Jerusal????????n', '', '0000-00-00'),
(83, 14, 6, 'Primer Santuario ', '', '0000-00-00'),
(84, 14, 29, 'El Refugio 1era', '', '0000-00-00'),
(85, 14, 29, 'Roca de Salvaci????????n 1era', '', '0000-00-00'),
(86, 14, 15, 'Septimo Tabern????????culo', '', '0000-00-00'),
(87, 14, 29, 'Cristo el Arca de Hoy', '', '0000-00-00'),
(88, 14, 29, 'Esmirna', '', '0000-00-00'),
(89, 14, 29, 'Fuente de Vida', 'Antonia Fco. de Mu????????oz', '1999-01-01'),
(90, 14, 29, 'Mizpa', 'Amado Marte', '1990-01-01'),
(91, 14, 32, 'Nueva Luz', '', '0000-00-00'),
(92, 14, 32, 'Nueva Sina????????', '', '0000-00-00'),
(93, 14, 29, 'Rios de Agua Viva 1era', 'Teodora Villaman', '1996-04-01'),
(94, 14, 29, 'Tabern????????culo Evangel????????stico', '', '0000-00-00'),
(95, 14, 32, 'Templo Bethesda', '', '0000-00-00'),
(96, 16, 31, 'Unci????????n de Jehov???????? 2da', '', '0000-00-00'),
(98, 16, 31, 'Columna De Fuego', '', '0000-00-00'),
(99, 16, 31, 'Eben-Ezer', '', '0000-00-00'),
(100, 16, 31, 'Faro De Luz', '', '0000-00-00'),
(101, 16, 31, 'Getsemani', '', '0000-00-00'),
(102, 16, 31, 'Iglesia Del Pentecost????????s', '', '0000-00-00'),
(103, 16, 31, 'Jehov???????? De Los Ej????????rcitos', '', '0000-00-00'),
(104, 16, 31, 'Juan 8:32', '', '0000-00-00'),
(105, 16, 31, 'Justicia Y Verdad', '', '0000-00-00'),
(106, 16, 31, 'Justicia Y Verdad II', '', '0000-00-00'),
(107, 16, 31, 'La Puerta De La Fe', 'Rev. Jose Ami', '2003-08-03'),
(108, 16, 31, 'La Roca', '', '0000-00-00'),
(109, 16, 31, 'Mi Refugio', '', '0000-00-00'),
(110, 16, 31, 'Monte De Sion', '', '0000-00-00'),
(111, 16, 31, 'Roca De Salvaci????????n 2da', 'Exh. Antonio Mateo', '2001-01-01'),
(112, 15, 5, 'Escala Al Cielo', '', '0000-00-00'),
(113, 15, 5, 'Iglesia Remanente Fiel', '', '0000-00-00'),
(114, 15, 5, 'Luz De La Esperanza', '', '0000-00-00'),
(115, 15, 5, 'Nueva Vida Eterna', '', '0000-00-00'),
(116, 15, 5, 'Pacto De Amor', '', '0000-00-00'),
(117, 15, 5, 'Aposento Alto', '', '0000-00-00'),
(118, 15, 5, 'Bethel', '', '0000-00-00'),
(119, 15, 5, 'Casa De Refugio', '', '0000-00-00'),
(120, 15, 5, 'El Camino', '', '0000-00-00'),
(121, 15, 5, 'El Consolador', '', '0000-00-00'),
(122, 15, 5, 'El Consolador 2da', '', '0000-00-00'),
(123, 15, 5, 'El Sembrador', '', '0000-00-00'),
(124, 15, 5, 'Esmirna', '', '0000-00-00'),
(125, 15, 5, 'Fuente de Esperanza', '', '0000-00-00'),
(126, 15, 5, 'Getsemani', '', '0000-00-00'),
(127, 15, 5, 'Jehov???????? Nisi', '', '0000-00-00'),
(128, 15, 5, 'Nueva Vision', '', '0000-00-00'),
(129, 15, 5, 'Pan Y Vida', '', '0000-00-00'),
(130, 15, 5, 'Santidad A Jehova', '', '0000-00-00'),
(131, 15, 5, 'Shalon', '', '0000-00-00'),
(132, 10, 22, '2da Enmanuel', 'Rev. Julio A. Medina Padilla', '1996-04-20'),
(133, 10, 22, '2do Refugio', 'Pedro Tom????????s S????????nchez', '1991-08-01'),
(134, 10, 22, '2do Tabern????????culo', 'Rev. Gregorio Artiles', '1991-06-19'),
(135, 10, 22, '3er Tabern????????culo', '', '0000-00-00'),
(136, 10, 22, '3era Jehov???????? Jireh', 'Lpa Julio Mena Mart????????nez', '1999-01-01'),
(137, 10, 22, '4to Refugio', 'Don Victor Lantigua', '1964-01-01'),
(139, 10, 22, '4to Tabern????????culo', 'Rev. Gregorio Artiles', '1987-03-15'),
(140, 10, 22, '5ta Jehov???????? Jireh', '', '0000-00-00'),
(141, 10, 22, '5to Refugio', 'Rev. Cristian Rivas', '1996-04-01'),
(142, 10, 22, '6to Refugio', 'Rev. Jorge Bonilla Ulerio', '1992-11-02'),
(143, 10, 22, '7mo Refugio', 'Rev. Cristian Rivas', '1995-04-05'),
(144, 10, 22, '8vo Refugio', '', '0000-00-00'),
(145, 10, 22, '9no Refugio', 'Exh. David Batista ', '2000-06-04'),
(146, 10, 22, 'Arca de Salvaci????????n', 'Rev. Gilberto Antonio Gonz????????lez', '1988-01-01'),
(147, 10, 22, 'Casa de Dios y Puerta del Cielo', 'Agustin Vargas', '1997-10-26'),
(148, 10, 22, 'El Primer Refugio', 'Rev. Gregorio Artiles', '1978-07-15'),
(149, 10, 22, 'Emanuel', 'Rev. Porfirio Gutierrez', '1966-11-23'),
(150, 10, 22, 'Filadelfia', 'Exh. Roosevelt Charles', '2000-10-08'),
(151, 10, 22, 'Jehov???????? Jireh', 'Rev. Julio A. Medina Padilla', '1989-09-10'),
(152, 10, 22, '12 Tabernaculo Luz en las Tinieblas', '', '0000-00-00'),
(153, 10, 22, 'Pr????????ncipe de Paz', 'Lpa. Jos???????? Domingo Polanco Mart????????nez', '2001-09-09'),
(155, 3, 24, 'Alfa Y Omega', 'Rev. Federico Sob????????', '1985-04-23'),
(156, 3, 24, 'Arca No????????', '', '0000-00-00'),
(157, 3, 24, 'Bethel 4ta', '', '0000-00-00'),
(158, 3, 24, 'Bethel 2da', '', '0000-00-00'),
(159, 3, 24, 'Casa De Oraccion 1ra', '', '0000-00-00'),
(160, 3, 24, 'Bethel 3era Casa De Oraci????????n', 'Rev. Crispin Aquino', '1998-12-06'),
(161, 3, 24, 'Casa De Oraci????????n 2da', '', '0000-00-00'),
(162, 3, 24, 'Ciudad De La Luz 1ra', 'Manuel Dipr????????', '1964-01-01'),
(163, 3, 24, 'Eben-Ezer', 'Lpd. Margarita Figuereo de Figuereo', '1966-08-07'),
(164, 3, 24, 'Eben-Ezer 2da', '', '0000-00-00'),
(165, 3, 24, 'Fuente De Agua Viva', '', '0000-00-00'),
(166, 3, 24, 'Fuente De Agua Viva 2da', 'Manuel de los Santos', '2007-12-21'),
(167, 3, 24, 'Jesucristo Te Salva', '', '0000-00-00'),
(168, 3, 24, 'La Hermosa Fuente De Amor', '', '0000-00-00'),
(169, 3, 24, 'Los Doce Ap????????stoles', '', '0000-00-00'),
(170, 3, 24, 'Mizpa', 'Eduardo de Le????????n', '1968-03-10'),
(171, 3, 24, 'Monte De Sion', 'Iglesia Bethesda', '1962-09-01'),
(172, 3, 24, 'Monte De Sion 2da', '', '0000-00-00'),
(173, 3, 24, 'Monte De Sion 3ra', 'Lpa. Santiago Sierra', '2005-10-01'),
(174, 3, 24, 'Senda De Maravilla', '', '0000-00-00'),
(175, 3, 24, 'Siloe 3ra', '', '0000-00-00'),
(176, 3, 24, 'Templo Bethel', 'Rev. Luis Aquino Isabel', '1967-01-01'),
(177, 2, 24, '2da Monte Horeb', 'Rev. Marcial Reyes Sob????????', '1980-01-01'),
(178, 2, 24, 'Ciudad de Luz 4ta', '', '0000-00-00'),
(179, 2, 24, 'Bethel', 'Alejo Mercedes', '1951-01-01'),
(180, 2, 24, 'Bethesda', '', '0000-00-00'),
(181, 2, 24, 'Ciudad de Luz 2da', '', '0000-00-00'),
(182, 2, 24, 'Ciudad de Luz 2da Hija', '', '0000-00-00'),
(183, 2, 24, 'Columna y Baluarte de la Verdad', '', '0000-00-00'),
(184, 2, 24, 'Eben-Ezer', '', '0000-00-00'),
(185, 2, 24, 'El Reba????????o', 'Rev. Regino De Le????????n', '1985-01-01'),
(186, 2, 24, 'El Reto????????o de Bethel', 'Lpa. Hector Antonio Zayas', '1994-02-10'),
(187, 2, 24, 'Evang????????lica Fraternal', 'Rev. Federico Claudio Alvares', '1990-05-17'),
(188, 2, 24, 'Fraternal 2da', 'Rev. Federico Claudio Alvares', '1994-08-30'),
(189, 2, 24, 'Fraternal 3era', 'Rev. Federico Claudio Alvares', '0000-00-00'),
(190, 2, 24, 'Fuente de Agua Viva', '', '0000-00-00'),
(191, 2, 24, 'Fuente de Agua Viva 2da', '', '0000-00-00'),
(192, 2, 24, 'Fuente de Vida', '', '0000-00-00'),
(193, 2, 24, 'Fuente de Vida 2da', 'Lucia Rosario De Monero', '0000-00-00'),
(194, 2, 24, 'Hechos 4:12', 'Rev. Frank Jim????????nez (Hijo)', '0000-00-00'),
(195, 2, 24, 'Jehov???????? de los Ej????????rcitos', 'Exh. Jes????????s Mar????????a Severino', '0000-00-00'),
(196, 2, 24, 'Jehov???????? Shal????????n', 'Rafael Arias Dipre', '0000-00-00'),
(197, 2, 24, 'Los Doce Ap????????stoles', 'Elpidio Soriano', '0000-00-00'),
(198, 2, 24, 'Maranata', 'Jos???????? La Rosa', '1980-05-15'),
(199, 2, 24, 'Jesucristo es el Camino', 'Yolanda Javier', '1997-10-24'),
(200, 2, 24, 'Monte de Horeb 1era', 'Rev. Cecilia Ruiz De Vizca????????no', '0000-00-00'),
(201, 2, 24, 'Monte Horeb', 'Narciso Obispo Reyes', '1968-01-01'),
(202, 2, 24, 'Oraci????????n Contestada', '', '0000-00-00'),
(203, 2, 24, 'Siloe 1era', 'Flor Dalesa Damiane', '1961-01-01'),
(204, 2, 24, 'Siloe 2da', 'Rev. Ramon Ramirez', '1986-03-01'),
(205, 2, 24, 'Siloe 3era', '', '0000-00-00'),
(206, 2, 24, 'Sina????????', '', '0000-00-00'),
(207, 2, 24, 'Templo Bethania', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `aic_iglesia_detalle_hist`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_iglesia_detalle_hist`;
CREATE TABLE `aic_iglesia_detalle_hist` (
  `id_detalle` int(8) NOT NULL,
  `id_iglesia` int(4) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `pastor` varchar(60) NOT NULL,
  `fch_inicio` date NOT NULL,
  `fch_fin` date NOT NULL,
  `ultima_actualizacion` tinyint(1) NOT NULL DEFAULT '1',
  `usuario` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_iglesia_detalle_hist`
--

INSERT INTO `aic_iglesia_detalle_hist` (`id_detalle`, `id_iglesia`, `direccion`, `telefono`, `pastor`, `fch_inicio`, `fch_fin`, `ultima_actualizacion`, `usuario`) VALUES
(1, 1, 'Calle Canela Mota No.41, Santa Rosa, Bani', '8095222951', 'LPA Miguel Antonio Dominguez Mezquita', '0000-00-00', '0000-00-00', 1, ''),
(2, 2, 'Matanza, bani', '8095026111', 'Exh. Deyanira Soto', '0000-00-00', '0000-00-00', 1, ''),
(3, 3, 'Santa Rosa, bani', '8293248571', 'Charles Sanchez', '0000-00-00', '0000-00-00', 1, ''),
(4, 4, 'Calle M????????ximo G????????mez No 53, Boca Canasta, Bani', '8093801639', 'Rev. Teofilo Gonzalez', '0000-00-00', '0000-00-00', 1, ''),
(5, 5, 'Cruce De Ocoa', '8093801639', 'Exh. ????????ngel David Aybar S????????nchez', '0000-00-00', '0000-00-00', 1, ''),
(6, 7, 'Enriquillo', '8298546084', 'Wander Medina', '0000-00-00', '0000-00-00', 1, ''),
(7, 8, 'Reparto 7 De Mayo No 4-A, Los Jovillos, Azua', '8293495954', 'Rev. Bruno De La Cruz Marte ', '0000-00-00', '0000-00-00', 1, ''),
(8, 9, 'Calle Se????????ora De Regla No.81 Sur', '8099734896', 'Rev. David De Los Santos Caro ', '0000-00-00', '0000-00-00', 1, ''),
(9, 10, 'Calle Gregorio Luperon no. 11, Palmar de Ocoa', '8092437146', 'Rev. Pedro Sanchez', '0000-00-00', '0000-00-00', 1, ''),
(10, 11, 'Calle Francisco Gregorio Billini No 8, Bani', '8095226273', 'Rev. Tania Del Pilar P????????rez De Mej????????a', '0000-00-00', '0000-00-00', 1, ''),
(11, 12, 'Calle Central No 66, Pisarrete, Bani', '8096621441', 'Rev. Eddy Gonz????????lez Prandi', '0000-00-00', '0000-00-00', 1, ''),
(12, 13, 'Calle Duverge Paya, Bani', '8093468580', 'Lpa. F????????lix Domingo Salom????????n Tejeda ', '0000-00-00', '0000-00-00', 1, ''),
(13, 14, 'Calle M????????ximo G????????mez, Paya, Bani', '8095221538', 'Exh. Ismael Rodr????????guez Aguas Viva', '0000-00-00', '0000-00-00', 1, ''),
(14, 15, 'Calle Padre Francisco Gregorio Billini no. 21 Bani.', '8095226353', 'Luis Lugo Diaz', '0000-00-00', '0000-00-00', 1, ''),
(15, 16, 'Calle principal no. 22, Coleton Enriquillo, Barahona', '8298340233', 'Santo Feliz', '0000-00-00', '0000-00-00', 1, ''),
(16, 18, 'Calle V????????ctor Mola no. 43, Barahona', '8097083087', 'Florencio Minier Vel????????squez', '0000-00-00', '0000-00-00', 1, ''),
(17, 19, 'El Baulio Soto no. 23, Postrer Rio, Jiman????????', '8099019215', 'John Kennedy Jim????????nez', '0000-00-00', '0000-00-00', 1, ''),
(18, 20, 'Arroyo Dulce, Enriquillo, Barahona', '8099019215', 'Rev. Esporminio Motos P????????rez', '0000-00-00', '0000-00-00', 1, ''),
(19, 21, 'Calle S????????nchez no. 36, Enriquillo Barahona', '8099019215', 'Reynaldo Arias Guzm????????n', '0000-00-00', '0000-00-00', 1, ''),
(20, 22, 'Calle Cahonabo Con Hermojenes Alcantara. # 35', '8293324889', 'Exh. Josefa Altagracia Beriquet De Acosta ', '0000-00-00', '0000-00-00', 1, ''),
(21, 24, 'Calle S????????nchez, Cambelen, Nigua Km. 23, Sc', '8092883473', 'Lpa Bienvenido Jim????????nez', '2002-04-18', '0000-00-00', 1, ''),
(22, 25, 'Calle Bienvenido Peguero #24, Sc', '8093326020', 'Rev. Julio Cesar Uribe', '0000-00-00', '0000-00-00', 1, ''),
(23, 26, 'Calle 1ra. #25 Quita Sue????????o, Haina Sc.', '8093326736', 'Altagracia Reyes De Encarnaci????????n', '1996-11-21', '0000-00-00', 1, ''),
(24, 27, 'Calle Bernardo Pichardo, no. 7, Haina', '8099574197', 'Rev. Antonio Santos', '1971-08-01', '0000-00-00', 1, ''),
(25, 28, 'Calle Anacaona Villa Lisa Haina', '8092371524', 'German Josef', '2005-06-13', '0000-00-00', 1, ''),
(26, 29, 'Calle Salome Ure????????a, Bo. Gringo, Haina, Sc', '8092374662', 'Licda. Bella Zoila Uribe De Ciprian', '1987-01-01', '0000-00-00', 1, ''),
(27, 30, 'Calle Salome Ure????????a, Bo. Gringo, Haina, Sc', '8092374662', 'Rev. Eugenio Encamaci????????n Pichardo', '2008-09-01', '0000-00-00', 1, ''),
(28, 32, 'Calle La Rotonda, Villa Guerrero, El Se????????bo', '8099895461', 'Fermina Echavarria', '0000-00-00', '0000-00-00', 1, ''),
(29, 33, '27 De Febrero #31, La Marina Higuey', '8095541937', 'Rev. Adela C????????danos Vda. Mercedes. ', '0000-00-00', '0000-00-00', 1, ''),
(30, 34, 'Calle Marcial Guerrero #78, Sector Juan Pablo Duarte.', '8299781496', 'Lpa. Julio Mercedes', '0000-00-00', '0000-00-00', 1, ''),
(31, 35, 'Higuey', '8092351478', 'Natividad Cueto', '0000-00-00', '0000-00-00', 1, ''),
(32, 36, 'Calle Padre Abiana # 18, Bo. Antonio Guzm????????n.', '8093528405', 'Lpa. Rafael Crist????????bal Santana', '0000-00-00', '0000-00-00', 1, ''),
(33, 37, 'Calle Ra????????l Rubio # 65, Sabana De La Mar, Hato Mayor.', '8093171613', 'Exh. Zunilda Bautista', '0000-00-00', '0000-00-00', 1, ''),
(34, 38, 'Calle Cambronal #77, Cambelen Higuey', '8299623780', 'Lpa, Lu????????s Pe????????a', '0000-00-00', '0000-00-00', 1, ''),
(35, 39, 'os???????? Francisco Pe????????a G????????mez #86', '8292690472', 'Exh. Cecilio Herrera Maldonado', '0000-00-00', '0000-00-00', 1, ''),
(36, 40, 'Calle Te????????filo Marrero #32, Sector Chilo Pouerie', '8092240364', 'Lpd. Leandro Morla L????????pez', '0000-00-00', '0000-00-00', 1, ''),
(37, 42, 'Calle 26 De Febrero #47, Bo. Los Guagiles El Eeibo.', '8097684523', 'Juana Aquino De Garc????????a', '0000-00-00', '0000-00-00', 1, ''),
(38, 43, 'Calle Juan 23 no. 30,San Martin, Higuey.', '8092244419', 'Rev. Mamerto Perez Garcia.', '0000-00-00', '0000-00-00', 1, ''),
(39, 44, 'Secci????????n Santana, Pareja Los Mangos', '8094610447', 'Exh. Buena Ventura Miguel', '0000-00-00', '0000-00-00', 1, ''),
(40, 45, 'Calle Marines, #12, Brisa Del Mar', '8095501768', 'Marina Laureano De P????????rez', '2002-03-05', '0000-00-00', 1, ''),
(41, 46, 'Calle Teniente Amado Garc????????a, La Romana', '8098132576', 'Luciana Cabrera', '0000-00-00', '0000-00-00', 1, ''),
(42, 47, 'Calle Berm????????dez # 15vv, La Romana', '8095561838', 'Rev. Pastor Virgilio Hern????????ndez', '1993-01-01', '0000-00-00', 1, ''),
(43, 48, 'C/Gral., Pedro Santana Los Mulos', '', 'Confesor Valerio', '0000-00-00', '0000-00-00', 1, ''),
(44, 49, 'calle los cristianos No.29 del Municipio Villa Hermosa en Vi', '8297746130', 'Florentina Leonardo', '1995-07-24', '0000-00-00', 1, ''),
(45, 50, 'Villa Progreso, La Romana', '8099912798', 'Carlos Manuel De La Cruz', '1999-01-01', '0000-00-00', 1, ''),
(46, 51, 'Calle H no. 53,Vila Espana, La Romana.', '8099066262', 'Rev. Pedro Alejandro Valera', '0000-00-00', '0000-00-00', 1, ''),
(47, 52, 'Villa Renovaci????????n, Sector Los Mulos', '8093575987', 'Juan Gonz????????lez', '0000-00-00', '0000-00-00', 1, ''),
(48, 53, 'Calle Principal, Villa Progreso, La Romana.', '8092666591', 'Exh. Maximiliano Mota Garc????????a', '0000-00-00', '0000-00-00', 1, ''),
(49, 54, 'alle Salom???????? Ure????????a no. 15 del municipio de Villa hermos', '8095501873', 'Lpa. Santiago Castillo Berroa', '1999-01-01', '0000-00-00', 1, ''),
(50, 55, 'Villa Hermosa', '8099023946', 'Lpa. F????????lix A. De Jes????????s Polanco', '0000-00-00', '0000-00-00', 1, ''),
(51, 56, 'Hato De San Pedro', '', 'Lpa. Luis Jean Baptiste', '0000-00-00', '0000-00-00', 1, ''),
(52, 57, 'Cruce de la Hermon, Munic. de Don Juan, Monte Plata', '', 'Rev. Jose Ami', '0000-00-00', '0000-00-00', 1, ''),
(53, 58, 'Los Banilejos De Rancho Arriba', '', 'Alfredo Ortiz', '0000-00-00', '0000-00-00', 1, ''),
(54, 59, 'Calle General Mazara, Los Quemados, Rancho Arriba', '8298897293', 'Lpa Ram????????n Andr????????s Lluveres', '0000-00-00', '0000-00-00', 1, ''),
(55, 60, 'El Mogote De San Jos???????? De Ocoa', '8095091628', 'Lpa Julio Santana', '0000-00-00', '0000-00-00', 1, ''),
(56, 61, 'Calle Principal. Las Clavellinas', '8098032426', 'Ercilio Columbena Mateo', '0000-00-00', '0000-00-00', 1, ''),
(57, 62, 'Calle Cabral, San Jos???????? De Ocoa', '8098898490', 'Rev. Angel Plinio Santana', '0000-00-00', '0000-00-00', 1, ''),
(58, 63, 'Bo. San Luis, San Jos???????? De Ocoa', '8099743939', 'Marino Antonio Mej????????a', '0000-00-00', '0000-00-00', 1, ''),
(59, 64, 'Calle Dr. Cabral esquina Diego de Velasquez.', '8096652783', 'l Rev. Dionisio Diroci???????? Mont????????s', '2010-05-01', '0000-00-00', 1, ''),
(60, 65, 'Calle Dr. Cabral Esquina Diego De Vel????????zquez', '8096652783', 'Exh. Elvira De Los Santos', '0000-00-00', '0000-00-00', 1, ''),
(61, 66, 'Secci????????n Capul????????n, Vallejuelo, San Juan.', '', 'Belarminio Nova De Oleo', '0000-00-00', '0000-00-00', 1, ''),
(62, 67, 'Calle Col????????n # 123-A', '8095575681', 'Rev. Susana De La Rosa Rosada', '0000-00-00', '0000-00-00', 1, ''),
(63, 68, 'calle primera No.8, Pedro Corto, San Juan', '', 'Julio A. de la Rosa', '2006-01-01', '0000-00-00', 1, ''),
(64, 69, 'Calle Duarte # 2 Bohechio, San Juan', '', 'Milka A. Luciano', '0000-00-00', '0000-00-00', 1, ''),
(65, 70, 'Arroyo Salada De B????????nica, San Juan.', '', 'Exh. Gumersindo Made', '0000-00-00', '0000-00-00', 1, ''),
(66, 71, 'sector Mirador Norte, calle Primera S/N, San Juan de la Magu', '', 'Kennedy Hern????????ndez', '1997-01-01', '0000-00-00', 1, ''),
(67, 72, 'Calle 6 #215, Bo. Le Loma, Consuelo, Spm', '', 'Lic. Pastor Bernardo Valdez V.', '0000-00-00', '0000-00-00', 1, ''),
(68, 73, 'Calle Chichi Olivo #11 Bo. Lindo, Spm.', '8095538344', 'Rev. Sebasti????????n Lora Reyna', '0000-00-00', '0000-00-00', 1, ''),
(69, 74, 'Calle S????????nchez # 7, Ingenio Santa Fe, Spm', '8095270703', 'Lic. Freddy Ovalle Marte', '0000-00-00', '0000-00-00', 1, ''),
(70, 76, 'Calle Isidro Barros #63, Municipio De Consuelo, Spm.', '8293359497', 'Rev. Ceferino Jim????????nez', '0000-00-00', '0000-00-00', 1, ''),
(71, 77, 'C/Rene Del Risco #58, Villa Progreso, Spm', '8097526088', 'Rev. Sebasti????????n Lora Reyna', '0000-00-00', '0000-00-00', 1, ''),
(72, 78, 'C/1ra. #88, Barrio La Loma, Consuelo, Spm.', '', 'uan Antonio Reyes Alduey', '0000-00-00', '0000-00-00', 1, ''),
(73, 79, 'Barri???????? Villa Mamota No 12, Spm.', '', 'Inocencio Vilorio', '0000-00-00', '0000-00-00', 1, ''),
(74, 80, 'Calle B no. 21, Bo. Joaquin Balaguer, Municipio SPM', '8095538961', 'Rev. Pedro Gonz????????lez', '0000-00-00', '0000-00-00', 1, ''),
(75, 81, 'Calle G????????nesis, Barrio Guamita, Consuelo, SPM', '', 'Elvis Polo Garc????????a', '0000-00-00', '0000-00-00', 1, ''),
(76, 82, 'Calle Santa Fe, Barrio Villa Centro, Spm.', '', 'Jos???????? An????????bal Feliz', '0000-00-00', '0000-00-00', 1, ''),
(77, 83, 'Calle Castillo # 183, Barrio Ram????????n Holgu????????n, Sfm ', '', 'Bienvenido V????????squez', '0000-00-00', '0000-00-00', 1, ''),
(78, 84, 'Calle Duarte # 2, Villa Olga Santiago.', '', 'Exh. Hilario D????????az', '0000-00-00', '0000-00-00', 1, ''),
(79, 85, 'Bo. Villa Bao, Santiago', '', 'Leonardo Rodr????????guez Dionisio', '0000-00-00', '0000-00-00', 1, ''),
(80, 86, 'Los Valerios, La Vega.', '', 'Juan Carlos S????nchez', '0000-00-00', '0000-00-00', 1, ''),
(81, 87, 'C/2 #8 Los Salados Nuevos, Santiag', '8097216138', 'Exh. Redames Rodr????????guez', '0000-00-00', '0000-00-00', 1, ''),
(82, 88, 'Jes????????s Mar????????a Lora #112', '', 'Exh. Jos???????? Francisco Henr????????quez Bruno', '0000-00-00', '0000-00-00', 1, ''),
(83, 89, 'calle 4, casi esquina 7 de la uni????????n segunda, Santiago', '8095756129', 'Consorcia Francisco de Felipe', '2000-12-15', '0000-00-00', 1, ''),
(84, 90, 'Calle 2 no. 39, San Lorenzo Santiago.', '8095756076', 'Rev. Amado Marte', '1990-01-01', '0000-00-00', 1, ''),
(85, 91, 'Calle Luper????????n #26, Esperanza, Mao, Valverde.', '', 'Exh. Justino Silverio', '0000-00-00', '0000-00-00', 1, ''),
(86, 92, 'Calle 1ra. Juan De Jes????????s Reyes #45, Mao, Valverde.', '', 'Lpa. Ram????????n Ant. Rodr????????guez.', '0000-00-00', '0000-00-00', 1, ''),
(87, 93, 'calle 2 No.4 de Pastor Abajo, Bella Vista, Santiago', '', 'Rev. Tomas Peralta', '1996-04-01', '0000-00-00', 1, ''),
(88, 94, 'Calle Francisco Caama????????o, Esquina C/4, Santiago', '', 'Rev. Agapito F????????lix', '0000-00-00', '0000-00-00', 1, ''),
(89, 95, 'Calle Dr. Pe????????a G????????mez # 40, Guatapanal, Mao', '', 'Isidro Goris', '0000-00-00', '0000-00-00', 1, ''),
(90, 96, 'Calle 31 # 45, San Felipe Villa Mella', '8092399033', 'Exh. Flavia ????????lvarez', '0000-00-00', '0000-00-00', 1, ''),
(91, 98, 'Calle Carolina', '8095374301', 'Exh. Juana Rosario', '0000-00-00', '0000-00-00', 1, ''),
(92, 99, 'Calle Respaldo M????????xico #21 Bo. Buenos Aires De Herrera', '8092387892', 'Rev. Antonio Mej????????a', '0000-00-00', '0000-00-00', 1, ''),
(93, 100, 'Calle 27 De Febrero # 13, Bo. Obras P????????blicas', '8292128725', 'Pastor F????????lix Benz Lorenzo', '0000-00-00', '0000-00-00', 1, ''),
(94, 101, 'Calle San Gabriel # 33 Km 9 Carretera S????????nchez', '8095645030', 'Rev. Cesar De Los Santos Asencio', '0000-00-00', '0000-00-00', 1, ''),
(95, 102, 'Calle La Puya #19, Los Arroyos, La Cuesta De Arroyo Hondo.', '8099228321', 'Lpa. Deivis Veras Ch????????vez', '0000-00-00', '0000-00-00', 1, ''),
(96, 103, 'Calle La Puya #19, Los Arroyos, La Cuesta De Arroyo Hondo', '8099228321', 'Lpa. Deivis Veras Ch????????vez ', '0000-00-00', '0000-00-00', 1, ''),
(97, 104, 'Calle Prolongaci????????n Independencia #9', '8098832424', 'Lpa. El????????as Arias P????????rez', '0000-00-00', '0000-00-00', 1, ''),
(98, 105, 'Calle Progreso#21, Bo. Enriquillo Km 9????????? Aut. Duarte', '8097634467', 'Rev. Antonio B????????ez N????????????????ez', '0000-00-00', '0000-00-00', 1, ''),
(99, 106, 'Calle 1ra. # 41, Villa Del Palmar; Pantoja', '8293013418', 'Francisco Agramonte', '0000-00-00', '0000-00-00', 1, ''),
(100, 107, 'Calle Santa Rosa De Rieles S/N, Villa Linda, De Pantoja', '8293013418', 'Exh. Epifania Previl De Le????????n ', '2003-08-03', '0000-00-00', 1, ''),
(101, 108, 'Av. Del Guaricano # 60, Santa Cruz, Villa Mella', '8093248984', 'Rev. Julio Arsenio S????????nchez', '0000-00-00', '0000-00-00', 1, ''),
(102, 109, 'Calle Antonio Guzman#16, Los Girasoles', '8099305989', 'Luis Manuel Urb????????ez', '0000-00-00', '0000-00-00', 1, ''),
(103, 110, 'Calle Anacaona #440 D. Bo. Los Alcarrizos Americanos', '8095489459', 'Rev. Domingo Antonio Pe????????a', '0000-00-00', '0000-00-00', 1, ''),
(104, 111, 'Calle 25 # 32, Bo. El Caf???????? De Herrera', '8295482302', 'Exh. Antonio Mateo', '2001-01-01', '0000-00-00', 1, ''),
(105, 112, 'Calle Altagracia#41 Sector Gualey', '8097718615', 'Rev. Jose Manuel De La Rosa ', '0000-00-00', '0000-00-00', 1, ''),
(106, 113, 'Calle 1ra # 23 La Flores San Lu????????s', '8094147517', 'Daniel Quezada De La Cruz ', '0000-00-00', '0000-00-00', 1, ''),
(107, 114, 'Calle Yolanda Guzm????????n #240, Esquina 17', '8095283657', 'Rev. Marcial Reyes Soba', '0000-00-00', '0000-00-00', 1, ''),
(108, 115, 'Gregorio Garc????????a Castro #23 Los Tres Brazos', '8092344691', 'Exh Luz Mercedes Montilla Del Valle', '0000-00-00', '0000-00-00', 1, ''),
(109, 116, 'Calle 6 #99, Sector El Capotillo', '8295152232', 'Exh. Jose Ventura', '0000-00-00', '0000-00-00', 1, ''),
(110, 117, 'Calle Respaldo San Andres #35, Andres Boca Chica', '8293877680', 'Exh. ????????ngela Feliciano', '0000-00-00', '0000-00-00', 1, ''),
(111, 118, 'Calle Paseo De Los Profesores#1, Los Frailes', '8092731205', 'Rev. Juni Roque Laureano', '0000-00-00', '0000-00-00', 1, ''),
(112, 119, 'Naranjo, Batey San Luis, Central Hozara', '8096700581', 'Lpa. Victor De La Cruz Marte', '0000-00-00', '0000-00-00', 1, ''),
(113, 120, 'Calle Jardines Del Norte #20, El Rosal, Alma Rosa 11', '8298513973', 'Rev. Miguelin Morillo', '0000-00-00', '0000-00-00', 1, ''),
(114, 121, 'Calle Progreso# 6 Bo. Libertad, Sabana Perdida', '8095902904', 'Ramon Fausto Pe????????a', '0000-00-00', '0000-00-00', 1, ''),
(115, 122, 'Calle Principal S/N, Villa Pantoja, Sabana Perdida', '8095907576', 'Dominga Antonio Jeres', '0000-00-00', '0000-00-00', 1, ''),
(116, 123, 'Calle 1ra. #5, Bo. Las Flore, San Luis', '8092362797', 'Lp. Manuel Javier Alcala ', '0000-00-00', '0000-00-00', 1, ''),
(117, 124, 'Calle F#22, Ensanche Isabelita', '8095996414', 'Ing. Nicol????????s Cuevas Sena', '0000-00-00', '0000-00-00', 1, ''),
(118, 125, 'Calle Respaldo Caracoles #25, Los Minas, Sabana Perdida', '8094355691', 'Exh. Benjamin Jorge Mojica', '0000-00-00', '0000-00-00', 1, ''),
(119, 126, 'Chirino, Monte Plata', '8092340932', 'Lpa Agustin Febles', '0000-00-00', '0000-00-00', 1, ''),
(120, 127, 'El Naranjo San Luis', '8297794572', 'Exh. Antero Liriano De Los Santos', '0000-00-00', '0000-00-00', 1, ''),
(121, 128, 'Sector La Caleta, Boca Chica', '8096348625', 'Rev. Carlos Manuel Guzman Guance', '0000-00-00', '0000-00-00', 1, ''),
(122, 129, 'Calle 12#158, La Isabelita', '8095954780', 'Rev. Eduardo Terrero', '0000-00-00', '0000-00-00', 1, ''),
(123, 130, 'Calle 311#58bo.Pto. Rico, Los Minas', '8098038400', 'Rev. Rafael Maria', '0000-00-00', '0000-00-00', 1, ''),
(124, 131, 'Calle 8 R # 10 Brisa', '8295312694', 'Santo Hiraldo Guzman', '0000-00-00', '0000-00-00', 1, ''),
(125, 132, 'Los Gomez, Montellamo, Sosua', '8094162130', 'Rva. Pedro Mart????????nez', '2000-04-20', '0000-00-00', 1, ''),
(126, 133, 'Paso Valiente, Sosua Abajo', '8094162130', 'Rev. Franklin Contreras', '1991-01-01', '0000-00-00', 1, ''),
(127, 134, 'Yasica Arriba, Sosua, Pto Pta', '8094162130', 'Lpa. Jos???????? Antonio Hern????????ndez Rodr????????guez', '2000-01-01', '0000-00-00', 1, ''),
(128, 135, 'Yaroa, Abajo Yasica', '8292795390', 'Esmeralda Rodr????????guez', '0000-00-00', '0000-00-00', 1, ''),
(129, 136, 'Cuesta Barrosa, Sabaneta Y????????sica, Sosua', '8092920558', 'Lpa Julio Mena Mart????????nez', '1999-01-01', '0000-00-00', 1, ''),
(130, 137, 'Madre Vieja, La Ponteada, La Uni????????n', '8098743304', 'Eddy Mart????????nez', '2006-09-02', '0000-00-00', 1, ''),
(131, 139, 'Arroyo De Leche, Distrito Municipal, Montellano', '8096120626', 'Exh. C????????ndida Elogia Placido De Reyes', '2000-09-02', '0000-00-00', 1, ''),
(132, 140, 'Islabon', '8298109999', 'Edilio D????????as', '0000-00-00', '0000-00-00', 1, ''),
(133, 141, 'Batey La Uni????????n, Frente A La Base A????????rea, Sosua', '8092501153', 'Lpa. Pastor Agust????????n Vargas', '0000-00-00', '0000-00-00', 1, ''),
(134, 142, 'Proyecto Habitaciones, La Uni????????n', '8092049697', 'Lic Pastor Pablo Toribio', '2006-01-01', '0000-00-00', 1, ''),
(135, 143, 'C/Eugenio Kunhardt #92, Sosua', '8093713296', 'Rev. Cristian Rivas', '1995-04-05', '0000-00-00', 1, ''),
(136, 144, 'Carretera Madre Vieja, Bella Vista #534', '8095713732', 'Willy Beneret', '0000-00-00', '0000-00-00', 1, ''),
(137, 145, 'Calle Italia, Villa Vetania, Sosua. P.P', '8095713732', 'Exh. Elsa Zapata', '2005-06-04', '0000-00-00', 1, ''),
(138, 146, 'Ca????????o Dulce, Gaspar Hern????????ndez.', '8098404326', 'Rev. Juan Casta????????o Rodr????????guez', '1998-06-04', '0000-00-00', 1, ''),
(139, 147, 'Batey Severet, Distrito Municipal Montellano', '8098737650', 'Exh. Pedro Lorenzo Sosa', '2003-06-04', '0000-00-00', 1, ''),
(140, 148, 'Calle Principal Villa Maranata, Sosua', '8093252906', 'Rev. Reyes Hern????????ndez Pe????????a', '1978-07-15', '0000-00-00', 1, ''),
(141, 149, 'C/Viejo Peres #7, Montellano Sosua', '8297476419', 'Lpa Juan Rosa Amador', '2000-07-15', '0000-00-00', 1, ''),
(142, 150, 'C/11 No. 10, El Higuerito, Montellano', '8099645269', 'Exh. Roosevelt Charles', '2000-10-08', '0000-00-00', 1, ''),
(143, 151, 'Entrada De las Colinas no. 126, Cabarete Sosua', '8094538755', 'Lpa. Quirico Diaz Alcantara', '2004-10-08', '0000-00-00', 1, ''),
(144, 152, 'Caraballo, Montellano, Pto Pta', '8096213642', 'Exh. Andr????????s L????????pez', '0000-00-00', '0000-00-00', 1, ''),
(145, 153, 'Villa Emmanuel, Sosua.', '8498495940', 'Exh. Jos???????? Polanco', '2001-09-09', '0000-00-00', 1, ''),
(146, 155, 'calle No. 2 del Municipio Los Cacaos, San Crist????????bal,', '', 'Juan Eduardo Rosario Santana', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(147, 156, 'Calle Andr????????s Bremon#63, La Sierra, Sc.', '8092889993', 'Lic. Pastor Julio Rodr????????guez', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(148, 157, 'La Capilla, Najayo Arriba, Sc.', '8092787536', 'Jose Antonio Febrillet', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(149, 158, 'Sector De Camba, Paraje Do????????a Ana, Calle S????????nchez Vieja,', '8293411553', 'Miledis Moquete Ram????????rez', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(150, 159, 'Do????????a Ana S.C', '8292988457', 'Raquel Rosario Perez', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(151, 160, 'Najayo Arriba, La Victoria, Sc', '8094642305', 'Lpa Esteban Hernandez', '2004-07-17', '0000-00-00', 1, 'fbrujan'),
(152, 161, 'La Sierra', '8096325046', 'Leonardo Febrillet', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(153, 162, 'Do????????a Ana, San Crist????????bal, Zona Oeste Km 10', '8096129837', 'Rev. Demetrio Martes', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(154, 163, 'calle No.35,canasta II, san Crist????????bal', '8297256996', 'Rev. Juan Isabel Jim????????nez', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(155, 164, 'Sector Los Casilla, San Crist????????bal', '8095282627', 'Bartolo Figuereo Medrano', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(156, 165, 'Cambita Esterlin. Sc', '8096474548', 'Lic. Manuel De Los Santos', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(157, 166, 'Cambita Esterlin. Sc', '8299175375', 'Lpa. Jos???????? El????????as Del Rosario', '2007-12-21', '0000-00-00', 1, 'fbrujan'),
(158, 167, 'Carretera Combita Km4, Sc', '8095278882', 'Rev. Virgilio Figuereo', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(159, 168, 'Paraje La Manigua, Sc', '8094063963', 'Lic. Teodoro Figuereo Feliz', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(160, 169, 'La Lagunita, Cambita, Garabito Sc', '8298856596', 'Jose E. Encarnaci????????n. (hijo)', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(161, 170, 'calle Jos???????? Francisco Pe????????a G????????mez del sector km. 5 Pr', '8098566486', 'Lic. Rafael P????????rez', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(162, 171, 'Calle Domingo Sabio No. 39 Canastica, San Crist????????bal', '8092880632', 'Rev. F????????lix A. Armando Severino', '1994-01-01', '0000-00-00', 1, 'fbrujan'),
(163, 172, 'La Guama, Cambita, San Crist????????bal', '8093863392', 'Jacinto Guzm????????n', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(164, 173, 'Entrada de Borozol, La Loma Najayo al Medio, Yaguate', '8297403990', 'Lpa. Santiago Sierra', '2005-10-01', '0000-00-00', 1, 'fbrujan'),
(165, 174, 'Calle Altagracia #4, Najayo Arriba, Km, 6 Sc', '8296659004', 'Exh. Milagros F????????lix', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(166, 175, 'Calle Privada No. 10, Hoyo De Vario, Ingenio Nuevo', '8096349532', 'Lpa. Brijido De La Cruz Jim????????nez', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(167, 176, 'calle Principal en Najayo Arriba, San Crist????????bal', '8094700051', 'Crisp????????n Aquino Alvarez', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(168, 177, 'Calle Palenque, Niza Abajo Km 71/2, Sc', '8095284615', 'Rev. Benita Paredes De Victorino', '2000-04-24', '0000-00-00', 1, 'cbatel'),
(169, 178, 'Calle 1era. Los Americanos, Sc', '8094281823', 'Yolanda Javier', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(170, 179, 'Calle Osvaldo Bazil #16, Hatillo SC', '8095280159', 'Rev. Juan De La Cruz De Los Santos', '1960-01-01', '0000-00-00', 1, 'cbatel'),
(171, 180, 'Calle General Duverge no. 12', '8095280473', 'Rev. Julio Manuel Garabito', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(172, 181, 'Calle Tulip????????n # 20, Las Flores', '8095280221', 'Rev. Joel De Los Santos Caro', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(173, 182, 'Calle Violeta #29, Las Flores, Sc', '8099774168', 'Exh. Antonio Rosario Lorenzo', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(174, 183, 'Calle San Rafael E. Borinqu????????n, Sc', '8095280354', 'Exh. Claudio Mart????????nez', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(175, 184, 'Calle Respaldo Pablo Barina # 46, Ca????????ada Honda', '8092883673', 'Rev. Juan Ruiz Dom????????nguez', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(176, 185, 'Calle Osvaldo Bazil, Hatillo, Sc', '8099437588', 'Rev. Regino De Le????????n', '1985-01-01', '0000-00-00', 1, 'cbatel'),
(177, 186, 'C/11 No. 12. Hoja Ancha, Hatillo, Sc', '8093874587', 'Rev. Modesto De La Cruz Rodr????????guez', '2010-01-01', '0000-00-00', 1, 'cbatel'),
(178, 187, ' Calle Principal #18, Los Molina, San Crist????????bal', '8095287401', 'Rev. Federico Claudio Alvares', '1990-05-17', '0000-00-00', 1, 'cbatel'),
(179, 188, 'Calle B No. 89, Barrio Mosc????????, Sc', '', 'Lpa. Ganaro De Jes????????s', '1994-08-30', '0000-00-00', 1, 'cbatel'),
(180, 189, 'Calle Principal Sector Sesda, Sc.', '8095280150', 'Exh. Fidel Lorenzo Medrano', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(181, 190, 'calle 6 #7, Bario Mosc????????, Sc', '8298482928', 'Lpa Antonio Guzm????????n ', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(182, 191, 'Cambita Uribe, Sc', '', 'Jos???????? El????????as Del Rosario', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(183, 192, 'Calle Francisco J Peinado #8, Bo. Jeringa', '8298703521', 'Lic. Pastor Modesto Florentino', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(184, 193, 'Sector Conani', '8092885090', 'Lucia Rosario De Monero', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(185, 194, 'Av. Constituci????????n, Sc', '', 'Rev. Frank Jim????????nez (Hijo)', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(186, 195, 'Calle La Toma, Los Caca????????tos, Sc', '', 'Exh. Jes????????s Mar????????a Severino', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(187, 196, 'Calle Prolongaci????????n ????????ngel Arias No.10, Sc', '8095274216', 'Rafael Arias Dipre', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(188, 197, 'Villa Mercedes, Madre Vieja Sur', '8095281796', 'Elpidio Soriano', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(189, 198, 'C/ Juan Roche #10, Madre Vieja', '8095278972', 'Rev. Hipolito Frias Gil', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(190, 199, 'Calle Luperon No. 22, Sainagua, Sc', '8093409704', 'Exh. Yulis Alberto Batel Ram????????rez', '2009-10-24', '0000-00-00', 1, 'cbatel'),
(191, 200, 'Calle Palenque Km 4?????????, Sainagua, Sc', '8095289595', 'Rev. Cecilia Ruiz De Vizca????????no', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(192, 201, 'Calle Mella No.20, Juan Bar????????n, Juan Bar????????n Palenque, Sc', '8092435768', 'Rev. Modesto Florentino', '2003-08-08', '0000-00-00', 1, 'cbatel'),
(193, 202, 'Calle Club Rotario #52, Madre Vieja Sur Sc', '8095281706', 'Rev. Julio Medina Padilla', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(194, 203, 'Calle Manuel Corpor????????n #25, Pueblo Nuevo, Sc', '8092372542', 'Rev. Antonio Alv????????rez Peguero', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(195, 204, 'Calle 3ra #43, Bario Nuevo, San Crist????????bal', '8095278499', 'Rev. Juan Dionisio Castillo', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(196, 205, 'Calle Privada, Hoyo Del Barrio, Ingenio Nuevo Sc', '8092352864', 'Exh. Brijido De La Cruz', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(197, 206, 'Calle Libertad #10, Sabana Grande De Palenque, SC', '8092882431', 'Rev. Ram????????n Ram????????rez', '0000-00-00', '0000-00-00', 1, 'cbatel'),
(198, 207, 'Calle P????????pilo D????????as #80 Madre Vieja Norte, La Pi????????a', '8095280873', 'Rev. Abel Alias Tejeda Gonzales', '0000-00-00', '0000-00-00', 1, 'cbatel');

-- --------------------------------------------------------

--
-- Table structure for table `aic_iglesia_estadisticas`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 18, 2018 at 07:52 PM
--

DROP TABLE IF EXISTS `aic_iglesia_estadisticas`;
CREATE TABLE `aic_iglesia_estadisticas` (
  `id_estadistica` int(10) NOT NULL,
  `id_circuito` int(3) NOT NULL,
  `id_iglesia` int(4) NOT NULL,
  `pastor` varchar(60) NOT NULL,
  `fch_estadistica` date NOT NULL,
  `ano_eclesiastico` varchar(10) NOT NULL,
  `damas_inicial` int(4) NOT NULL,
  `damas_final` int(4) NOT NULL,
  `caballeros_inicial` int(4) NOT NULL,
  `caballeros_final` int(4) NOT NULL,
  `jovenes_inicial` int(4) NOT NULL,
  `jovenes_final` int(4) NOT NULL,
  `juveniles_inicial` int(4) NOT NULL,
  `ninos_inicial` int(4) NOT NULL,
  `ninos_final` int(4) NOT NULL,
  `prefesiones_fe` int(4) NOT NULL,
  `ganados_bautismo` int(3) NOT NULL,
  `ganados_traslado` int(3) NOT NULL,
  `ganados_otro_concilio` int(3) NOT NULL,
  `perdidos_muerte` int(3) NOT NULL,
  `perdidos_traslado` int(3) NOT NULL,
  `perdidos_otro_concilio` int(3) NOT NULL,
  `perdidos_descarriados` int(3) NOT NULL,
  `maestros_ebaic` int(3) NOT NULL,
  `maestros_itaic` int(3) NOT NULL,
  `maestros_emaic` int(3) NOT NULL,
  `estudiantes_itaic_prim` int(3) NOT NULL,
  `estudiantes_itaic_seg` int(3) NOT NULL,
  `estudiantes_itaic_ter` int(3) NOT NULL,
  `estudiantes_emaic` int(3) NOT NULL,
  `graduados_itaic` int(3) NOT NULL,
  `graduados_emaic` int(3) NOT NULL,
  `oficiales_aic` int(3) NOT NULL,
  `laicos_registrados` int(3) NOT NULL,
  `total_miembros` int(4) NOT NULL,
  `miembros_activos` int(4) NOT NULL,
  `miembros_pasivos` int(4) NOT NULL,
  `campos_blancos` int(3) NOT NULL,
  `exhortadores` int(3) NOT NULL,
  `exhortadoras` int(3) NOT NULL,
  `lic_pastores` int(3) NOT NULL,
  `lic_pastoras` int(3) NOT NULL,
  `lic_predicadores` int(3) NOT NULL,
  `lic_predicadoras` int(3) NOT NULL,
  `ministros_ordenados` int(3) NOT NULL,
  `ministras_ordenadas` int(3) NOT NULL,
  `evangelistas` int(3) NOT NULL,
  `usuario` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aic_persona`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_persona`;
CREATE TABLE `aic_persona` (
  `id_persona` int(6) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `fch_nacimiento` date NOT NULL,
  `fch_conversion` date NOT NULL,
  `sexo` varchar(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_persona`
--

INSERT INTO `aic_persona` (`id_persona`, `nombre`, `apellidos`, `fch_nacimiento`, `fch_conversion`, `sexo`) VALUES
(2, 'Francisco', 'Brujan Arias', '1977-06-04', '1992-03-17', 'Masculino'),
(5, 'Flor Angel', 'Mojica de Baez', '0000-00-00', '0000-00-00', 'Femenino'),
(6, 'Clarivel Jacqueline', 'Brujan Batel', '1975-12-20', '1992-08-08', 'Femenino');

-- --------------------------------------------------------

--
-- Table structure for table `aic_persona_detalle_hist`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_persona_detalle_hist`;
CREATE TABLE `aic_persona_detalle_hist` (
  `id_detalle` int(8) NOT NULL,
  `id_persona` int(6) NOT NULL,
  `id_rango` int(3) NOT NULL,
  `id_provincia` int(3) NOT NULL,
  `id_circuito` int(3) NOT NULL,
  `credencial_aic` varchar(10) NOT NULL,
  `id_iglesia` int(4) NOT NULL,
  `cedula` varchar(13) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `peso` int(3) NOT NULL,
  `estatura` varchar(7) NOT NULL,
  `estado_civil` varchar(10) NOT NULL,
  `color_ojos` varchar(10) NOT NULL,
  `color_piel` varchar(10) NOT NULL,
  `color_cabello` varchar(10) NOT NULL,
  `ocupacion` varchar(25) NOT NULL,
  `grado_academico` varchar(27) NOT NULL,
  `pastor` varchar(50) NOT NULL,
  `fch_inicio` date NOT NULL,
  `fch_fin` date NOT NULL,
  `ultima_actualizacion` tinyint(1) NOT NULL DEFAULT '1',
  `usuario` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_persona_detalle_hist`
--

INSERT INTO `aic_persona_detalle_hist` (`id_detalle`, `id_persona`, `id_rango`, `id_provincia`, `id_circuito`, `credencial_aic`, `id_iglesia`, `cedula`, `telefono`, `direccion`, `peso`, `estatura`, `estado_civil`, `color_ojos`, `color_piel`, `color_cabello`, `ocupacion`, `grado_academico`, `pastor`, `fch_inicio`, `fch_fin`, `ultima_actualizacion`, `usuario`) VALUES
(1, 2, 2, 24, 2, 'RD-0855', 187, '002-0097492-1', '8094232642', 'Calle 19 de Marzo No. 16 Los Molina', 180, '5.5', 'Casado(a)', 'Negros', 'Negro', 'Negros', 'Empleado', 'Universitario(a)', 'Rev. Federico Claudio Alvares', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(4, 5, 3, 24, 2, '', 187, '', '829450xxxx', 'Barrio los Molina', 180, '5', 'Casado(a)', 'Marron', 'Morena', 'Negros', '', 'Universitario(a)', 'Rev. Federico Claudio Alvares', '0000-00-00', '0000-00-00', 1, 'fbrujan'),
(5, 6, 1, 24, 2, '', 187, '002-0115998-5', '8094362642', 'Calle 19 de Marzo No. 16 Los Molina', 120, '5', 'Casado(a)', 'Verdes', 'Blanca', 'Rubio', 'Estudiante', 'Universitario(a)', 'Rev. Federico Claudio Alvares', '0000-00-00', '0000-00-00', 1, 'fbrujan');

-- --------------------------------------------------------

--
-- Table structure for table `aic_persona_imagen`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_persona_imagen`;
CREATE TABLE `aic_persona_imagen` (
  `id_imagen` int(6) NOT NULL,
  `id_persona` int(6) NOT NULL,
  `credencial_aic` varchar(10) NOT NULL,
  `imagen` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_persona_imagen`
--

INSERT INTO `aic_persona_imagen` (`id_imagen`, `id_persona`, `credencial_aic`, `imagen`) VALUES
(2, 2, 'RD-0855', '../2_2012-01-05-124103.jpg'),
(5, 6, '', '../aic_fotos/6__clari01.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `aic_rango_ministerial`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_rango_ministerial`;
CREATE TABLE `aic_rango_ministerial` (
  `id_rango` int(3) NOT NULL,
  `rango` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_rango_ministerial`
--

INSERT INTO `aic_rango_ministerial` (`id_rango`, `rango`) VALUES
(8, 'De otro Concilio'),
(7, 'Evangelista'),
(3, 'Exhortador (a)'),
(2, 'Laico Registrado (a)'),
(5, 'Lic. Pastor (a)'),
(4, 'Lic. Predicador (a)'),
(1, 'Miembro Laico'),
(6, 'Ministro Ordenado (a)');

-- --------------------------------------------------------

--
-- Table structure for table `aic_registro`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_registro`;
CREATE TABLE `aic_registro` (
  `id_registro` int(8) NOT NULL,
  `id_distrito` int(11) NOT NULL,
  `id_actividad` varchar(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `no_orden` varchar(20) DEFAULT NULL,
  `nombres` varchar(40) DEFAULT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `sexo` varchar(10) NOT NULL,
  `zona` varchar(40) DEFAULT NULL,
  `iglesia` int(3) NOT NULL,
  `rango_ministerial` varchar(40) DEFAULT NULL,
  `credencial` varchar(10) DEFAULT NULL,
  `asociacion` varchar(10) DEFAULT NULL,
  `comite` varchar(40) DEFAULT 'Miembro',
  `cargo_comite` varchar(40) DEFAULT NULL,
  `tanda` varchar(10) DEFAULT NULL,
  `usuario` varchar(15) NOT NULL,
  `id_comite` varchar(5) NOT NULL,
  `id_cargo` int(3) NOT NULL,
  `costo` int(5) NOT NULL,
  `exhonerado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AVG_ROW_LENGTH=227 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_registro`
--

INSERT INTO `aic_registro` (`id_registro`, `id_distrito`, `id_actividad`, `fecha`, `no_orden`, `nombres`, `apellidos`, `sexo`, `zona`, `iglesia`, `rango_ministerial`, `credencial`, `asociacion`, `comite`, `cargo_comite`, `tanda`, `usuario`, `id_comite`, `id_cargo`, `costo`, `exhonerado`) VALUES
(1, 1, 'CONV-ADAIC-2012', '2012-04-21', '1', 'Ramona', 'Pion', 'Femenino', '15', 114, '1', '', 'ADAIC', '', '', 'Matutina', 'fbrujan', '', 0, 0, 0),
(4, 1, 'CONV-ADAIC-2012', '2012-04-24', '2', 'Francisco', 'Brujan Arias', 'Masculino', '2', 187, '2', '', 'ACAIC', '', '', 'Matutina', 'fbrujan', '', 0, 0, 0),
(5, 1, 'CONV-ADAIC-2012', '2012-04-24', '3', 'Clarivel Jacqueline', 'Batel Ramirez', 'Femenino', '2', 187, '1', '', 'ADAIC', '', '', 'Matutina', 'fbrujan', '', 0, 0, 0),
(6, 1, 'CONV-ADAIC-2012', '2012-04-24', '4', 'Isis jafreisis', 'Brujan Batel', 'Femenino', '2', 187, '1', '', 'ADAIC', '', '', 'Vespertina', 'fbrujan', '', 0, 0, 0),
(7, 1, 'CONV-ADAIC-2012', '2012-04-26', '5', 'Franyelis Yelisa', 'Brujan Batel', 'Femenino', '2', 187, '1', '', 'ADAIC', '', '', 'Matutina', 'fbrujan', '', 0, 0, 0),
(8, 1, 'CONV-ADAIC-2012', '2012-04-26', '6', 'Jilfrandy Francisco', 'Brujan Batel', 'Masculino', '2', 187, '1', '', 'ACAIC', '', '', 'Vespertina', 'fbrujan', '', 0, 0, 0),
(9, 1, 'CONV-ADAIC-2012', '2012-04-27', '7', 'Fraider Joelfri', 'Brujan Batel', 'Masculino', '2', 187, '1', '', 'ANAIC', '', '', 'Matutina', 'fbrujan', '', 0, 0, 0),
(10, 1, 'CONV-ACAIC-2012', '2012-04-27', '1', 'Willy', 'Taveras', 'Masculino', '7', 45, '7', '0774', 'ACAIC', '', '', 'Matutina', 'cbatel', '', 0, 0, 0),
(11, 1, 'CONV-ADAIC-2012', '2012-04-30', '8', 'Santo', 'Lorenzo Placencio', 'Masculino', '2', 187, '1', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 20, 0, 0),
(12, 1, 'CONV-ADAIC-2012', '2012-04-30', '9', 'Julia', 'Yoli Amador', 'Femenino', '2', 187, '1', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 20, 750, 0),
(13, 1, 'CONV-ADAIC-2012', '2012-04-30', '10', 'Claudio', 'Alvarez', 'Masculino', '2', 187, '6', 'RD-0048', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 15, 0, 0),
(14, 1, 'CONV-ADAIC-2012', '2012-04-30', '10', 'Jose Alberto', 'Victorino', 'Masculino', '2', 177, '2', '', 'ACAIC', '', '', 'Ma????????ana', 'benita', 'HOS', 5, 750, 0),
(15, 1, 'SIMPOSIO-2012', '2012-10-20', '1', 'Francisco', 'Brujan Arias', 'Masculino', '2', 187, '3', 'RD-855', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 500, 0),
(16, 1, 'SIMPOSIO-2012', '2012-10-20', '2', 'Clarivel Jacqueline', 'Batel Ramirez', 'Femenino', '2', 187, '2', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 500, 0),
(17, 1, 'SIMPOSIO-2012', '2012-10-20', '3', 'Miriam Mercedes', 'Rodriguez', 'Femenino', '2', 187, '3', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 500, 0),
(18, 1, 'SIMPOSIO-2012', '2012-10-20', '4', 'Flor Angel', 'Mojica de Baez', 'Femenino', '2', 187, '3', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 500, 0),
(19, 1, 'SIMPOSIO-2012', '2012-10-20', '5', 'Sarita', 'Martinez', 'Femenino', '2', 187, '1', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 500, 0),
(20, 1, 'SIMPOSIO-2012', '2012-10-20', '6', 'Luz Celia', 'Diaz', 'Femenino', '2', 187, '1', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 500, 0),
(21, 1, 'SIMPOSIO-2012', '2012-10-20', '7', 'Dinorah', 'Montero', 'Femenino', '2', 179, '3', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 500, 0),
(22, 1, 'SIMPOSIO-2012', '2012-10-20', '8', 'Julio Manuel', 'Garabitos', 'Masculino', '2', 180, '6', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'EJE', 4, 500, 0),
(23, 1, 'SIMPOSIO-2012', '2012-10-20', '9', 'Joel', 'De los Santos Caro', 'Masculino', '2', 181, '6', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'EJE', 10, 500, 0),
(24, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Abelardo', 'Batista', 'Masculino', '2', 180, '6', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'EJE', 18, 500, 0),
(25, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Marcial', 'Reyes Soba', 'Masculino', '15', 114, '6', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'EJE', 3, 500, 0),
(26, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Cecilia', 'Ruiz de Vizcaino', 'Femenino', '2', 200, '6', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'EJE', 8, 500, 0),
(27, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Benita', 'Paredes Rosario', 'Femenino', '2', 177, '6', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'EJE', 7, 500, 0),
(28, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Eladio', 'Quintana', 'Masculino', '15', 114, '6', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'EJE', 1, 500, 0),
(29, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Sebastian', 'Lora Reina', 'Masculino', '13', 73, '6', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'EJE', 1, 500, 0),
(30, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Julio Anibal', 'Medina Padilla', 'Masculino', '2', 202, '6', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'EJE', 9, 500, 0),
(31, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Yulys Alberto', 'Batel Ramirez', 'Masculino', '2', 199, '3', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 500, 0),
(32, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Olandina', 'Martinez', 'Femenino', '2', 199, '1', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 500, 0),
(33, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Stalin', 'Ledesma', 'Masculino', '2', 203, '1', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 500, 0),
(34, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Edward', 'Cifre', 'Masculino', '16', 101, '4', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'EJE', 1, 500, 0),
(35, 1, 'SIMPOSIO-2012', '2012-10-20', '10', 'Sandra', 'Soriano', 'Femenino', '2', 203, '1', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 500, 0),
(36, 1, 'CONV-AICINC-2013', '2012-12-03', '1', 'Benita', 'Paredes Rosario', 'Femenino', '2', 177, '6', '', 'ADAIC', '', '', 'Ma????????ana', 'fbrujan', 'EJE', 7, 0, 0),
(37, 1, 'CONV-AJAIC-2013', '2013-01-11', '1', 'Francisco', 'Brujan', 'Masculino', '2', 187, '3', 'RD-855', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'REG', 12, 0, 0),
(38, 1, 'CONV-AJAIC-2013', '2013-01-11', '2', 'Daniel', 'Mendoza', 'Masculino', '4', 27, '1', '', 'AJAIC', '', '', 'Ma????????ana', 'fbrujan', 'REG', 12, 0, 0),
(39, 1, 'CONV-AICINC-2013', '2013-05-21', '2', 'Francisco', 'Brujan Arias', '', '2', 187, '3', 'RD-855', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'REG', 5, 0, 0),
(40, 1, 'CONV-AICINC-2013', '2013-05-21', '3', 'Francy', 'Ledesma Gonz????lez', '', '2', 181, '3', '', 'AJAIC', '', '', 'Ma????????ana', 'fbrujan', 'Selec', 0, 0, 0),
(41, 1, 'CAMP-AICINC-2016', '2016-03-29', '1', 'Juan Carlos', 'Polanco', 'Masculino', '16', 108, '1', '', 'ACAIC', '', '', 'Ma????????ana', 'fbrujan', 'GEN', 17, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aic_tipo_actividad`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `aic_tipo_actividad`;
CREATE TABLE `aic_tipo_actividad` (
  `id_tipo_actividad` varchar(10) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=MyISAM AVG_ROW_LENGTH=5461 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aic_tipo_actividad`
--

INSERT INTO `aic_tipo_actividad` (`id_tipo_actividad`, `nombre`) VALUES
('CONV', 'Convencion'),
('CAMP', 'Campamento');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_banner`
--
-- Creation: Jun 26, 2017 at 02:11 PM
-- Last update: Jun 26, 2017 at 02:11 PM
--

DROP TABLE IF EXISTS `aicrd_banner`;
CREATE TABLE `aicrd_banner` (
  `bid` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT 'banner',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_bannerclient`
--
-- Creation: Jun 26, 2017 at 02:11 PM
-- Last update: Jun 26, 2017 at 02:11 PM
--

DROP TABLE IF EXISTS `aicrd_bannerclient`;
CREATE TABLE `aicrd_bannerclient` (
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_bannertrack`
--
-- Creation: Jun 26, 2017 at 02:11 PM
-- Last update: Jun 26, 2017 at 02:11 PM
--

DROP TABLE IF EXISTS `aicrd_bannertrack`;
CREATE TABLE `aicrd_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) UNSIGNED NOT NULL,
  `banner_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_categories`
--
-- Creation: Jun 26, 2017 at 02:11 PM
-- Last update: Jun 26, 2017 at 02:11 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_categories`;
CREATE TABLE `aicrd_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_categories`
--

INSERT INTO `aicrd_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(1, 0, 'locales', '', 'locales', '', '1', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(2, 0, 'circuitos', '', 'circuitos', '', '1', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(3, 0, 'nacionales', '', 'nacionales', '', '1', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(4, 0, 'internacionales', '', 'internacionales', '', '1', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(14, 0, 'Escuela Ministerios', '', 'emaic', '', '9', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(10, 0, 'Damas', '', 'damas', '', '4', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(11, 0, 'Caballeros', '', 'caballeros', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(12, 0, 'Jovenes', '', 'jovenes', '', '6', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(13, 0, 'Instituto Teologico', '', 'itaic', '', '8', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(15, 0, 'Escuela Biblica', '', 'ebaic', '', '2', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(16, 0, 'Damas', '', 'damas', '', '11', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(17, 0, 'Caballeros', '', 'caballeros', '', '11', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(18, 0, 'Jovenes', '', 'jovenes', '', '11', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(19, 0, 'Ninos', '', 'ninos', '', '11', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(20, 0, 'Juveniles', '', 'juveniles', '', '11', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 5, 0, 0, ''),
(21, 0, 'Escuela Biblica', '', 'escuela-biblica', '', '13', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(22, 0, 'Escuela de Ministerios', '', 'escuela-de-ministerios', '', '13', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(23, 0, 'Instituto Teologico', '', 'instituto-teologico', '', '13', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(24, 0, 'Cuerpo Cadetes ', '', 'cuerpo-cadetes-', '', '11', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(25, 0, 'San Cristobal Centro', '', 'sab-cristobal-centro', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(26, 0, 'San Cristobal Oeste', '', 'san-cristobal-oeste', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(27, 0, 'Haina', '', 'haina', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(28, 0, 'Santiago', '', 'santiago', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(29, 0, 'San Jose de Ocoa', '', 'san-jose-de-ocoa', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 5, 0, 0, ''),
(30, 0, 'La Romana', '', 'la-romana', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(31, 0, 'San Juan de la Maguana', '', 'san-juan-de-la-maguana', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 7, 0, 0, ''),
(32, 0, 'Higuey', '', 'higuey', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 8, 0, 0, ''),
(33, 0, 'Santo Domingo Este', '', 'santo-domingo-este', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 9, 0, 0, ''),
(34, 0, 'Santo Domingo Oeste', '', 'santo-domingo-oeste', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 10, 0, 0, ''),
(35, 0, 'San Pedro de Macoris', '', 'san-pedro-de-macoris', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 11, 0, 0, ''),
(36, 0, 'Puerto Plata', '', 'puerto-plata', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 12, 0, 0, ''),
(37, 0, 'Sosua', '', 'sosua', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 13, 0, 0, ''),
(38, 0, 'Bani', '', 'bani', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 14, 0, 0, ''),
(39, 0, 'Monte Plata', '', 'monte-plata', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 15, 0, 0, ''),
(40, 0, 'Barahona', '', 'barahona', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 16, 0, 0, ''),
(42, 0, 'Educaci????n', '', 'educacion', '', '15', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(43, 0, 'Instituto Teol????gico', '', 'instituto-teologico', '', '15', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(44, 0, 'Escuela Biblica', '', 'escuela-biblica', '', '15', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(45, 0, 'Escuela Ministerios', '', 'escuela-ministerios', '', '15', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(46, 0, 'Educaci????n', 'Educaci????n', '', '', 'com_docman', 'left', '<p>Listado de Documentos para Descargar</p>', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_components`
--
-- Creation: Jun 26, 2017 at 02:11 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_components`;
CREATE TABLE `aicrd_components` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `parent` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_components`
--

INSERT INTO `aicrd_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clientes', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Enlaces Web', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Enlaces', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categor????as', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contactos', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contactos', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categor????as', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, '', 1),
(10, 'Encuesta', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(13, 'Categor????as', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'Usuario', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Buscar', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categor????as', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail para', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Administrador Media', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=0\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n', 1),
(20, 'Art????culos', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\n\n', 1),
(21, 'Administrar Configuraci????n', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Administrar Instalaciones', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Gestor de idiomas', '', 0, 0, '', 'Idiomas', 'com_languages', 0, '', 1, 'administrator=es-ES\nsite=es-ES', 1),
(24, 'Mail masivo', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Men???? del editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Mensajes', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Administrar modulos', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Administrar Plugin', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Administrar plantilla', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'Administrar usuarios', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Administrar la cach????', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Panel de Control', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(34, 'Administrador de Traducciones', 'option=com_translationsmanager', 0, 0, 'option=com_translationsmanager', 'Administrador de Traducciones', 'com_translationsmanager', 0, 'class:language', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_contact_details`
--
-- Creation: Jun 26, 2017 at 02:11 PM
-- Last update: Jun 26, 2017 at 02:11 PM
--

DROP TABLE IF EXISTS `aicrd_contact_details`;
CREATE TABLE `aicrd_contact_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_content`
--
-- Creation: Jun 26, 2017 at 02:11 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_content`;
CREATE TABLE `aicrd_content` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `mask` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `catid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `parentid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `metadata` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_content`
--

INSERT INTO `aicrd_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(1, 'Relacionadora Publica ADAIC 2011-2012', 'relacionadora-publica', '', '<p>Nombre: Clarivel Jacqueline Batel Ramirez de Brujan</p>\r\n<p>Iglesia: Evangelica Fraternal I</p>\r\n<p>Pastor: Rev. Federico Claudio Alvarez</p>\r\n<p>Zona: San Cristobal Centro</p>\r\n<p>Edad: Despues de los 15 no se dice</p>\r\n<p> </p>\r\n<p>Me gusta Adorar al Padre en Espiritu y En Verdad.</p>\r\n<p>Soy madre de 4 Ni????os a los que amo con todo mi Corazon.</p>\r\n<p>He Dispuesto mi Corazon para temer a Dios y para servirle donde quiera que el me envie. Es por ello que estoy aqui, decidida a Luchar y Ser Victoriosa en Dios.</p>', '', 0, 11, 0, 16, '2011-03-29 01:27:34', 63, '', '2011-04-13 03:44:52', 63, 0, '0000-00-00 00:00:00', '2011-03-29 01:27:34', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=es-ES\nkeyref=\nreadmore=Conoce Mas...', 26, 0, 3, '', '', 0, 183, 'robots=\nauthor='),
(54, 'Convenci????n Nacional AIC 2011', 'convencion-nacional-aic-2011', '', '<p>Se les recuerda a Todos que nuestra Magna Convenci????n Nacional de Asamblea de Iglesias Cristianas,Inc. Distrito Rep????blica Dominicana; se estar???? celebrando a partir del pr????ximo mi????rcoles 18 hasta el s????bado 21 de mayo del 2011.</p>\r\n<p>????</p>\r\n<p>Lugar: Centro Conferencial MICMAS, Escondido, Ban????.</p>\r\n<p>Costo RD$ 800.00 P/P</p>\r\n<p>????</p>\r\n<h1>No te la puedes perder!!!!!!!!!!!!!!!!!!!!</h1>\r\n<p>.....</p>\r\n<p>Espera mas detalles pronto....</p>', '', 1, 1, 0, 3, '2011-04-25 16:56:54', 63, '', '2016-05-10 13:40:24', 63, 0, '0000-00-00 00:00:00', '2011-04-25 16:56:54', '2016-05-02 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 7, '', '', 0, 152, 'robots=\nauthor='),
(28, 'Bethania', 'bethania', '', '<p>DIRECCION: Calle principal no. 22, Coleton Enriquillo, Barahona</p>\r\n<p>CIRCUIITO: Barahona</p>\r\n<p>PASTOR: Santo Feliz</p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><span lang=\"en-US\">TELEFONO: </span>829-834-0233.</em></span></span></span></p>', '', 1, 14, 0, 40, '2011-04-12 13:31:17', 65, '', '2011-05-06 19:14:50', 63, 0, '0000-00-00 00:00:00', '2011-04-12 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 140, 'robots=\nauthor='),
(29, 'Tesal????nica', 'tesalonica', '', '<p>DIRECCION: Calle S????nchez no. 36, Enriquillo Barahona.</p>\r\n<p>CIRCUITO: Barahona</p>\r\n<p>PASTOR: Reynaldo Arias Guzm????n</p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><span lang=\"en-US\">TELEFONO: </span>829-506-3055</em></span></span></span></p>', '', 1, 14, 0, 40, '2011-04-12 13:37:34', 65, '', '2011-05-06 19:15:53', 63, 0, '0000-00-00 00:00:00', '2011-04-12 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 4, '', '', 0, 135, 'robots=\nauthor='),
(30, 'La Hermosa', 'la-hermosa', '', '<p>DIRECCION: Arroyo Dulce, Enriquillo, Barahona</p>\r\n<p>CIRCUITO: Barahona</p>\r\n<p>PASTOR: Rev. Esporminio Motos P????rez</p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><span lang=\"en-US\">TELEFONO: </span>809-973-4377</em></span></span></span></p>', '', 1, 14, 0, 40, '2011-04-12 13:43:25', 65, '', '2011-05-06 19:16:52', 63, 0, '0000-00-00 00:00:00', '2011-04-12 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 185, 'robots=\nauthor='),
(31, 'Getseman????', 'getsemani', '', '<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">DIRECCION: El Baulio Soto no. 23, Postrer Rio, Jiman????</span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">CIRCUITO: Barahona</span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">PASTOR: John Kennedy Jim????nez</span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">TELEFONO: 809-901-9215</span></span></p>', '', 1, 14, 0, 40, '2011-04-12 13:59:14', 65, '', '2011-07-12 12:35:21', 63, 0, '0000-00-00 00:00:00', '2011-04-12 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 2, '', '', 0, 180, 'robots=\nauthor='),
(32, 'Mensaje del Obispo', 'mensaje-del-obispo', '', '<p style=\"text-align: justify;\">Como Obispo y presidente de la Asamblea de Iglesias Cristianas, Inc., me place saludarles. Es emocionante hablar de nuestra organizacion <img src=\"images/stories/obispo.jpg\" border=\"0\" width=\"140\" height=\"162\" align=\"right\" />desde sus comienzos hasta el presente.</p>\r\n<p style=\"text-align: justify;\">La Asamblea de Iglesias Cristiana, Inc. (AIC, Inc.) nace el d????a de las madres de 1939. Los padres fundadores fueron el Rev. Carlos Sep????lveda y Felipe G. Sabater. Nustros antecesores fueron guiados por Dios e inspirados en la magnifica obra evangelizadora del insigne ap????stol azteca, Rev. Francisco Olaz????bal, en uni????n a otros fieles colaboradores dieron a este gran concilio.<br /> <br /> Dentro de estos baluartes que fungieron en su hora, est????n los Reverendos: Frank Alexander, Frank Hern????ndez y celestino Griociotti. Como concilio pentecostal, la base doctrinal esta sustentada en la Santa Biblia y as???? mismo nuestra organizaci????n como cuerpo debidamente estructurado, esta regido por la Constituci????n y reglamento aprobados en convenci????n internacional.</p>\r\n', '\r\n<p><br /> <br /> El Gobierno Central de AIC se compone del Comit???? Ejecutivo (presidido por el Obispo), el Comit???? de Credenciales y Conducta Ministerial y la Junta de Directores (S????ndicos).</p>\r\n<p> </p>\r\n<p style=\"text-align: justify;\">La AIC funciona en mas de 34 pa????ses con 6 Distritos fuertemente establecidos y 24 Campos Misioneros organizados, comprendidos en todo el territorio, desde Canad???? hasta Argentina, incluyendo el Caribe. Asamblea de Iglesias Cristianas, Inc. se ha extendido al otro lado del Atlantico estableciendo nuevos campos en Europa, India y Africa. Nuestra obra misionera se extiende constantemente. La misi????n es evangelizadora. En la actualidad contamos con 1,600 iglesias miembros, desde donde ministramos a la comunidad en todas las ????reas: social, cultural y educacional. Somos una voz de alerta y una familia unida al servicio de Dios y de nuestros semejantes.<br /> <br /> Contamos con la aprobaci????n de un libro llamado: ???????Adelante en la carrera???????, a trav????s del cual puedes obtener mas informaci????n acerca de la declaraci????n de fe, organigrama, departamentos y dependencias de la AIC, Inc. Este libro lo puedes pedir al 722 Prospect Avenue, Bronx, N.Y. 10455 donde se encuentran localizadas las oficinas centrales de nuestro concilio.<br /> <br /> Ser miembro de esta institucion es mas que un privilegio y usted tambien puede ser parte de la gran familia Aicie????a. La familia de la fe que menciona el venerable apostol Pablo en la epistola a los Galatas. Ser parte de la historia de la Asamblea de Iglesias Cristianas, Inc., no importa el tiempo que vivamos entendemos que Dios nos ha permitido poner un grano de arena para que hoy por hoy nuestra institucion sea conocida intenacionalmente.<br /> Dios te bendiga y continue cumpliendo su prop????sito en tu vida,</p>\r\n<p style=\"text-align: justify;\"><strong>Rev. Abelardo Batista Miranda<br /> Obispo y Presidente</strong></p>', 1, 1, 0, 3, '2011-04-08 15:08:15', 62, '', '2011-04-13 20:49:25', 63, 0, '0000-00-00 00:00:00', '2011-04-08 15:08:15', '0000-00-00 00:00:00', '', '', 'show_title=1\nlink_titles=\nshow_intro=1\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nlanguage=\nkeyref=\nreadmore=Conoce Mas...', 5, 0, 8, '', '', 0, 140, 'robots=\nauthor='),
(9, 'Bethesda', 'bethesda', '', '<p>DIRECCION:Calle General Duverge no. 12</p>\r\n<p>CIRCUITO: San Crist????bal Centro</p>\r\n<p>PASTOR: Rev. Julio Manuel Garabito</p>\r\n<p>TELEFONO: 809-528-0473</p>', '', 1, 14, 0, 25, '2011-04-10 20:08:03', 65, '', '2011-05-06 18:31:54', 63, 0, '0000-00-00 00:00:00', '2011-04-10 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 30, '', '', 0, 147, 'robots=\nauthor='),
(10, 'Jesus la Unica Esperanza', 'jesus-la-unica-esperanza', '', '<p> </p>\r\n<p>DIRECCION: Calle Gregorio Luperon no. 11, Palmar de Ocoa</p>\r\n<p>CIRCUITO: Bani</p>\r\n<p>PASTOR: Rev. Pedro Sanchez</p>\r\n<p>TELEFONO: 809-243-7146 / 809-340-6135</p>', '', 1, 14, 0, 38, '2011-04-10 20:21:00', 65, '', '2011-05-06 01:21:21', 63, 0, '0000-00-00 00:00:00', '2011-04-10 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=1\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 14, '', '', 0, 132, 'robots=\nauthor='),
(14, 'Directiva Nacional Caballeros 2011-2012', 'directiva-nacional-caballeros-2011-2012', '', '<p>Presidente: Andres la Post (Higuey)</p>\r\n<p>Vice Presidente: Carmelo Arias</p>\r\n<p>Secretario: Jose Alberto Victorino (San Cristobal Centro)</p>\r\n<p>Sub secretario: Felipe Santos</p>\r\n<p>Tesorero: Edward Cifre (Santo Domingo Oeste)</p>\r\n<p>sub Tesorero: Martin Jimenez (Sosua)</p>\r\n<p>Primer Vocal: Juan Jesus Dipre</p>\r\n<p>Segundo Vocal: Maximo Lebron</p>\r\n<p>Relacionador Publico: Benito de la Rosa (San Cristobal Oeste)</p>\r\n<p>Consejero: Pedro Alejandro Valera</p>', '', 0, 11, 0, 17, '2011-04-10 21:42:03', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-04-10 00:00:00', '0000-00-00 00:00:00', '', '', '', 1, 0, 1, '', '', 0, 97, ''),
(11, 'Getsemani', 'getsemani', '', '<p><em>DIRECCION: Calle San Gabriel # 33 Km 9 Carretera S????nchez.</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Rev. Cesar De Los Santos Asencio. </em></p>\r\n<p><em>TELEFONO: 809-564-5030.</em></p>', '', 1, 14, 0, 34, '2011-04-10 20:41:09', 65, '', '2011-05-07 00:26:13', 65, 0, '0000-00-00 00:00:00', '2011-04-10 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 17, '', '', 0, 106, 'robots=\nauthor='),
(15, 'Directiva Nacional Damas 2011-2012', 'directiva-nacional-damas-2011-2012', '', '<p><img src=\"images/stories/actividades 389.jpg\" border=\"0\" width=\"330\" height=\"347\" style=\"margin-left: 10px; margin-right: 10px; border: 5px solid black; float: left;\" /></p>\r\n<p>Supervisor: Rev. Marcial Reyes Sob????</p>\r\n<p>Presidenta: Lic. Alejandrina Ripoll</p>\r\n<p>Vice Presidenta: Rosi Belen</p>\r\n<p>Secretaria: Petra Vasquez</p>\r\n<p>Sub Secretaria: En????rgica Santana</p>\r\n<p>Tesorera: Lic. Miledis Mota de Lora</p>\r\n<p>Sub Tesorera: Lic. Pastora Nero de Figuereo</p>\r\n<p>Primer Vocal: Exh. Maribel Rodriguez</p>\r\n<p>Segundo Vocal: Luz del Carmen Robles</p>\r\n<p>Relacionadora Publica: Clarivel Jacqueline Batel Ramirez</p>\r\n<p>Consejera: Matea Estrella</p>', '', 0, 11, 0, 16, '2011-04-10 21:46:43', 63, '', '2011-10-19 19:34:05', 72, 0, '0000-00-00 00:00:00', '2011-04-10 00:00:00', '0000-00-00 00:00:00', '', '', '', 5, 0, 2, '', '', 0, 138, ''),
(4, 'Mensaje del Obispo', 'mensaje-del-obispo', '', '<p style=\"text-align: justify;\">Como Obispo y presidente de la Asamblea de Iglesias Cristianas, Inc., me place saludarles. Es emocionante<img src=\"images/stories/obispo.jpg\" border=\"0\" width=\"180\" height=\"240\" align=\"right\" style=\"float: right; border: 5px solid black; margin-left: 10px; margin-right: 10px;\" /> hablar de nuestra organizacion desde sus comienzos hasta el presente.</p>\r\n<p style=\"text-align: justify;\">La Asamblea de Iglesias Cristiana, Inc. (AIC, Inc.) nace el d????a de las madres de 1939. Los padres fundadores fueron el Rev. Carlos Sep????lveda y Felipe G. Sabater. Nustros antecesores fueron guiados por Dios e inspirados en la magnifica obra evangelizadora del insigne ap????stol azteca, Rev. Francisco Olaz????bal, en uni????n a otros fieles colaboradores dieron a este gran concilio.<br /> <br /> Dentro de estos baluartes que fungieron en su hora, est????n los Reverendos: Frank Alexander, Frank Hern????ndez y celestino Griociotti. Como concilio pentecostal, la base doctrinal esta sustentada en la Santa Biblia y as???? mismo nuestra organizaci????n como cuerpo debidamente estructurado, esta regido por la Constituci????n y reglamento aprobados en convenci????n internacional.<br /> <br /> El Gobierno Central de AIC se compone del Comit???? Ejecutivo (presidido por el Obispo), el Comit???? de Credenciales y Conducta Ministerial y la Junta de Directores (S????ndicos).</p>\r\n<p style=\"text-align: justify;\">La AIC funciona en mas de 34 pa????ses con 6 Distritos fuertemente establecidos y 24 Campos Misioneros organizados, comprendidos en todo el territorio, desde Canad???? hasta Argentina, incluyendo el Caribe. Asamblea de Iglesias Cristianas, Inc. se ha extendido al otro lado del Atlantico estableciendo nuevos campos en Europa, India y Africa. Nuestra obra misionera se extiende constantemente. La misi????n es evangelizadora. En la actualidad contamos con 1,600 iglesias miembros, desde donde ministramos a la comunidad en todas las ????reas: social, cultural y educacional. Somos una voz de alerta y una familia unida al servicio de Dios y de nuestros semejantes.<br /> <br /> Contamos con la aprobaci????n de un libro llamado: ???????Adelante en la carrera???????, a trav????s del cual puedes obtener mas informaci????n acerca de la declaraci????n de fe, organigrama, departamentos y dependencias de la AIC, Inc. Este libro lo puedes pedir al 722 Prospect Avenue, Bronx, N.Y. 10455 donde se encuentran localizadas las oficinas centrales de nuestro concilio.<br /> <br /> Ser miembro de esta institucion es mas que un privilegio y usted tambien puede ser parte de la gran familia Aicie????a. La familia de la fe que menciona el venerable apostol Pablo en la epistola a los Galatas. Ser parte de la historia de la Asamblea de Iglesias Cristianas, Inc., no importa el tiempo que vivamos entendemos que Dios nos ha permitido poner un grano de arena para que hoy por hoy nuestra institucion sea conocida intenacionalmente.<br /> Dios te bendiga y continue cumpliendo su prop????sito en tu vida,</p>\r\n<p style=\"text-align: justify;\"><strong>Rev. Abelardo Batista Miranda<br /> Obispo y Presidente</strong></p>', '', 1, 1, 0, 4, '2011-04-08 15:08:15', 62, '', '2011-04-12 15:06:16', 63, 0, '0000-00-00 00:00:00', '2011-04-08 15:08:15', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nlanguage=\nkeyref=\nreadmore=Conoce Mas', 10, 0, 1, '', '', 0, 2538, 'robots=\nauthor='),
(2, 'Elecciones Nacionales', 'elecciones-nacionales', '', '<p> </p>\r\n<p>residenta:</p>\r\n<p>Aliquam pharetra. Nulla</p>\r\n<p><img src=\"images/stories/obispo.jpg\" border=\"0\" style=\"float: left;\" /></p>\r\n<p>in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p> </p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p> </p>\r\n', '\r\n<p> </p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<div>\r\n<p>residenta:</p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p><span style=\"color: #ff0000;\"><br /></span></p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p> </p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n</div>\r\n<div>\r\n<p>residenta:</p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p> </p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p> </p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n</div>\r\n<div>\r\n<p>residenta:</p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p> </p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p> </p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n</div>\r\n<div>\r\n<p>residenta:</p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p> </p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p> </p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n</div>\r\n<div>\r\n<p>residenta:</p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p> </p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n<p> </p>\r\n<p>Aliquam pharetra. Nulla in tellus eget odio sagittis blandit.Maecenas at nisl. Nullam lorem mi, eleifend a, fringilla vel, semper at, ligula. Mauris eu wisi. Ut ante dui, aliquet nec, congue non, accumsan sit amet, lectus. Mauris et mauris. Duis sed massa id mauris pretium venenatis. Suspendisse cursus velit vel ligula. Mauris elit.</p>\r\n</div>\r\n<p> </p>', 0, 11, 0, 17, '2011-03-29 01:36:56', 62, '', '2011-04-10 18:55:28', 62, 0, '0000-00-00 00:00:00', '2011-03-29 01:36:56', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 2, '', '', 0, 89, 'robots=\nauthor='),
(5, 'Historia Asamblea de Iglesias Cristianas', 'historia-asamblea-de-iglesias-cristianas', '', '<p align=\"justify\"><strong><img class=\"caption\" src=\"images/stories/fco_olazabar.jpg\" border=\"0\" alt=\"Fundador AIC\" title=\"Francisco Olazabar\" align=\"right\" style=\"float: right; border: 5px solid black; margin-left: 20px; margin-right: 20px;\" />Asamblea de Iglesias Cristianas naci???? en la ciudad de Nueva York en el a????o 1939, un d????a de las Madres. </strong></p>\r\n<p align=\"justify\">En mayo de 1934 el evangelista mejicano Francisco Olaz????bal, celebr???? una poderosa campa????a bajo carpa, de evangelizaci????n y sanidad divina, en el pueblo de Ri???? Piedras. Producto de aquella campa????a lo fue el Rev. Carlos Sep????lveda, un pastor presbiteriano en Mayag????ez, que se acerc???? all???? y fue impactado por la experiencia de Pentecost????s y los milagros de sanidad divina que presenci????. Al concluir la misma, el Rev. Sep????lveda acept???? acompa????ar al evangelista Olaz????bal a la ciudad de Nueva York y de all???? a California donde fue instalado como pastor del Templo Bethel de Los ????ngeles. En el a????o 1936 volvi???? el Evangelista Olaz????bal a celebrar otra campa????a en Puerto Rico, en el pueblo de Ponce y San Juan, siendo nuevamente acompa????ado por el Rev. Sep????lveda, a quien esta vez dej???? pastoreando una peque????a iglesia en la playa de Ponce. Luego fue llamado a pastorear una iglesia en El Paso, Texas, EE.UU. En el a????o 1937, el Evangelista Francisco Olaz????bal fallece en un accidente automovil????stico en Texas, y a ra????z de su muerte los l????deres de la obra por ????l fundada, Concilio Latinoamericano de Iglesias, presidida por el Rev. Miguel Guill????n, comenzaron a cambiar las normas, a ser exclusivistas. Trataron de declararse vitalicios en sus puestos y aprobaron acuerdos desatinados provocando que en la Convenci????n de 1938 el grupo de puertorrique????os que all???? asisti????, capitaneados por los reverendos Sep????lveda, Frank Hern????ndez, Felipe Gonz????lez Sabater y Gilberto D????az decidieran separarse del Concilio.</p>\r\n<p align=\"justify\">En el 1939, el D????a de las Madres y en el Templo Bethel del 110, calle 114 de Nueva York se reunieron los reverendos Carlos Sep????lveda, Felipe Sabater (que era pastor) Frank Hern????ndez, Angel Robles, Frank Alexander, Max Padovani, Gilberto Ortiz y otros, y acordaron organizar un movimiento evangelizador y misionero de hispanos, dirigidos por hispanos y para trabajar entre los hispanos, bajo el nombre de Asamblea de Iglesias Cristianas, siendo incorporada en el mes de mayo en Washington, D.C. Seguidamente comenzaron a abrirse nuevas obras en el Este de Estados Unidos, Chicago, California, Pennsylvania, Nueva Jersey y se hicieron planes para establecerse en Puerto Rico y Santo Domingo.</p>\r\n<p> </p>', '', 1, 1, 0, 4, '2011-04-08 15:45:08', 62, '', '2011-04-10 17:51:53', 62, 72, '2011-05-05 18:52:42', '2011-04-08 15:45:08', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 2, '', '', 0, 3995, 'robots=\nauthor='),
(7, 'Documentos Para Descargar', 'documentos-educacion', '', '<p>Documentos y Formularios Disponibles para Descargar:</p>\r\n<p>????</p>\r\n<p><a href=\"images/doc/educacion/formulario de ingreso emaic 09.doc\">Formulario Inscripcion EMAIC</a></p>\r\n<p><a href=\"images/doc/educacion/formulario de ingreso itaic 09 1.doc\">Formulario Inscripcion ITAIC</a></p>\r\n<p><a href=\"images/doc/educacion/formulario solicitud de ingreso maestros itaic.doc\">Solicitud Maestros ITAIC</a></p>\r\n<p><a href=\"images/doc/educacion/solicitud emaic para maestros.doc\">Solicitud Maestros EMAIC</a></p>\r\n<p><a href=\"images/doc/educacion/reporte de asignatura itaic.doc\">Reporte de Asignatura ITAIC</a></p>\r\n<p><a href=\"images/doc/educacion/reporte de asistencia.doc\">Reporte de Asistencia ITAIC</a></p>\r\n<p><a href=\"images/doc/educacion/nuevo pensum emaic 09.doc\">Nuevo Pensum EMAIC 09</a></p>\r\n<p><a href=\"images/doc/educacion/nuevo pensum itaic 09.doc\">Nuevo Pensum ITAIC 09</a></p>', '', 1, 15, 0, 42, '2011-04-10 17:37:44', 62, '', '2011-05-13 05:30:39', 63, 0, '0000-00-00 00:00:00', '2011-04-10 17:37:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 11, 0, 3, '', '', 0, 168, 'robots=\nauthor='),
(8, 'Evang????lica Fraternal', 'evangelica-fraternal', '', '<p><img src=\"images/stories/fraternal1.jpg\" border=\"0\" width=\"250\" height=\"200\" style=\"border: 10px solid black; margin-left: 10px; margin-right: 10px; float: right;\" /><span lang=\"es-DO\"> </span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Principal #18, Los Molina, San Crist????bal.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Federico Claudio Alvares. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-528-7401</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p>Breve Resena Historica:</p>\r\n<p><span lang=\"es-DO\">En el a????o 1989 dimos inicio a un campo misionero que se convirti???? en la iglesia Evang????lica Fraternal oficialmente el 17 de mayo del a????o 1990, ubicada en la calle principal No. 18, Los Molina, San Crist????bal, R.D. siendo su fundador y pastor actualmente el ministro Federico Claudio Alvarez Mart????nez. Esta iglesia abri???? dos campos misioneros m????s, que ya son iglesias oficiales con pastores seleccionados de sus propios miembros y son identificadas con los nombres de Iglesia Fraternal II e Iglesia Fraternal III.</span></p>\r\n<p> </p>\r\n<p> </p>\r\n<p><img src=\"images/stories/claudioalvarez.jpg\" border=\"0\" width=\"170\" height=\"200\" style=\"border: 10px solid black; margin-left: 10px; margin-right: 10px; vertical-align: text-bottom;\" /></p>\r\n<p>Pastor: Reverendo Federico Claudio Alvarez</p>\r\n<p> </p>\r\n<p style=\"margin-bottom: 0in;\" align=\"justify\"><span lang=\"es-DO\"><br /></span></p>', '', 1, 14, 0, 25, '2011-04-10 19:26:21', 63, '', '2011-05-06 18:29:01', 63, 65, '2011-05-07 15:41:51', '2011-04-10 19:26:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 31, '', '', 0, 218, 'robots=\nauthor='),
(13, '1er Refugio', '1er-refugio', '', '<p>DIRECCION: Calle 6, no. 26,Padre Las Casas, pto. pta.</p>\r\n<p>CIRCUITO: Puerto Plata</p>\r\n<p>PASTOR: Rev. Antonio Rodriguez</p>\r\n<p>TELEFONO: 809-586-6708</p>', '', 1, 14, 0, 36, '2011-04-10 21:21:59', 65, '', '2011-05-07 12:02:31', 65, 0, '0000-00-00 00:00:00', '2011-04-10 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 53, '', '', 0, 104, 'robots=\nauthor='),
(17, 'Faro De Luz', 'faro-de-luz', '', '<p>DIRECCION: Calle Bernardo Pichardo, no. 7, Haina</p>\r\n<p>CIRCUITO: Haina</p>\r\n<p>PASTOR: Rev. Antonio Santos</p>\r\n<p>TELEFONOS: 809-957-4197</p>\r\n<p> </p>\r\n<p> </p>\r\n', '\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">En el mes de Julio del a????o 1967 el Rey. Aurelio D????az se traslad???? desde Do????a Ana (San Crist????bal) hacia Haina quien dio inicio a la primera Iglesia de Asamblea de Iglesias Cristianas en Haina llamada ???????Faro de Luz???????, qui????n a los dos meses dej???? instalado al Rey. Jes????s Mar????a Abreu (Negro) quien pastoreo hasta el mes de Agosto del a????o 1971, dejando instalado al Pastor Alejandro Santos qui????n permanece hasta la fecha.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\"> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>', 1, 14, 0, 27, '2011-04-10 22:07:39', 65, '', '2011-05-07 02:08:25', 62, 0, '0000-00-00 00:00:00', '2011-04-10 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 7, '', '', 0, 210, 'robots=\nauthor='),
(18, 'Jehov???? Nisi', 'jehova-nisi', '', '<p>DIRECCION: Calle B no. 21, Bo. Joaquin Balaguer, Municipio SPM</p>\r\n<p>CIRCUITO: San Pedro De Macoris</p>\r\n<p>PASTOR: Rev. Pedro Gonz????lez</p>\r\n<p>TELEFONO: 809-553-8961</p>', '', 1, 14, 0, 35, '2011-04-12 00:17:00', 65, '', '2011-05-06 19:40:15', 63, 0, '0000-00-00 00:00:00', '2011-04-11 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 10, '', '', 0, 151, 'robots=\nauthor='),
(19, 'Jehov???? Jireh', 'jehova-jireh', '', '<p>DIRECCION : Entrada De las Colinas no. 126, Cabarete Sosua.</p>\r\n<p>CIRCUITO: Sosua</p>\r\n<p>PASTOR: Lpa. Quirico Diaz Alcantara</p>\r\n<p>TELEFONO: 809-453-8755</p>\r\n<p> </p>\r\n<p>\r\n', '\r\n</p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-size: small;\">La iglesia Jehov???? Jireh fue fundada bajo el glorioso poder del esp????ritu santo en la calle principal no. 126 de la entrada de la colonia, distrito municipal de Cabarete, municipio de Sos????a provincia de puerto plata, republica dominicana.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"> </p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-size: small;\">El d????a lunes diez (10) del mes de septiembre del a????o mil novecientos ochenta y nueve (1989) por el Rev. Julio a. medina padilla, junto con otros hermanos dando un culto en una casa recibiendo confirmaci????n del sin igual llamado que dios hace a quien el conoce que puede desarrollar una buena labor, el primero (1ro.) de noviembre del a????o mil novecientos noventa y cinco (1995), fue trasladado el pastor-fundador y en su lugar instalaron al Rev. Heriberto Bied Silverio, quien contin????o el arduo trabajo del Rev. Medina padilla, comprando dos porciones de terreno al lado del templo y recibiendo algunos materiales de construcci????n para la misma, pero el d????a jueves nueve (9) de septiembre del a????o dos mil cuatro (2004) fue trasladado el Rev. Bierd e instalaron al Exh. Quirico D????az Alc????ntara, quien hasta la fecha se mantiene ensanchando la tienda de la caba????a que comenz???? en 1989. Actualmente estamos en construcci????n. La iglesia Jehov???? Jireh ha levantado cuatro campos de predicaci????n de los cuales uno ya es oficial y otro se encamina, de los cuales tres tienen templo propio y a nombre de AIC. Tambi????n la iglesia establece la bandera de AIC. En la provincia de El????as pi????a y se proyecta hacia nuevos campos. Necesitamos de ustedes. ???????santidad a Jehov???????????. </span></span><span style=\"color: #000000;\">Y actualmente est???? pastoreada por el Lic. Pastor Juan Rosa Amador.</span></p>', 1, 14, 0, 37, '2011-04-12 00:28:14', 65, '', '2011-05-07 12:05:42', 63, 0, '0000-00-00 00:00:00', '2011-04-11 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 21, '', '', 0, 206, 'robots=\nauthor='),
(20, 'Llama Pentecostal', 'llama-pentecostal', '', '<p>DIRECCION: Calle Juan 23 no. 30,San Martin, Higuey.</p>\r\n<p>CIRCUITO: Higuey</p>\r\n<p>PASTOR: Rev. Mamerto Perez Garcia.</p>\r\n<p>TELEFONO: 809-224-4419</p>', '', 1, 14, 0, 32, '2011-04-12 00:36:18', 65, '', '2011-05-06 19:55:44', 63, 0, '0000-00-00 00:00:00', '2011-04-11 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 12, '', '', 0, 189, 'robots=\nauthor='),
(21, 'Asamblea De iglesias Cristianas Central', 'asamblea-de-iglesias-cristianas-central', '', '<p><img src=\"images/stories/iglesias/sjm-aic-central.jpg\" border=\"0\" width=\"300\" height=\"199\" style=\"vertical-align: top; margin: 10px;\" /><img src=\"images/stories/pastores/sjm-aic-central-pastor.jpg\" border=\"0\" width=\"300\" height=\"199\" style=\"margin: 10px; vertical-align: top;\" /></p>\r\n<p><span style=\"font-size: medium;\">DIRECCION: Calle Dr. Cabral esquina Diego de Velasquez.</span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">CIRCUITO: San Juan De La Maguana</span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">PASTOR: Rev. Kennedy Hernandez</span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">TELEFONO: 809-665-2783</span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Breve Rese????a Hist????rica</strong><span lang=\"es-CR\"> </span></span></span></p>\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-CR\">La primera iglesia de este concilio, abri???? sus puertas en el a????o 1960, siendo su primer pastor F????lix de la Cruz.</span><span lang=\"es-CR\"> </span></span></span></p>\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; text-align: justify;\" lang=\"es-CR\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-CR\">Dicha congregaci????n</span><span lang=\"es-CR\"> ha sido pastoreada por diferentes hermanos: Rev. Eugenio B????ez (fallecido), Rev. Manuelico P????rez, Rev. Andr????s P????rez (fallecido), Rev. Jos???? de Le????n, Rev. Rafael del Rosario (Nano), Rev. Juan Roberto Ramos P????rez, Ram????n Antonio Guerrero, Rev. Julio Manuel Garabito, sustituido por el Rev. Hed???? Prandy Gonz????lez, sustituido por Mar????a Joaquina Beltr???? y m????s luego por Clarito Dom????nguez, el cual fue sucedido por el Rev. Saturnino Gonz????lez (1997) y actualmente dicha congregaci????n est???? siendo pastoreada por el Rev. Dionisio Diroci???? Mont????s.</span></span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-CR\"><span style=\"font-size: medium;\"><br /></span></p>\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: Comic Sans MS,cursive;\"><span lang=\"es-CR\">Actualmente se encuentra ubicada en l</span></span><span style=\"font-family: Comic Sans MS,cursive;\"><span lang=\"es-CR\">a calle Diego de Vel????squez, esq. Dr. Cabral, donde estamos ubicados en la actualidad con templo propio.</span></span></span></p>', '', 1, 14, 0, 31, '2011-04-12 00:58:57', 65, '', '2011-05-09 14:14:30', 63, 0, '0000-00-00 00:00:00', '2011-04-11 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 8, '', '', 0, 266, 'robots=\nauthor='),
(22, 'Fuente De Agua Viva', 'fuente-de-agua-viva', '', '<p>DIRECCION: Calle H no. 53,Vila Espana, La Romana.</p>\r\n<p>CIRCUITO: La Romana</p>\r\n<p>PASTOR: Rev. Pedro Alejandro Valera</p>\r\n<p>TELEFONO: 809-906-6262</p>', '', 1, 14, 0, 30, '2011-04-12 01:24:47', 65, '', '2011-05-07 04:03:30', 63, 0, '0000-00-00 00:00:00', '2011-04-11 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 11, '', '', 0, 127, 'robots=\nauthor='),
(23, 'Mizpa', 'mizpa', '', '<p>DIRECCION: Calle 2 no. 39, San Lorenzo Santiago.</p>\r\n<p>CIRCUITO: Santiago</p>\r\n<p>PASTOR: Rev. Amado Marte</p>\r\n<p>TELEFONO: 809-575-6076</p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\">La iglesia mizpa se inicia con el traslado del reverendo Amado Marte desde Altamira a Santiago en el a????o 1985. En el a????o 1990 inicia la obra y fue oficializada en el a????o 1995, quedando como pastor el reverendo Amado Marte en la actualidad. El mismo que todav????a permanece en la iglesia como pastor.</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"> </p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\">La iglesia mizpa ha parido tres iglesias mas la cuales permanecen.</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"> </p>', '', 1, 14, 0, 28, '2011-04-12 01:33:46', 65, '', '2011-05-07 11:53:11', 63, 0, '0000-00-00 00:00:00', '2011-04-11 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 14, '', '', 0, 139, 'robots=\nauthor='),
(24, 'Bethel', 'bethel', '', '<p>DIRECCION: Calle V????ctor Mola no. 43, Barahona</p>\r\n<p>CIRCUITO: Barahona</p>\r\n<p>PASTOR: Florencio Minier Vel????squez</p>\r\n<p>TELEFONO: 809-708-3087</p>\r\n<p> </p>', '', 1, 14, 0, 40, '2011-04-12 01:41:11', 65, '', '2011-05-06 19:14:08', 63, 0, '0000-00-00 00:00:00', '2011-04-11 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 6, '', '', 0, 115, 'robots=\nauthor='),
(25, 'Puerta Del Cielo 5ta', 'puerta-del-cielo-sta', '', '<p>DIRECCION: Calle Cabral, San Jos???? De Ocoa</p>\r\n<p>CIRCUITO: San Jos???? De Ocoa</p>\r\n<p>PASTOR: Rev. Angel Plinio Santana</p>\r\n<p>TELEFONO: 809-889-8490</p>', '', 1, 14, 0, 29, '2011-04-12 01:48:10', 65, '', '2011-05-06 19:06:41', 63, 0, '0000-00-00 00:00:00', '2011-04-11 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 6, '', '', 0, 231, 'robots=\nauthor='),
(26, 'Puerta Del Cielo', 'puerta-del-cielo', '', '<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">DIRECCION: Cruce de la Hermon, Munic. de Don Juan, Monte Plata.</span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">CIRCUITO: Monte Plata</span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">PASTOR: Rev. Jose Ami</span></span></p>', '', 1, 14, 0, 39, '2011-04-12 01:55:14', 65, '', '2011-07-12 12:43:18', 63, 0, '0000-00-00 00:00:00', '2011-04-11 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 2, '', '', 0, 179, 'robots=\nauthor='),
(27, 'Asamblea de Iglesias Cristianas, Inc.', 'asamblea-de-iglesias-cristianas-inc', '', '<p>DIRECCION: Hato De San Pedro</p>\r\n<p>CIRCUITO: Monte Plata</p>\r\n<p>PASTOR: Lpa. Luis Jean Baptiste</p>', '', 1, 14, 0, 39, '2011-04-12 13:23:07', 65, '', '2011-05-06 19:05:38', 63, 0, '0000-00-00 00:00:00', '2011-04-12 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 178, 'robots=\nauthor='),
(53, 'Presidenta Nacional ADAIC 2011-2012', 'presidenta-nacional-adaic-2011-2012', '', '<p><img src=\"images/stories/ripoll.jpg\" border=\"0\" width=\"438\" height=\"329\" /></p>', '', 0, 11, 0, 16, '2011-04-13 03:11:22', 70, '', '2011-04-13 03:58:28', 65, 0, '0000-00-00 00:00:00', '2011-04-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 2, 0, 1, '', '', 0, 117, ''),
(55, '65ta. Convenci????n Nacional', '65ta-convencion-nacional', '', '<p>Estad atento (a)</p>\r\n<p>Nuestra Magna Convenci????n Nacional <strong>Inicia</strong></p>\r\n<p>el <strong><span style=\"text-decoration: underline;\">Mi????rcoles 18</span></strong> de Mayo a las <span style=\"text-decoration: underline;\"><strong>10:00 A. M</strong>.</span></p>\r\n<p> </p>\r\n<p> </p>\r\n<p>Asamblea de Iglesias Crsitianas, Inc.</p>\r\n<p>Distrito Rep????blica Dominicana</p>\r\n<p>Reafirmando Nuestros Principios Doctrinales.</p>', '', 0, 1, 0, 3, '2011-05-05 15:21:41', 72, '', '2011-05-07 19:03:25', 63, 0, '0000-00-00 00:00:00', '2011-05-05 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 6, '', '', 0, 78, 'robots=\nauthor=');
INSERT INTO `aicrd_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(56, 'Vida Eterna', 'vida-eterna', '', '<p>p { margin-bottom: 0.08in; }</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Padre Francisco Gregorio Billini no. 21 Bani.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Luis Lugo D????az. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-252-6353.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p> </p>', '', 1, 14, 0, 38, '2011-05-06 00:55:39', 63, '', '2011-05-06 00:58:30', 63, 0, '0000-00-00 00:00:00', '2011-05-06 00:55:39', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 13, '', '', 0, 118, 'robots=\nauthor='),
(57, 'Genezaret', 'genezaret', '', '<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Se????ora De Regla No.81 Sur</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. David De Los Santos Caro </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-973-4896, 809-380-0675</em></span></span></span></p>\r\n<p> </p>', '', 1, 14, 0, 38, '2011-05-06 00:58:52', 63, '', '2011-05-07 15:00:14', 63, 72, '2011-05-14 18:27:20', '2011-05-06 00:58:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 12, '', '', 0, 183, 'robots=\nauthor='),
(58, 'Monte Sinai', 'monte-sinai', '', '<p>p { margin-bottom: 0.08in; }\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Central No 66, Pisarrete, Bani</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Eddy Gonz????lez Prandi</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-662-1441</em></span></span></span></p>\r\n</p>', '', 1, 14, 0, 38, '2011-05-06 01:01:08', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 01:01:08', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 11, '', '', 0, 168, 'robots=\nauthor='),
(59, '2da Genesaret', '2da-genesaret', '', '<p><!--  p { margin-bottom: 0.08in; } -- ></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Canela Mota No 41</em></span></span></span><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>, Santa Rosa</em></span></span></span><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>, Bani</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: LPA. Miguel Ant. Dom????nguez Mezquita </em></span></span></span></p>\r\n<p><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em> </em></span></span></span><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-522-2951.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p> </p>', '', 1, 14, 0, 38, '2011-05-06 01:03:17', 63, '', '0000-00-00 00:00:00', 0, 63, '2011-05-07 21:26:58', '2011-05-06 01:03:17', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 10, '', '', 0, 157, 'robots=\nauthor='),
(60, 'La Chequinac de Jehov????', 'la-chequinac-de-jehova', '', '<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Francisco Gregorio Billini No 8, Bani</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Rev. Tania Del Pilar P????rez De Mej????a</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-522-6273</em></span></span></span></p>', '', 1, 14, 0, 38, '2011-05-06 01:07:13', 63, '', '2011-07-12 12:34:31', 63, 0, '0000-00-00 00:00:00', '2011-05-06 01:07:13', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 2, '', '', 0, 257, 'robots=\nauthor='),
(61, 'Erec Salvatore', 'erec-salvatore', '', 'p { margin-bottom: 0.08in; }\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Cruce De Ocoa</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. ????ngel David Aybar S????nchez</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-380-1639</em></span></span></span></p>', '', 1, 14, 0, 38, '2011-05-06 01:08:44', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 01:08:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 113, 'robots=\nauthor='),
(62, 'Filadelfia', 'filadelfia', '', '<p>p { margin-bottom: 0.08in; }\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Reparto 7 De Mayo No 4-A, Los Jovillos, Azua<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Bruno De La Cruz Marte </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 829-349-5954</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><br /></em></span></span></span></p>\r\n</p>', '', 1, 14, 0, 38, '2011-05-06 01:11:30', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 01:11:30', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 8, '', '', 0, 122, 'robots=\nauthor='),
(63, 'Centro Evangelistico Shalon', 'centro-evangelistico-shalon', '', '<p>p { margin-bottom: 0.08in; }</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle M????ximo G????mez No 53, Boca Canasta, Bani</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Te????filo Gonz????lez </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Ban????</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-380-1639</em></span></span></span></p>\r\n<p> </p>', '', 1, 14, 0, 38, '2011-05-06 01:13:47', 63, '', '2011-05-06 01:20:14', 63, 0, '0000-00-00 00:00:00', '2011-05-06 01:13:47', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 7, '', '', 0, 116, 'robots=\nauthor='),
(64, 'Puerta de la Misericordia', 'puerta-de-la-misericordia', '', '<p>p { margin-bottom: 0.08in; }\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Duverge Paya, Bani</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpa. F????lix Domingo Salom????n Tejeda </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-346-8580</em></span></span></span></p>\r\n</p>', '', 1, 14, 0, 38, '2011-05-06 13:53:45', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 13:53:45', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 142, 'robots=\nauthor='),
(65, '2da Puerta de Refugio', '2da-puerta-de-refugio', '', '<p>p { margin-bottom: 0.08in; }\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Matanza, Bani</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh, Deyanira Soto</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-502-6111</em></span></span></span></p>\r\n</p>', '', 1, 14, 0, 38, '2011-05-06 13:56:43', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 13:56:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 115, 'robots=\nauthor='),
(66, 'Puerta de la Misericordia 2da', 'puerta-de-la-misericordia-2da', '', '<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle M????ximo G????mez, Paya, Bani</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Exh. Ismael Rodr????guez Aguas Viva</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-522-1538</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>\r\n<p>????</p>', '', 1, 14, 0, 38, '2011-05-06 13:58:07', 63, '', '2011-07-12 12:46:58', 63, 0, '0000-00-00 00:00:00', '2011-05-06 13:58:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 4, '', '', 0, 108, 'robots=\nauthor='),
(67, 'Faro de Luz', 'faro-de-luz', '', '<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Enriquillo</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Wander Medina</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 829-854-6084</em></span></span></span></p>\r\n<p>????</p>', '', 1, 14, 0, 38, '2011-05-06 13:59:40', 63, '', '2011-07-12 12:39:02', 63, 0, '0000-00-00 00:00:00', '2011-05-06 13:59:40', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 175, 'robots=\nauthor='),
(68, 'Centro de Renovacion Shadday', 'centro-de-renovacion-shadai', '', '<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Santa Rosa</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Ban????<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Charles S????nchez</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 829-324-8571</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>', '', 1, 14, 0, 38, '2011-05-06 14:00:44', 65, '', '2011-05-12 16:31:53', 63, 63, '2012-04-09 23:36:46', '2011-05-06 14:00:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 1, '', '', 0, 192, 'robots=\nauthor='),
(69, 'Maranata', 'maranata', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: C/ Juan Roche #10, Madre Vieja</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Hipolito Frias Gil</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-527-8972</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\">La Iglesia Maranatha esta ubicada en la Calle Juan Roche No. 10 del sector de Madre Vieja Norte en la provincia de San Crist????bal Rep. Dom. Fue fundada el 15 de mayo de 1980 por el pastor Jos???? La Rosa. En su trayectoria ha sido guiada por siete ministros del se????or en aqu???? sus respectivos nombres: Jos???? De La Rosa, Juan De La Rosa, Rey. Justo Mejia, Rev.Virgilio Figuereo, Rey. Ra????l Candelario, Rey. Marcial Reyes Soba y el Rey. Hip????lito Fr????as Pastor Actual. Es una d???? las primeras iglesias de sector de madre vieja norte.</span></p>', '', 1, 14, 0, 25, '2011-05-06 14:12:50', 65, '', '2011-05-07 02:29:46', 62, 0, '0000-00-00 00:00:00', '2011-05-06 14:12:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 29, '', '', 0, 92, 'robots=\nauthor='),
(70, 'Templo Bethania', 'templo-bethania', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle P????pilo D????as #80 Madre Vieja Norte, La Pi????a</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Abel Alias Tejeda Gonzales.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-528-0873</em></span></span></span></p>', '', 1, 14, 0, 25, '2011-05-06 14:14:11', 70, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 14:14:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 28, '', '', 0, 141, 'robots=\nauthor='),
(71, 'Ciudad de Luz 2da', 'ciudad-de-luz-2da', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Tulip????n # 20, Las Flores<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro<br /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Joel De Los Santos Caro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-528-0221</em></span></span></span></p>', '', 1, 14, 0, 25, '2011-05-06 14:15:54', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 14:15:54', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 27, '', '', 0, 96, 'robots=\nauthor='),
(72, 'Siloe 2da', 'siloe-2da', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle 3ra #43, Bario Nuevo, San Crist????bal</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Juan Dionisio Castillo</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-527-8499</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">\r\n', '\r\n</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span lang=\"es-DO\">La iglesia Siloe II ubicada en la calle 3 No. 43 del Barrio nuevo en el sector de Madre Vieja Norte San Crist????bal, Republica Dominicana. Fue fundada en el mes de Marzo del a????o 1986, siendo su fundador el Rey. RAMON RAMIREZ, durante sus 22 a????os de existencia, ha sido dirigida por 7 pastores, cuyos nombres son los siguientes: REV. RAMON RAMIREZ, Exh. MANUEL ZAPATA (Fallecido), Exh. ALCIBIADE FELIZ SEGURA, Lpa. RAFAEL SORIANO LARA, REV. CLARITO DOM????NGUEZ, REY. PASCUAL OGANDO, REV. JUAN DIONICIO CASTILLO, pastor en la actualidad, con su domicilio en la calle Tulip????n, casa No. 1 8B, en el barrio las flores San Crist????bal Republica dominicana.</span></p>', 1, 14, 0, 25, '2011-05-06 14:19:37', 70, '', '2011-05-07 02:28:50', 62, 0, '0000-00-00 00:00:00', '2011-05-06 14:19:37', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 26, '', '', 0, 189, 'robots=\nauthor='),
(73, 'Sina????', 'sinai', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Libertad #10, Sabana Grande De Palenque, SC</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Ram????n Ram????rez</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-288-2431</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 25, '2011-05-06 14:23:40', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 14:23:40', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 25, '', '', 0, 48, 'robots=\nauthor='),
(74, 'Bethel', 'bethel', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Osvaldo Bazil #16, Hatillo SC.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Juan De La Cruz De Los Santos</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-528-0159</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n', '\r\n<p> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span lang=\"es-DO\">La Iglesia Bethel Asamblea de iglesias cristianas Inc., ubicada en la calle Osvaldo Bazil No. 16, Hatillo Sur San Crist????bal R. D. Se estableci???? como Iglesia oficial en el a????o 1951, siendo su primer pastor Alejo Mercedes. (Ultimo de sus fundadores).</span></p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">En 57 a????os de existencia se ha ubicado en tres recinto diferente, dos de ellos en la Sabana o Hatillo Norte y uno en Hatillo Sur, donde actualmente tiene su local.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">En sus a????os de existencia ha tenido cuatro (4) pastores, cuyo nombres son los siguientes:</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">1) Alejo Mercedes.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">2) Vinicio Santiago.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">3) Eduviges D????az (Aurelio)</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">4) Rev. Juan de la Cruz de los Santos, quien es su Pastor actualmente por mas de 40 A????os.</p>', 1, 14, 0, 25, '2011-05-06 14:26:10', 70, '', '2011-05-07 14:49:18', 63, 0, '0000-00-00 00:00:00', '2011-05-06 14:26:10', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 24, '', '', 0, 221, 'robots=\nauthor='),
(75, 'Fuente de Vida', 'fuente-de-vida', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Francisco J Peinado #8, Bo. Jeringa</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lic. Pastor Modesto Florentino</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 829-870-3521</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 25, '2011-05-06 14:27:39', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 14:27:39', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 23, '', '', 0, 79, 'robots=\nauthor='),
(76, 'Los Doce Ap????stoles', 'los-doce-apostoles', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Villa Mercedes, Madre Vieja Sur</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Elpidio Soriano</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-528-1796</em></span></span></span></p>', '', 1, 14, 0, 25, '2011-05-06 14:29:26', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 14:29:26', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 22, '', '', 0, 42, 'robots=\nauthor='),
(77, 'Siloe 1era', 'siloe-1era', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Manuel Corpor????n #25, Pueblo Nuevo, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Antonio Alv????rez Peguero</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-237-2542</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">\r\n', '\r\n</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span lang=\"es-DO\">Alrededor del a????o 1961 comienza la evangelizaci????n de dicha iglesia, por la misionera flor dalesa damiane y su esposo en el hogar de Graciela Lorenzo y con su ayuda. En el 1964,</span><span lang=\"es-DO\"> fue reconocida como iglesia, siendo los primeros pastores:</span></p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">1 .Julio Damian y su esposa.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">2. Rafael rosario (nano).</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">3. pataliano.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">4. Samuel Pimentel (algunos d????as).</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">5. Ram????n Ram????rez</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">6. miguel payano.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">7. Antonio ????lvarez</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">Asiendo un total de 7 pastores. El actual es el s????ptimo (Antonio ????lvarez).</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\"> </p>', 1, 14, 0, 25, '2011-05-06 14:35:36', 70, '', '2011-05-07 02:30:52', 62, 0, '0000-00-00 00:00:00', '2011-05-06 14:35:36', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 21, '', '', 0, 278, 'robots=\nauthor='),
(78, 'Oraci????n Contestada 1era', 'oracion-contestada-1era', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Club Rotario #52, Madre Vieja Sur Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Julio Medina Padilla</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-528-1706.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 25, '2011-05-06 14:38:41', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 14:38:41', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 20, '', '', 0, 108, 'robots=\nauthor='),
(79, 'Eben-Ezer', 'eben-ezer', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Respaldo Pablo Barina # 46, Ca????ada Honda</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Juan Ruiz Dom????nguez</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELFONO: 809-288-3673.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 25, '2011-05-06 14:39:37', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 14:39:37', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 19, '', '', 0, 82, 'robots=\nauthor='),
(80, 'El Reba????o', 'el-rebano', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Osvaldo Bazil, Hatillo, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Regino De Le????n. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-943-7588</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\">\r\n', '\r\n</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span lang=\"es-DO\">La iglesia El Reba????o de ASAMBLEA DE IGLESIAS CRISTIANA, tiene su inicio en el a????o 1985 cuando el hermano Regino De Le????n impart????a Escuela B????blicas de ni????os debajo de una mata de aguacate en el patio de la casa de la hermana Juana Lugo. Luego de muchas Escuelas B????blicas, actividades y predicaci????n se reconoce la Iglesia en el a????o 1989, siendo tambi????n reconocido como pastor exhortador. Despu????s de tener unos 27 miembros entre los que figuran algunos hermanos de la iglesia Bethel de Hatillo, y una gran parte ganado durante un periodo de 4 a????os, nos ubicamos en un local en la calle Osvaldo Bazil No.150, Hatillo, el cual rentamos y acondicionarnos con algunas sillas y bancos quedando fundada la segundo Iglesia del sector. Luego de varios a????os recib???? un solar donado por el ministro Luis Aquino, donde en la actualidad tenemos el templo propio a nombre de nuestro concilio y contarnos con una cantidad de 95 miembros por lo que seguirnos predicando y trabajando por las almas para cristo en dicho sector.</span></p>', 1, 14, 0, 25, '2011-05-06 14:52:32', 63, '', '2011-05-07 02:20:25', 62, 0, '0000-00-00 00:00:00', '2011-05-06 14:52:32', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 18, '', '', 0, 128, 'robots=\nauthor=');
INSERT INTO `aicrd_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(81, 'Fuente de Agua Viva', 'fuente-de-agua-viva', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: #7, Bario Mosc????, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpa Antonio Guzm????n </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 829-848-2928.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 25, '2011-05-06 14:53:00', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 14:53:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 17, '', '', 0, 125, 'robots=\nauthor='),
(82, '2da Monte Horeb', '2da-monte-horeb', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Palenque, Niza Abajo Km 71/2, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Benita Paredes De Victorino.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-528-4615.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">\r\n', '\r\n</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span lang=\"es-DO\">La Segunda Monte de Horeb, ubicada en la comunidad de Niza, Carretera Palenque, Km 7 ???????/2, San Crist????bal, Rep????blica Dominicana, fundada en el mes Enero del a????o 1980, siendo su fundador el Rey. Marcial Reyes Sob????, durante sus 29 a????os de existencia ha sido dirigida por dos pastores, cuyos nombres son los siguientes: Rey. Marcial Reyes Sob????, Supervisor de la Asamblea en la Rep????blica Dominicana, y la Rey. Benita Paredes, Pastora en la actualidad. Es la primera iglesia de Asamblea de Iglesias Cristianas, Inc, establecida en la comunidad de Niza.</span></p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">Y cuenta con un campo blanco.</p>', 1, 14, 0, 25, '2011-05-06 14:53:31', 70, '', '2011-05-07 02:25:25', 62, 0, '0000-00-00 00:00:00', '2011-05-06 14:53:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 16, '', '', 0, 171, 'robots=\nauthor='),
(83, 'Columna y Baluarte de la Verdad', 'columna-y-baluarte-de-la-verdad', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle San Rafael E. Borinqu????n, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Claudio Mart????nez.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-528-0354</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 25, '2011-05-06 14:57:19', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 14:57:19', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 15, '', '', 0, 54, 'robots=\nauthor='),
(84, 'Monte Horeb', 'monte-horeb', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Mella No.20, Juan Bar????n, Juan Bar????n Palenque, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Modesto Florentino.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-243-5768</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">\r\n', '\r\n</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">Fue fundada en el a????o 1968 aproximadamente siendo su primer pastor Narciso Obispo Reyes hasta el 1982 (oriundo de nuestro pueblo natal).</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">En su lugar lo sustituye el pastor Tomas Figueres (procedente desde San Crist????bal), Hasta 1987. Luego estuvo pastoreando el Hermano Salvador Ogando (Nativo de Sabana Grande de Palenque) 1987-1990. Afinales del 1990 ocupa el puesto de pastor el Hermano Yoselma Rodin Mirabal (1990-1994), Reconstruyo la iglesia y elaboro un reglamento local.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">Luego de Yoselman estuvo desempe????ado esa labor el Co-pastor Bemandmo Mart????nez y a responsabilidad de el prebistoro, RU: Jos???? Encamaci????n asabienda de esto nos enviaron a el pastor, Amauris G????lvez oriundo de la ciudad de Pimentel, que estuvo por espacio de 1 a????o y 8 meses (1994-1996).</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">El hermano le comunica al concilio que por raz????n de problemas familiares necesita estar con su familia estuvo al frente por espacio de (2 mese) el Co-pastor Bernandino Mart????nez hasta que trajeron a el pastor Manuel Antonio Adames (1997-</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">2003).</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">Durante mayo 2003 ???????? agosto 2003 estuvimos dirigido por la junta de di????conos</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">previspero RU: Ram????n Ram????rez durante este tiempo estuvimos arreglando todo lo que pudimos en la Iglesia.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">El d????a 08/08/2003 fue instalado el lic. Modetos Florentino hoy Ministro a su</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">llegada se ocupo de conocer cada una de las necesidades de la Iglesia.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\"> </p>', 1, 14, 0, 25, '2011-05-06 14:57:57', 70, '', '2011-05-07 02:26:58', 62, 0, '0000-00-00 00:00:00', '2011-05-06 14:57:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 14, '', '', 0, 165, 'robots=\nauthor='),
(85, 'Monte de Horeb 1era', 'monte-de-horeb-1era', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Palenque Km 4????, Sainagua, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Cecilia Ruiz De Vizca????no.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-528-9595.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 25, '2011-05-06 14:58:34', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 14:58:34', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 13, '', '', 0, 159, 'robots=\nauthor='),
(86, 'Jehov???? de los Ej????rcitos', 'jehova-de-los-ejercitos', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle La Toma, Los Caca????tos, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Jes????s Mar????a Severino.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 25, '2011-05-06 14:58:59', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 14:58:59', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 12, '', '', 0, 122, 'robots=\nauthor='),
(87, 'El Reto????o de Bethel', 'el-retono-de-bethel', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: C/11 No. 12. Hoja Ancha, Hatillo, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Modesto De La Cruz Rodr????guez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-387-4587</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">\r\n', '\r\n</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span lang=\"es-DO\">La Iglesia ???????RETO?????O DE BETHEL??????? Asamblea de iglesias cristianas Inc., ubicada en la calle Porfirio Mateo No. 37, Sector el Cementerio de Hatillo Sur San Crist????bal R. D. El d????a 10 de Febrero del a????o 1994 iniciamos un trabajo en un local alquilado como campo blanco, en el transcurso del trabajo le buscamos un nombre y de un culto especial surgi???? el nombre ???????RETONO DE BETHEL???????, Seguimos trabajando con el nombre establecido y el 15 de Mayo del a????o 2002 fuimos constituidos iglesia oficial, ahora ubicada en la calle ???????H??????? No. 12, Sector el Cementerio de Hatillo Sur San Crist????bal R. D. siendo el ????nico Pastor LPA H????ctor Antonio Zayas.</span></p>', 1, 14, 0, 25, '2011-05-06 14:59:55', 70, '', '2011-05-07 02:27:56', 62, 0, '0000-00-00 00:00:00', '2011-05-06 14:59:55', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 11, '', '', 0, 189, 'robots=\nauthor='),
(88, 'Ciudad de Luz 2da Hija', 'ciudad-de-luz-2da-hija', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Violeta #29, Las Flores, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Antonio Rosario Lorenzo. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-977-4168.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 25, '2011-05-06 15:19:56', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 15:19:56', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 10, '', '', 0, 135, 'robots=\nauthor='),
(89, 'Hechos 4:12', 'hechos-412', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Av. Constituci????n, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Frank Jim????nez (Hijo)</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: </em></span></span></span></p>', '', 1, 14, 0, 25, '2011-05-06 15:20:59', 70, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 15:20:59', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 152, 'robots=\nauthor='),
(90, 'Siloe 3era', 'siloe-3era', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Privada, Hoyo Del Barrio, Ingenio Nuevo Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Brijido De La Cruz. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-235-2864</em></span></span></span></p>', '', 1, 14, 0, 25, '2011-05-06 15:21:36', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 15:21:36', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 8, '', '', 0, 112, 'robots=\nauthor='),
(91, 'Fuente de Vida 2da', 'fuente-de-vida-2da', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Sector Conani</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lucia Rosario De Monero. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-288-5090.</em></span></span></span></p>', '', 1, 14, 0, 25, '2011-05-06 18:23:41', 70, '', '2011-05-07 21:38:34', 63, 0, '0000-00-00 00:00:00', '2011-05-06 18:23:41', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 7, '', '', 0, 135, 'robots=\nauthor='),
(92, 'Fuente de Agua Viva 2da', 'fuente-de-agua-viva-2da', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Cambita Uribe, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Jos???? El????as Del Rosario.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: </em></span></span></span></p>', '', 1, 14, 0, 25, '2011-05-06 18:24:24', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 18:24:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 141, 'robots=\nauthor='),
(93, 'Misionera Pentecostal Jesucristo es el Camino', 'misionera-pentecostal-jesucristo-es-el-camino', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Luperon No. 22, Sainagua, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Yulis Alberto Batel Ram????rez.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-322-2622.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">\r\n', '\r\n</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span lang=\"es-DO\">La Iglesia de Jesucristo es el Camino ubicada en la calle luper????n numero 23 Sainagua San Crist????bal Rep. Dom. fundada el d????a 24 en el mes de octubre del a????o 1997 siendo su fundador el pastor Eladio Lorenzo Bautista y la pastora Yolanda Javier durante sus 11 a????os de asistencia ha sido dirigida por 3 pastores Eladio Lorenzo Bautista, Yolanda Javier y Yulys A. Batel R., pastor en la actualidad Iglesia 29 de Asamblea de Iglesia Cristiana INC. Establecida en San Crist????bal.</span></p>', 1, 14, 0, 25, '2011-05-06 18:25:24', 70, '', '2011-05-07 02:23:39', 62, 0, '0000-00-00 00:00:00', '2011-05-06 18:25:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 236, 'robots=\nauthor='),
(94, 'Jehov???? Shal????n', 'jehova-shalon', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Prolongaci????n ????ngel Arias No.10, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Rafael Arias Dipre. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-527-4216.</em></span></span></span></p>', '', 1, 14, 0, 25, '2011-05-06 18:26:02', 63, '', '2011-07-12 12:45:26', 63, 0, '0000-00-00 00:00:00', '2011-05-06 18:26:02', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 4, '', '', 0, 153, 'robots=\nauthor='),
(95, '4ta Ciudad de Luz', '4ta-ciudad-de-luz', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle 1era. Los Americanos, Sc. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Yolanda Javier. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-428-1823.</em></span></span></span></p>', '', 1, 14, 0, 25, '2011-05-06 18:26:38', 63, '', '2011-07-12 12:40:27', 63, 0, '0000-00-00 00:00:00', '2011-05-06 18:26:38', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 172, 'robots=\nauthor='),
(96, 'Fraternal 3era', 'fraternal-3era', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Principal Sector Sesda, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Fidel Lorenzo Medrano. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-528-0150.</em></span></span></span></p>', '', 1, 14, 0, 25, '2011-05-06 18:27:08', 63, '', '2011-07-12 12:36:37', 63, 0, '0000-00-00 00:00:00', '2011-05-06 18:27:08', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 2, '', '', 0, 118, 'robots=\nauthor='),
(97, 'Fraternal 2da', 'fraternal-2da', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle B No. 89, Barrio Mosc????, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Crist????bal Centro</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Ganaro De Jes????s</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>\r\n', '\r\n<p><span style=\"font-size: medium;\"> </span></p>\r\n\r\n<p style=\"margin-bottom: 0in; text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span></p>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-DO\">Fue fundada como campo misionero el 30 de Agosto de 1994, siendo su fundador y pastor el REy. FEDERICO CLAUDIO ALVAREZ, fue reconocida como iglesia oficial el 14 de Junio del 2000. su pastor actual es el</span></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">LIC. PASTOR GENARO DE JES????S.</span></span></p>', 1, 14, 0, 25, '2011-05-06 18:27:37', 63, '', '2011-07-12 12:34:09', 63, 0, '0000-00-00 00:00:00', '2011-05-06 18:27:37', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 1, '', '', 0, 316, 'robots=\nauthor='),
(98, 'El Refugio II', 'el-refugio-ii', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle 1ra. #25 Quita Sue????o, Haina Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Haina</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Altagracia Reyes De Encarnaci????n. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-332-6736.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">\r\n', '\r\n</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>BREVE HISTORIA</em></span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span lang=\"es-DO\">Yo la Pastora Maria Altagracia P????rez recib???? el Campo Blanco el 21 de nowiembre de 1996, ubicada en la calle ira numero 25 Quita Sue????o Santo Doimingo R.D. siendo su fundador el Reverendo Julio Cesar Uribe, durante 12 a????os de asistencia a sido dirigida dos pastores los cuales son el reverendo Julio Cesar Uribe y Maria Altagracia P????rez en la actualidad.</span></p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">Es la segunda Iglesia de Asambleas Cristianas, Inc. En Quita Sue????o de</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">Haiina.</p>', 1, 14, 0, 27, '2011-05-06 18:56:14', 65, '', '2011-05-07 02:09:26', 62, 0, '0000-00-00 00:00:00', '2011-05-06 18:56:14', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 6, '', '', 0, 224, 'robots=\nauthor='),
(99, 'El Nuevo Nacimiento', 'el-nuevo-nacimiento', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle S????nchez, Cambelen, Nigua Km. 23, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Haina</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpa Bienvenido Jim????nez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-288-3473.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">\r\n', '\r\n</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">La Iglesia Nuevo Nacimiento, ubicada en la Carretera S????nchez, km. 23 del Sector Cambel????n del Municipio de Nigua, Provincia San Crist????bal, Rep????blica Dominicana, fue fundada en el a????o 1992, siendo su fundadora la Sra. Mar????a Guti????rrez (a) Melita (fallecida); durante sus diecis????is (16) a????os de existencia ha sido dirigida por cinco (5) pastores, cuyos nombres citamos a continuaci????n:</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">Exhortador Claudio Mart????nez, Exhortador Obispo, Exhortador Julio Agramonte, Exhortador Israel Reyes y desde finales del a????o 2002, hasta la actualidad est???? siendo pastoreada por el Lic. Pastor Bienvenido Enrique Jim????nez.</p>', 1, 14, 0, 27, '2011-05-06 19:00:01', 63, '', '2011-05-07 02:06:28', 62, 0, '0000-00-00 00:00:00', '2011-05-06 19:00:01', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 220, 'robots=\nauthor='),
(100, 'La Nueva Jerusal????n', 'la-nueva-jerusalen', '', '<p>DIRECCION: Calle Camboya #40. Barsequillo, Haina Sc.</p>\r\n<p>CIRCUITO: Haina</p>\r\n<p>PASTOR: Rev. Eugenio Encamaci????n Pichardo.</p>\r\n<p>TELEFONO: 809-984-8828.</p>\r\n<p> </p>\r\n<p> </p>\r\n<p>\r\n', '\r\n</p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><em><strong>La iglesia Nueva Jerusalen se fundo en el mes de septiembre de 1996 Siendo su fundador el pastor Domingo Mariano P????rez Mora, quien ha pastoreado la misma durante sus primeros once (11) a????os. </strong></em></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><em><strong>En la actualida esta siendo pastoreada por el reverendo Eugenio Encarnaci????n Pichardo.</strong></em></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><em><strong>La iglesia nueva jerusalen esta ubicada en la calle cambolla #40 Del sector baserquillo de haina.</strong></em></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"> </p>', 1, 14, 0, 27, '2011-05-06 19:00:33', 63, '', '2011-05-07 02:15:08', 62, 0, '0000-00-00 00:00:00', '2011-05-06 19:00:33', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 4, '', '', 0, 241, 'robots=\nauthor='),
(101, 'El Refugio', 'el-refugio', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Bienvenido Peguero #24, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Haina</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Rev. Julio Cesar Uribe. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-332-6020.</em></span></span></span></p>\r\n<p>????</p>\r\n<p style=\"text-align: center;\">????</p>\r\n<p style=\"text-align: center;\">????</p>\r\n', '\r\n<p>????</p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p>La iglesia El Refugio ubicada en la calle bienvenido peguero No. 130 del sector el Nieto, Quita Sue????o, en el municipio de Haina, provincia San Crist????bal, R.D.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">Fue fundada en el a????o 1972, por el misionero Alejandro Brito, en la parte este de ???????Quita Sue????o???????. En 1973, ingresa al concilio de Asamblea de Iglesias Cristinas Inc.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">En 1976 fue trasladada al lado oeste, de Quita Sue????o, sector El Nieto de Quita Sue????o, donde se encuentra ubicada actualmente.</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">Esta iglesia ha sido dirigida por tres pastores:</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">1.- Rvdo. Alejandro Santos</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">2.- Rvdo. Julio Cesar Uribe Paredes</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">3.- Rvdo. Antonio ????lvarez. Peguero</p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-DO\" align=\"JUSTIFY\">En la actualidad esta siendo pastoreada por el Rvdo. Julio Cesar Uribe, siendo esta la primera iglesia Evang????lica fundada en Quita Sue????o.</p>', 1, 14, 0, 27, '2011-05-06 19:02:53', 63, '', '2011-07-12 12:39:33', 63, 63, '2012-04-12 15:18:52', '2011-05-06 19:02:53', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 3, '', '', 0, 424, 'robots=\nauthor='),
(102, 'Fuente de Vida', 'fuente-de-vida', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Salome Ure????a, Bo. Gringo, Haina, Sc.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\"><span style=\"color: #000000;\"><em>CIRCUITO: Haina</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\"><span style=\"color: #000000;\"><em>PASTOR: Licda. Bella Zoila Uribe De Ciprian. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-237-4662.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\">????</p>\r\n', '\r\n<p><span style=\"font-family: helvetica;\"> </span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span></p>\r\n\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\"><span lang=\"es-DO\">La Iglesia Fuente de Vida, ubicada en la Calle Salom???? Ure????a, No. 36, del Municipio de Los Bajos de llama, del Sector de Gringo, Provincia San Crist????bal, Rep????blica Dominicana, fue fundada en el a????o 1987, siendo su fundadora la Exhortadora Sra. Bella Zoila Uribe de Cipri????n, y durante su veinti????n (21) a????os de existencia y hasta la actualidad, est???? siendo pastoreada por la Licenciada antes mencionada Pastora Bella Zoila Uribe de Cipri????n.</span></span></span></p>', 1, 14, 0, 27, '2011-05-06 19:03:21', 63, '', '2011-07-12 12:34:56', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:03:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 2, '', '', 0, 353, 'robots=\nauthor=');
INSERT INTO `aicrd_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(103, 'Faro de Luz 2da', 'faro-de-luz-2da', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Anacaona Villa Lisa Haina.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Haina</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: German Josef</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-237-1524.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>\r\n', '\r\n<p><span style=\"font-size: medium;\"> </span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span></p>\r\n\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-DO\">En </span><span lang=\"es-DO\">el a????o 1997 el exhortador S????crates Valdez inicio esta obra como Campo Blanco. Al transcurrir el tiempo fue entregado al exhortador German Joseph quien inicio como capilla. El mismo despu????s de 2 a????os como capilla fue reconocida como Iglesia. Instalado como pastor a Gerrnan Joseph, reconocida por el concilio como iglesia el 13 de Junio del 2005.</span></span></span></p>', 1, 14, 0, 27, '2011-05-06 19:03:51', 63, '', '2011-07-12 12:32:53', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:03:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 1, '', '', 0, 327, 'robots=\nauthor='),
(104, 'Puerta de Refugio', 'puerta-de-refugio', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: El Mogote De San Jos???? De Ocoa.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Jos???? de Ocoa</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpa Julio Santana. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-509-1628.</em></span></span></span></p>', '', 1, 14, 0, 29, '2011-05-06 19:07:57', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:07:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 111, 'robots=\nauthor='),
(105, 'Puerta del Cielo la Hermosa', 'puerta-del-cielo-la-hermosa', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Bo. San Luis, San Jos???? De Ocoa</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Jos???? de Ocoa</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Marino Antonio Mej????a.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-974-3939.</em></span></span></span></p>', '', 1, 14, 0, 29, '2011-05-06 19:08:42', 63, '', '2011-07-12 12:44:58', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:08:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 4, '', '', 0, 187, 'robots=\nauthor='),
(106, 'Asamblea de Iglesias Cristianas', 'asamblea-de-iglesias-cristianas', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Los Banilejos De Rancho Arriba.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Jos???? de Ocoa</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Alfredo Ortiz.</em></span></span></span></p>', '', 1, 14, 0, 29, '2011-05-06 19:09:40', 63, '', '2011-07-12 12:41:03', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:09:40', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 117, 'robots=\nauthor='),
(107, 'Fuente de Amor', 'fuente-de-amor', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle General Mazara, Los Quemados, Rancho Arriba.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Jos???? de Ocoa</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Lpa Ram????n Andr????s Lluveres. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 829-889-7293.</em></span></span></span></p>', '', 1, 14, 0, 29, '2011-05-06 19:10:53', 63, '', '2011-07-12 12:36:59', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:10:53', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 2, '', '', 0, 166, 'robots=\nauthor='),
(108, 'Puerta del Cielo 3era', 'puerta-del-cielo-3era', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Principal. Las Clavellinas.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Jos???? de Ocoa</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Ercilio Columbena Mateo. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-803-2426.</em></span></span></span></p>', '', 1, 14, 0, 29, '2011-05-06 19:11:26', 63, '', '2011-07-12 12:35:44', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:11:26', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 162, 'robots=\nauthor='),
(109, 'Tesal????nica 2da', 'tesalonica-2da', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"en-US\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Cahonabo Con Hermojenes Alcantara. # 35.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Barahona</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"en-US\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Exh. Josefa Altagracia Beriquet De Acosta. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"en-US\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 829-332-4889</em></span></span></span></p>', '', 1, 14, 0, 40, '2011-05-06 19:20:34', 63, '', '2011-07-12 12:32:32', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:20:34', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 179, 'robots=\nauthor='),
(110, '7mo Tabern????culo', '7mo-tabernaculo', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Los Valerios, La Vega.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Juan Carlos S????nchez</em></span></span></span></p>', '', 1, 14, 0, 28, '2011-05-06 19:23:43', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:23:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 13, '', '', 0, 98, 'robots=\nauthor='),
(111, 'Esmirna', 'esmirna', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Jes????s Mar????a Lora #112.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Jos???? Francisco Henr????quez Bruno.</em></span></span></span></p>', '', 1, 14, 0, 28, '2011-05-06 19:24:18', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:24:18', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 12, '', '', 0, 132, 'robots=\nauthor='),
(112, 'Tabern????culo Evangel????stico', 'tabernaculo-evangelistico', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Francisco Caama????o, Esquina C/4, Santiago.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Agapito F????lix.</em></span></span></span></p>', '', 1, 14, 0, 28, '2011-05-06 19:24:48', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:24:48', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 11, '', '', 0, 158, 'robots=\nauthor='),
(113, 'Templo Bethesda', 'templo-bethesda', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Dr. Pe????a G????mez # 40, Guatapanal, Mao.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Isidro Goris</em></span></span></span></p>', '', 1, 14, 0, 28, '2011-05-06 19:25:30', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:25:30', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 10, '', '', 0, 113, 'robots=\nauthor='),
(114, '1era Roca de Salvaci????n', '1era-roca-de-salvacion', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Bo. Villa Bao, Santiago.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Leonardo Rodr????guez Dionisio</em></span></span></span></p>', '', 1, 14, 0, 28, '2011-05-06 19:26:00', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:26:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 110, 'robots=\nauthor='),
(115, '1era Iglesia El Refugio', '1era-iglesia-el-refugio', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Duarte # 2, Villa Olga Santiago.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Hilario D????az.</em></span></span></span></p>', '', 1, 14, 0, 28, '2011-05-06 19:26:43', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:26:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 8, '', '', 0, 104, 'robots=\nauthor='),
(116, 'Primera Rios de Agua Viva', 'primera-rios-de-agua-viva', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: C/2 #4 Avenida N????????ez De C????ceres.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Tomas Peralta.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\">La primera Iglesia R????os de Agua Viva, Ubicada en la calle 2 No.4 de Pastor Abajo, Bella Vista, Santiago de Los caballeros. Fundada por Teodora Villaman en abril del a????o 1996. En sus 12 a????os de nacimiento ha sido dirigido por 3 pastores:</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\">Teodora Villaman, Humberto Pe????a y el exhortador Bernardo Alcal???? quien en la actualidad es pastor de la misma.</p>', '', 1, 14, 0, 28, '2011-05-06 19:27:23', 65, '', '2011-05-07 11:59:25', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:27:23', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 7, '', '', 0, 138, 'robots=\nauthor='),
(117, 'Nueva Sina????', 'nueva-sinai', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle 1ra. Juan De Jes????s Reyes #45, Mao, Valverde.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpa. Ram????n Ant. Rodr????guez.</em></span></span></span></p>', '', 1, 14, 0, 28, '2011-05-06 19:28:09', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:28:09', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 110, 'robots=\nauthor='),
(118, 'Rios de Agua Viva', 'rios-de-agua-viva', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Santiago.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Miguelina Peralta.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\">La primera Iglesia R????os de Agua Viva, Ubicada en la calle 2 No.4 de Pastor Abajo</p>\r\n<p style=\"margin-bottom: 0in;\">Bella Vista, Santiago de Los caballeros. Fundada por Teodora Villaman en abril del a????o 1996. En sus 12 a????os de nacimiento ha sido dirigido por 3 pastores:</p>\r\n<p style=\"margin-bottom: 0in;\">Teodora Villaman, Humberto Pe????a y el exhortador Bernardo Alcal???? quien en la actualidad es pastor de la misma.</p>\r\n<p style=\"margin-bottom: 0in;\"> </p>\r\n<!--  p { margin-bottom: 0.08in; } -- >', '', 1, 14, 0, 28, '2011-05-06 19:28:36', 70, '', '2011-05-07 15:31:49', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:28:36', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 5, '', '', 0, 278, 'robots=\nauthor='),
(119, 'Cristo el Arca de Hoy', 'cristo-el-arca-de-hoy', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: C/2 #8 Los Salados Nuevos, Santiago.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Redames Rodr????guez </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-721-6138</em></span></span></span></p>', '', 1, 14, 0, 28, '2011-05-06 19:29:35', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:29:35', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 140, 'robots=\nauthor='),
(120, '1er Santuario', '1er-santuario', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Castillo # 183, Barrio Ram????n Holgu????n, Sfm.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Bienvenido V????squez.</em></span></span></span></p>', '', 1, 14, 0, 28, '2011-05-06 19:30:12', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:30:12', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 103, 'robots=\nauthor='),
(121, 'Nueva Luz', 'nueva-luz', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Luper????n #26, Esperanza, Mao, Valverde.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Santiago</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Exh. Justino Silverio.</em></span></span></span></p>', '', 1, 14, 0, 28, '2011-05-06 19:30:42', 63, '', '2011-07-12 12:37:54', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:30:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 2, '', '', 0, 166, 'robots=\nauthor='),
(122, 'Luz de Salvaci????n', 'luz-de-salvacion', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"> </span></span></span></p>\r\n<table style=\"width: 408px; height: 274px;\" border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em><img src=\"images/stories/iglesias/sjm-luz-salvacion.jpg\" border=\"0\" width=\"300\" height=\"225\" style=\"margin: 10px; vertical-align: top;\" /></em></span></span></span></p>\r\n</td>\r\n<td>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em><img src=\"images/stories/pastores/sjm-luz-salvacion-pastor.jpg\" border=\"0\" width=\"209\" height=\"199\" style=\"vertical-align: top; margin: 10px;\" /></em></span></span></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>Iglesia Luz de Salvacion</td>\r\n<td>Pastora Milka A. Luciano</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"> </span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Duarte # 2 Bohechio, San Juan.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Ju????n de la Maguana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Milka A. Luciano.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n\r\n<p style=\"margin-bottom: 0in; line-height: 150%; text-align: center;\" lang=\"es-CR\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Breve Rese????a Hist????rica</span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 150%; text-align: justify;\" lang=\"es-CR\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Sus fundadore la hermana Isaura S????nchez y su esposos tomas soto, la iglesia ecangelica de las asamblea de iglesias cristianas INC, de bohechio tiene aproximadamente 39 a????os de fundada en los a????os 1969-1970. para ese entonces fue la primera iglesia evangelica Pentecostal que hubo en bohechio, san juan R.D, ubicada actualmente en la calle ???????duarte #02, sector El Tocon????????.En la actualidad esta pastoreando la hermana milka Antonia Luciano de Susana por mas de 13 a????os. Por la gracia de dion=s hemos mantenido un evangelio puro en este lugar luchando, pasando por pruebas y dificultades per dandole gracias a dios que nos ha mantenido firmes y adelante con el.</span></span></p>', '', 1, 14, 0, 31, '2011-05-06 19:33:54', 63, '', '2011-05-10 02:53:53', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:33:54', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 7, '', '', 0, 143, 'robots=\nauthor='),
(123, 'Casa de Dios', 'casa-de-dios', '', '<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><img src=\"images/stories/iglesias/sjm-casa-Dios.jpg\" border=\"0\" width=\"300\" height=\"199\" style=\"margin: 10px;\" /><img src=\"images/stories/pastores/sjm-casa-Dios-pastor.jpg\" border=\"0\" width=\"287\" height=\"191\" style=\"vertical-align: top; margin: 10px;\" /></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Dr. Cabral Esquina Diego De Vel????zquez.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Ju????n de la Maguana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Exh. Elvira De Los Santos.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 150%; text-align: center;\" lang=\"es-CR\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Breve Rese????a Hist????rica</strong></span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 150%; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-CR\">Fue fundada en el a????o 1962, por el pastor Enerio Romero. </span></span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 150%; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-CR\">Desde el a????o 1962 hasta la fecha, ha tenido los siguientes pastores: Fausto F????lix, Eliseo Jim????nez (fallecido), M????ximo Lebr????n Cuevas en m????s de una ocasi????n, Victor Pinales, Lu????s Guzm????n, Rafael P????rez y P????rez, Emma Valenzuela, y en la actualidad pastoreada por la Licda. Elvira de los Santos. La misma se encuentra ubicada en la entrada del Distrito Juan de Herrera, San Juan de la Maguana, R.D.</span></span></span></p>', '', 1, 14, 0, 31, '2011-05-06 19:34:20', 63, '', '2011-05-09 14:17:02', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:34:20', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 6, '', '', 0, 123, 'robots=\nauthor='),
(124, 'Luz en el Desierto', 'luz-en-el-desierto', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Arroyo Salada De B????nica, San Juan.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Ju????n de la Maguana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Gumersindo Made</em></span></span></span></p>', '', 1, 14, 0, 31, '2011-05-06 19:34:58', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:34:58', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 154, 'robots=\nauthor='),
(125, 'Refugio 2do', 'refugio-2do', '', ' \r\n<table border=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"images/stories/iglesias/sjm-2do-refugio.jpg\" border=\"0\" width=\"301\" height=\"200\" style=\"vertical-align: top; margin: 10px;\" /></td>\r\n<td><img src=\"images/stories/pastores/sjm-2do-refugio-pastor.jpg\" border=\"0\" width=\"301\" height=\"200\" style=\"vertical-align: top; margin: 10px;\" /></td>\r\n</tr>\r\n<tr>\r\n<td>Iglrsia El refugio 2do</td>\r\n<td>Pastor Kennedy Hernandez</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Anacahona #2-a, San Juan.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Ju????n de la Maguana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Kennedy Hern????ndez.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n\r\n<p style=\"margin-bottom: 0in; line-height: 150%; text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-CR\">Breve</span><span lang=\"es-CR\"> Rese????a Hist????rica</span></span></span></p>\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; line-height: 140%; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-CR\">Por iniciativa de la pastora Susana Rosado y unos hermanos puertorrique????os</span><span lang=\"es-CR\"> dirigidos por Samuel Estrada entre otros misioneros del Concilio, AIC., procedieron a alquilar una peque????a casa propiedad de la hermana Mercedes Santana, quedando al frente del campo el hermano Samuel Agramonte Pinales, sustituido m????s tarde por la hermana Nurys Medina.</span></span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 140%; text-align: justify;\" lang=\"es-CR\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; line-height: 140%; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-CR\">En el 1997 fue sustituida la pastora Nurys Medina por el pastor actual, </span><span lang=\"es-CR\">Rev. Kennedy Hern????ndez.</span></span></span></p>\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; line-height: 140%; text-align: justify;\" lang=\"es-CR\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; line-height: 140%; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-CR\">Actualmente estamos ubicados en el sector Mirador Norte, calle Primera S/N, San Juan de la Maguana, R.D. con local propio.</span></span></span></p>', '', 1, 14, 0, 31, '2011-05-06 19:35:39', 63, '', '2011-05-10 03:00:51', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:35:39', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 4, '', '', 0, 153, 'robots=\nauthor='),
(126, 'El Buen Pastor', 'el-buen-pastor', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Secci????n Capul????n, Vallejuelo, San Juan.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Ju????n de la Maguana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Belarminio Nova De Oleo.</em></span></span></span></p>', '', 1, 14, 0, 31, '2011-05-06 19:36:02', 70, '', '2011-05-06 19:37:17', 63, 65, '2011-05-09 14:21:57', '2011-05-06 19:36:02', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 153, 'robots=\nauthor='),
(127, 'El Refugio 1ero', 'el-refugio-1ero', '', '<!--  p { margin-bottom: 0.08in; } -- > \r\n<table border=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"images/stories/iglesias/sjm-1er-refugio.jpg\" border=\"0\" width=\"301\" height=\"200\" style=\"vertical-align: top; margin: 10px;\" /></td>\r\n<td><img src=\"images/stories/pastores/sjm-1er-refugio-pastor.jpg\" border=\"0\" width=\"301\" height=\"200\" style=\"border: 0pt none; vertical-align: top; margin: 10px;\" /></td>\r\n</tr>\r\n<tr>\r\n<td>Iglesia Primer Refugio</td>\r\n<td>Pastora Susana de la Rosa</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Col????n # 123-A</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Ju????n de la Maguana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Rev. Susana De La Rosa Rosada. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-557-5681.</em></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; line-height: 150%;\">????</p>\r\n', '\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; line-height: 150%; text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Breve Rese????a Hist????rica</strong></span></span></p>\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; line-height: 150%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-CR\">La iglesia </span><span lang=\"es-CR\"><strong>???????El Refugio 1ro???????</strong></span><span lang=\"es-CR\"> fue fundada en el Sector Mesopotamia, San Juan de la Maguana, en el a????o 1975, siendo su fundador el exhortador Jorge de los Santos. Durante sus 33 a????os de existencia ha sido pastoreada por 4 pastores, cuyos nombres son los siguientes: Exhortador Jorge de los Santos, Exhortador Trinidad Ramos, Lic. Emmanuel Romero, Revda. Susana Rosado.</span></span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 150%;\" lang=\"es-CR\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"text-indent: 0.49in; margin-bottom: 0in; line-height: 150%;\" lang=\"es-CR\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Actualmente la iglesia se encuentra ubicada en la calle Col????n No.123-A, San Juan de la Maguana, R.D.</span></span></p>', 1, 14, 0, 31, '2011-05-06 19:36:38', 65, '', '2011-05-10 03:07:14', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:36:38', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 2, '', '', 0, 351, 'robots=\nauthor=');
INSERT INTO `aicrd_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(128, 'Camino al Cielo', 'camino-al-cielo', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Chichi Olivo #11 Bo. Lindo, Spm.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Pedro de Macor????s</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Sebasti????n Lora Reyna. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-553-8344 / 809-752-6188.</em></span></span></span></p>', '', 1, 14, 0, 35, '2011-05-06 19:40:19', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:40:19', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 99, 'robots=\nauthor='),
(129, 'Faro de Luz', 'faro-de-luz', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Isidro Barros #63, Municipio De Consuelo, Spm.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Pedro de Macor????s</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Ceferino Jim????nez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 829-335-9497.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 35, '2011-05-06 19:40:53', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:40:53', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 8, '', '', 0, 152, 'robots=\nauthor='),
(130, 'Bethania', 'bethania', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle 6 #215, Bo. Le Loma, Consuelo, Spm.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Pedro de Macor????s</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lic. Pastor Bernardo Valdez Vesque</em></span></span></span></p>', '', 1, 14, 0, 35, '2011-05-06 19:41:27', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:41:27', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 103, 'robots=\nauthor='),
(131, 'Eben-Ezer 2da', 'eben-ezer-2da', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle S????nchez # 7, Ingenio Santa Fe, Spm.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Pedro de Macor????s</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lic. Freddy Ovalle Marte.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-527-0703</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 35, '2011-05-06 19:41:53', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:41:53', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 126, 'robots=\nauthor='),
(132, 'Nueva Jerusal????n', 'nueva-jerusalen', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Santa Fe, Barrio Villa Centro, Spm.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: San Pedro de Macor????s</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Jos???? An????bal Feliz.</em></span></span></span></p>', '', 1, 14, 0, 35, '2011-05-06 19:42:22', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:42:22', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 173, 'robots=\nauthor='),
(133, 'Fuente de Salvaci????n', 'fuente-de-salvacion', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: C/Rene Del Risco #58, Villa Progreso, Spm.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Pedro de Macor????s</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Rev. Sebasti????n Lora Reyna. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-752-6088</em></span></span></span></p>', '', 1, 14, 0, 35, '2011-05-06 19:42:52', 63, '', '2011-07-12 12:46:30', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:42:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 4, '', '', 0, 139, 'robots=\nauthor='),
(134, 'Fundada Sobre la Roca', 'fundada-sobre-la-roca', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: C/1ra. #88, Barrio La Loma, Consuelo, Spm.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Pedro de Macor????s</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Juan Antonio Reyes Alduey.</em></span></span></span></p>', '', 1, 14, 0, 35, '2011-05-06 19:43:18', 63, '', '2011-07-12 12:44:40', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:43:18', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 102, 'robots=\nauthor='),
(135, 'Jehov???? Jireh', 'jehova-jireh', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Barri???? Villa Mamota No 12, Spm.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: San Pedro de Macor????s</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Inocencio Vilorio.</em></span></span></span></p>', '', 1, 14, 0, 35, '2011-05-06 19:43:44', 63, '', '2011-07-12 12:37:24', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:43:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 2, '', '', 0, 175, 'robots=\nauthor='),
(136, 'Monte Carmelo', 'monte-carmelo', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\">DIRECCION: Calle G????nesis, Barrio Guamita, Consuelo, SPM.</span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\">CIRCUITO: San Pedro de Macor????s</span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\">PASTOR: Elvis Polo Garc????a</span></span></span></p>', '', 1, 14, 0, 35, '2011-05-06 19:44:24', 63, '', '2011-05-13 03:53:59', 63, 0, '0000-00-00 00:00:00', '2011-05-06 19:44:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 245, 'robots=\nauthor='),
(137, 'Jehov???? Jireh', 'jehova-jireh', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Te????filo Marrero #32, Sector Chilo Poueriet.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Higuey</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpd. Leandro Morla L????pez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-224-0364.</em></span></span></span></p>', '', 1, 14, 0, 32, '2011-05-06 19:55:52', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:55:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 11, '', '', 0, 147, 'robots=\nauthor='),
(138, '2da Unci????n de Jehov????', '2da-uncion-de-jehova', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: 27 De Febrero #31, La Marina Higuy.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Higuey</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Adela C????danos Vda. Mercedes. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-554-1937.</em></span></span></span></p>', '', 1, 14, 0, 32, '2011-05-06 19:58:08', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:58:08', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 10, '', '', 0, 142, 'robots=\nauthor='),
(139, '3era AIC Fe en Oraci????n', '3era-aic-fe-en-oracion', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Marcial Guerrero #78, Sector Juan Pablo Duarte.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Higuey</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpa. Julio Mercedes. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 829-978-1496.</em></span></span></span></p>', '', 1, 14, 0, 32, '2011-05-06 19:58:55', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:58:55', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 173, 'robots=\nauthor='),
(140, 'Jehova Shal????n', 'jehova-shalon', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle 26 De Febrero #47, Bo. Los Guagiles El Ceibo.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Higuey</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Juana Aquino De Garc????a. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-768-4523.</em></span></span></span></p>', '', 1, 14, 0, 32, '2011-05-06 19:59:40', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 19:59:40', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 8, '', '', 0, 111, 'robots=\nauthor='),
(141, '4ta Asamblea de Iglesias Cristianas', '4ta-asamblea-de-iglesias-cristianas', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Padre Abiana # 18, Bo. Antonio Guzm????n.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Higuey</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpa. Rafael Crist????bal Santana. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-352-8405.</em></span></span></span></p>', '', 1, 14, 0, 32, '2011-05-06 20:00:05', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 20:00:05', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 116, 'robots=\nauthor='),
(142, 'Asamblea de Iglesias Cristianas', 'asamblea-de-iglesias-cristianas', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Ra????l Rubio # 65, Sabana De La Mar, Hato Mayor.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Higuey</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Zunilda Bautista. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-317-1613.</em></span></span></span></p>', '', 1, 14, 0, 32, '2011-05-06 20:00:57', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-06 20:00:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 167, 'robots=\nauthor='),
(143, 'Puerta de Si????n', 'puerta-de-sion', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Secci????n Santana, Pareja Los Mnagos.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Higuey</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Buena Ventura Miguel. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-461-0447.</em></span></span></span></p>', '', 1, 14, 0, 32, '2011-05-06 20:01:24', 70, '', '2011-05-06 20:04:12', 63, 0, '0000-00-00 00:00:00', '2011-05-06 20:01:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 126, 'robots=\nauthor='),
(144, 'Dios es Bueno', 'dios-es-bueno', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Jos???? Francisco Pe????a G????mez #86. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Higuey</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Exh. Cecilio Herrera Maldonado. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 829-269-0472..</em></span></span></span></p>', '', 1, 14, 0, 32, '2011-05-06 20:01:49', 63, '', '2011-07-12 12:41:24', 63, 0, '0000-00-00 00:00:00', '2011-05-06 20:01:49', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 4, '', '', 0, 119, 'robots=\nauthor='),
(145, 'Cordero de Dios 6ta', 'cordero-de-dios-6ta', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Cambronal #77, Cambelen Higuey.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Higuey</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Lpa, Lu????s Pe????a. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 829-962-3780.</em></span></span></span></p>', '', 1, 14, 0, 32, '2011-05-06 20:02:11', 63, '', '2011-07-12 12:39:58', 63, 0, '0000-00-00 00:00:00', '2011-05-06 20:02:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 165, 'robots=\nauthor='),
(146, '3era Llama Pentecostal', '3era-llama-pentecostal', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Higuey.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Higuey</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Natividad Cueto. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-235-1478</em></span></span></span></p>', '', 1, 14, 0, 32, '2011-05-06 20:02:35', 63, '', '2011-07-12 12:36:05', 63, 0, '0000-00-00 00:00:00', '2011-05-06 20:02:35', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 2, '', '', 0, 168, 'robots=\nauthor='),
(147, '2da Asamblea de Iglesias Cristianas', '2da-asamblea-de-iglesias-cristianas', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle La Rotonda, Villa Guerrero, El Se????bo.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Higuey</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Fermina Echavarria. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-989-5461.</em></span></span></span></p>', '', 1, 14, 0, 32, '2011-05-06 20:03:06', 63, '', '2011-07-12 12:33:14', 63, 0, '0000-00-00 00:00:00', '2011-05-06 20:03:06', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 180, 'robots=\nauthor='),
(148, 'Iglesia Del Pentecost????s', 'iglesia-del-pentecostes', '', '<p><em>DIRECCION: Calle La Puya #19, Los Arroyos, La Cuesta De Arroyo Hondo.</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Lpa. Deivis Veras Ch????vez </em></p>\r\n<p><em>TELEFONO: 809-922-8321</em></p>', '', 1, 14, 0, 34, '2011-05-06 23:39:08', 65, '', '2011-05-07 00:27:22', 65, 0, '0000-00-00 00:00:00', '2011-05-06 23:39:08', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 16, '', '', 0, 82, 'robots=\nauthor='),
(149, 'Jehov???? De Los Ej????rcitos', 'jehova-de-los-ejercitos', '', '<p><em>DIRECCION: Calle La Puya #19, Los Arroyos, La Cuesta De Arroyo Hondo.</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Lpa. Deivis Veras Ch????vez </em></p>\r\n<p><em>TELEFONO: 809-922-8321</em></p>', '', 1, 14, 0, 34, '2011-05-06 23:41:02', 65, '', '2011-05-07 00:28:39', 65, 0, '0000-00-00 00:00:00', '2011-05-06 23:41:02', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 15, '', '', 0, 58, 'robots=\nauthor='),
(150, 'Faro De Luz', 'faro-de-luz', '', '<p><em>DIRECCION: Calle 27 De Febrero # 13, Bo. Obras P????blicas</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Pastor F????lix Benz Lorenzo</em></p>\r\n<p><em>TELEFONO: 829-212-8725</em></p>', '', 1, 14, 0, 34, '2011-05-06 23:42:24', 65, '', '2011-05-07 00:30:26', 65, 0, '0000-00-00 00:00:00', '2011-05-06 23:42:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 14, '', '', 0, 74, 'robots=\nauthor='),
(151, 'Justicia Y Verdad', 'justicia-y-verdad', '', '<p><em>DIRECCION: Calle Progreso#21, Bo. Enriquillo Km 9???? Aut. Duarte</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Rev. Antonio B????ez N????????ez </em></p>\r\n<p><em>TELEFONO: 809-763-4467</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 34, '2011-05-06 23:45:13', 65, '', '2011-05-07 00:31:30', 65, 0, '0000-00-00 00:00:00', '2011-05-06 23:45:13', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 13, '', '', 0, 115, 'robots=\nauthor='),
(152, 'Juan 8:32', 'juan-832', '', '<p><em>DIRECCION: Calle Prolongaci????n Independencia #9</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Lpa. El????as Arias P????rez </em></p>\r\n<p><em>TELEFONO: 809-883-2424</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 34, '2011-05-06 23:45:46', 65, '', '2011-05-07 00:32:12', 65, 65, '2011-05-07 00:35:57', '2011-05-06 23:45:46', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 12, '', '', 0, 145, 'robots=\nauthor='),
(153, 'Justicia Y Verdad II', 'justicia-y-verdad-ii', '', '<p><em>DIRECCION: Calle 1ra. # 41, Villa Del Palmar; Pantoja</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Francisco Agramonte. </em></p>\r\n<p><em>TELEFONO: 829-301-3418</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 34, '2011-05-06 23:46:47', 65, '', '2011-05-07 00:32:54', 65, 0, '0000-00-00 00:00:00', '2011-05-06 23:46:47', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 11, '', '', 0, 124, 'robots=\nauthor='),
(154, 'Monte De Sion', 'monte-de-sion', '', '<p><em>DIRECCION: Calle Anacaona #440 D. Bo. Los Alcarrizos Americanos</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Rev. Domingo Antonio Pe????a </em></p>\r\n<p><em>TELEFONO: 809-548-9459</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 34, '2011-05-06 23:48:23', 65, '', '2011-05-07 00:33:34', 65, 0, '0000-00-00 00:00:00', '2011-05-06 23:48:23', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 10, '', '', 0, 178, 'robots=\nauthor='),
(155, ' Roca De Salvaci????n', '-roca-de-salvacion', '', 'undefined', '', 1, 14, 0, 34, '2011-05-06 23:49:54', 65, '', '0000-00-00 00:00:00', 0, 65, '2011-05-07 00:37:28', '2011-05-06 23:49:54', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 129, 'robots=\nauthor='),
(156, 'Eben-Ezer', 'eben-ezer', '', '<p><em>DIRECCION: Calle Respaldo M????xico #21 Bo. Buenos Aires De Herrera</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Rev. Antonio Mej????a </em></p>\r\n<p><em>TELEFONO: 809-238-7892</em></p>', '', 1, 14, 0, 34, '2011-05-06 23:50:54', 65, '', '2011-05-07 01:59:54', 65, 0, '0000-00-00 00:00:00', '2011-05-06 23:50:54', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 8, '', '', 0, 68, 'robots=\nauthor='),
(157, 'La Roca', 'la-roca', '', '<p><em>DIRECCION: Av. Del Guaricano # 60, Santa Cruz, Villa Mella</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Rev. Julio Arsenio S????nchez.</em></p>\r\n<p><em>TELEFONO: 809-324-8984</em></p>', '', 1, 14, 0, 34, '2011-05-06 23:51:53', 65, '', '2011-05-07 02:00:42', 65, 0, '0000-00-00 00:00:00', '2011-05-06 23:51:53', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 7, '', '', 0, 128, 'robots=\nauthor='),
(158, '2da. Unci????n De Jehov????', '2da-uncion-de-jehova', '', '<p><em>DIRECCION: Calle 31 # 45, San Felipe Villa Mella</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Exh. Flavia ????lvarez </em></p>\r\n<p><em>TELEFONO: 809-239-9033</em></p>', '', 1, 14, 0, 34, '2011-05-06 23:53:23', 65, '', '2011-05-07 02:01:25', 65, 0, '0000-00-00 00:00:00', '2011-05-06 23:53:23', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 6, '', '', 0, 116, 'robots=\nauthor='),
(159, 'El Sembrador ', 'el-sembrador-', '', '<p><em>DIRECCION: Calle Central #26 Bo. Guzm????n, Km.12 De Haina</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Lpa. Andr????s D Oleo Ram????rez</em></p>\r\n<p><em>TELEFONO: 809-460-0939</em></p>', '', 1, 14, 0, 34, '2011-05-06 23:54:03', 65, '', '2011-05-07 02:01:46', 65, 0, '0000-00-00 00:00:00', '2011-05-06 23:54:03', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 131, 'robots=\nauthor='),
(160, 'Roca De Salvaci????n 2da', '-roca-de-salvacion-2da', '', '<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>DIRECCION: Calle 25 # 32, Bo. El Caf???? De Herrera.</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>CIRCUITO: Santo Domingo Oeste</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>PASTOR: Exh. Antonio Mateo </em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>TELEFONO: 829-548-2302</em></span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\">RESE?????A HIST?????RICA</span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Dicha Iglesia naci???? como campo de predicaci????n de la iglesia Roca de Salvaci????n AIC, INC. en el a????o 2001. </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Luego  en el 2002, contando con 3 miembros, dicho campo de blanco fue  entregado al pastor Exh. Antonio Mateo. Dos a????os dmas tarde, en el 2004,  la iglesia fue recibida oficialmente ya que contaba con los requisitos  de membresia exhigidos por nuestro reglamento. </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">El Pastor actual es el Exh. Antonio Mateo</span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em> </em></span></span></p>', '', 1, 14, 0, 34, '2011-05-06 23:54:57', 65, '', '2011-05-15 16:19:41', 63, 0, '0000-00-00 00:00:00', '2011-05-06 23:54:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 4, '', '', 0, 182, 'robots=\nauthor='),
(161, 'La Puerta De La Fe', 'la-puerta-de-la-fe', '', '<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>DIRECCION: Calle Santa Rosa De Rieles S/N, Villa Linda, De Pantoja</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>CIRCUITO: Santo Domingo Oeste</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>PASTOR: Exh. Epifania Previl De Le????n </em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>TELEFONO: 829-664-3310</em></span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\"><br /></span></span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\">RESE?????A HISTORICA</span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">La iglesia La Puerta de la Fe, de villa linda, fue fundada por el Rev. pastor Jose Ami en la fecha del dia 3 de agosto del 2003. De este tiempo, la hermana Epifania Previl de Leon resivio la unsion de???? Dios???? de pastorear esta iglesia hasta actualmente por la misericordia de Dios.<br /></span></span></p>', '', 1, 14, 0, 34, '2011-05-06 23:56:32', 65, '', '2011-05-15 16:31:11', 63, 0, '0000-00-00 00:00:00', '2011-05-06 23:56:32', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 3, '', '', 0, 174, 'robots=\nauthor='),
(162, 'Mi Refugio', 'mi-refugio', '', '<p><em>DIRECCION: Calle Antonio Guzman#16, Los Girasoles</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Luis Manuel Urb????ez. </em></p>\r\n<p><em>TELEFONO: 809-930-5989</em></p>', '', 1, 14, 0, 34, '2011-05-06 23:57:44', 65, '', '2011-05-07 02:04:43', 65, 0, '0000-00-00 00:00:00', '2011-05-06 23:57:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 2, '', '', 0, 163, 'robots=\nauthor='),
(163, 'Fuente de Esperanza', 'fuente-de-esperanza', '', '<p><em>DIRECCION: Calle Respaldo Caracoles #25, Los Minas, Sabana Perdida</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Exh. Benjamin Jorge Mojica. </em></p>\r\n<p><em>TELEFONO: </em><em>809-435-5691</em></p>', '', 1, 14, 0, 33, '2011-05-07 00:01:12', 65, '', '2011-05-07 02:06:47', 65, 0, '0000-00-00 00:00:00', '2011-05-07 00:01:12', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 20, '', '', 0, 77, 'robots=\nauthor='),
(164, ' Luz De La Esperanza', '-luz-de-la-esperanza', '', '<p><em>DIRECCION: Calle Yolanda Guzm????n #240, Esquina 17</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Rev. Marcial Reyes Soba.</em></p>\r\n<p><em>TELEFONO: 809-528-3657</em></p>', '', 1, 14, 0, 33, '2011-05-07 00:02:58', 65, '', '2011-05-07 02:07:51', 65, 0, '0000-00-00 00:00:00', '2011-05-07 00:02:58', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 19, '', '', 0, 110, 'robots=\nauthor='),
(165, 'Bethel,', 'bethel', '', '<p><em>DIRECCION: Calle Paseo De Los Profesores#1, Los Frailes</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Rev. Juni Roque Laureano. </em></p>\r\n<p><em>TELEFONO: 809-273-1205</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 33, '2011-05-07 00:05:11', 65, '', '2011-05-07 02:08:19', 65, 0, '0000-00-00 00:00:00', '2011-05-07 00:05:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 18, '', '', 0, 72, 'robots=\nauthor='),
(166, 'El Camino', 'el-camino', '', '<p><em>DIRECCION: Calle Jardines Del Norte #20, El Rosal, Alma Rosa 11</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Rev. Miguelin Morillo. </em></p>\r\n<p><em>TELEFONO: 829-851-3973</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 33, '2011-05-07 00:05:56', 65, '', '2011-05-07 02:08:48', 65, 0, '0000-00-00 00:00:00', '2011-05-07 00:05:56', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 17, '', '', 0, 143, 'robots=\nauthor='),
(167, 'Esmirna', 'esmirna', '', '<p><em>DIRECCION: Calle F#22, Ensanche Isabelita</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Ing. Nicol????s Cuevas Sena </em></p>\r\n<p><em>TELEFONO: 809-599-6414</em></p>', '', 1, 14, 0, 33, '2011-05-07 00:06:48', 65, '', '2011-05-07 02:09:26', 65, 0, '0000-00-00 00:00:00', '2011-05-07 00:06:48', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 16, '', '', 0, 112, 'robots=\nauthor='),
(168, 'Pan Y Vida', 'pan-y-vida', '', '<p><em>DIRECCION: Calle 12#158, La Isabelita</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Rev. Eduardo Terrero </em></p>\r\n<p><em>TELEFONO: 809-595-4780</em></p>', '', 1, 14, 0, 33, '2011-05-07 00:07:34', 65, '', '2011-05-07 02:10:14', 65, 0, '0000-00-00 00:00:00', '2011-05-07 00:07:34', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 15, '', '', 0, 73, 'robots=\nauthor=');
INSERT INTO `aicrd_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(169, 'Columna De Fuego ', 'columna-de-fuego-', '', '<p><em>DIRECCION: Calle Carolina. </em></p>\r\n<p><em>CIRCUITO: Santo Domingo Oeste</em></p>\r\n<p><em>PASTOR: Exh. Juana Rosario. </em></p>\r\n<p><em>TELEFONO: 809-537-4301</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 34, '2011-05-07 02:04:46', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:04:46', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 163, 'robots=\nauthor='),
(170, 'Santidad A Jehova', 'santidad-a-jehova', '', '<p><em>DIRECCION: Calle 311#58bo.Pto. Rico, Los Minas.</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Rev. Rafael Maria. </em></p>\r\n<p><em>TELEFONO: 809-803-8400</em></p>', '', 1, 14, 0, 33, '2011-05-07 02:10:18', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:10:18', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 14, '', '', 0, 104, 'robots=\nauthor='),
(171, ' Escala Al Cielo', '-escala-al-cielo', '', '<p><em>DIRECCION: Calle Altagracia#41 Sector Gualey</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Rev. Jose Manuel De La Rosa </em></p>\r\n<p><em>TELEFONO: 809-771-8615 / 809-599-4590</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 33, '2011-05-07 02:11:06', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:11:06', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 13, '', '', 0, 125, 'robots=\nauthor='),
(172, 'Nueva Vicion', 'nueva-vicion', '', '<p><em>DIRECCION: Sector La Caleta, Boca Chica</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Rev. Carlos Manuel Guzman Guance </em></p>\r\n<p><em>TELEFONO: 809-634-8625</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 33, '2011-05-07 02:12:31', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:12:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 12, '', '', 0, 139, 'robots=\nauthor='),
(173, 'Aposento Alto', 'aposento-alto', '', '<p><em>DIRECCION: Calle Respaldo San Andres #35, Andres Boca Chica</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Exh. ????ngela Feliciano </em></p>\r\n<p><em>TELEFONO: 829-387-7680</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 33, '2011-05-07 02:13:57', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:13:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 11, '', '', 0, 186, 'robots=\nauthor='),
(174, 'Casa De Refugio', 'casa-de-refugio', '', '<p><em>DIRECCION: Naranjo, Batey San Luis, Central Hozara</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Lpa. Victor De La Cruz Marte. </em></p>\r\n<p><em>TELEFONO: 809-670-0581</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 33, '2011-05-07 02:15:16', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:15:16', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 10, '', '', 0, 131, 'robots=\nauthor='),
(175, ' Pacto De Amor', '-pacto-de-amor', '', '<p><em>DIRECCION: Calle 6 #99, Sector El Capotillo</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Exh. Jose Ventura.</em></p>\r\n<p><em>TELEFONO: 829-515-2232</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 33, '2011-05-07 02:16:21', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:16:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 132, 'robots=\nauthor='),
(176, 'El Sembrador ', 'el-sembrador-', '', '<p><em>DIRECCION: Calle 1ra. #5, Bo. Las Flore, San Luis</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Licp. Manuel Javier Alcala </em></p>\r\n<p><em>TELEFONO: 809-236-2797</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 33, '2011-05-07 02:18:05', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:18:05', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 8, '', '', 0, 161, 'robots=\nauthor='),
(177, 'Shalon', 'shalon', '', '<p><em>DIRECCION: Calle 8 R # 10 Brisa</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Santo Hiraldo Guzman </em></p>\r\n<p><em>TELEFONO: 829-531-2694</em></p>', '', 1, 14, 0, 33, '2011-05-07 02:19:47', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:19:47', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 193, 'robots=\nauthor='),
(178, 'Getsemani', 'getsemani', '', '<p><em>DIRECCION: Chirino, Monte Plata</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Lpa Agustin Febles </em></p>\r\n<p><em>TELEFONO: 809-234-0932</em></p>', '', 1, 14, 0, 33, '2011-05-07 02:20:41', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:20:41', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 127, 'robots=\nauthor='),
(179, 'El Consolador ', 'el-consolador-', '', '<p><em>DIRECCION: Calle Progreso# 6 Bo. Libertad, Sabana Perdida</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Ramon Fausto Pe????a </em></p>\r\n<p><em>TELEFONO: 809590-2904</em></p>', '', 1, 14, 0, 33, '2011-05-07 02:22:11', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:22:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 216, 'robots=\nauthor='),
(182, 'El Consolador 11', 'el-consolador-11', '', '<p><em>DIRECCION: Calle Principal S/N, Villa Pantoja, Sabana Perdida</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Dominga Antonio Jeres </em></p>\r\n<p><em>TELEFONO: 809-590-7576</em></p>', '', 1, 14, 0, 33, '2011-05-07 02:30:52', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:30:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 143, 'robots=\nauthor='),
(183, ' Iglesia Remanente Fiel', '-iglesia-remanente-fiel', '', '<p><em>DIRECCION: Calle 1ra # 23 La Flores San Lu????s.</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Daniel Quezada De La Cruz.</em></p>\r\n<p><em>TELEFONO: 809-414-7517</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 33, '2011-05-07 02:31:41', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:31:41', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 182, 'robots=\nauthor='),
(184, 'Jehov???? Nisi.', 'jehova-nisi', '', '<p><em>DIRECCION: El Naranjo San Luis.</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Exh, Antero Liriano De Los Santos. </em></p>\r\n<p><em>TELEFONO: 829-779-4572.</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 33, '2011-05-07 02:32:43', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:32:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 181, 'robots=\nauthor='),
(185, ' Nueva Vida Eterna.', '-nueva-vida-eterna', '', '<p><em>DIRECCION: Gregorio Garc????a Castro #23 Los Tres Brazos.</em></p>\r\n<p><em>CIRCUITO: Santo Domingo Este</em></p>\r\n<p><em>PASTOR: Exh, Luz Mercedes Montilla Del Valle. </em></p>\r\n<p><em>TELEFONO: 809-234-4691</em></p>', '', 1, 14, 0, 33, '2011-05-07 02:33:22', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:33:22', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 194, 'robots=\nauthor='),
(186, 'Casa De Oraci????n 2da', 'casa-de-oracion-2da', '', '<p><em>DIRECCION: La Sierra </em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Leonardo Febrille</em></p>\r\n<p><em>TELEFONO: 809-632-5046</em></p>', '', 1, 14, 0, 26, '2011-05-07 02:34:45', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:34:45', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 22, '', '', 0, 70, 'robots=\nauthor='),
(187, 'Casa De Oraccion 1ra', 'casa-de-oraccion-1ra', '', '<p><em>DIRECCION: Do????a Ana S.C</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Raquel Rosario Perez </em></p>\r\n<p><em>TELEFONO: 829-298-8457</em></p>', '', 1, 14, 0, 26, '2011-05-07 02:35:43', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:35:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 21, '', '', 0, 85, 'robots=\nauthor='),
(188, 'Monte De Sion', 'monte-de-sion', '', '<p><em>DIRECCION: Calle Domingo Sabio No. 39 Canastica, San Crist????bal</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Rev. F????lix A. Armando Severino</em></p>\r\n<p><em>TELEFONO: 809-288-0632</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\">BREVE HISTORIA</p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\">La Iglesia Evang????lica Monte de Sion de AIC, Inc. Es fruto del trabajo apasionado de hombres y mujeres con un deseo fecundo de plantar en corazones ????vidos la palabra de Dios.</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\">En el mes de septiembre de 1962 un grupo de hermanos de la iglesia Bethesda, inquietados por el Esp????ritu Santo para trasladarse a Canastica a evangelizar, surgiendo en ellos el deseo de establecer una iglesia en este lugar; en el 1964 se consigue el solar de la iglesia con una casita de tablas de palmas y cobijada de zinc. Despu????s de mucho trabajo, ofrendas y donaciones se inauguro el templo el 24 de septiembre de 1983.</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span lang=\"es-DO\">En la galer????a de los pastores que ha tenido la iglesia est????n: Sime????n Morban, (Moch????n), Miguel Rosario, Rey. Calixto Figuereo, Rey. Eugenio B????ez, Lp. Rafael Dar????o Rodr????guez, Rey. Ram????n Ram????rez y en 1994 es instalado como pastor el Rey. F????lix Armando Severino, siendo el pastor m????s joven que ha sido instalado en nuestra iglesia. La iglesia en su gesti????n a alcanzando: 1. Un profundo desarrollo socio-espiritual. 2. Crecimiento mas que triplicado en membres????a. 3. Mantenimiento, ornato, ampliaci????n remodelaci????n de la planta fisica construyendo el 2do nivel. 4. Adquiriendo la guagua de la iglesia para la misi????n 5. Ocupando un sitial de honra y respeto en la comunidad, 6. Formamos el Colegio Cristiano Monte de Sion para la comunidad que alcanza hoy hasta el 4to. Grado del nivel medio (Bachillerato. dejando nuestros mejores aportes a la postrimer????a. 6. Hemos plantando por lo meno 3 nuevas iglesias hijas. 7. La formaci????n y adiestramiento de obreros para trabajar en la mies, y 8. Establecimos el Instituto Teol????gico de MC en la Iglesia. Honor a nuestros fundadores Honor a quienes han sido y son nuestros pastores, Gracias a los que tienen fe en nuestro porvenir.</span></p>', '', 1, 14, 0, 26, '2011-05-07 02:37:57', 65, '', '2011-05-07 15:37:50', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:37:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 20, '', '', 0, 507, 'robots=\nauthor='),
(189, 'Jesucristo Te Salva', 'jesucristo-te-salva', '', '<p><em>DIRECCION: Carretera Combita Km4, Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>Pastor Rev. Virgilio Figuereo. </em></p>\r\n<p><em>TELEFONO: 809-527-8882</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 26, '2011-05-07 02:39:56', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:39:56', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 19, '', '', 0, 48, 'robots=\nauthor='),
(190, 'Fuente De Agua Viva', 'fuente-de-agua-viva', '', '<p><em>DIRECCION: Cambita Esterlin. Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Lic. Manuel De Los Santos.</em></p>\r\n<p><em>TELEFONO: 809-647-4548</em></p>', '', 1, 14, 0, 26, '2011-05-07 02:40:43', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:40:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 18, '', '', 0, 116, 'robots=\nauthor='),
(191, 'Ciudad De La Luz 1ra.', 'ciudad-de-la-luz-1ra', '', '<p><em>DIRECCION. Do????a Ana San Crist????bal.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Rev. Demetrio Martes. </em></p>\r\n<p><em>TELEFONO: 809-612-9837</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p> </p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\">La Iglesia Ciudad de Luz 1ra, ubicada en Do????a Ana, San Crist????bal, Zona Oeste Km 10, Inicia en el 1964. Inicia en el sector de la Carreterita. Su primer Pastor fue Manuel Dipr???? (fallecido), luego de ese sector fue trasladada a la casa del se????or Celio De Le????n P????rez para un garaje de carreta de bueyes. En ese tiempo el pastor Manuel Dipr???? abandono la obra, quedando al frente el hermano Porfirio Brem????n (Chachao).</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"> </p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\">Luego nos trasladamos al tempo Ciudad De Luz, donde estamos ubicados actualmente. En ese tiempo, el supervisor de turno era el hermano Aurelio Eduvirgen D????az, quien surg????a como supervisor y pastor de la misma iglesia.</span></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 26, '2011-05-07 02:41:28', 65, '', '2011-05-07 15:52:31', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:41:28', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 17, '', '', 0, 97, 'robots=\nauthor='),
(192, 'Alfa Y Omega', 'alfa-y-omega', '', '<p><em>DIRECCION: Los Cacaos, Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Juan Eduardo Rosario Santana</em></p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span lang=\"es-DO\">La iglesia Alfa y Omega ubicada en la calle No. 2 del Municipio Los Cacaos, San Crist????bal, Republica Dominicana, fue fundada en el a????o 1985 por el reverendo Federico Sob????, durante sus 23 a????os de existencia ha sido dirigida por 6 pastores cuyos nombres son los siguientes: Exh. Israel Garbel, Exh. Queyla Corporal, Rey. Juan Isabel Jim????nez, Exh. Andr????s Casilla, Exh. Altagracia Peguero de Veras, Exh. Juan Eduardo Rosario, quien es el pastor en la actualidad.</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\"> </p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span lang=\"es-DO\">Es la primera Iglesia de Asamblea de Iglesias Cristiana Inc. establecida en el municipio Los Cacaos, San Crist????bal Republica Dominicana.</span></p>', '', 1, 14, 0, 26, '2011-05-07 02:44:23', 65, '', '2011-05-07 15:44:41', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:44:23', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 16, '', '', 0, 91, 'robots=\nauthor='),
(193, 'Templo Bethel', 'templo-bethel', '', '<p><em>DIRECCION: Najayo Arriba. Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Crisp????n Aquino Alvares. </em></p>\r\n<p><em>TELEFONO: 809-470-0051</em></p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\"><br /></span></p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span lang=\"es-DO\">Templo Bethel ubicada en la calle Principal en Najayo Arriba, San Crist????bal Rep. Dom.; Fue fundada en el a????o 1967, por el Rey. Luis Aquino Isabel:</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span lang=\"es-DO\">Durante su estad????a de 41 a????os ha sido dirigida por seis pastores que son:</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\">Rey. Luis Aquino Isabel. (2 veces)</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\">Lic. P. Rafael David Feliz. (3 veces)</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\">Rey. Bartolo Cuevas Feliz. (Fallecido)</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\">Manuel Dipr????. (Fallecido)</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\">Ismael Mateo. (Interino)</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\">Rey. Crisp????n Aquino ????lvarez Pastor actual.</p>', '', 1, 14, 0, 26, '2011-05-07 02:46:50', 65, '', '2011-05-07 15:54:11', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:46:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 15, '', '', 0, 121, 'robots=\nauthor='),
(194, 'Eben-Ezer', 'eben-ezer', '', '<p><em>DIRECCION: Canasta, Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Rev. Juan Isabel Jim????nez. </em></p>\r\n<p><em>TELEFONO: 829-725-6996</em></p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\">La iglesia (EBEN-EZER 1) ubicada en la calle No.35,canasta II, san Crist????bal, Republica Dominicana, esta fue fundada el DIA 7 de agosto del a????o 1966, sus fundadores fueron la pareja de esposo; Lic. Predicadora Margarita Figuereo de Figuereo, y Lic. Predicador Candido Figuereo Feliz (fallecido).</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"> </p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\">La congregacion durante sus 42 a????os de existencia ha sido dirigida por los siguientes pastores;</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\">??????? <span style=\"font-size: medium;\">Rafael Lara</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\">??????? <span style=\"font-size: medium;\">Rey. David De Los Santos Caro</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\">??????? <span style=\"font-size: medium;\">Ismael Mateo</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\">??????? <span style=\"font-size: medium;\">Rey. Domingo Gonz????lez</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\">??????? <span style=\"font-size: medium;\">Rey. Juan Isabel Jim????nez</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\">Este ????ltimo es el pastor en la actualidad, la iglesia tiene una hija cuyo nombre es (EBEN-.EZER II), y tambi????n un campo blanco.</span></p>', '', 1, 14, 0, 26, '2011-05-07 02:47:27', 65, '', '2011-05-07 15:49:50', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:47:27', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 14, '', '', 0, 137, 'robots=\nauthor='),
(195, 'Mizpa', 'mizpa', '', '<p><em>DIRECCION: Proyecto Canasta, Km.5.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Lic. Rafael P????rez. </em></p>\r\n<p><em>TELEFONO: 809-856-6486</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span lang=\"es-DO\">La primera Iglesia Mizpa ubicada en la calle Jos???? Francisco Pe????a G????mez del sector km. 5 Proyecto Canasta, San Crist????bal, Rep????blica Dominicana, fue fundada el d????a 10 de marzo del a????o 1968, siendo su fundador el Pastor Eduardo de Le????n. Durante sus 40 a????os de existencia ha sido dirigida por 7 pastores cuyos nombres son los siguientes: Juan Ramos, Ismael Mateo, Mauricio Ruiz (Fallecido), Jos???? Luis N????????ez, Juan Dionisio Castillo, Eduardo Mel????ndez (Fallecido), Y el Pastor Reverendo Rafael P????rez (Actualidad).</span></p>', '', 1, 14, 0, 26, '2011-05-07 02:48:20', 65, '', '2011-05-07 15:50:53', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:48:20', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 13, '', '', 0, 144, 'robots=\nauthor='),
(196, 'Casa De Oraci????n', 'casa-de-oracion', '', '<p><em>DIRECCION: Najayo Arriba, La Victoria, Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Lpa Esteban Hernandez </em></p>\r\n<p><em>TELEFONO: 809-464-2305</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span lang=\"es-DO\">La iglesia Casa de Oraci????n naci???? el d????a 06/12/1998, la cual fue fundada por la iglesia templo bethel que pastorea el reverendo Crisp????n Aquino, quien dej???? atendiendo el campo al Licenciado Bruno De La Cruz, quien muy pronto prosper???? en dicha obra logrando oficializarla y siendo ratificado por el Comit???? Ejecutivo Nacional, dicha iglesia recibe su segundo pastor el 17- 7-2004 al Lic. Esteban Enrique Hern????ndez Adv????ncola, quien al junto de la iglesia tienen bien cambiarle el nombre de Casa de Oraci????n por Templo Bethel 3era. Para as???? honrar a dicha iglesia madre.</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\"> </p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\">Dicho pastor actual lleva cinco (5) a????os pastoreando.</p>', '', 1, 14, 0, 26, '2011-05-07 02:49:04', 65, '', '2011-05-07 15:46:59', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:49:04', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 12, '', '', 0, 145, 'robots=\nauthor='),
(197, 'Arca No????', 'arca-noe', '', '<p><em>Direcci????n: Calle Andr????s Bremon#63, La Sierra, Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Lic. Pastor Julio Rodr????guez. </em></p>\r\n<p><em>TELEFONO: 809-288-9993</em></p>', '', 1, 14, 0, 26, '2011-05-07 02:49:59', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:49:59', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 11, '', '', 0, 103, 'robots=\nauthor='),
(198, 'Bet-El II', 'bethel-ii', '', '<p><em>DIRECCION: Sector De Camba, Paraje Do????a Ana, Calle S????nchez Vieja, Km.7</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>TELEFONO: 829-341-1553</em></p>\r\n<p><em> </em></p>\r\n<p><em>PASTOR: Miledys Moquete Ram????rez</em></p>', '', 1, 14, 0, 26, '2011-05-07 02:52:00', 65, '', '2013-05-15 14:20:13', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:52:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 10, '', '', 0, 123, 'robots=\nauthor='),
(199, 'Senda De Maravilla', 'senda-de-maravilla', '', '<p><em>DIRECCION: Calle Altagracia #4, Najayo Arriba, Km, 6 Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Exhortadora Milagros F????lix.</em></p>\r\n<p><em>TELEFONO: 829-865-9004</em></p>', '', 1, 14, 0, 26, '2011-05-07 02:54:40', 65, '', '2011-05-07 15:47:46', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:54:40', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 9, '', '', 0, 117, 'robots=\nauthor='),
(200, 'La Hermosa Fuente De Amor', 'la-hermosa-fuente-de-amor', '', '<p><em>DIRECCION: Paraje La Manigua, Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Lic. Teodoro Figuereo. Feliz. </em></p>\r\n<p><em>TELEFONO: 809-406-3963</em></p>', '', 1, 14, 0, 26, '2011-05-07 02:55:38', 65, '', '2011-05-07 15:48:06', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:55:38', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 8, '', '', 0, 103, 'robots=\nauthor='),
(201, 'Siloe 3ra', 'siloe-3ra', '', '<p><em>DIRECCION: Calle Privada No. 10, Hoyo De Vario, Ingenio Nuevo</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Lpa. Brijido De La Cruz Jim????nez.</em></p>\r\n<p><em>TELEFONO: 809-634-9532</em></p>\r\n<p><em> \r\n<hr />\r\n</em></p>', '', 1, 14, 0, 26, '2011-05-07 02:56:24', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:56:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 91, 'robots=\nauthor='),
(202, 'Eben-Ezer 2da', 'eben-ezer-2da', '', '<p><em>DIRECCION: Sector Los Casilla, San Crist????bal</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Bartolo Figuereo Medrano. </em></p>\r\n<p><em>TELEFONO: 809-528-2627</em></p>', '', 1, 14, 0, 26, '2011-05-07 02:57:25', 65, '', '2011-05-07 15:47:23', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:57:25', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 6, '', '', 0, 107, 'robots=\nauthor='),
(203, 'Fuente De Agua Viva 2da', 'fuente-de-agua-viva-2da', '', '<p><em>DIRECCION: Calle 1ra. #38 Entrada De Modesto, Cabita Uribe, Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Lpa. Jos???? El????as Del Rosario </em></p>\r\n<p><em>TELEFONO: 829-917-5375</em></p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span lang=\"es-DO\">Aproximadamente Diez a????os a tras, el pastor Manuel de los Santos de la (iglesia fluente de agua viva 1), Compro un terreno donde se construy???? la iglesia fuente de agua viva segunda (HIJA), la cual se oficializ???? como iglesia el 21 de diciembre del a????o 2007.</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\"> </p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span lang=\"es-DO\">Manuel de los Santos le pareci???? bien ponerme al frente de esta obra la estoy pastoreando por la misericordia de Dios.</span></p>', '', 1, 14, 0, 26, '2011-05-07 02:58:21', 65, '', '2011-05-07 15:55:24', 63, 0, '0000-00-00 00:00:00', '2011-05-07 02:58:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 64, 'robots=\nauthor='),
(204, 'Bethel 4ta', 'bethel-4ta', '', '<p><em>DIRECCION: La Capilla, Najayo Arriba, Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Jose Antonio Febrillet </em></p>\r\n<p><em>TELEFONO: 809-278-7536</em></p>', '', 1, 14, 0, 26, '2011-05-07 02:59:06', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:59:06', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 113, 'robots=\nauthor='),
(205, 'Los Doce Ap????stoles', 'los-doce-apostoles', '', '<p><em>DIRECCION: La Lagunita, Cambita, Garabito Sc.</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Jose E. Encarnaci????n. (hijo). </em></p>\r\n<p><em>TELEFONO: 829-885-6596</em></p>', '', 1, 14, 0, 26, '2011-05-07 02:59:57', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 02:59:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 158, 'robots=\nauthor='),
(206, 'Monte De Sion 3ra', 'monte-de-sion-3ra', '', '<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>DIRECCION: Paraje La Loma, Najayo. Yaguate, Sc.</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>CIRCUITO: San Crist????bal Oeste</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>PASTOR: Lpa. Santiago Sierra. </em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>TELEFONO: 829-740-3990</em></span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\"><br /></span></span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span></p>\r\n\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-DO\">La Iglesia Monte de Si????n 3era consagrada para Dios ubicada en la Entrada de Borozol, La Loma Najayo al Medio, Yaguate, Rep????blica Dominicana.</span></span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-DO\">Siendo obrero de Asamblea Cristiana y miembro del Monte de Si????n, vino a m???? el sentir de trasladarme a ese lugar donde fui recibido por Do????a Tatita P????rez, quien me prest???? una casa donde iniciamos la obra el de octubre del 2005, a los 6 meses compramos un peque????o solar donde est???? la Iglesia la cual fue recibida oficialmente el 5 mayo 2008 la cual sigo siendo su pastor.</span></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em> </em></span></span></p>', '', 1, 14, 0, 26, '2011-05-07 03:01:05', 65, '', '2011-07-12 12:43:00', 63, 0, '0000-00-00 00:00:00', '2011-05-07 03:01:05', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 2, '', '', 0, 165, 'robots=\nauthor='),
(207, 'Monte De Sion 2da', 'monte-de-sion-2da', '', '<p><em>DIRECCION: La Guama, Cambita, San Crist????bal</em></p>\r\n<p><em>CIRCUITO: San Crist????bal Oeste</em></p>\r\n<p><em>PASTOR: Jacinto Guzm????n </em></p>\r\n<p><em>TELEFONO: 809-386-3392</em></p>', '', 1, 14, 0, 26, '2011-05-07 03:01:35', 65, '', '2011-05-07 15:47:56', 63, 0, '0000-00-00 00:00:00', '2011-05-07 03:01:35', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 174, 'robots=\nauthor='),
(208, '4ta Canaan', '4ta-canaan', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Berm????dez # 15vv, La Romana.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: La Romana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Lic. Pastor Virgilio Hern????ndez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-556-1838</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>\r\n', '\r\n<p><span style=\"font-size: medium;\"> </span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: justify;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-DO\">La iglesia canaan, ubicada en la calle Juana saltitopa no. 13, del sector de villa verde, la romana, R.D., fundada en el ano 1993, siendo su fundadora, la misionera Esther de los Santos y el Rev. Virgilio Hernandez Santana, pastor actual. Es la 4ta iglesia de la asamblea de iglesias cristianas, INC., establecidas en la </span><span lang=\"es-DO\">romana.</span></span></span></p>', 1, 14, 0, 30, '2011-05-07 04:03:35', 63, '', '2011-07-12 12:28:04', 63, 0, '0000-00-00 00:00:00', '2011-05-07 04:03:35', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 10, '', '', 0, 250, 'robots=\nauthor='),
(209, 'Filadelfia', 'filadelfia', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Villa Progreso, La Romana.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: La Romana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Carlos Manuel De La Cruz. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-891-2798 / 809-986-9208</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>\r\n', '\r\n<p><span style=\"font-size: medium;\"> </span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\">BREVE HISTORIA</span></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">La iglesia Filadelfia ubicada en el sector de villa Progreso, municipio de villa Hermosa, provincia la Romana Republica Dominicana, la fundo el pastor Adriano Olivo en el a????o 1995, el principal problema de la iglesia para ese entonces era no tener un local estable para adorar a Dios, debido a esto estuvo en cinco locales diferentes, pero aun as???? Dios prospero la obra, luego descendi???? debido a que el pastor se descarri???? y con el se descarriaron la mayor????a de los miembros hasta que solo quedaron 7, fue entonces cuando en el a????o 1999 Dios envi???? el reverendo. Carlos Manuel de la Cruz quien para la gloria de Dios construyo el templo actual.</span></span></p>', 1, 14, 0, 30, '2011-05-07 04:07:05', 70, '', '2011-07-12 12:26:44', 63, 0, '0000-00-00 00:00:00', '2011-05-07 04:07:05', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 9, '', '', 0, 244, 'robots=\nauthor='),
(210, 'Trino Dios', 'trino-dios', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Villa Progreso, Los Mulos.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: La Romana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Lpa. Santiago Castillo Berroa. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-550-1873 / 809-484-0158</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>\r\n', '\r\n<p><span style=\"font-size: medium;\"> </span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\">BREVE HISTORIA</span></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">La Iglesia Trino Dios ubicada en la calle Salom???? Ure????a no. 15 del municipio de Villa hermosa, sector de Villa Progreso, La Romana Rep. Dom.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Abri???? sus puertas como campo blanco en el 1992 con el exhortador Felipe Rodr????guez Alvarez. En sus 16 a????os ha sido dirigida por 3 pastores: 1 ro. Exhortador Felipe Rodr????guez Alvarez, 2do. Exhortadora Tania Cordones Jonson y 3ro. Y actual Reverendo Santiago Castillo Berroa; es la Tercera Iglesia de asamblea de iglesias Cristianas, Inc. establecida en la Ciudad De La Romana</span></span></p>', 1, 14, 0, 30, '2011-05-07 04:09:40', 63, '', '2011-07-12 12:30:39', 63, 0, '0000-00-00 00:00:00', '2011-05-07 04:09:40', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 8, '', '', 0, 246, 'robots=\nauthor=');
INSERT INTO `aicrd_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(211, 'Pe????a de Horeb', 'pena-de-horeb', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Villa Renovaci????n, Sector Los Mulos.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: La Romana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Juan Gonz????lez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-357-5987</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><span style=\"text-decoration: underline;\"><br /></span></span></span></span></p>', '', 1, 14, 0, 30, '2011-05-07 04:11:24', 63, '', '2011-07-12 12:29:31', 63, 0, '0000-00-00 00:00:00', '2011-05-07 04:11:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 7, '', '', 0, 101, 'robots=\nauthor='),
(212, '7mo Valle de Bendici????n', '7mo-valle-de-bendicion', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: C/Gral., Pedro Santana Los Mulos.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: La Romana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Confesor Valerio</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n', '\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><span style=\"text-decoration: underline;\"><br /></span></span></span></span></p>', 1, 14, 0, 30, '2011-05-07 04:13:03', 63, '', '2011-07-12 12:28:41', 63, 0, '0000-00-00 00:00:00', '2011-05-07 04:13:03', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 6, '', '', 0, 211, 'robots=\nauthor='),
(213, 'Enhacored', 'enhacored', '', '<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><img src=\"images/stories/iglesias/rom-enhacore.jpg\" border=\"0\" width=\"300\" height=\"191\" style=\"border: 0pt none; vertical-align: top; margin: 10px;\" /><img src=\"images/stories/pastores/rom-enhacore-pastor.jpg\" border=\"0\" width=\"221\" height=\"191\" style=\"margin: 10px;\" /></em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Villa Progreso, Los Mulos.</em></span><span style=\"color: #000000;\"> </span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: La Romana</em></span><span style=\"color: #000000;\"> </span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Florentina Leonardo.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 829-774-6130</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\">????</p>\r\n', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\">La Iglesia Enhacore esta ubicada en la calle los cristianos No.29 del Municipio Villa Hermosa en Villa Para????so, La Romana, R.D. fue fundada el 24 de Julio del 1995, comenzando as???? bajo un ????rbol, cre???? a Dios y me ha dado la victoria, golpe a golpe hemos machacado venciendo obst????culos, subiendo y bajando llegaremos hasta la cima.</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\" lang=\"es-DO\">Esta iglesia es pastoreada por la Licenciada Florentina Leonardo de Mateo quien comenz???? esta obra debajo de un ????rbol y terminar???? cuando Dios lo decida.</p>', 1, 14, 0, 30, '2011-05-07 04:15:40', 63, '', '2011-05-09 13:52:00', 63, 0, '0000-00-00 00:00:00', '2011-05-07 04:15:40', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 5, '', '', 0, 186, 'robots=\nauthor='),
(214, '2da Fuente de Agua Viva', '2da-fuente-de-agua-viva', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: justify;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Teniente Amado Garc????a, La Romana.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: justify;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: La Romana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: justify;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Luciana Cabrera.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: justify;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-813-2576</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: justify;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: justify;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><em> </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: justify;\" lang=\"es-ES\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><br /></em></span></span></span></p>', '', 1, 14, 0, 30, '2011-05-07 04:18:51', 63, '', '2011-07-12 12:25:55', 63, 0, '0000-00-00 00:00:00', '2011-05-07 04:18:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 4, '', '', 0, 139, 'robots=\nauthor='),
(215, '2da Buena Nueva de Salvaci????n', '2da-buena-nueva-de-salvacion', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>Dieccion: Calle Marines, #12, Brisa Del Mar. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: La Romana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Marina Laureano De P????rez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-550-1768</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\">BREVE HISTORIA</span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-DO\">La iglesia Buena nueva de salvaci????n de AIC, ubicada en la autopista de la Romana-San pedro KM.5 ????, Brisas del mar. Fue fundada el 5 de marzo del 2002, por el pastor Julio Mercedes y la Licda. Pastora Marina Laureano. Actualmente esta congregaci????n tiene 50 miembros y un templo propio.</span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><br /></em></span></span></span></p>', '', 1, 14, 0, 30, '2011-05-07 04:20:24', 63, '', '2011-07-12 12:27:25', 63, 0, '0000-00-00 00:00:00', '2011-05-07 04:20:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 166, 'robots=\nauthor='),
(216, 'Tabern????culo de Gracia', 'tabernaculo-de-gracia', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Calle Principal, Villa Progreso, La Romana.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: La Romana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Exh. Maximiliano Mota Garc????a. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-266-6591</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\">BREVE HISTORIA</span></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><br /></em></span></span></span></p>', '', 1, 14, 0, 30, '2011-05-07 04:23:49', 70, '', '2011-07-12 12:30:09', 63, 0, '0000-00-00 00:00:00', '2011-05-07 04:23:49', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 2, '', '', 0, 186, 'robots=\nauthor='),
(217, 'Valle de Bendici????n', 'valle-de-bendicion', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Villa Hermosa.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: La Romana</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Lpa. F????lix A. De Jes????s Polanco. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 809-902-3946</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\">????</p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><span style=\"text-decoration: underline;\"><br /></span></span></span></span></p>', '', 1, 14, 0, 30, '2011-05-07 04:25:42', 63, '', '2011-07-12 12:31:06', 63, 0, '0000-00-00 00:00:00', '2011-05-07 04:25:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 185, 'robots=\nauthor='),
(218, 'El Refugio', 'el-refugio', '', '<p><em>DIRECCION: Calle 6 #26, Padre Las Casas, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. Antonio Rodr????guez. </em></p>\r\n<p><em>TELEFONO: 809-970-0926</em></p>', '', 1, 14, 0, 36, '2011-05-07 12:05:25', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:05:25', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 52, '', '', 0, 90, 'robots=\nauthor='),
(219, 'El Refugio 111', 'el-refugio-111', '', '<p><em>DIRECCION: C/1 No. 27 Buenos Aires Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. Virginia Almonte De Castillo. </em></p>\r\n<p><em>TELEFONO: 809-291-8045</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La iglesia 3er Refugio ubicada en la calle primera no. 25 del barrio Buenos Aires, Puerto Plata Rep????blica Dominicana, fue fundada en el a????o 1991, siendo su fundador el Rv. Gilberto Antonio Gonz????lez. En el 1991-1992 estuvo pastoreada por Sara Ure????a. Desde parte del 1992 hasta la actualidad por la Rvda V????rgula Almonte de Castillo.</p>', '', 1, 14, 0, 36, '2011-05-07 12:07:33', 65, '', '2011-05-07 15:09:47', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:07:33', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 51, '', '', 0, 52, 'robots=\nauthor='),
(220, '1er. Tabern????culo', '1er-tabernaculo', '', '<p><em>DIRECCION: Calle Juan Loffi. #55 Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. Heriberto Beard. </em></p>\r\n<p><em>TELEFONO: 809-261-7172</em></p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p style=\"text-align: justify;\">Esta fue fundada en el 1965 luego de una campa????a impartida por el entonces evangelista, Miguel Pimentel (fallecido), en el Ensanche Luper????n. Siendo mas tarde istalados como pastores: el pastor Gregorio Artiles C. Y su esposa Angela Vasquez C.</p>\r\n<p style=\"text-align: justify;\">Desde entonces ha estado ubicada en los siguientes lugares: Ensanche Luper????n, Ave. 27 de Febrero, CI Juan Laffi No. 45, Ensanche Miramar y muchos a????os despu????s se inaugura el templo propio alrededor del 1983 en la misma calle Juan Laffi No. 55. donde permanece hasta hoy.</p>\r\n<p style=\"text-align: justify;\">La iglesia ha sido denominada desde el principio una iglesia Misionera y ha fundado a trav????s de los tiempos alrededor de 13 iglesias, las cuales han sido entregadas al concil jo, en la actualidad contamos con 2 campos blancos.</p>\r\n<p style=\"text-align: justify;\">Por estos 43 a????os la iglesia ha contado con los siguientes pastores:</p>\r\n<p style=\"text-align: justify;\">Rey. Gregorio Artiles C.</p>\r\n<p style=\"text-align: justify;\">Pastor Isaac Artiles</p>\r\n<p style=\"text-align: justify;\">Rey. Antonio Pichardo</p>\r\n<p style=\"text-align: justify;\">Rey. Gilberto A. Gonz????lez</p>\r\n<p style=\"text-align: justify;\">Rey. Heriberto Bierd, pastor en la actualidad.</p>\r\n<p style=\"text-align: justify;\">La Iglesia El Tabern????culo, es la 2da. Iglesia de Asambleas de Iglesias Cristiana, fundada en Puerto Plata.</p>\r\n<p style=\"text-align: justify;\"> </p>', '', 1, 14, 0, 36, '2011-05-07 12:08:21', 65, '', '2011-05-07 15:17:34', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:08:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 50, '', '', 0, 239, 'robots=\nauthor='),
(221, '1ra. Casa De Dios Y Puerta Del Cielo', '1ra-casa-de-dios-y-puerta-del-cielo', '', '<p><em>DIRECCION: C/6 #3 Urb. Las Olivas, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. Roberto Cobar. </em></p>\r\n<p><em>TELEFONO: 809-261-2340</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">.La iglesia 1ra casa de Dios y puerta del cielo, ubicada en la calle 8 #7 del sector los olivas, Pto. Pta., R.D. fundada en el a????o 1994 por la misionera Elvira Reinoso de Dom????nguez, la cual fue sustituida por la misionera Marina Reinoso de Reyes. En sus 14 a????os de existencia ha sido dirigida por 4 personas las cuales responden al nombre de: Misionera Elvira Reinoso de Dom????nguez, Pastora Marina Reinoso de Reyes, Pastor Franklin Contreras y en la actualidad el Pastor Roberto Nazario Cobar Cruz</p>', '', 1, 14, 0, 36, '2011-05-07 12:08:53', 65, '', '2011-05-07 14:51:53', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:08:53', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 49, '', '', 0, 185, 'robots=\nauthor='),
(222, '7mo Refugio', '7mo-refugio', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: C/Eugenio Kunhardt #92, Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Cristian Rivas And????jar. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-571-3296</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><em> </em></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">La Iglesia 7mo Refugio tiene su inicio el d????a 5 de Abril del 1995, por el Rev. Cristian Rivas Andujar, quien durante 13 a????os ha estado pastoreando la misma.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:07:56', 70, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:07:56', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 20, '', '', 0, 76, 'robots=\nauthor='),
(223, '4ta. Bethel', '4ta-bethel', '', '<p><em>DIRECCION: C/8 #30, Playa Oeste, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. V????ctor Manuel Oviedo. </em></p>\r\n<p><em>TELEFONO: 809-357-0387</em></p>', '', 1, 14, 0, 36, '2011-05-07 12:09:51', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:09:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 48, '', '', 0, 84, 'robots=\nauthor='),
(224, '7mo. Tabern????culo', '7mo-tabernaculo', '', '<p><em>DIRECCION: San Pi????e, Pt Opta. </em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. Marino Parra Gonzales. </em></p>\r\n<p><em>TELEFONO: 809-370-3669</em></p>', '', 1, 14, 0, 36, '2011-05-07 12:10:36', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:10:36', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 47, '', '', 0, 101, 'robots=\nauthor='),
(225, '6to. Refugio', '6to-refugio', '', '<p><em>DIRECCION: Los Tejadas, Maim????n, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. Confesor Eusebio Santana.</em></p>\r\n<p><em>TELEFONO: 809-586-1588</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">Siendo yo miembros de la Iglesia Primer Refugio que en el entonces pastoreaba Gilberto A. Gonz????lez, con la inquietud de trabajar en la obra, quise ir a es lugar esto fue en el a????o 1995, yo daba cultos en los caminos con un radio y un peque????o micr????fono.</p>\r\n<p style=\"text-align: justify;\">A los 6 meses un inconverso me regalo un solar y as???? seguir trabajando en ese lugar como campo blanco, en el a????o 1997 pas???? a ser iglesia oficial hasta la actualidad 2008.</p>\r\n<p style=\"text-align: justify;\"> </p>', '', 1, 14, 0, 36, '2011-05-07 12:11:07', 65, '', '2011-05-07 15:27:42', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:11:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 46, '', '', 0, 82, 'robots=\nauthor='),
(226, 'El Primer Refugio', 'el-primer-refugio', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Principal Villa Maranata, Sosua.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Reyes Hern????ndez Pe????a. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-325-2906</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><em> </em></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">El 15 de Julio del a????o 1978 fui instalado como pastor por el Rev. Gregorio Artiles Castillo, que en ese tiempo era el presb????tero de la zona de Puerto Plata.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Comenzamos a trabajar con la fe en nuestro Dios. En ese tiempo no hab????a nada, pero mi Dios comenz???? a bendecir y hemos levantado 17 iglesias, por lo que Dios se ha glorificado y toda la gloria se la damos a:</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"> </p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Reverendo Reyes Hern????ndez Pe????a</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Reyes Ivan Hern????ndez Inoa, Co-Pastor</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Lic. Eladia Altagracia de Hern????ndez</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:09:52', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:09:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 19, '', '', 0, 121, 'robots=\nauthor='),
(227, '5to. Tabern????culo', '5to-tabernaculo', '', '<p><em>DIRECCION: Los Sufridos 2 #55, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. Genaro Dom????nguez. </em></p>\r\n<p><em>TELEFONO: 809-261-1568</em></p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\"><br /></span></p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p> </p>\r\n<p style=\"text-align: justify;\">La Iglesia 5to. Tabern????culo Nace en el a????o 1989, en el Sector Los Sufridos en la ciudad San Felipe de Puerto Plata, Con la llegada de unos l????deres enviados por el pastor Rev. Gregorio Artilez Castillo, los cuales responden a los nombre de: Elvira de Dom????nguez, Genaro Dom????nguez, Lu????s Mel????ndez y Maria de Garc????a; pasado un tiempo, los hermanos Lu????s Mel????ndez y Maria de Garc????a regresaron a su iglesia madre; quedando al frente de la obra la pareja de Esposos Genaro Dom????nguez y Elvira de Dom????nguez, quienes procrearon su familia, formando parte de la obra desde sus primeros pasos. La Iglesia 5to. Tabern????culo, habiendo crecido espiritual y en membres????a, en el 1994, decide levantar su primer campo Blanco, ubicado en el sector Los Oliva, parte abajo, recibiendo apoyo de la iglesia madre y parientes de la familia pastoral. Luego de un tiempo dicho Campo blanco llamado Casa de Dios y Puerta del Cielo, fue recibido por el Concilio, como iglesia oficial Dejando al frente de la misma la Exhortadora Maria de Reyes. La iglesia 5to tabern????culo desde el principio hasta la fecha se ha mantenido con un ????nico pastor, el Rev. Genaro Dom????nguez y su esposa la Licda. Elvira de Dom????nguez.</p>', '', 1, 14, 0, 36, '2011-05-07 12:11:44', 65, '', '2011-05-07 14:36:23', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:11:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 45, '', '', 0, 119, 'robots=\nauthor='),
(228, ' Bethel 1ra.', '-bethel-1ra', '', '<p><em>DIRECCION: C/2 #7, La Viara, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. Porfirio Guti????rrez. </em></p>\r\n<p><em>TELEFONO: 809-586-9724</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 36, '2011-05-07 12:12:17', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:12:17', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 44, '', '', 0, 86, 'robots=\nauthor='),
(229, '3er. Tabern????culo', '3er-tabernaculo', '', '<p><em>DIRECCION: Calle Jos???? E Kunhardt #35 Sector Mirador Sur.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Cruz Antonio Garc????a. </em></p>\r\n<p><em>TELEFONO: 809-261-5956 / 809-223-8152</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La iglesia 3er Tabern????culo, ubicada en la calle Principal # 33 Mirador Sur, Puerto Plata, Rep????blica Dominicana, fue fundada en el a????o 1986, por el Rey. Gregorio Artiles Castillo, dejando al frente al exhortador Johny Salvador Artiles adjunto a un grupo de hermanos y hermanas, esta iglesia tiene unos veintid????s (22) a????os de ser fundada.</p>\r\n<p style=\"text-align: justify;\">Esta iglesia hasta la fecha ha tenido tres (3) pastores cuyos nombres son los siguientes, a la fecha son ministros ordenados.</p>\r\n<p style=\"text-align: justify;\">Rey. Johny Salvador Artiles, Rey. Roberto del Bois Anderson y Rey. Juli????n Ventura de los Santos, pastor actual.</p>', '', 1, 14, 0, 36, '2011-05-07 12:12:58', 65, '', '2011-05-07 15:26:04', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:12:58', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 43, '', '', 0, 188, 'robots=\nauthor='),
(230, 'Emanuel', 'emanuel', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: C/Viejo Peres #7, Montellano Sosua.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpa Juan Rosa Amador. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 829-747-6419</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><em> </em></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Fue fundada el 23 de noviembre del 1966, siendo su fundador el reverendo Porfirio Guti????rrez. Durante los a????os de existencia, ha sido pastoreada por los siguientes pastores: Rev. Porfirio Guti????rrez, Rev. Ram????n Ram????rez, Rev. Arcadio Reyes, Rev. Antonio Pichardo, Rev. Julio A. Padilla, Rev. Clarito Dom????nguez, Rev. Victorino.</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Y actualmente est???? pastoreada por el Lic. Pastor Juan Rosa Amador.</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"> </p>', '', 1, 14, 0, 37, '2011-05-07 12:12:01', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:12:01', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 18, '', '', 0, 82, 'robots=\nauthor='),
(231, 'Nueva Vida', 'nueva-vida', '', '<p><em>DIRECCION: C/6 #ens. Eduardo Brito, Pt Opta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa Petronila Pe????a De N????????ez. </em></p>\r\n<p><em>TELEFONO: 809-568-5505</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 36, '2011-05-07 12:13:43', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:13:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 42, '', '', 0, 99, 'robots=\nauthor='),
(232, '4to Refugio', '4to-refugio', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Madre Vieja, La Ponteada, La Uni????n</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Eddy Mart????nez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-874-3304</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">La iglesia fue fundada en el a????o 1964, por el pastor Don Victor Lantigua, quien la dirigi???? hasta el a????o 1982. Desde el a????o 1982 hasta el 1993 la iglesia estuvo cerrada. En ese a????o volvi???? a resurgir la iglesia con la pastora Margarita, quien estuvo desde 1993 hasta el 1996. En el 1996 Pablo Toribio pas???? a pastorear la iglesia la Monteada, hasta el 2 de Septiembre del 2006.</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Desde esa ????ltima fecha, 2 de Septiembre, el Eddy Mart????nez se encuentra dirigiendo las ovejas hasta la actualidad.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:14:14', 70, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:14:14', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 17, '', '', 0, 65, 'robots=\nauthor='),
(233, 'Puerta La Hermosa', 'puerta-la-hermosa', '', '<p><em>DIRECCION: Av. Pedro Clisante, Callej????n Villa Progreso#2</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Exh. Pastor Jos???? A. Thomas </em></p>\r\n<p><em>TELEFONO: 809 970 0974</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p>Nuestra iglesia fue fundada en el aio 2003 por la pastora Virginia Almonte de Castillo, pastora de la Iglesia 3er. Refugio.</p>\r\n<p>El d????a 6 de enero del 2004 nombra a Jos???? Augusto Thomas, un obrero de la Iglesia que ella pastorea, como pastor de la reci????n iglesia. es el pastor actualmente de dicha iglesia.</p>', '', 1, 14, 0, 36, '2011-05-07 12:16:09', 65, '', '2011-05-07 15:06:26', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:16:09', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 41, '', '', 0, 77, 'robots=\nauthor='),
(234, 'Juan 3.16', 'juan-316', '', '<p><em>DIRECCION: Calle Principal El Javillar, Costambar </em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lic. Pastor Francisco Del Valle </em></p>\r\n<p><em>TELEFONO: 809-320-0232 </em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 36, '2011-05-07 12:16:46', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:16:46', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 40, '', '', 0, 96, 'robots=\nauthor='),
(235, '2do Refugio', '2do-refugio', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Paso Valiente, Sosua Abajo.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Franklin Contreras. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 829-863-6879</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Fue fundada en el mes de agosto del a????o 1991. Durante este tiempo ha sido pastoreada por 5 pastores con el actual, siendo su primer pastor el hermano Pedro Tom????s S????nchez, quien fuera el fundador de la iglesia.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"> </p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Luego el pastor Jorge David Puello, seguido por el pastor Felix Domingo Tejada, Rev. Francisco Paulino G????mez y el actual pastor el Rev. Franklin Contreras.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:16:26', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:16:26', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 16, '', '', 0, 209, 'robots=\nauthor=');
INSERT INTO `aicrd_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(236, '6to Refugio', '6to-refugio', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Proyecto Habitaciones, La Uni????n</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Pablo Toribio. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-204-9697</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Esta iglesia fue fundada el 2 de Noviembre del a????o 1992 por el Rev. Jorge Bonilla Ulerio, el cual estuvo pasteando hasta el 2006, luego pas???? a ser pastoreada por el Lic Pastor Pablo Toribio, quien es actualmente su pastor durante 2 a????os.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:18:53', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:18:53', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 15, '', '', 0, 68, 'robots=\nauthor='),
(237, 'Bethel III ', 'bethel-iii-', '', '<p><em>DIRECCION: C/1ra Urb. Ginebra Arzeno Pto. Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. Luis Alberto Mercado </em></p>\r\n<p><em>TELEFONO: 829-341-0533</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p align=\"center\"> </p>\r\n<p style=\"text-align: justify;\">La Iglesia Bethel 3ra. Fue fundada el 18 de agosto del a????o 1990, en el sector Villa Progreso Pto. Pta. R. D. por el Rev. Porfirio Guti????rrez y Casilda Guzm????n de Guti????rrez, pastores de la Iglesia Bethel 1ra. Desde su fundaci????n hasta el a????o 2000 estuvo funcionando en un local rentado, pero a partil de ese a????o se traslad???? a su propio local, ubicado el la Urb. Ginebra Arzeno C/Principal #32 de la ciudad de Pto. Pta. R. D.</p>\r\n<p style=\"text-align: justify;\">Durante sus 18 a????os de existencia ha sido pastoreada por el Rev. Luis A. Mercado Fern????ndez, quien a lo largo de su ministerio pastoral ha logrado preparar tres (3) pastores m????s.</p>\r\n<p style=\"text-align: center;\"> </p>\r\n<p style=\"text-align: center;\"><em><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 12:18:28', 65, '', '2011-05-07 15:24:04', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:18:28', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 39, '', '', 0, 83, 'robots=\nauthor='),
(238, '2do Tabern????culo', '2do-tabernaculo', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Yasica Arriba, Sosua, Pto Pta.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpa. Jos???? Antonio Hern????ndez Rodr????guez </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-612-9595</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">El Segundo Tabern????culo de Asamblea de Iglesia Cristiana, ubicada en la Carretera Luper????n no. 69, del Distrito Municipal de Y????sica Arriba, Puerto Plata.</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Fue fundada el 19 de Juno del 1991 por el Rev. Gregorio Artiles. Durante sus 17 a????os de existencia ha sido dirigida por 6 pastores, cuyos nombres son los siguientes:</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Reverendo Julio Gomera Fria, Reverendo Roberto Anderson, Reverendo Wilson Almonte, Reverendo Olis Rayan, y en la actualidad est???? siendo pastoreada por Jos???? Antonio Hern????ndez, Exhortador.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:20:30', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:20:30', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 14, '', '', 0, 96, 'robots=\nauthor='),
(239, '5to. Refugio', '5to-refugio', '', '<p><em>DIRECCION: C/1ra #186, Padre Granaro</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. Luis Almonte Hiraldo </em></p>\r\n<p><em>TELEFONO: 809-261-5850</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p style=\"text-align: justify;\">La iglesia 5to refugio de AIC, ubicada en la calle principal del barrio padre granero en Pto. Pta, RD. Hija del 1er refugio, fue fundada en el a????o 1993 por inspiraci????n del pastor Gilberto Gonz????lez, quien a la saz????n pastoreaba la iglesia madre. En la actualidad el 5to refugio cuenta con una membres????a de 120 personas. De ella han nacido dos nuevas iglesias que llevan por nombre, Luz y vida de AIC y 2da 5to refugio Roca Eterna de AIC. Durante toda su existencia ha sido pastoreada ????nicamente por el Rev. Lu????s Almonte.</p>\r\n<p style=\"text-align: center;\"><em><br /></em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 36, '2011-05-07 12:22:38', 65, '', '2011-05-07 14:45:42', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:22:38', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 38, '', '', 0, 108, 'robots=\nauthor='),
(240, '3ra, Getseman???? Portadora De Luz ', '3ra-getsemani-portadora-de-luz-', '', '<p><em>DIRECCION: Cafember, Costambar. Pto. Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Wascar De La Cruz La Hoz. </em></p>\r\n<p><em>TELEFONO: 809-964-9805</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 36, '2011-05-07 12:24:00', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:24:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 37, '', '', 0, 156, 'robots=\nauthor='),
(241, '4to Tabern????culo', '4to-tabernaculo', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Arroyo De Leche, Distrito Municipal, Montellano</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. C????ndida Elogia Placido De Reyes. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-612-0626</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">El IV Tabern????culo est???? ubicado en Arroyo de Leche, secci????n del Municipio Villa Montellano, Provincia de Puerto Plata, R.D.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"> </p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Siendo sus fundadores Gregorio Artiles, el 15 de Marzo del 1987. Desde su existencia ha sido dirigida por 6 pastores, cuyos nombres son los siguientes: Rev. Clarito Dom????nguez, misionero Julian F r????as Gomera, Rev. Seraf????n Garc????a Camacho, Rev. Heriberto Beard, Pastor Manuel Emilio Brito, y la pastora actual Candida Eligia Pl????cido de Reyes.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"> </p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Fue recibida como oficial en el concilio en fecha 19 de Abril del 1990.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"> </p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"> </p>', '', 1, 14, 0, 37, '2011-05-07 12:23:03', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:23:03', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 13, '', '', 0, 97, 'robots=\nauthor='),
(242, 'Getseman???? 1ra.', 'getsemani-1ra', '', '<p><em>DIRECCION: Playa Oeste. Pto. Pta. </em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. Domingo Antonio Pichardo </em></p>\r\n<p><em>TELEFONO: 809-586-8643</em></p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p style=\"text-align: justify;\"><strong>La primera iglesia Getsemani Ubicada en la calle 5, No. 10, del sector los coquitos, Puerto Plata Republica Dominicana, Fundada en el mes de Noviembre del a????o 1962, siendo su fundador el Rev. ????ngel Dar????o Suero Prat.. Durante sus 45 a????os de existencia ha sido dirigida por 7 pastores, cuyos nombres son los siguientes: Rev. ????ngel Dar????o Suero Prat (fallecido), Rev. Lorenzo P????rez Romero (fallecido), LPA. Pedro A. Valera, Rev. Wenceslao de los Santos M., Antonio Ramos, Rev. Jos???? Encarnaci????n (fallecido), Exhortadora Alicia N????????ez Y el Rev. Domingo A. Pichardo Pastor en la actualidad. Es la primera iglesia de Asamblea de Iglesias Cristianas INC., establecida en Puerto Plata.</strong></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 36, '2011-05-07 12:25:08', 65, '', '2011-05-07 14:33:29', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:25:08', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 36, '', '', 0, 217, 'robots=\nauthor='),
(243, 'Arca de Salvaci????n', 'arca-de-salvacion', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Ca????o Dulce, Gaspar Hern????ndez.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rev. Juan Casta????o Rodr????guez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-840-4826</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">La iglesia fue levantada por la hermana iglesia 1er Refugio de Padres las Casas, Puerto Plata, pastoreada por el Rev. Gilberto Antonio Gonz????lez, en el a????o 1988.</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">En ese entonces, inici???? en la obra de ese mismo sector.</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\"><span style=\"text-decoration: underline;\"><strong>Lista de pastores hasta la fecha:</strong></span></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">1.- Wilson Mart????nez, Puerto Plata</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">2.- Efigenia N????????ez, Puerto Plata</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">3.- Alexandra Rodr????guez, Puerto Plata</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">4.- Wilson Almonte, Puerto Plata</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">5.- Isabel Dom????nguez, Puerto Plata</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">6.- V????ctor Abreu, Puerto Plata</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">7.- Florencio Garc????a, Puerto Plata</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">8.- Rev. Juan Casta????o, en la actualidad es el pastor oficial desde 1998.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:25:29', 70, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:25:29', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 12, '', '', 0, 152, 'robots=\nauthor='),
(244, '4to Refugio', '4to-refugio', '', '<p><em>DIRECCION: C/1ra. #27 Los Bordas Pto. Pta. 809-710-6540</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. F????lix Manuel Almonte. </em></p>\r\n<p><em>TELEFONO: 809-970-0479</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p>Nombre de la Iglesia: 4to Refugio</p>\r\n<p>Direccion Cura No 27 Barrio Los Bordas, Puerto Plata, R D</p>\r\n<p>Fecha de Fundada: 24 de Septiembre de 1992</p>\r\n<p>Fundador: Rey. Gilberto Antonio Gonz????lez</p>\r\n<p>Pastor Actual: Rey. Felix Manuel Almonte</p>\r\n<p>Co-Pastora: Evelyn S????nchez</p>\r\n<p>Total de Miembros: 283</p>\r\n<p>Total de Obreros Oficiales: 4</p>\r\n<p>Total de Obreros Locales: 2</p>\r\n<p>Obreros del concilio que trabajaron al inicio de la obra: Carmen</p>\r\n<p>Almonte, Mike Figueroa, Angela.</p>\r\n<p>Donde Inicia la Obra: En la marquesina de la casa del hermano Monchy</p>\r\n<p>Templo Propio: Con un tama????o de 15 Metros por 18 y acomoda un total</p>\r\n<p>de 300 miembros.</p>\r\n<p>Cantidad de Iglesias Fundadas por esta congregacion: 3 y un campo</p>\r\n<p>Blanco.</p>\r\n<p>Orden de Cultos:</p>\r\n<p>Lunes: Escuela Biblica</p>\r\n<p>Martes: Culto de Jovenes.</p>\r\n<p>Miercoles: Culto fuera.</p>\r\n<p>Jueves: Culto de Caballeros.</p>\r\n<p>Viernes: Culto de Damas.</p>\r\n<p>Sabado: Culto Fuera.</p>', '', 1, 14, 0, 36, '2011-05-07 12:25:44', 65, '', '2011-05-07 15:08:00', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:25:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 35, '', '', 0, 149, 'robots=\nauthor='),
(245, 'Casa de Dios y Puerta del Cielo', 'casa-de-dios-y-puerta-del-cielo', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Batey Severet, Distrito Municipal Montellano</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Pedro Lorenzo Sosa. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-873-7650</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Fue fundada el 26 de Octubre del a????o 1997 por el pastor Agustin Vargas, el cual se mantuvo pastoreando hasta el a????o 2003, y a partir de esa fecha el co-pastor Pedro Florencio de Sena pas???? a ocupar su lugar hasta la fecha, siendo el pastor oficial de dicha iglesia.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:28:35', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:28:35', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 11, '', '', 0, 136, 'robots=\nauthor='),
(246, 'Monte Horeb', 'monte-horeb', '', '<p><em>DIRECCION: Los Ca????os, Maim????n, Pto, Pta. 809-841-5836 </em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa Cristino Hurtado </em></p>\r\n<p><em>TELEFONO: 809-244-4197</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p style=\"text-align: justify;\">La iglesia Roca Eterna 2da. 5to. Refugio ubicada en la calle Principal No. 256 del sector Padre Granero, de la ciudad de Puerto Plata, Rep. Dom., fue fundada el d????a 4 de agosto del a????o 2004. Su fundador lo fue el hermano Mateo Polanco Francisco de la iglesia 5to. Refugio, pastoreada por el Rev. Lu????s Amonte. El hermano Mateo Polanco Francisco, junto a diez (10) hermanos mas, se organizaron para levantar un campo blanco en la parte baja del sector.</p>\r\n<p style=\"text-align: justify;\">Durante estos cuatro (4) a????os la iglesia ha mantenido un crecimiento sostenido; ha sido pastoreada por dos (2) pastores, cuyos nombres son los siguientes: Hno. Mateo Polanco Francisco y la Lic. Francisca Jim????nez, la cual es la pastora en la actualidad. Estamos trabajando arduamente y orando al Se????or por la terminaci????n de nuestro templo propio.</p>\r\n<p style=\"text-align: justify;\">durante 2 a????os, pero para esa ????poca el trasporte era muy dif????cil, y el trayecto distante, por lo que en el a????o 1985 decide dejar a la hermana Mar????a E. Tejada como su sustituta, quien era la persona que reun????a las condiciones para seguir en la direcci????n de la iglesia. Durante el ministerio de la pastora Emelinda tejada naci???? una nueva iglesia la cual fue nombrada segunda monte horeb de A. I. C. Pastoreada por la pastora Sara Luz Tejada. En el a????o 2006 la pastora Emelinda Tejada decide entregar la iglesia por motivo de enfermedad, ocupando su lugar el exhortador Cristino Hurtado Ventura junto a su amada esposa Bone Almonte de Hurtado quienes se mantienen dirigiendo la iglesia hasta la fecha.</p>', '', 1, 14, 0, 36, '2011-05-07 12:29:10', 65, '', '2011-05-07 14:43:32', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:29:10', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 34, '', '', 0, 183, 'robots=\nauthor='),
(247, '5to Refugio', '5to-refugio', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Batey La Uni????n, Frente A La Base A????rea, Sosua.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpa. Agust????n Vargas.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-250-1153</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">La Iglesia 5to Refugio nace en el a????o 1996, siendo su primer pastor el Reverendo Cristian Rivas, luego le sigui???? el exhortador Ricardo Mart????nez; sigui???? el exhortador Domingo L????pez Ramos, continu???? la Lic. Pastora Margarita Vargas y actualmente est???? pastoreada por el Lic. Pastor Agust????n Vargas.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:30:27', 70, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:30:27', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 10, '', '', 0, 58, 'robots=\nauthor='),
(248, ' Bethel II', '-bethel-ii', '', '<p><em>DIRECCION: Principal #21, Los Dom????nguez 809-261-5228. </em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. Franklin Royer. </em></p>\r\n<p><em>TELEFONO: 809-261-5228</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 12:32:10', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:32:10', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 33, '', '', 0, 130, 'robots=\nauthor='),
(249, '9no Refugio', '9no-refugio', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Calle Italia, Villa Vetania, Sosua. P.P</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Elsa Zapata. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-571-3732</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Fue fundada el 4 de Junio del 2000, por el exhortador David Batista (fallecido), el cual pastore???? durante 5 a????os. En su lugar, su esposa Eliza Zapata vda. Batista, es la pastora actual por m????s de 3 a????os.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:34:07', 70, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:34:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 140, 'robots=\nauthor='),
(250, 'La Gran Comisi????n', 'la-gran-comision', '', '<p><em>DIRECCION: C/5#5, Cristo Rey, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Ehx. Pastor Nicol????s Lantigua </em></p>\r\n<p><em>TELEFONO: 809-842-4422</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 12:34:52', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:34:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 32, '', '', 0, 95, 'robots=\nauthor='),
(251, '2da Enmanuel', '2da-enmanuel', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Los Gomez, Montellamo, Sosua.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Rva. Pedro Mart????nez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-416-2130</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Fue fundada en el a????o 1996, por el Rev. Julio A. Medina Padilla y el actual pastor Pedro Mart????nez.</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Despu????s de 3 a????os de inactividad, reiniciamos los cultos en nuestra iglesia en el a????o 2000, donde cont????bamos con 4 miembros, siendo oficializada en el a????o 2002, y para este tiempo ya cont????bamos con 12 miembros bautizados.</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">En la actualidad, gracias a las bendiciones de nuestro Dios, contamos con 50 miembros</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:35:28', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:35:28', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 8, '', '', 0, 138, 'robots=\nauthor='),
(252, 'Monte Horeb Ll', 'monte-horeb-ll', '', '<p><em>DIRECCION: Maim????n Centro, Pto.Pta</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. Sarah Luz Tejada De Santos </em></p>\r\n<p><em>TELEFONO: 809-228-9606</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La iglesia 2da Monte Horeb de A.I.C., ubicada en el distrito municipal de Maim????n Pto. Pta., R.D., pr????ximo a la cl????nica candida Minaya, fundada en el mes de noviembre del a????o 1997. Siendo sus fundadores la Licda. Pastora Sara Luz Tejada de Santos y Eduardo Santos Silverio. Pastores en la actualidad, dicha iglesia surgi???? con la ayuda y representaci????n de su iglesia madre 1ra Monte Horeb, de los Canos de Maim????n, pto.Pta.</p>\r\n<p style=\"text-align: justify;\"> </p>', '', 1, 14, 0, 36, '2011-05-07 12:36:20', 65, '', '2011-05-07 14:54:32', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:36:20', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 31, '', '', 0, 117, 'robots=\nauthor='),
(253, 'Pr????ncipe de Paz', 'principe-de-paz', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Villa Emmanuel, Sosua.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Jos???? Polanco. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 829-849-5940</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">La Iglesia Pr????ncipe de Paz fue fundada el 9 de Septiembre del 2001 por el Lic. Pastor Jos???? Domingo Polanco Mart????nez, quien es su pastor actual por 7 a????os.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:37:11', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:37:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 209, 'robots=\nauthor='),
(254, 'Arca De Dios ', 'arca-de-dios-', '', '<p><em>DIRECCION: Calle Principal Urb. La Limonera, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Exh. Pastor Miguel ????ngel Murray. </em></p>\r\n<p><em>TELEFONO: 809-970-1674</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La Iglesia Arca de Dios naci???? de la visi????n del Rey. F????lix Manuel Almonte, cuando dios puso en su coraz????n levantar una obra en la Urbanizaci????n La Limonera.</p>\r\n<p style=\"text-align: justify;\">El d????a 14 de noviembre del 2002 fue fundada como Campo Blanco lo que hoy es Iglesia Oficial del Concilio Asamblea de Iglesias Cristianas, Inc. El d????a 25 de junio fue hecha Iglesia Oficial.</p>\r\n<p style=\"text-align: justify;\">Lic. Pastor Miguel ????ngel Murray al junto de su esposa Sandra Morales de Murray y otros hermanos fueron puesto a dirigir esa obra</p>\r\n<p style=\"text-align: justify;\">Actualmente el Lic. Pastor Miguel ????ngel Murray al junto de su familia es el pastor de dicha obra.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p align=\"center\"> </p>\r\n<p align=\"center\"> </p>\r\n<p align=\"center\"> </p>', '', 1, 14, 0, 36, '2011-05-07 12:38:16', 65, '', '2011-05-07 15:03:02', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:38:16', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 30, '', '', 0, 102, 'robots=\nauthor='),
(255, '3era Jehov???? Jireh', '3era-jehova-jireh', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Cuesta Barrosa, Sabaneta Y????sica, Sosua.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Lpa Julio Mena Mart????nez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-292-0558</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">La Iglesia 3ra Jehov???? Jireh fue fundada en el a????o 1999, por el exhortador Julio Mena y Aquilina Ramos de Mena. Los esposos Mena Ramos fueron enviados a Cuesta Barrosa, Sabaneta de Y????sica, por el Presb????tero del Circuito de Sos????a, Rev. Reyes Hern????ndez Pe????a, el cual tambi????n era su pastor. En el a????o 2005 fue oficializada dicha iglesia, y en la actualidad sigue siendo pastoreada por su fundador Julio Mena.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:39:05', 70, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:39:05', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 129, 'robots=\nauthor='),
(256, 'Huerto De Dios', 'huerto-de-dios', '', '<p><em>DIRECCION: Escalereta, Imbert, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Exh. . Domingo Elizabeth Mart????nez. </em></p>\r\n<p><em>TELEFONO: 809-257-5185</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 12:39:14', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:39:14', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 29, '', '', 0, 70, 'robots=\nauthor='),
(257, 'Luz En El Camino', 'luz-en-el-camino', '', '<p><em>DIRECCION: El Estrecho, Luper????n, Pto.Pta</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. Bernardo Arcala </em></p>\r\n<p><em>TELEFONO: 809-261-2218</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center; padding-left: 30px;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p align=\"center\"> </p>\r\n<p align=\"center\"> </p>\r\n<p>La iglesia Luz en el Camino de Asamblea de Iglesias Cristianas INC. fue fundada e12 de febrero del 1991 por la exhortadora Teodora Villaman de Mart????nez.</p>\r\n<p>Pastores que han dirigido la iglesia.</p>\r\n<p>1-Exhortadora Pastora Teodora Villaman de Mart????nez.</p>\r\n<p>2-Exhortadora Pastora Rhina Santana Cruz.</p>\r\n<p>3-Licenciado Pastor Roberto N. Cobar Cruz.</p>\r\n<p>4-Exhortedor Pastor Luis Jos???? Polanco Mart????nez (Fallecido).</p>\r\n<p>Actualmente est???? siendo dirigido por la junta de ancianos, precedida por los hermanos Jos????</p>\r\n<p>Pe????a y Dania Aristy de pe????a.</p>', '', 1, 14, 0, 36, '2011-05-07 12:40:41', 65, '', '2011-05-07 15:20:12', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:40:41', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 28, '', '', 0, 167, 'robots=\nauthor='),
(258, 'Filadelfia', 'filadelfia', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: C/11 No. 10, El Higuerito, Montellano.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Roosevelt Charles. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-964-5269</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\">Fue fundada por Roosevelt Charles, el domingo 8 Octubre del a????o 2000, en el barrio Las Flores, donde estuvo la iglesia durante 8 meses. Luego fue traslada al sector el Tamarindo, donde dur???? 5 a????os y 4 meses. La iglesia luego fue traslada al barrio Higuerito, donde actualmente lleva 2 a????os.</span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:41:03', 70, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:41:03', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 137, 'robots=\nauthor=');
INSERT INTO `aicrd_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(259, 'Luz en el Desierto', 'luz-en-el-desierto', '', '<p><em>DIRECCION: Cambiazo, Luperon, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rev. Pastor Jos???? G????mez. </em></p>\r\n<p><em>TELEFONO: 809-720-6070</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La Iglesia<strong> Luz</strong><strong> en el Desierto de AIC. </strong>Fue iniciada por el misionero Juli????n Ulloa en el a????o 1985, luego paso a ser dirigida por el Hermano Bautista Santana, mas bien conocido como el hermano Lin, en el a????o 1989 hasta el a????o 1992, cuando paso a formar parte de Asamblea de Iglesias Cristianas Inc. Siendo el Rev. Gilberto A. Gonz????lez, el presb????tero de turno del circuito de Puerto Plata. Dicha Iglesia paso como campo blanco del circuito con 6 miembros, 3 bautizados y 3 pasivos, luego el d????a 4 de junio del 1992 fue instalado como pastor de dicho campo blanco, el Exhortador Jos???? G????mez, quien comenz???? a trabajar para el avance de la iglesia; en el a????o 1994 d????a 15 de julio fue recibida por el concilio como iglesia oficial. En la actualidad cuenta con unos 50 miembros aproximadamente, y un campo blanco con su local en construcci????n en la comunidad del Fundo, Luperon, Pto. Pta., Rep. Dom.</p>', '', 1, 14, 0, 36, '2011-05-07 12:42:24', 65, '', '2011-05-07 14:35:29', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:42:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 27, '', '', 0, 70, 'robots=\nauthor='),
(260, 'Nueva Jerusal????n', 'nueva-jerusalen', '', '<p><em>DIRECCION: Proyecto Aguilar- Vuelta Larga-Imbert</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Exh. Juana De Mercado. <br /></em></p>\r\n<p><em>TELEFONO: 809-341-7545</em></p>\r\n<p><em> </em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 12:44:56', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:44:56', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 26, '', '', 0, 115, 'robots=\nauthor='),
(261, 'Luz en las Tinieblas, Tabern????culo XII', 'luz-en-las-tinieblas-tabernaculo-xii', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Caraballo, Montellano, Pto Pta.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Exh. Andr????s L????pez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-621-3642</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><br /></em></span></span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:42:55', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:42:55', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 117, 'robots=\nauthor='),
(262, ' La Nueva Luz', '-la-nueva-luz', '', '<p><em>DIRECCION: Calle Crist????bal Colon #290, La Llanada, La Isabela Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. Ana Joaquina Almengot </em></p>\r\n<p><em>TELEFONO: 829-370-3825</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La iglesia La Nueva Luz de Asamblea de iglesias cristianas fue fundada en el a????o</p>\r\n<p style=\"text-align: justify;\">1968.</p>\r\n<p style=\"text-align: justify;\">En el a????o 1967 los hermanos I)ar????o Suero fenecido), Rey. Gregorio Astiles, Rey. Porfirio Guti????rrez adjunto de un grupo de hermanos que se dirig????an hacia la comunidad de ca????o Miguel y se detuvieron al lado de la estaci????n. de gasolina isla en la comunidad de la .Llanada donde hay dos grandes matas de mango pr????ximo a la iglesia actual, y dieron un culto rel????mpago, en ese culto el se????or Dado Suero sugiri???? a idea y dijo: Aqu???? vamos a formar una iglesia.</p>\r\n<p style=\"text-align: justify;\">Despu????s de varios a????os, Fabi????n Loray su esposa se fueron; y qued???? al frente del campo el se????or Alcib????ades W????????iilians de la comunidad de ca????o Miguel. Despu????s de varios tiempos el se????or Alcib????ades W????l.lians se retir???? del campo, quedando sin pastor, y por esta raz????n tuvieron que entregar la casa que estaba alquilada, pero continuaron dando los cultos en. un rancho de una hermana llamada Mercedes Mat????as (actualmente una i????dei) juntamente con los (as) hennanos (as) que compon????an dicha congregaci????n, donde estuvieron orando para que Dios enviaran a un pastor.</p>\r\n<p style=\"text-align: justify;\"> </p>', '', 1, 14, 0, 36, '2011-05-07 12:47:46', 65, '', '2011-05-07 15:31:54', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:47:46', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 25, '', '', 0, 105, 'robots=\nauthor='),
(263, '4ta. Nueva Luz', '4ta-nueva-luz', '', '<p><em>DIRECCION: La Jaiba, La Isabela, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. Geogino Santos </em></p>\r\n<p><em>TELEFONO: 809-589-5873</em></p>', '', 1, 14, 0, 36, '2011-05-07 12:49:07', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:49:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 24, '', '', 0, 117, 'robots=\nauthor='),
(264, '8vo Refugio', '8vo-refugio', '', '<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>DIRECCION: Carretera Madre Vieja, Bella Vista #534.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>PASTOR: Willy Beneret. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em>TELEFONO: 809-571-3732</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"> </p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\">BREVE HISTORIA</span></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><br /></em></span></span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:47:17', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:47:17', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 65, 'robots=\nauthor='),
(265, 'Bethel', 'bethel', '', '<p><em>DIRECCION: La China, Altamira, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Exh. Pastor Thomas Cabrera. </em></p>\r\n<p><em>TELEFONO: 829-975-6060</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La iglesia evangelica Bethel de asamblea de iglesias cristianas, esta ubicada en el sector de la china del municiopio de Altamira en la provincia de Pto. Pta. Sus inicios fueron en el ano 1968. Ha estado en diferentes lugares hasta que se adquirio el local donde se encuentra en la actualidad. Ha estado dirigida por nueve pastores en todo ese tiempo; ellos son: Santiago ventura, Luis Rodr????guez, Amado Marte, Francisco del Valle, Anastasio Bravo, Paulino Gomez, Felix Domingo tejada y Tomas Cabrera quien sempena esa labor desde 1998 hasta hoy.</p>', '', 1, 14, 0, 36, '2011-05-07 12:50:22', 65, '', '2011-05-07 14:59:24', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:50:22', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 23, '', '', 0, 162, 'robots=\nauthor='),
(266, '3er Tabern????culo', '3er-tabernaculo', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Yaroa, Abajo Yasica.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Esmeralda Rodr????guez. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 829-279-5390</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\">BREVE HISTORIA</span></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><br /></em></span></span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:51:52', 63, '', '2011-07-12 12:38:39', 63, 0, '0000-00-00 00:00:00', '2011-05-07 12:51:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 2, '', '', 0, 154, 'robots=\nauthor='),
(267, 'Tabern????culo IX', 'tabernaculo-ix', '', '<p><em>DIRECCION: Bajabonico Arriban Imbert, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. Juan Silverio Peres. </em></p>\r\n<p><em>TELEFONO: 829-553-5024</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La Iglesia 9no Tabern????culo de (A.I.C) ubicada en la c/principa] de Bajabonico Arriba, fue fundada en el mes de Enero del 1993, por el Pastor Gregorio Artiles, y a la vez pastoreada por el Pastor. Juan Silverio P????rez, quien permanece por 15 a????oE de labor pastoral y quien ocupa la posicion de Pastor Exortador.</p>', '', 1, 14, 0, 36, '2011-05-07 12:52:10', 65, '', '2011-05-07 15:14:01', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:52:10', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 22, '', '', 0, 60, 'robots=\nauthor='),
(268, 'Pe????a De Horeb', 'pena-de-horeb', '', '<p><em>DIRECCION: El Cruce De Pescado Bobo, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Ehx. Herminio Parra. </em></p>\r\n<p><em>TELEFONO: 829-277-8363</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La iglesia pe????a de Horeb de A.I.C., Ubicada en pescado Bobo Altamira, Pto. Pta., R.D. Fundada en el mes de junio del a????o 1968, siendo su fundador el Rev. ????ngel Dar????o Suero Prat. Durante sus 36 a????os de existencia ha sido dirigida por 11 pastor cuyo nombres son los siguientes, Julia Padilla, Juan Marte, Exhortador Ferm????n Mejia, Ram????n Parra, Sim????n Bol????var, Exhortador Eduardo Castellano, Exhortador Santiago Dom????nguez, Santos N????????ez y actualmente la exhra Petronila Santana..</p>\r\n<p> </p>', '', 1, 14, 0, 36, '2011-05-07 12:54:03', 65, '', '2011-05-07 14:53:36', 65, 0, '0000-00-00 00:00:00', '2011-05-07 12:54:03', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 21, '', '', 0, 118, 'robots=\nauthor='),
(269, '5ta Jehov???? Jireh', '5ta-jehova-jireh', '', '\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>DIRECCION: Islabon.</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>CIRCUITO: Sosua</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>PASTOR: Edilio D????as. </em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000;\"><em>TELEFONO: 829-810-9999</em></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2; text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\"><span style=\"color: #000000;\">BREVE HISTORIA</span></span></span></span></p>\r\n<p style=\"margin-bottom: 0in; widows: 2; orphans: 2;\" lang=\"es-ES\" align=\"JUSTIFY\"><span style=\"color: #000000;\"><span style=\"font-family: Times New Roman,serif;\"><span style=\"font-size: x-small;\"><em><br /></em></span></span></span></p>', '', 1, 14, 0, 37, '2011-05-07 12:54:32', 63, '', '2011-07-12 12:33:37', 63, 0, '0000-00-00 00:00:00', '2011-05-07 12:54:32', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 187, 'robots=\nauthor='),
(270, 'Eben-Ezer', 'eben-ezer', '', '<p><em>DIRECCION: Pie-Jagua, Altamira, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. Miguel Mart????nez</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 12:55:26', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:55:26', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 20, '', '', 0, 54, 'robots=\nauthor='),
(271, '3ra Nueva Luz', '3ra-nueva-luz', '', '<p><em>DIRECCION: Solim????n, Secci????n, La Jaiba, La Isabela, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Ehx. Pastor Sencion Paulino.</em></p>\r\n<p><em>TELEFONO: 809-337-3445</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\"><br /></span></em></p>', '', 1, 14, 0, 36, '2011-05-07 12:56:46', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:56:46', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 19, '', '', 0, 88, 'robots=\nauthor='),
(272, 'Asamblea De Iglesias Cristianas', 'asamblea-de-iglesias-cristianas', '', '<p><em>DIRECCION: Palmar Grande Altamira.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. Gaspar Minaya Ventura. </em></p>\r\n<p><em>TELEFONO: 809-749-8413</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 12:58:24', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:58:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 18, '', '', 0, 227, 'robots=\nauthor='),
(273, 'Arca De Salvaci????n', 'arca-de-salvacion', '', '<p><em>DIRECCION: El Ranchito De Los Vargas, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rosalba Genao. </em></p>\r\n<p><em>TELEFONO: 829-798-4775</em></p>\r\n<p><em> </em></p>', '', 1, 14, 0, 36, '2011-05-07 12:59:53', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 12:59:53', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 17, '', '', 0, 98, 'robots=\nauthor='),
(274, 'Arca De Salvaci????n', 'arca-de-salvacion', '', '<p><em>DIRECCION: El Ranchito De Los Vargas, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rosalba Genao. </em></p>\r\n<p><em>TELEFONO: 829-798-4775</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:00:23', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 13:00:23', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 16, '', '', 0, 92, 'robots=\nauthor='),
(275, 'Bethel', 'bethel', '', '<p><em>DIRECCION: La Sabana Luperon, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. Alberto Parra Gonz????lez. </em></p>\r\n<p><em>TELEFONO: 829-984-1660</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La iglesia Bet-el de AIC, ubicada en la sabana de luper????n, Pto. Pta. R.D., fue fundada en el a????o 1979 por la pastora Ana Joaquina Almengot (Minerva). Para el a????o 1982 fue nombrado como pastor de la joven iglesia, el se????or Marino Parra Gonz????lez, a quien sustituyo el Lic. Pastor Cesar Gonz????lez quien fue sustituido por el Se????or Alberto Parra Gonz????lez, el cual se mantiene como pastor en la actualidad junto a su esposa Heridania V????squez de Parras. A la fecha de hoy dicha iglesia cuenta con un numero de 70 miembros y dos campos de predicaci????n, el primero ubicado en el paraje del canal de luyeron, el segundo en las maras, luyeron, puerto plata R.D.</p>', '', 1, 14, 0, 36, '2011-05-07 13:01:57', 65, '', '2011-05-07 14:47:23', 65, 0, '0000-00-00 00:00:00', '2011-05-07 13:01:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 15, '', '', 0, 81, 'robots=\nauthor='),
(276, 'Asamblea De Iglesias Cristianas', 'asamblea-de-iglesias-cristianas', '', '<p><em>DIRECCION: La Descubierta, Altamira, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Ehx. P. Dalsy Mart????nez </em></p>\r\n<p><em>TELEFONO: 829-984-4607</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:03:31', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 13:03:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 14, '', '', 0, 73, 'robots=\nauthor='),
(277, 'La Hermosa', 'la-hermosa', '', '<p><em>DIRECCION: El Guazarar, Altamira, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Ehx. Mercedes Mart????nez. </em></p>\r\n<p><em>TELEFONO: 809-268-7545</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:05:30', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 13:05:30', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 13, '', '', 0, 116, 'robots=\nauthor='),
(278, 'Tabern????culo X', 'tabernaculo-x', '', '<p><em>DIRECCION: Obispo-Barrabas-Imbert, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Santo Te????filo Mu????oz. </em></p>\r\n<p><em>TELEFONO: 829-981-4560</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:06:43', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 13:06:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 12, '', '', 0, 95, 'robots=\nauthor='),
(279, 'Roca De Salvaci????n', 'roca-de-salvacion', '', '<p><em>DIRECCION: La Colorada, Imbert, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Estela Mart????nez. </em></p>\r\n<p><em>TELEFONO: 809-970-1084</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La iglesia Bet-el de AIC, ubicada en la sabana de luper????n, Pto. Pta. R.D., fue fundada en el a????o 1979 por la pastora Ana Joaquina Almengot (Minerva). Para el a????o 1982 fue nombrado como pastor de la joven iglesia, el se????or Marino Parra Gonz????lez, a quien sustituyo el Lic. Pastor Cesar Gonz????lez quien fue sustituido por el Se????or Alberto Parra Gonz????lez, el cual se mantiene como pastor en la actualidad junto a su esposa Heridania V????squez de Parras. A la fecha de hoy dicha iglesia cuenta con un numero de 70 miembros y dos campos de predicaci????n, el primero ubicado en el paraje del canal de luyeron, el segundo en las maras, luyeron, puerto plata R.D.</p>', '', 1, 14, 0, 36, '2011-05-07 13:07:41', 65, '', '2011-05-07 14:48:20', 65, 65, '2011-05-07 15:01:48', '2011-05-07 13:07:41', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 11, '', '', 0, 102, 'robots=\nauthor='),
(280, 'Roca Eterna 2da. 5to.Refugio', 'roca-eterna-2da-5torefugio', '', '<p><em>DIRECCION: Calle Principal Padre Granero, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Lpa. Francisca Peralta Jim????nez.</em></p>\r\n<p><em>TELEFONO: 809-261-0886 / 809-764-4826 </em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><strong><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></strong></p>\r\n<p style=\"text-align: justify;\">La iglesia Roca Eterna 2da. 5to. Refugio ubicada en la calle Principal No. 256 del sector Padre Granero, de la ciudad de Puerto Plata, Rep. Dom., fue fundada el d????a 4 de agosto del a????o 2004. Su fundador lo fue el hermano Mateo Polanco Francisco de la iglesia 5to. Refugio, pastoreada por el Rev. Lu????s Amonte. El hermano Mateo Polanco Francisco, junto a diez (10) hermanos mas, se organizaron para levantar un campo blanco en la parte baja del sector.</p>\r\n<p style=\"text-align: justify;\">Durante estos cuatro (4) a????os la iglesia ha mantenido un crecimiento sostenido; ha sido pastoreada por dos (2) pastores, cuyos nombres son los siguientes: Hno. Mateo Polanco Francisco y la Lic. Francisca Jim????nez, la cual es la pastora en la actualidad. Estamos trabajando arduamente y orando al Se????or por la terminaci????n de nuestro templo propio.</p>', '', 1, 14, 0, 36, '2011-05-07 13:08:50', 65, '', '2011-05-07 14:41:03', 65, 0, '0000-00-00 00:00:00', '2011-05-07 13:08:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 10, '', '', 0, 163, 'robots=\nauthor='),
(281, 'El Shaddai', 'el-shaddai', '', '<p><em>DIRECCION: Saballo, Imbert.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Ehx. Leonel Cabrera. </em></p>\r\n<p><em>TELEFONO: 829-321-0619</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:11:07', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 13:11:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 119, 'robots=\nauthor='),
(282, ' Visi????n Primitiva', '-vision-primitiva', '', '<p><em>DIRECCION: San Marcos Abajo, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Ehx. Reyes Garc????a Lebr????n. </em></p>\r\n<p><em>TELEFONO: 829-304-5089</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:12:23', 65, '', '2011-05-07 13:13:48', 65, 0, '0000-00-00 00:00:00', '2011-05-07 13:12:23', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 8, '', '', 0, 138, 'robots=\nauthor='),
(283, ' Monte De Los Olivos', '-monte-de-los-olivos', '', '<p><em>DIRECCION: Calle Pedro Clisante, Los Mameyes, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Ehx. Alberto D????az. </em></p>\r\n<p><em>TELEFONO: 829-436-0614</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p><em><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:13:50', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 13:13:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 163, 'robots=\nauthor='),
(284, 'Luz Y Vida', 'luz-y-vida', '', '<p><em>DIRECCION: Calle 5#42 Bello Costero, Pto, Pta.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Ehx. Vinicio Del Rosario.</em></p>\r\n<p><em>TELEFONO: 809-773-2756</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p style=\"text-align: justify;\">La iglesia Luz y Vida ubicada en la calle 5 #53 del sector bello costero, Pto. Pta., R.D., naci???? en el mes de febrero del a????o 1994, fundada por la Licda. Pastora Josefina Rivera. Durante sus 14 a????os de existencia ha sido dirigida por tres pastores, cuyos nombres son los siguientes: Pastora Josefina Rivera, Licenciado pastor, Humberto Hamsbery y en la actualidad el Exhortador pastor Vinicio Rosario.</p>', '', 1, 14, 0, 36, '2011-05-07 13:15:17', 65, '', '2011-05-07 14:50:25', 65, 0, '0000-00-00 00:00:00', '2011-05-07 13:15:17', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 6, '', '', 0, 233, 'robots=\nauthor='),
(285, ' XlV Tabern????culo', '-xlv-tabernaculo', '', '<p><em>DIRECCION: Calle 2 # 22. </em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Rufino Le????n Almonte. </em></p>\r\n<p><em>TELEFONO: 809-586-7497</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:16:24', 65, '', '2011-05-07 13:50:32', 65, 65, '2011-05-07 14:57:05', '2011-05-07 13:16:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 139, 'robots=\nauthor='),
(286, 'La Puerta La Hermosa', 'la-puerta-la-hermosa', '', '<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>DIRECCION: Calle 1 Padre Las Casa Callej????n Villa Progreso.</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>CIRCUITO: Puerto Plata</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>PASTOR: Gilda Gutierre De Parra.</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>TELEFONO: 809-514-1601</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"text-align: center;\"><em><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:17:29', 65, '', '2011-07-12 12:45:51', 63, 0, '0000-00-00 00:00:00', '2011-05-07 13:17:29', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 4, '', '', 0, 92, 'robots=\nauthor='),
(287, 'La Tribu De Jud???? Derribando Los Muros', 'la-tribu-de-juda-derribando-los-muros', '', '<p><em>DIRECCION: Barri???? Hait???? Manzana 26.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Margarita Mart????nez De Guerrero. </em></p>\r\n<p><em>TELEFONO: 829-939-5855</em></p>\r\n<p><em> </em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:18:21', 65, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 13:18:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 229, 'robots=\nauthor='),
(288, 'Pentecostal La Unidad', 'pentecostal-la-unidad', '', '<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>DIRECCION: Altos De Chabon Calle Principal.</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>CIRCUITO: Puerto Plata</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>PASTOR: Amarilis V????zquez Liriano. </em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>TELEFONO: 809-261-5895</em></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"text-align: center;\"><em><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></span></span><br /></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:19:44', 65, '', '2011-07-12 12:43:39', 63, 0, '0000-00-00 00:00:00', '2011-05-07 13:19:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 2, '', '', 0, 158, 'robots=\nauthor='),
(289, 'Jehov???? Jireh', 'jehova-gire', '', '<p><em>DIRECCION: Calle Principal Calle Granero 145.</em></p>\r\n<p><em>CIRCUITO: Puerto Plata</em></p>\r\n<p><em>PASTOR: Eduardo Nolasco. </em></p>\r\n<p><em>TELEFONO: 809-261-6870</em></p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><em><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></em></p>\r\n<p><em><span style=\"text-decoration: underline;\"><br /></span></em></p>', '', 1, 14, 0, 36, '2011-05-07 13:21:12', 65, '', '2011-05-07 14:31:33', 65, 0, '0000-00-00 00:00:00', '2011-05-07 13:21:12', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 1, '', '', 0, 202, 'robots=\nauthor='),
(290, 'Ebenezer', 'genezaret', '', '<table border=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-CR\"><img src=\"images/stories/iglesias/sjm-genezareth.jpg\" border=\"0\" width=\"299\" height=\"199\" style=\"border: 0pt none; margin: 10px;\" /></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"font-family: helvetica;\">San Juan de la Maguana. Iglesia Ebenezer</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"margin-bottom: 0in; line-height: 150%; text-align: center;\" lang=\"es-CR\">????</p>\r\n', '\r\n<p>????</p>\r\n<p style=\"margin-bottom: 0in; line-height: 150%; text-align: center;\" lang=\"es-CR\"><span style=\"text-decoration: underline;\"><span style=\"font-family: Comic Sans MS,cursive;\"><strong>Breve Rese????a Hist????rica</strong></span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 150%; text-align: justify;\" lang=\"es-CR\"><span style=\"font-family: Comic Sans MS,cursive;\">Primera iglesia fundada el 12 de octubre de 1990 en Pedro Corto, San Juan, por el pastor Ismael Mateo del Carmen, quien estuvo al frente de la obra por unos 16 a????os, y fue sucedido en el 2006 por Julio A. de la Rosa, quien actualmente es la pastorea.</span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 150%; text-align: justify;\" lang=\"es-CR\"><span style=\"font-family: Comic Sans MS,cursive;\">Actualmente se encuentra ubicada</span><span style=\"font-family: Comic Sans MS,cursive;\"> en la calle</span><span style=\"font-family: Comic Sans MS,cursive;\">primera No.8, Pedro Corto, San Juan, R.D.</span><img src=\"images/stories/pastores/sjm-genezareth-pastor.jpg\" border=\"0\" width=\"299\" height=\"199\" style=\"border: 0pt none; vertical-align: top; margin: 10px;\" /></p>', 1, 14, 0, 31, '2011-05-07 15:00:32', 63, '', '2013-05-31 16:06:48', 83, 83, '2016-01-06 14:51:15', '2011-05-07 15:00:32', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 12, 0, 1, '', '', 0, 508, 'robots=\nauthor='),
(291, 'Fuente de Vida', 'fuente-de-vida', '', '<p> </p>\r\n<p> </p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">BREVE HISTORIA</span></p>\r\n<p> </p>\r\n<!--  p { margin-bottom: 0.08in; } -- >\r\n<p style=\"margin-bottom: 0in; text-align: justify;\">La Iglesia Cristiana Fuente de Vida Eterna, ubicada en la calle 4, casi esquina 7 de la uni????n segunda, Santiago, Republica Dominicana, con su tel????fono (809) 575-6129, fue iniciada en el a????o 1999 por la hermana Antonia Fco. de Mu????oz, el d????a 15 de diciembre del a????o 2000 me fue entregada y en marzo del 2001 fue oficializada por</p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\">Concilio Asamblea de Iglesia Cristiana Inc., durante sus 8 a????os de existencia ha sido dirigida un afio por la hermana Antonia Fco. de Mu????oz y los ????ltimos 7 a????os por la Pastora Consorcia Francisco de Felipe (Miledys).</p>', '', 1, 14, 0, 28, '2011-05-07 15:33:34', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-07 15:33:34', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 165, 'robots=\nauthor='),
(546, 'Qu???? es el Departamento de Educaci????n', 'que-es-el-departamento-de-educacion', '', '<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\">El Departamento de Educaci????n Cristiana de AIC INC.</span></strong></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\"><br /></span></strong></span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> Es un ????rga</span></span><img src=\"images/stories/aic educacion.jpg\" border=\"0\" style=\"float: left; margin: 10px;\" /><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">no del concilio Asamblea de Iglesias Cristianas, Inc. El cual esta destinado a </span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">instruir hom</span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">bres y mujeres en la divina vocaci????n ministerial.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">El departamento de educaci????n prepara hombres y mujeres para la ense????anza, evangelizaci????n, pastorado y misiones, funciones tomadas de las sagradas escrituras.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Todo lo que tiene que ver con la comunicaci????n y ministracion de la palabra de Dios, es funci????n de este Departamento, el cual realiza sus funciones a traves del Instituto Teol????gico, Escuela de Ministerios, Escuelas B????blicas y Medios Masivos, adem????s de una serie de seminarios y congresos impartidos de manera peri????dica.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Las bases principales de esta Instituci????n de AIC son:</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>B????blica</strong>: Por cuanto sus ense????anzas son tomadas de la Biblia.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Teol????gica</strong>: En virtud de que sus contenidos son fundados en bases l????gicas y s????lidas del conocimiento de Dios.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Ministerial: </strong>Prepara obreros(as) ????tiles y valiosos para la labor cristiana.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Orientaci????n Personal: </strong>Orientado a la ayuda integral de las personas.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Docente: </strong>Busca el desarrollo de las personas en el campo de la cultura de forma general.</span></span></p>', '', 1, 15, 0, 42, '2011-05-12 16:52:02', 72, '', '2011-05-12 17:02:17', 63, 0, '0000-00-00 00:00:00', '2011-05-12 16:52:02', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 10, '', '', 0, 76, 'robots=\nauthor=');
INSERT INTO `aicrd_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(547, 'Rese????a Hist????rica', 'resena-historica-del-departamento-de-educacion', '', '<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>EL Departamento de Educaci????n como ente regulador de la Escuela de Ministerio, el Instituto Teol????gico, las Escuelas B????blicas, as???? como los medios masivos de comunicaci????n, colegios y la universidad Verbo de Vida, tienen ya muchos a????os funcionando internacionalmente. No es hasta el a????o 1996, que el Obispo, Rev. Dr. Domingo Rodr????guez D????az, en su calidad de Delegado a la Conferencia N????mero 50, anuncia la intenci????n de organizar en la Rep????blica Dominicana este departamento, funcionando para la fecha El Instituto Teol????gico y el Departamento de Escuelas B????blicas.</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>Por tal motivo solicita el env????o de tres candidatos, v????a Comit???? Ejecutivo Nacional, para la designaci????n por parte del Comit???? Ejecutivo Central del primer Director Nacional de Educaci????n; entre los expedientes enviados, fue escogido el Rev. Yoselman Mirabal como Director Nacional.</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>El Rev. Mirabal, fue presentado por el entonces Director Mundial de Educaci????n, el Rev. Miguel A. D????az, el 10 de Diciembre del a????o 1999, en el Taller Pastoral celebrado en el Centro Conferencial Micmas. El cual duro un a????o al frente y fue objeto de grandes cambios.</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>Este Departamento de Educaci????n inici???? sin recurso alguno. Sin embargo, el Director Nacional, Rev. Yoselman Mirabal, nombr???? la Directiva, adjunto del Comit???? Ejecutivo Nacional, y prosigui???? adelante. Durante este primer per????odo de gesti????n, se logr???? organizar la estructura del Departamento de Educaci????n, iniciar la Escuela de Ministerios tres meses m????s tarde, aument????ndose considerablemente las estad????sticas y las finanzas, tanto en el plano nacional como internacional,</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>La creaci????n de este Departamento trajo consigo una revoluci????n no s????lo en el liderazgo sino en la metodolog????a y la administraci????n de los asuntos educativos, tratando de establecer los nuevos est????ndares y paradigmas as seguir por las nuevas generaciones.</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>Entre los logros de esta primera gesti????n se mencionan los siguientes:</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>Inicio de la Escuela de Ministerios en Santo Domingo, San Crist????bal y Puerto Plata (98 graduados en total) y posteriormente en Higuey y San Juan (27 graduados).</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>Crear las bases de peque????as bbliotecas.</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>Elaboraci????n de programas de clases de la Escuela de Ministerios y del Instituto Teol????gico</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>Establecimiento de la compensaci????n a los maestros del Instituto Teol????gico.</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>Carnet de Identificaci????n para estudiantes de la Escuela de Ministerios y del???? Instituto Teol????gico.</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>Actualizaci????n de los libros del Instituto Teol????gico.</em></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><em>Establecimiento de una oficina Equipada. </em></span></span></p>', '', 1, 15, 0, 42, '2011-05-12 17:04:26', 63, '', '2011-05-13 03:36:20', 63, 0, '0000-00-00 00:00:00', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 2, 0, 9, '', '', 0, 134, ''),
(548, 'Visi????n Departamento Educaci????n', 'vision-departamento-educacion', '', '\r\n<p style=\"margin-bottom: 0in;\">????</p>\r\n<p style=\"margin-bottom: 0in; text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Nuestra visi????n es ser un instrumento ????til a Dios para lograr que todos los creyentes que perseveren en las iglesias de nuestro movimiento puedan disfrutar de un crecimiento y madurez espiritual saludable a trav????s de la sana ense????anza basada en el la Biblia.</span></span></p>', '', 1, 15, 0, 42, '2011-05-12 17:06:42', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 1, 0, 8, '', '', 0, 45, ''),
(549, 'Misi????n Departamento Educaci????n', 'mision-departamento-educacion', '', '\r\n<p style=\"margin-bottom: 0in; text-align: center;\">????</p>\r\n<p style=\"margin-bottom: 0in; text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">La capacitaci????n y ense????anza de los miembros del Cuerpo Ministerial, y laicos en general, para proveer una mejor capacitaci????n; que a su efecto, puedan servir mejor a nuestro Se????or Jesucristo</span></span></p>', '', 1, 15, 0, 42, '2011-05-12 17:07:53', 63, '', '0000-00-00 00:00:00', 0, 72, '2011-05-12 18:23:58', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 1, 0, 7, '', '', 0, 48, ''),
(550, 'Fundamentos Departamento Educaci????n', 'fundamentos-departamento-educacion', '', '\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">De conformidad al Reglamento Nacional e Internacional de Asamblea de Iglesias Cristianas, Inc. Este Departamento tiene como base doctrinal los siguientes postulados:</span></span></p>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>CREEMOS</strong>: En la divinidad 	del Padre, la divinidad del Hijo y la divinidad de Esp????ritu Santo. 	Que juntos forman la Trinidad</span></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>CREEMOS</strong>: En la inspiraci????n, 	verdad y autoridad de las sagradas escrituras (en su totalidad) como 	la palabra de Dios infalible, sin error, regla de fe y pr????ctica.</span></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>CREEMOS</strong>: Que la Iglesia es 	el cuerpo de Cristo, el cual muri???? por toda la humanidad.</span></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>', '', 1, 15, 0, 42, '2011-05-12 17:09:38', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 1, 0, 6, '', '', 0, 55, ''),
(551, 'Objetivos Departamento Educaci????n', 'objetivos-departamento-educacion', '', ' \r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Preparar siervo para el Reino de 	los Cielos.</span></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Instruir maestros para la 	educaci????n  cristiana, con una visi????n amplia de la sana doctrina.</span></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Elevar el conocimiento sobre los 	deberes doctrinales, para ense????ar la palabra de Dios, pura y 	cierta.</span></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Formar ministros dispuestos a 	trabajar en la lid del se????or voluntariamente.</span></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Educar a lideres para que tengan 	una mejor participaci????n como gerentes de los negocios del se????or, 	con la finalidad de que la iglesia este mejor representada y guiada 	por buenos senderos.</span></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Trabajar para erradicar todo el 	analfabetismo en todo el sentido de la palabra, entre los miembro de 	AIC en Rep????blica Dominicana.</span></span></p>\r\n</li>\r\n</ul>', '', 1, 15, 0, 42, '2011-05-12 17:10:34', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 1, 0, 5, '', '', 0, 60, ''),
(552, 'Estructura Administrativa Departamento Educaci????n', 'estructura-administrativa-departamento-educacion', '', '<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Director Regional de Educaci????n</strong></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Rev. Dr. Sebasti????n Lora Reyna</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Sub-Director Regional y Director de ITAIC</strong></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Rev. Lic.Yuni Roque Laureano</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Secretaria ITAIC</strong></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Abigail C????rdenas de Javier</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Secretario EMAIC</strong></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Lic. Alcibiades Cruz Espinal</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Tesorera</strong></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">L.P. Wendy Hilario de Laureano</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Director Regional Dpto. Escuelas B????blicas</strong></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Lic. Edward Cifre</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Directora Regional de Medios Masivos</strong></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Tania Mejia</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Director Nacional Escuela Ministerio</strong></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Lic. Yovanny Martes</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>', '', 1, 15, 0, 42, '2011-05-12 17:15:11', 63, '', '2011-05-12 18:29:21', 63, 72, '2011-05-12 18:40:05', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 2, 0, 4, '', '', 0, 65, ''),
(553, 'Programa de Becas para Hijos de Pastores', 'programa-de-becas-hijos-de-pastores', '', '<h2 style=\"text-align: center;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"font-size: large;\"><span style=\"text-decoration: underline;\"><strong>Nuestro Programa de Becas</strong></span></span></span></span></h2>\r\n<p style=\"margin-bottom: 0in; line-height: 0.3in;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 0.3in;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in; line-height: 0.3in;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">La capacitaci????n de las personas tiene mucho que ver con su servicio al resto de la humanidad.???? Por ello es de suponerse que a mayor educaci????n, mejor rendimiento, mejor calidad de vida y mejores ciudadanos.???? Cierto es que no todos tienen las mismas oportunidades, pero todos pueden esforzarse para dar de s???? lo mejor.???? Teniendo esta verdad como norte es que se ha establecido el Programas de Becas Sr. Erasto Torres, con el objetivo de ayudar, de alguna manera, a los Hijos de Pastores para que logren superarse.</span></span></p>\r\n<p style=\"margin-top: 0.17in; margin-bottom: 0.17in; line-height: 0.3in;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Por siempre la escasez, la pobreza, y el medio ambiente, han sido factores determinantes en el futuro de muchas familias.???? Sus limitaciones acompa????adas de otras precariedades, les han impedido impulsar de la mejor manera a sus hijos hacia una mejor educaci????n.???? Gracias al Banco Ponce de Le????n y su oficial en Jefe Ejecutivo, el Sr. Erasto Torres, hemos podido????aunar esfuerzos y crear este maravilloso recurso.</span></span></p>\r\n<p style=\"margin-top: 0.17in; margin-bottom: 0.17in; line-height: 0.3in;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">La????Asamblea de Iglesias Cristianas, Inc. y el Banco Ponce de Le????n han hecho posible que muchos j????venes puedan disfrutar de un????incentivo que les motiva a educarse, superarse y entender que en la vida nada se logra por s????</span><span style=\"font-family: helvetica;\"> </span><span style=\"font-family: helvetica;\">solo; siempre existe alguien m????s que nos hace part????cipe de sus bondades y bendiciones.</span></span></p>\r\n<p style=\"margin-top: 0.17in; margin-bottom: 0.17in; line-height: 0.3in;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /><br /></span></span></p>\r\n<p style=\"margin-top: 0.17in; margin-bottom: 0.17in; line-height: 0.3in;\" lang=\"es-ES\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"text-decoration: underline;\"><strong>LOS REQUISITOS PARA APLICAR SON LOS SIGUIENTES:</strong></span></span></span></p>\r\n<p style=\"margin-top: 0.17in; margin-bottom: 0.17in; line-height: 0.3in;\" lang=\"es-ES\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /><br /></span></span></p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Ser hijo 	de Pastor.</span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-ES\">Estar </span></span><span style=\"font-family: helvetica;\"><span lang=\"es-ES\"><span style=\"text-decoration: underline;\">cursando estudios</span></span></span><span style=\"font-family: helvetica;\"><span lang=\"es-ES\"> universitarios. Presentar constancia/certificado de  la universidad. </span></span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Ser 	miembro en plena comuni????n de una iglesia local de AIC. Presentar 	constancia de la Oficina del Distrito/Campo Misionero.</span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Preparar 	un ensayo con m????nimo de 200 palabras, sobre uno de los siguientes 	temas: (1) Dios; (2) Salvaci????n; y (3) ????Qu???? es ser hijo de pastor?</span></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" lang=\"es-ES\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span lang=\"es-ES\">NOTA ???????? Para renovaci????n de beca, </span></span><span style=\"font-family: helvetica;\"><span lang=\"es-ES\"><span style=\"text-decoration: underline;\">es requisito indispensable</span></span></span><span style=\"font-family: helvetica;\"><span lang=\"es-ES\"> haber aprobado satisfactoriamente el a????o en que el estudiante se benefici???? de la presente beca.</span></span></span></p>', '', 1, 15, 0, 42, '2011-05-12 17:21:16', 63, '', '2011-05-12 17:21:43', 63, 0, '0000-00-00 00:00:00', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 2, 0, 2, '', '', 0, 1148, ''),
(554, 'Medios Masivos de Comunicaci????n', 'medios-masivos-de-comunicacion', '', '<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"text-decoration: underline;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Programas de Radio y Televisi????n</strong></span></span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> <br /></span></span></p>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><img src=\"images/stories/mmc.jpg\" border=\"0\" style=\"float: left; margin: 10px;\" /></span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">PROPOSITO:</span></span></p>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Los adelantos en los m</span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">edios de comunicaci????n masiva por radio y televisi????n hacen de estos un formidable m????todo para la propagaci????n del evangelio. La utilizaci????n de estos no se afecta negativamente por las constricciones de fronteras, distancias o falta de obreros prestos para la evangelizaci????n en un particular lugar. Con el fin de Evangelizar y propagar el evangelio por todo el m</span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">undo con todos el mundo con todos los medios disponibles. El Comit???? Ejecutivo autorizara la formaci????n y co</span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">ordinaci????n de Propagaci????n de Radios y Televisi????n dentro Asamblea de Iglesias Cristianas, Inc.</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">En la actualidad contamos en nuestro Pa????s con       Emisoras Radiales</span></span></p>\r\n<p style=\"margin-bottom: 0in; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>', '', 1, 15, 0, 42, '2011-05-13 02:45:41', 63, '', '2011-05-13 02:52:05', 63, 0, '0000-00-00 00:00:00', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 3, 0, 1, '', '', 0, 57, ''),
(555, 'Qu???? es la Escuela de Ministerios', 'que-es-la-escuela-de-ministerios', '', '\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Es una dependencia del Departamento de Educaci????n de nuestro Distrito Rep????blica Dominicana, con sus siglas EMAIC; creada con la finalidad de ofrecer una propuesta especial a los (as) egresados (as) del Instituto, con el grado de T????cnico en Teolog????a en una de las determinadas ????reas especiales del ministerio.</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Es una escuela para estimular, cultivar, y adiestrar al alumno en las destrezas y rigores necesarios en el desarrollo de su ministerio en particular. </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Es una respuesta a la pregunta: ????D????nde conseguiremos obreros preparados para el ministerio?</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Es un programa donde el alumno puede seleccionar aquellas clases que considera habr????n de facultarle mejor para llenar las necesidades de su llamado o ministerio. </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">El Programa de Clases o Curr????culo Educativo de EMAIC comprende una formaci????n acad????mica y ministerial con clases generales, y especialidades tales como Pastorado, Evangelismo y Magisterio.</span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Este programa tiene una duraci????n de un a????o de estudio en el cual se imparte una asignatura cada mes en una jornada semanal de 3 horas de clases. </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">EMAIC funciona a nivel nacional bajo la Direcci????n del Lic. Yovanny Marte Brea, el cual tiene a su cargo la supervisi????n de los directores de las diversas Ramas donde funciona la Escuela. </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">En la actualidad contamos con 8 ramas, distribuidas en el territorio nacional, las cuales son: Santo Domingo Este, Santo Domingo Oeste, Haina, San Crist????bal Centro, Najayo, La Romana, San Pedro de Macor????s, Puerto Plata e Higuey. </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">En Escuela de Ministerio Contamos Con   15  Maestros, y con 94 Estudiantes. </span></span></p>\r\n<p style=\"margin-bottom: 0in;\" align=\"JUSTIFY\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<h2 style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"font-size: small;\">PROP?????SITO DE EMAIC</span></span></span></h2>\r\n<p style=\"margin-top: 0.17in; margin-bottom: 0.17in; line-height: 100%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Con el fin de llenar la necesidad inmediata de adiestramiento ministerial a la luz de los constantes cambios del tiempo presente en la sociedad y la teolog????a, se establece la Escuela de Ministerio para personas que sientan el llamado o vocaci????n hacia el ministerio.</span></span></p>\r\n<h2 style=\"text-align: center;\"></h2>\r\n<h2 style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"font-size: small;\">FUNCIONES DE EMAIC</span></span></span></h2>\r\n<ul style=\"text-align: justify;\">\r\n<li>\r\n<p style=\"margin-top: 0.19in; margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Proveer 	una programaci????n para los miembros del Cuerpo Ministerial y laicos 	con un llamado o vocaci????n hacia el ministerio que por alguna raz????n 	no pueden estudiar en una instituci????n con acreditaci????n acad????mica, 	pero que es capaz de rendir una labor efectiva en el ministerio. </span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Adiestrar 	a los estudiantes para un mejor servicio dentro del cuerpo de 	Cristo, ejerci????ndolo dentro de su particular ministerio.</span></span></p>\r\n</li>\r\n</ul>', '', 1, 15, 0, 45, '2011-05-13 03:02:02', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 1, 0, 2, '', '', 0, 131, ''),
(556, 'Requisitos de Admisi????n', 'requisitos-de-admision', '', ' \r\n<ul>\r\n<li>\r\n<p style=\"margin-top: 0.19in; margin-bottom: 0in; line-height: 150%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Someter???? un 	resumen de su experiencia cristiana para ser evaluada, y que incluya 	el prop????sito y meta de su estudio.</span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 150%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Ser 	miembro de buen testimonio y en plena comuni????n de una iglesia 	cristiana que guarde uniformidad con los criterios doctrinales de </span><span style=\"font-family: helvetica;\"><strong><span style=\"color: #333333;\">ASAMBLEA 	DE IGLESIAS CRISTIANAS, INC. </span></strong></span><span style=\"font-family: helvetica;\">(Assembly 	of Christian Churches, Inc.) y que cumpla con las responsabilidades 	en su congregaci????n. </span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 150%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Llenar 	una solicitud que incluye la firma Del Solicitante y el Pastor</span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 150%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Haberse 	graduado de un Seminario B????blico o Instituto B????blico. </span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 150%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Copia 	de diploma del  Seminario B????blico o Instituto Teol????gico. </span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 150%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">4 	fotos 2X2 Actuales</span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 150%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Carta 	de la Iglesia Firmada y Sellada</span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 150%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Copia 	de la C????dula o Copia de Acta de Nacimiento</span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in; line-height: 150%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Pagar 	 RD$ 300.00 Pesos de Cuota de Inscripci????n </span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.19in; line-height: 150%;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Pagar 	RD$ 300.00 Pesos de Cuota Mensual (Pagos 25 al 30 de cada mes)</span></span></p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-top: 0.19in; margin-bottom: 0.19in;\" align=\"CENTER\">????</p>\r\n<p style=\"margin-top: 0.19in; margin-bottom: 0.19in;\" align=\"CENTER\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\"><span style=\"text-decoration: underline;\"><strong>REQUISITOS PARA GRADUACION</strong></span></span></span></span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li>\r\n<p style=\"margin-top: 0.19in; margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Pagar 	el Derecho a Graduaci????n (Incluye Toga y Birrete)</span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Haber 	Aprobado todas las Asignaturas del Pensum</span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Presentar 	recibo o Constancia de Saldo o Pago Final</span></span></p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.19in;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Pagar 	Cinco D????lares para Diploma </span></span></p>\r\n</li>\r\n</ul>', '', 1, 15, 0, 45, '2011-05-13 03:05:06', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 1, 0, 1, '', '', 0, 76, ''),
(557, 'Qu???? es ITAIC', 'que-es-itaic', '', '<p style=\"margin-top: 0.19in; margin-bottom: 0.19in;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><img src=\"images/stories/itaic.jpg\" border=\"0\" style=\"float: left; margin: 10px;\" />El <span style=\"font-size: medium;\">Instituto Teol????gico  (ITAIC)</span>, es el organismo dependiente del Departamento de Educaci????n, en Nuestro Distrito Republica Dominicana,  responsable de la formaci????n b????blica y teol????gica de hombres y mujeres para la eficacia de la proclamaci????n del evangelio de nuestro Se????or Jesucristo. </span></span></span></p>\r\n<p style=\"margin-top: 0.19in; margin-bottom: 0.19in;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">El programa de clases o curr????culo educativo del Instituto Teol????gico, esta distribuido en tres (3) a????os escolares en lo que se imparten 21 Asignaturas con un equivalente a 65 cr????ditos acad????micos, iniciando nuestras labor en la primera semana del mes de septiembre, hasta la ultima semana de junio de cada a????o. Nuestras clases se ofrecen regularmente una vez por semana con un sesi????n de tres (3) horas de clases, el d????a y la hora que mas convenga al grupo y a los profesores.</span></span></span></p>\r\n<p style=\"margin-top: 0.19in; margin-bottom: 0.19in;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Al termino de los tres a????os, el estudiante recibe un Diploma que le acredita sus estudios de tres a????os de teolog????a, apto para seguir capacit????ndose en lo que es la Escuela de Ministerio (EMAIC). (Ver Escuela de Ministerio)</span></span></span></p>\r\n<h3><span style=\"color: #000000;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><span style=\"font-weight: normal;\">En la actualidad en nuestro Instituto Teol????gico (ITAIC) contamos con 25 ramas en todo el Distrito, con un qu????rum de 646 estudiantes de los cuales 304 cursan el Bachillerato Teol????gico (BACHITAIC) y 342 el Instituto Teol????gico normal (ITAIC). Para un total de 321 estudiantes en el primero, 202 en el segundo y 123 en el tercero.</span></span></span></span></h3>\r\n<h3 style=\"font-weight: normal;\"><span style=\"color: #000000;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Contamos con un personal de directores y maestros altamente capacitados en cada una de nuestras Ramas:</span></span></span></h3>', '', 1, 15, 0, 43, '2011-05-13 03:13:13', 63, '', '2016-05-10 14:08:31', 63, 0, '0000-00-00 00:00:00', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 2, 0, 3, '', '', 0, 460, ''),
(558, 'Rese????a Hist????rica', 'resena-historica', '', '<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">RESE?????A HIST?????RICA DE ITAIC EN REP????BLICA DOMINICANA</span></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">El Instituto Teol????gico de Asamblea de Iglesias Cristianas, Inc. (ITAIC), llamado ???????Arca Evang????lica??????? es tan antiguo como el establecimiento del concilio en el a????o 1946 en nuestro pa????s, que para entonces se establec????a como campo misionero de AIC y hoy 63 a????os despu????s, cuenta con la categor????a de Distrito.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">El Rev. Roberto Madera, Primer Representante, es quien forma el Instituto en 1946, en compa????????a de su esposa la Misionera Delta Madera, con el objetivo de preparar hermanos aptos para ministrar la palabra de Dios. Pero al transcurrir el tiempo esta iniciativa desfalleci???? y dej???? de funcionar.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Fue a la llegada del Rev. Julio Morales, el cuarto representante, cuando el 21 de septiembre de 1962 se inician los trabajos del Instituto, siendo los primeros maestros el Rev. Morales, su esposa Paula, El Rev. Julio Cesar Dami????n, Francisca Valdez y Ana Miriam Mateo. Los primeros graduados en el a????o 1965, fueron: Ang????lica de Rodr????guez, Francisca Ram????rez, Mercedes Bello, y Rafael Angustia.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Al salir del pa????s el Rev. Morales, tom???? la direcci????n del Instituto, la Misionera Ana Miriam Mateo hasta el a????o 1968, que debido a algunos inconvenientes deja nuevamente de funcionar.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Durante este tiempo, antes de dejar de funcionar, se llevo a cabo en la residencia de Aurelio D????az (Supervisor), el Primer Internado Para Pastores, la mayor????a de origen haitiano y algunos dominicanos; de esos ????ltimos se graduaron el Rev. Bartola Cuevas, el Rev. Emilio Castillo e Isaura Soto. Este internado dur???? dos a????os y entre los maestros estaban Ana Mirian Mateo (Directora), Ang????lica Aviles, Francisca de Ram????rez, entre otros.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">En el a????o 1973, el Representante Federico Sob????, nombra al Rev. Manuelico P????rez como Director de ITAIC; ????ste con la ayuda del Rev. Frank Bienvenido Jim????nez comienza a organizar los trabajos y darle proyecci????n al mismo, junto a la misionera Mercedes Bello, Ana Mirian Mateo, entre otros. Esto fue hasta el a????o 1975, cuando nuevamente toma la direcci????n Ana Mirian Mateo.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Para este tiempo se graduaron Aurelio V????squez, su esposa Carmen, Domingo P????rez, Mar????a Angustia y el Rev. Juan Lorenzo (Co-pastor por algunos a????os de la Iglesia Bethesda y posteriormente en Madre Vieja, Barahona y Palenque).</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">De 1978 ????a 1980 es nombrado el Rev. Manuelico P????rez, nuevamente como Director del ITAIC y se establece por primera vez el Instituto por correspondencia y algunos pudieron cursar estudios, pero no pudo sostenerse por falta de recursos.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Entre 1980 y 1982, La hermana Ana Mirian Mateo, asume de nuevo el cargo. En el per????odo 1982-1985 estuvo de nuevo el Rev. Manuelico P????rez; en este tiempo se graduaron en el Instituto el Rev. Gregorio Artiles, el Rev. Lorenzo Andr????s P????rez, entre muchos otros.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">En el a????o 1984, dentro de ese mismo intervalo bajo la supervisi????n del Rev. Lu????s Aquino Isabel, se realiz???? el Segundo Internado Especial para Pastores, con una duraci????n de tres meses, con una credencial de Licenciado Pastor asegurada al final del curso y una iglesia para pastorear.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Los gastos generales fueron cubiertos por el Rev. Aquino y los profesores fueron: Ana Mirian Mateo, Francisca Aquino, el Rev. Julio C????sar Dami????n, entre otros.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">De esta promoci????n se graduaron ocho (8), dentro de???? los cuales estaban: el Rev. Eddy Gonz????lez Prandy, Rev. Pedro Alejandro Valera y el hermano Aurelio Hidalgo.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Desde el mes de Abril del a????o 1985, hasta Abril del a????o 2000 le correspondi???? la ardua labor del Instituto Teol????gico al Licenciado Aurelio V????squez, (fallecido), quien durante esos quince a????os pudo sostener, ampliar y desarrollar esta entidad educativa, gradu????ndose m????s de 1,200 hermanos y hermanas, muchos de los cuales son lideres y pastores de nuestras iglesias, gracias a los esfuerzos y esmero en la labor de este siervo de Dios.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">A partir del 2000, y con la creaci????n del Departamento de Educaci????n, el Instituto Teol????gico, pasa a ser administrado directamente por el Director Nacional del Departamento, el Rev. Yoselman Mirabal, primera persona en ocupar del cargo de Director del Departamento de Educaci????n.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">El Rev. Mirabal trabaj???? arduamente, promoviendo cambios en cuanto a metodolog????a, contenido y administraci????n se refiere. En esa administraci????n fueron creados programas de clases para las asignaturas.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">En el a????o 2001, el Rev. Sebasti????n Lora Reyna, pasa a ocupar el cargo de Director Nacional del Departamento de Educaci????n, y hasta la actualidad, atravesando el a????o 2009; ha estado administrando dicho departamento, promoviendo cambios e innovaciones. En esta gesti????n se descentraliz???? el trabajo, designando Directores Nacionales para cada ????rea dependiente del Departamento de Educaci????n, tales como el Instituto Teol????gico, La Escuela de Ministerio y la Direcci????n de Escuelas B????blicas.</span></span></p>', '', 1, 15, 0, 43, '2011-05-13 03:38:51', 63, '', '2011-05-13 03:49:12', 63, 0, '0000-00-00 00:00:00', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 2, 0, 2, '', '', 0, 147, '');
INSERT INTO `aicrd_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(559, 'Requisitos Nuevo Ingreso ITAIC', 'requisitos-nuevo-ingreso-itaic', '', '<p style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><img src=\"images/stories/itaic.jpg\" border=\"0\" style=\"margin: 10px; border: 0pt none; vertical-align: top;\" /></strong></span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p>????</p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\">INFORMACION GENERAL PARA NUEVO INGRESO </span></strong></span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">INSTITUTO (ITAIC) Y BACHILLERATO TEOLOGICO (BACHITAIC)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">REQUISITOS:</span></span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>El Solicitante deber</strong></span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>???? tener un a????o de      bautizado</strong></span></span></li>\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\">Formulario:</span></strong> debidamente      lleno, con letra legible, sin borrones, firmada por el pastor y el      solicitante</span></span></li>\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\">4 Fotos:</span></strong> Actuales</span></span></li>\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\">Fotocopia???? de la Cedula y/o Copia del Acta de Nacimiento</span></strong></span></span></li>\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\">Carta de l</span></strong></span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\">a Iglesia:</span></strong> Firmada por el Pastor y sellada</span></span></li>\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\">Reporte de pago Inscripci????n      ($200.00)</span></strong></span></span></li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\"> </span></strong></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Si opta???? por el Bachillerato debe anexar a todo lo anterior:</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\">Certificado de Octavo </span></strong>o      Equivalencia de Cursos Superiores a 8vo. </span></span></li>\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\">Record de Notas</span></strong>:      Bachillerato y/o Universidad </span></span></li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\"> </span></strong></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"text-decoration: underline;\"> </span></strong></span></span></p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>RE ???????? INGRESO</strong> (Para el Segundo y/o Tercero)</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong> </strong></span></span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Re-Inscripci????n RD$ 200.00</strong></span></span></li>\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Reporte de Notas del a????o anterior</strong></span></span></li>\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Pago Completo del a????o cursado</strong></span></span> </li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong> </strong></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Graduaci????n</strong></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong> </strong></span></span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Derecho a Graduaci????n RD$ 600.00</strong></span></span></li>\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Reporte de Notas de los tres a????os      anteriores</strong></span></span></li>\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Pago Completo de los tres a????os</strong></span></span></li>\r\n<li><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong>Pago Derecho a Diploma US$ 5 d????lares</strong></span></span></li>\r\n</ul>', '', 1, 15, 0, 43, '2011-05-13 03:58:28', 63, '', '2011-05-13 04:00:12', 63, 0, '0000-00-00 00:00:00', '2011-05-12 00:00:00', '0000-00-00 00:00:00', '', '', '', 2, 0, 1, '', '', 0, 134, ''),
(560, 'Mensaje del Supervisor', 'mensaje-del-supervisor', '', '<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: x-large;\"><span style=\"text-decoration: underline;\"><span style=\"font-family: helvetica;\">Mensaje del Supervisor</span></span></span></p>\r\n<p style=\"text-align: center;\">????</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">No os dej????is llevar de doctrinas diversas y extra????as; porque buena cosa  es afirmar el coraz????n con la gracia, no con viandas, que nunca  aprovecharon a los que se han ocupado de ellas. (Hebreos 13:9)</span></span></p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Es tiempo de que los maestros y l????deres del pueblo de Dios se<strong> preparen</strong> para <strong>Proteger </strong>a los suyos y <strong>Capacitarlos</strong> para salir contra los errores doctrinales.</span></span></p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">En la actualidad tenemos que ser vigilantes, pues no son pocos los l????deres, evangelistas y promotores de ense????anzas falsas que estan empe????ados en arrastrar a los creyentes.</span></span></p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Es urgente entonces que la Iglesia se esfuerce por<strong> Mantener la Sana Doctrina.</strong></span></span></p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: large;\"><span style=\"font-family: helvetica;\"><strong>Rev. Marcial Reyes Sob????</strong></span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: large;\"><span style=\"font-family: helvetica;\"><strong>Supervisor Distrito Rep????blica Dominicana</strong></span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica;\"><strong>LXV Convenci????n Nacional AIC, INC.</strong></span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: small;\"><span style=\"font-family: helvetica;\"><strong>Centro Conferencial MICMAS, Escondido, Ban????</strong></span></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><strong><span style=\"font-size: small;\">Del 18 al 21 de Mayo 2011</span><br /></strong></span></span></p>', '', 1, 2, 0, 15, '2011-05-18 03:09:03', 63, '', '2016-05-10 14:35:59', 63, 0, '0000-00-00 00:00:00', '2016-05-10 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 12, 0, 3, '', '', 0, 258, 'robots=\nauthor='),
(561, 'Oremos por Cesar de Los Santos', 'oremos-por-cesar-de-los-santos', '', '<p style=\"text-align: justify;\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\">Invitamos a todo el Pueblo AICIE?????O a que nos unamos en un clamor por la salud de Nuestro Hermano, Rev. Cesar de los Santos que se encuentra en delicado estado de Salud...</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\"><br /></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: helvetica;\"><span style=\"font-size: medium;\">La Oracion de Fe curar???? al enfermo.<br /></span></span></p>', '', 0, 1, 0, 3, '2011-06-14 19:24:11', 63, '', '2011-06-14 19:29:17', 63, 0, '0000-00-00 00:00:00', '2011-06-14 19:24:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 158, 'robots=\nauthor='),
(562, '73 Convenci????n Internacional AIC', '73-convencion-internacional-aic', '', '<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Puedes seguir la transmision la Magna 73 Convencion Internacional haciendo Click en el Siguiente Link:</span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><a href=\"http://www.unored.com/njerusalen\">Transmision en Vivo </a></span></span></p>\r\n<p>????</p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><img src=\"images/stories/73conv.jpg\" border=\"0\" width=\"652\" height=\"268\" /><br /></span></span></p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></p>\r\n<p>????</p>\r\n<p><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">No te lo pierdas<br /></span></span></p>', '', 0, 0, 0, 0, '2011-07-12 18:00:00', 63, '', '2011-07-16 12:07:25', 63, 0, '0000-00-00 00:00:00', '2011-07-12 18:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(563, 'Aviso de tormenta tropical para la costa sur', 'aviso-de-tormenta-tropical-para-la-costa-sur', '', '<div style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><br /></span></span></div>\r\n<div style=\"color: #5b5b5b; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">El oleaje comenzar???? a deteriorarse cuando Emily comience a acercarse a nuestro territorio</span></span></div>\r\n<div style=\"width: 322px; padding: 5px; float: left; margin-right: 10px; background: none repeat scroll 0% 0% #f2f2f2; border: 1px solid #e2e2e2; text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"><img src=\"http://z101digital.com/app/renderimage.aspx?s=6&amp;m=0&amp;i=CDB3D0FF-3C00-46FB-AB0C-325C201635DF&amp;f=10\" border=\"0\" style=\"float: left; margin: 5px; border: 1px solid black;\" /></span></span></div>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">La Oficina Nacional de Meteorolog????a (Onamet) mantiene el aviso  de tormenta tropical para todo el per????metro costero,????desde la Bah????a de  Manzanillo hasta Cabo Enga????o y desde Cabo Enga????o hasta Pedernales.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Un aviso significa que en 36 horas o menos dos o tres de los de  efectos asociados a un cicl????n tropical, como son vientos fuertes,  lluvias intensas y marejadas, pueden afectar las zonas bajo aviso.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">La Onamet vigila el desarrollo y evoluci????n de la tormenta tropical  Emily localizada a unos 500 kil????metros al sureste de Cabo Enga????o, la  cual contin????a desplaz????ndose hacia el oeste a unos 26kph, esper????ndose un  giro hacia el oeste/noroeste. Sus vientos m????ximos sostenidos son  estimados en unos 65kph.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">De continuar con su movimiento actual y responder a los modelos de  trayectorias, Emily colocar????a su centro en la madrugada del mi????rcoles  aproximadamente a unos 100 kil????metros al sur/Sureste de la isla Saona.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">En cuanto al ????mbito local las condiciones del tiempo estar????n  dominadas por el viento predominante del noreste, transportando n????cleos  nubosos cargados de humedad y los efectos locales (calentamiento diurno y  orograf????a), ????para provocar la ocurrencia de aguaceros dispersos con  aisladas tormentas el????ctricas hacia las regiones Sureste, Noreste y  Cordillera Central en horas de la tarde y noche.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">En horas de la noche el campo nuboso asociado a la tormenta tropical  Emily estar???? incidiendo sobre nuestro territorio, principalmente hacia  la parte Este y luego se ira extendiendo a otras localidades en la  medida que la tormenta se desplace hacia el Oeste.</span></span></p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Fuente: www.Z101digital.com<br /></span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">El oleaje comenzar???? a deteriorarse cuando Emily comience a acercarse a nuestro territorio.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Santo Domingo y sus municipios. ????Nubes dispersas en la ma????ana  aumentando en ocasiones con aguaceros dispersos y aisladas tronadas en  la tarde y noche.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\">Distrito Nacional.???? Nubes dispersas en la ma????ana aumentando en  ocasiones con aguaceros dispersos y aisladas tronadas en la tarde y  noche.</span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><span style=\"font-family: helvetica;\"> </span></span></p>', '', 0, 1, 0, 3, '2011-08-02 11:46:38', 63, '', '2011-08-02 11:51:12', 63, 0, '0000-00-00 00:00:00', '2011-08-02 11:46:38', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 4, '', '', 0, 5, 'robots=\nauthor='),
(564, 'Experto propone sistema financiero electr????nico en RD', 'experto-propone-sistema-financiero-electronico-en-rd', '', '<div style=\"text-align: justify; padding-right: 15px;\"><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: medium;\">Experto propone sistema financiero electr????nico en RD</span></span></div>\r\n<div style=\"text-align: justify;\">\r\n<table style=\"width: 657px; margin-bottom: 15px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td align=\"left\" valign=\"middle\">\r\n<table style=\"width: 197px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td width=\"56\" align=\"left\" valign=\"middle\"><span style=\"font-family: verdana,geneva;\"></span></td>\r\n<td align=\"left\" valign=\"middle\"><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: medium;\">????</span></span></td>\r\n<td width=\"64\" align=\"left\" valign=\"middle\"><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: medium;\">????</span></span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<div id=\"artab_zone1\" style=\"text-align: justify; display: block;\">\r\n<table style=\"width: 657px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td align=\"left\" valign=\"top\">\r\n<div>\r\n<div id=\"ArticleSourceDiv-body-author\" style=\"margin-top: 0px;\"><strong><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: medium;\">Santo Domingo</span></span></strong></div>\r\n<div id=\"ArticleBody\" style=\"margin-top: 10px;\">\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: medium;\">Desde 2002 el economista Friedrich Siegel ha estado proponiendo la???? aplicaci????n del sistema financiero, macroecon????mico y de gobernabilidad Elpas-Sifes, basado en una soluci????n tecnol????gica para el financiamiento del gasto p????blico y privado, que ha sido presentado en Estados Unidos, Europa y algunos pa????ses de Latinoam????rica, incluyendo a Rep????blica Dominicana</span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: medium;\">Se trata de la implementaci????n de una moneda electr????nica personalizada, no convertible en dinero al portador, que permita establecer controles y transparencia para prevenir delitos financieros.</span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: medium;\">Seg????n el experto, la emisi????n de dinero electr????nico en funci????n de la???? productividad econ????mica erradicar????a la devaluaci????n del valor trabajo, y con la aplicaci????n del un sistema financiero electr????nico sectorial se lograr????a no solo neutralizar la inflaci????n econ????mica dom????stica sino la inestabilidad monetaria, el d????ficit fiscal y presupuestario, el desempleo y el crimen financiero organizado.</span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: medium;\">Siegel asegura que ese mecanismo constituye una posible salida a la crisis financiera global a trav????s de la conversi????n de la deuda en inversi????n social.</span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: medium;\">El economista se????ala que su propuesta es en recomendaci????n de las Naciones Unidas (ONU) y de la Organizaci????n de los Estados Americanos (OEA).</span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: medium;\">El proyecto fue formalmente presentado en noviembre de 2011 en Lima, Per????, y el 1 de marzo en la Universidad Tecnol????gica de Santiago (Utesa) en Santo Domingo. Asegura que cuenta con el respaldo del 80% de la sociedad civil dominicana, seg????n una encuesta realizada recientemente.????</span></span></p>\r\n</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', '', 0, 1, 0, 3, '2012-03-12 12:22:20', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-03-12 12:22:20', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 94, 'robots=\nauthor='),
(565, 'Presidenta Nacional ADAIC 2012-2013', 'presidenta-nacional-adaic-2012-2013', '', '<p style=\"text-align: justify;\"><span style=\"font-size: medium;\">Sra. Clarivel Jacqueline Batel Ramirez.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\">Presidenta Nacional de ADAIC 2012-2013</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><br /></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\">Estudiante de Informatica en la Universidad del Caribe.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\">Casada con el Exh. Francisco Brujan Arias</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><br /></span></p>\r\n<p style=\"text-align: justify;\"><strong><span style=\"font-size: medium;\">Madre de 4 hijos:</span></strong></p>\r\n<p style=\"text-align: justify;\"><em><span style=\"font-size: medium;\">Isis Jafreizi (11 a????os)</span></em></p>\r\n<p style=\"text-align: justify;\"><em><span style=\"font-size: medium;\">Franyelis Yeliza (8 a????os)</span></em></p>\r\n<p style=\"text-align: justify;\"><em><span style=\"font-size: medium;\">Fraider Joelfri (5 a????os)</span></em></p>\r\n<p style=\"text-align: justify;\"><em><span style=\"font-size: medium;\">Jilfrandy Francisco (4 A????os)</span></em></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\"><br /></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: medium;\">Miembro de la Iglesia Evangelica Fraternal, Pastor Federico Claudio Alvarez, Circuito San Cristobal Centro</span></p>', '', 0, 1, 0, 1, '2012-10-24 16:08:38', 63, '', '2012-10-24 16:16:00', 63, 0, '0000-00-00 00:00:00', '2012-10-24 16:08:38', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 11, 'robots=\nauthor='),
(566, 'Noche de Hot Dogs ADAIC 2012', 'noche-de-hot-dogs-adaic-2012', '', '<p style=\"text-align: justify;\"><span style=\"font-size: small;\">La Asociacion de Damas Portadoras de Luz (ADAIC) Estara realizando una noche de HotDogs.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\">Fecha: Sabado 8 de Diciembre</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\">Lugar:???? Parque de Villa Fundacion, San Cristobal Centro</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\">Precio: RD$50.00 por un HotDogs + 1 Vaso Refresco</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\"><br /></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\"><br /></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\">No te lo puedes Perder.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\"><br /></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\"><br /></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\">Esta Actividad es Profondo de la Sociedad de Damas.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\"><br /></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: small;\">Invita: Clarivel J. Batel R. (Presidenta Nacional ADAIC 2012-2013)<br /></span></p>', '', 0, 4, 0, 10, '2012-11-22 15:30:40', 70, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-11-22 15:30:40', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 1, 'robots=\nauthor='),
(567, 'Cumplea????os Jose Elias Victorino', 'cumpleanos-jose-elias-victorino', '', '<p>Invitamos a Todo AJAIC a celebrar el cumplea????o numero 18 de Jose Elias Victorino....</p>\r\n<p>gmmandgf ]akognask[od gi0oaskjdgkasdfg adskjof spld.g,maijpsdb[d</p>\r\n<p>f,;ln asdfkmgn asdgfaspldfkaskodbngfkpalkjgfkjsadg as???????ldgkoaibgkaskdgkjabsvduiogfkasdkbgfasdkpasodhiadsokoadskbgiasdg</p>\r\n<p>dskgjdskjgioasdj</p>', '', 0, 6, 0, 12, '2012-12-04 02:16:42', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-12-04 02:16:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(568, 'Taller pastoral ', 'taller-pastoral-', '', '<p style=\"text-align: justify;\"><span style=\"font-size: small;\">taller pastoral 14 y 15 de diciembre en micma escondido bani </span></p>', '', 0, 1, 0, 3, '2012-12-04 02:35:58', 79, '', '2012-12-04 02:40:32', 79, 0, '0000-00-00 00:00:00', '2012-12-04 02:35:58', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 2, '', '', 0, 1, 'robots=\nauthor='),
(572, 'Sexag????sima Novena Convenci????n Nacional', 'sexagesima-novena-convencion-nacional', '', '<p style=\"text-align: center;\"><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\">A TODA LA FAMILIA AICIE?????A</span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\"> </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\">Se les  informa que nuestra Sexag????sima Novena Convenci????n Nacional del Distrito  Republica Dominicana, con el tema: \"RETENIENDO LA SANA DOCTRINA\", ser????  celebrada los dias 20 al 23 de Mayo 2015, en el Centro Conferencial  MICMAS, en Escondido, Ban????.</span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\"> </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\">El Derecho a Convenci????n es de RD$ 900.</span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\"> </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\">Este a????o se estar????n realizando las Elecciones del Comite Ejecutivo para el Periodo 2015-2017.</span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\"> </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\">Les Esperamos.</span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\"> </span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\"> </span></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\"><br /></span></span></p>\r\n<p><span style=\"font-family: verdana,geneva;\"><span style=\"font-size: large;\"><span id=\"es-RVR1960-29765\"><span style=\"color: #000000; font-size: 16px; line-height: 24px;\"><span style=\"font-size: large;\">Porque vendr???? tiempo cuando no sufrir????n la sana doctrina, sino que teniendo comez????n de o????r, se amontonar????n maestros conforme a sus propias concupiscencias</span></span><span style=\"font-family: verdana, geneva;\"> </span><span style=\"font-size: small;\">(2 Timoteo 4:3 RV1960)</span><br /></span></span></span></p>', '', 1, 2, 0, 15, '2015-03-31 20:30:13', 63, '', '2016-05-10 13:39:36', 63, 0, '0000-00-00 00:00:00', '2015-03-31 20:30:13', '2016-05-09 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 2, '', '', 0, 24, 'robots=\nauthor='),
(569, 'Sexag????sima S????ptima Convenci????n General', 'sexagesima-septima-convencion-general', '', '<p style=\"text-align: center;\">????</p>\r\n<p style=\"text-align: center;\">A TODA LA FAMILIA AICIE?????A</p>\r\n<p style=\"text-align: center;\">????</p>\r\n<p style=\"text-align: justify;\">Se les informa que nuestra Sexag????sima S????ptima Convenci????n Nacional del Distrito Rep[ublica Dominicana, con el tema: A????o de Expansi????n y Cosecha\", ser???? celebrada los dias 22 al 25 de Mayo 2013, en el Centro Conferencial MICMAS, en Escondido, Ban????.</p>\r\n<p style=\"text-align: justify;\">El Derecho a Convenci????n es de RD$ 900.</p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\">Este a????o se estar????n realizando las Elecciones del Comite Ejecutivo para el Periodo 2013-2015.</p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\">Les Esperamos.</p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">Mensaje del Supervisor</span></p>\r\n<p style=\"text-align: justify;\">Cuando Dios nos llama para trabajar en su obra se sienten cargas; una de ellas es la Expansi????n de su palabra para que luego podamos RECOGER los Frutos.</p>\r\n<p style=\"text-align: justify;\">Expansi????n es????<span style=\"color: #000000; font-family: Arial; font-size: 13px; line-height: normal;\">Ampliaci????n o dilataci????n de algo para que ocupe m????s espacio.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"color: #000000; font-family: Arial; font-size: 13px; line-height: normal;\">En nuestro Distrito (Republica Dominicana) la AIC tiene que seguir Ampliandose en los pueblos donde aun no tenemos iglesias fundadas. </span></p>\r\n<p style=\"text-align: justify;\"><span style=\"color: #000000; font-family: Arial; font-size: 13px; line-height: normal;\">Creemos que este es el a????o de lograr ????dicha Expansion.</span></p>', '', 0, 1, 0, 3, '2013-05-15 15:01:42', 63, '', '2016-05-10 13:40:11', 63, 0, '0000-00-00 00:00:00', '2013-05-15 15:01:42', '2016-05-03 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 426, 'robots=\nauthor='),
(570, 'Sexag????sima S????ptima Convenci????n General', 'sexagesima-septima-convencion-general', '', '<p style=\"text-align: center;\">????</p>\r\n<p style=\"text-align: center;\">A TODA LA FAMILIA AICIE?????A</p>\r\n<p style=\"text-align: center;\">????</p>\r\n<p style=\"text-align: justify;\">Se les informa que nuestra Sexag????sima S????ptima Convenci????n Nacional del Distrito Rep[ublica Dominicana, con el tema: A????o de Expansi????n y Cosecha\", ser???? celebrada los dias 22 al 25 de Mayo 2013, en el Centro Conferencial MICMAS, en Escondido, Ban????.</p>\r\n<p style=\"text-align: justify;\">El Derecho a Convenci????n es de RD$ 900.</p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\">Este a????o se estar????n realizando las Elecciones del Comite Ejecutivo para el Periodo 2013-2015.</p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\">Les Esperamos.</p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: justify;\">????</p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\">Mensaje del Supervisor</span></p>\r\n<p style=\"text-align: justify;\">Cuando Dios nos llama para trabajar en su obra se sienten cargas; una de ellas es la Expansi????n de su palabra para que luego podamos RECOGER los Frutos.</p>\r\n<p style=\"text-align: justify;\">Expansi????n es????<span style=\"color: #000000; font-family: Arial; font-size: 13px; line-height: normal;\">Ampliaci????n o dilataci????n de algo para que ocupe m????s espacio.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"color: #000000; font-family: Arial; font-size: 13px; line-height: normal;\">En nuestro Distrito (Republica Dominicana) la AIC tiene que seguir Ampliandose en los pueblos donde aun no tenemos iglesias fundadas. </span></p>\r\n<p style=\"text-align: justify;\"><span style=\"color: #000000; font-family: Arial; font-size: 13px; line-height: normal;\">Creemos que este es el a????o de lograr ????dicha Expansion.</span></p>', '', 0, 5, 0, 11, '2013-05-15 15:01:42', 63, '', '2013-05-29 02:11:27', 63, 0, '0000-00-00 00:00:00', '2013-05-15 15:01:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 1, '', '', 0, 268, 'robots=\nauthor='),
(571, 'Sexagesima Octava Convencion Nacional', 'sexagesima-octova-convencion-nacional', '', '<p style=\"text-align: center;\"><span style=\"font-size: x-large;\">A TODA LA FAMILIA AICIE?????A</span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: large;\"> </span></p>\r\n<p><span style=\"font-size: large;\"> </span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: large;\">Se les informa que nuestra Sexag????sima Octava Convenci????n Nacional del Distrito Republica Dominicana ser???? celebrada los dias 21 al 24 de  Mayo 2014, en el Centro Conferencial MICMAS, en Escondido, Ban????.</span></p>\r\n<p><span style=\"font-size: large;\"> </span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: large;\">El Derecho a Convenci????n es de RD$ 900.</span></p>\r\n<p><span style=\"font-size: large;\"> </span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: large;\"> </span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: large;\">Les Esperamos.....No te la puedes Perder.....No dejes que te lo cuenten....</span></p>', '', 0, 2, 0, 15, '2014-04-30 01:44:58', 63, '', '2016-05-10 13:39:57', 63, 0, '0000-00-00 00:00:00', '2014-04-30 01:44:58', '2016-05-03 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 4, '', '', 0, 30, 'robots=\nauthor='),
(573, 'Septuag????sima Convenci????n Nacional', 'septuagesima-convencion-nacional', '', '<p style=\"font-size: 12.16px; line-height: 15.808px; text-align: center;\"><span style=\"font-family: verdana, geneva;\"><span style=\"font-size: large;\"><span style=\"font-family: helvetica;\">A TODA LA FAMILIA AICIE?????A</span></span></span></p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px;\"><span style=\"font-family: verdana, geneva;\"><span style=\"font-size: large;\"><span style=\"font-family: helvetica;\"> </span></span></span></p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px; text-align: center;\"><span style=\"font-family: helvetica;\"><span style=\"font-size: large;\">Se les informa que nuestra Septuag????sima Convenci????n Nacional del Distrito Republica Dominicana, con el tema:</span><span style=\"font-size: large; line-height: 15.808px;\">\"RESTAURANDO EL ALTAR FAMILIAR\", ser???? celebrada los dias 25 al 28 de Mayo 2016, en el Centro Conferencial MICMAS, en Escondido, Ban????.</span></span></p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px; text-align: center;\"><span style=\"font-family: helvetica;\"><span style=\"font-size: large; line-height: 15.808px;\"> </span><span style=\"font-size: large; line-height: 15.808px;\">El Derecho a Convenci????n es de RD$ 1000.</span></span></p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px; text-align: center;\"><span style=\"font-family: verdana, geneva;\"><span style=\"font-size: large;\"><span style=\"font-family: tahoma, arial, helvetica, sans-serif;\"> </span></span></span></p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px; text-align: center;\"><span style=\"font-family: helvetica;\"><br /></span></p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px;\"><span style=\"font-family: verdana, geneva;\"><span style=\"font-size: large;\"><span style=\"font-family: helvetica;\"> </span></span></span></p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px; text-align: justify;\"><span style=\"font-family: verdana, geneva;\"><span style=\"font-size: large;\"><span style=\"font-family: helvetica;\">Les Esperamos.</span></span></span></p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px;\"><span style=\"font-family: verdana, geneva;\"><span style=\"font-size: large;\"><span style=\"font-family: helvetica;\"> </span></span></span></p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px;\"><span style=\"font-family: verdana, geneva;\"><span style=\"font-size: large;\"><span style=\"font-family: helvetica;\"> </span></span></span></p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px; text-align: justify;\">????</p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px; text-align: center;\"><span style=\"font-size: large; color: #000000; line-height: 24px; font-family: helvetica;\">Entonces dijo El????as a todo el pueblo: Acercaos a m????. Y todo el pueblo se le acerc????; y ????l arregl???? el altar de Jehov???? que estaba arruinado.</span></p>\r\n<p style=\"font-size: 12.16px; line-height: 15.808px; text-align: center;\"><span style=\"font-family: helvetica;\"><span style=\"color: #000000; line-height: 24px;\"><span style=\"font-size: large;\"> </span></span></span><span style=\"font-family: helvetica; font-size: large; line-height: 15.808px;\">(1 REYES 18:30 RV1960)</span></p>', '', 1, 2, 0, 15, '2016-05-10 13:36:45', 72, '', '2016-05-10 14:54:25', 63, 0, '0000-00-00 00:00:00', '2016-05-10 10:36:45', '2016-09-30 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 12, 0, 1, 'convencion aicrd', '', 0, 3, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_content_frontpage`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_content_frontpage`;
CREATE TABLE `aicrd_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_content_frontpage`
--

INSERT INTO `aicrd_content_frontpage` (`content_id`, `ordering`) VALUES
(560, 2),
(573, 1);

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_content_rating`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_content_rating`;
CREATE TABLE `aicrd_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `rating_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_core_acl_aro`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_core_acl_aro`;
CREATE TABLE `aicrd_core_acl_aro` (
  `id` int(11) NOT NULL,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_core_acl_aro`
--

INSERT INTO `aicrd_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0),
(11, 'users', '63', 0, 'Francisco Brujan Arias', 0),
(18, 'users', '70', 0, 'Clarivel J Batel R', 0),
(13, 'users', '65', 0, 'Isis Jafreisis Brujan', 0),
(20, 'users', '72', 0, 'Fatima Beriguete Gonzalez', 0),
(19, 'users', '71', 0, 'Miguel Ramon De Leon De Jesus', 0),
(21, 'users', '73', 0, 'Jose Ariel Caro Lopez', 0),
(22, 'users', '74', 0, 'Jose Elias Victorino', 0),
(23, 'users', '75', 0, 'Esther Candelario', 0),
(24, 'users', '76', 0, 'Anny Elizabeth Santos', 0),
(25, 'users', '77', 0, 'Jose', 0),
(26, 'users', '78', 0, 'Rev. Cecilia Ruiz De Vizcaino.', 0),
(27, 'users', '79', 0, 'Benita Rosario', 0),
(28, 'users', '80', 0, 'Josias Montero Vargas', 0),
(29, 'users', '81', 0, 'PASTOR TOMAS PERALTA', 0),
(30, 'users', '82', 0, 'nicor odalis castillo', 0),
(31, 'users', '83', 0, 'Julio De la Rosa', 0),
(32, 'users', '84', 0, 'miguel angel mosquea', 0),
(33, 'users', '85', 0, 'Aristides D Heredia S', 0),
(34, 'users', '86', 0, 'ernesto montero pe????a', 0),
(35, 'users', '87', 0, 'Jose Rom????n Gonzalez Castillo', 0),
(36, 'users', '88', 0, 'Jose Roman Gonzalez', 0),
(37, 'users', '89', 0, 'Jose Manuel Aquino Perez', 0),
(38, 'users', '90', 0, 'Jovanny Marte', 0),
(39, 'users', '91', 0, 'lisanna reyes', 0),
(40, 'users', '92', 0, 'JOSE MONTERO VARGAS', 0),
(41, 'users', '93', 0, 'Ana morales', 0),
(42, 'users', '94', 0, 'JACQUELINE GARCIA', 0),
(43, 'users', '95', 0, 'ODALIS GARCIA', 0),
(44, 'users', '96', 0, 'Rosa Arias P????rez', 0),
(46, 'users', '98', 0, 'Danielsasy', 0),
(47, 'users', '99', 0, 'ricardo', 0),
(48, 'users', '100', 0, 'DANIEL PE?????ALO', 0),
(50, 'users', '102', 0, 'joel medina', 0),
(51, 'users', '103', 0, 'Kelin Espinal', 0),
(52, 'users', '104', 0, 'MableLoxy', 0),
(53, 'users', '105', 0, 'Lidys ESther Ramirez Jimenez', 0),
(54, 'users', '106', 0, 'ROSAURA QUEZADA', 0),
(55, 'users', '107', 0, 'Marco Antonio', 0),
(84, 'users', '136', 0, 'Stevelstus', 0),
(57, 'users', '109', 0, 'E.J. Arg????elles', 0),
(58, 'users', '110', 0, 'uvojaroyenaze', 0),
(85, 'users', '137', 0, 'Ram????n Reyes', 0),
(61, 'users', '113', 0, 'yafihecove', 0),
(62, 'users', '114', 0, 'oteduzehepj', 0),
(63, 'users', '115', 0, 'wuzuvito', 0),
(83, 'users', '135', 0, 'rickybettis98117', 0),
(65, 'users', '117', 0, 'oogadaputesig', 0),
(87, 'users', '139', 0, 'Jorge Mulet Ricardo', 0),
(79, 'users', '131', 0, '76561004', 0),
(68, 'users', '120', 0, 'oluqogoitay', 0),
(80, 'users', '132', 0, 'Yerenia sime', 0),
(81, 'users', '133', 0, 'Wilchencuse', 0),
(72, 'users', '124', 0, 'ubihohifah', 0),
(86, 'users', '138', 0, 'David Clase', 0),
(82, 'users', '134', 0, 'Georlowl', 0),
(77, 'users', '129', 0, 'ounulonal', 0),
(78, 'users', '130', 0, 'Cristhian Rafael Solano Gonz????lez', 0),
(88, 'users', '140', 0, 'Israel Juarbe', 0),
(89, 'users', '141', 0, 'ChestHaimunc', 0),
(90, 'users', '142', 0, 'JamArtibly', 0),
(91, 'users', '143', 0, 'Thomsuics', 0),
(92, 'users', '144', 0, 'kelvin ventura', 0);

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_core_acl_aro_groups`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_core_acl_aro_groups`;
CREATE TABLE `aicrd_core_acl_aro_groups` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_core_acl_aro_groups`
--

INSERT INTO `aicrd_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_core_acl_aro_map`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_core_acl_aro_map`;
CREATE TABLE `aicrd_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_core_acl_aro_sections`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_core_acl_aro_sections`;
CREATE TABLE `aicrd_core_acl_aro_sections` (
  `id` int(11) NOT NULL,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_core_acl_aro_sections`
--

INSERT INTO `aicrd_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_core_acl_groups_aro_map`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_core_acl_groups_aro_map`;
CREATE TABLE `aicrd_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_core_acl_groups_aro_map`
--

INSERT INTO `aicrd_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(18, '', 19),
(18, '', 21),
(18, '', 22),
(18, '', 23),
(18, '', 24),
(18, '', 25),
(18, '', 48),
(18, '', 50),
(18, '', 51),
(18, '', 52),
(18, '', 53),
(18, '', 54),
(18, '', 55),
(18, '', 57),
(18, '', 58),
(18, '', 61),
(18, '', 62),
(18, '', 63),
(18, '', 65),
(18, '', 68),
(18, '', 72),
(18, '', 77),
(18, '', 78),
(18, '', 79),
(18, '', 80),
(18, '', 81),
(18, '', 82),
(18, '', 83),
(18, '', 84),
(18, '', 85),
(18, '', 86),
(18, '', 87),
(18, '', 88),
(18, '', 89),
(18, '', 90),
(18, '', 91),
(18, '', 92),
(21, '', 26),
(21, '', 28),
(21, '', 29),
(21, '', 30),
(21, '', 31),
(21, '', 32),
(21, '', 33),
(21, '', 34),
(21, '', 35),
(21, '', 36),
(21, '', 37),
(21, '', 38),
(21, '', 39),
(21, '', 40),
(21, '', 41),
(21, '', 42),
(21, '', 43),
(21, '', 44),
(21, '', 46),
(21, '', 47),
(23, '', 13),
(23, '', 20),
(24, '', 18),
(25, '', 10),
(25, '', 11),
(25, '', 27);

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_core_log_items`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_core_log_items`;
CREATE TABLE `aicrd_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_core_log_searches`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_core_log_searches`;
CREATE TABLE `aicrd_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_groups`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_groups`;
CREATE TABLE `aicrd_groups` (
  `id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_groups`
--

INSERT INTO `aicrd_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_menu`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_menu`;
CREATE TABLE `aicrd_menu` (
  `id` int(11) NOT NULL,
  `menutype` varchar(75) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `componentid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `rgt` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `home` int(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_menu`
--

INSERT INTO `aicrd_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Inicio', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=0\nnum_columns=0\nnum_links=10\norderby_pri=alpha\norderby_sec=front\nmulti_column_order=1\nshow_pagination=1\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=Reteniendo la Sana Doctrina\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(2, 'mainmenu', 'Caballeros', 'acaic', 'index.php?option=com_content&view=category&layout=blog&id=17', 'component', 0, 5, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=2\nnum_columns=3\nnum_links=10\norderby_pri=alpha\norderby_sec=rdate\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=Sociedad de Caballeros\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(3, 'mainmenu', 'Damas', 'adaic', 'index.php?option=com_content&view=category&layout=blog&id=16', 'component', 0, 5, 20, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=2\nnum_columns=2\nnum_links=4\norderby_pri=alpha\norderby_sec=alpha\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=0\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=Sociedad de Damas\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(4, 'mainmenu', 'Jovenes', 'ajaic', 'index.php?option=com_content&view=category&layout=blog&id=18', 'component', 0, 5, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(5, 'mainmenu', 'Asociaciones', 'asociaciones', 'index.php?option=com_content&view=section&id=11', 'component', 1, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=1\nshow_cat_num_articles=1\nshow_category_description=1\norderby=\norderby_sec=\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=0\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=1\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(6, 'mainmenu', 'Juveniles', 'ajuvaic', 'index.php?option=com_content&view=category&layout=blog&id=20', 'component', 0, 5, 20, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(7, 'mainmenu', 'Ninos', 'anaic', 'index.php?option=com_content&view=category&layout=blog&id=19', 'component', 0, 5, 20, 1, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(8, 'mainmenu', 'Departamentos', 'departamentos', 'index.php?option=com_content&view=section&layout=blog&id=13', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=0\nnum_links=20\norderby_pri=\norderby_sec=alpha\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=0\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(9, 'mainmenu', 'Mundo AIC', 'mundo-aic', 'index.php?option=com_content&view=section&id=2', 'component', 1, 0, 20, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\norderby=\norderby_sec=\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(10, 'mainmenu', 'Preguntas Frecuentes', 'preguntas-frecuentes', 'index.php?option=com_content&view=section&id=2', 'component', 0, 0, 20, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\norderby=\norderby_sec=\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(11, 'mainmenu', 'Escuela Biblica', 'escuela-biblica', 'index.php?option=com_content&view=category&layout=blog&id=21', 'component', 1, 17, 20, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(12, 'mainmenu', 'Instituto Teologico', 'instituto-teologico', 'index.php?option=com_content&view=category&layout=blog&id=23', 'component', 1, 17, 20, 2, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(13, 'mainmenu', 'Escuela de Ministerios', 'escuela-de-ministerios', 'index.php?option=com_content&view=category&layout=blog&id=22', 'component', 1, 17, 20, 2, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(14, 'mainmenu', 'Cuerpo de Cadetes', 'cuerpo-de-cadetes', 'index.php?option=com_content&view=category&layout=blog&id=24', 'component', 0, 5, 20, 1, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(15, 'mainmenu', 'Circuitos', 'circuitos', 'index.php?option=com_content&view=section&id=14', 'component', 1, 0, 20, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=1\nshow_cat_num_articles=1\nshow_category_description=1\norderby=alpha\norderby_sec=alpha\nshow_feed_link=1\nshow_noauth=\nshow_title=1\nlink_titles=\nshow_intro=\nshow_section=0\nlink_section=\nshow_category=1\nlink_category=\nshow_author=0\nshow_create_date=1\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=1\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(16, 'mainmenu', 'Iglesias', 'iglesias', 'index.php?option=com_content&view=section&layout=blog&id=14', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=1\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=2\nnum_columns=0\nnum_links=20\norderby_pri=alpha\norderby_sec=alpha\nmulti_column_order=0\nshow_pagination=1\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=0\nlink_section=\nshow_category=0\nlink_category=\nshow_author=1\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=Listado de Iglesias\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(17, 'mainmenu', 'Educaci????n', 'educacion', 'index.php?option=com_content&view=section&id=15', 'component', 1, 8, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\norderby=\norderby_sec=\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(18, 'mainmenu', 'Misiones', 'misiones', 'index.php?option=com_content&view=section&id=16', 'component', 1, 8, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\norderby=\norderby_sec=\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_menu_types`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_menu_types`;
CREATE TABLE `aicrd_menu_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `menutype` varchar(75) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_menu_types`
--

INSERT INTO `aicrd_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Men???? principal', 'Este es el men???? principal del sitio');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_messages`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_messages`;
CREATE TABLE `aicrd_messages` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `user_id_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id_to` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `folder_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) UNSIGNED NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_messages`
--

INSERT INTO `aicrd_messages` (`message_id`, `user_id_from`, `user_id_to`, `folder_id`, `date_time`, `state`, `priority`, `subject`, `message`) VALUES
(106, 63, 62, 0, '2011-05-13 02:45:41', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Medios Masivos de Comunicaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(84, 72, 65, 0, '2011-05-05 15:21:41', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ Fati Beri ], con el t????tulo: [ 65ta. Convenci????n Nacional ], en la secci????n: [ noticias ] y en la categor????a: [ nacionales ]'),
(82, 72, 62, 0, '2011-05-05 15:21:41', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ Fati Beri ], con el t????tulo: [ 65ta. Convenci????n Nacional ], en la secci????n: [ noticias ] y en la categor????a: [ nacionales ]'),
(85, 63, 62, 0, '2011-05-12 17:04:26', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Rese????a Hist????rica del Departamento de Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(87, 63, 65, 0, '2011-05-12 17:04:26', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Rese????a Hist????rica del Departamento de Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(88, 63, 62, 0, '2011-05-12 17:06:43', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Visi????n Departamento Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(90, 63, 65, 0, '2011-05-12 17:06:43', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Visi????n Departamento Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(91, 63, 62, 0, '2011-05-12 17:07:53', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Misi????n Departamento Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(93, 63, 65, 0, '2011-05-12 17:07:53', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Misi????n Departamento Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(94, 63, 62, 0, '2011-05-12 17:09:38', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Fundamentos Departamento Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(96, 63, 65, 0, '2011-05-12 17:09:38', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Fundamentos Departamento Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(97, 63, 62, 0, '2011-05-12 17:10:34', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Objetivos Departamento Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(99, 63, 65, 0, '2011-05-12 17:10:34', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Objetivos Departamento Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(100, 63, 62, 0, '2011-05-12 17:15:11', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Estructura Administrativa Departamento Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(102, 63, 65, 0, '2011-05-12 17:15:11', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Estructura Administrativa Departamento Educaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(103, 63, 62, 0, '2011-05-12 17:21:16', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Programa de Becas Hijos de Pastores ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(105, 63, 65, 0, '2011-05-12 17:21:16', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Programa de Becas Hijos de Pastores ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(108, 63, 65, 0, '2011-05-13 02:45:41', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Medios Masivos de Comunicaci????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ educacion ]'),
(109, 63, 62, 0, '2011-05-13 03:02:02', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Qu???? es la Escuela de Ministerios ],  en la secci????n: [ educacion ]  y en la categor????a: [ Escuela Ministerios ]'),
(111, 63, 65, 0, '2011-05-13 03:02:02', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Qu???? es la Escuela de Ministerios ],  en la secci????n: [ educacion ]  y en la categor????a: [ Escuela Ministerios ]'),
(112, 63, 62, 0, '2011-05-13 03:05:06', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Requisitos de Admisi????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ Escuela Ministerios ]'),
(114, 63, 65, 0, '2011-05-13 03:05:06', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Requisitos de Admisi????n ],  en la secci????n: [ educacion ]  y en la categor????a: [ Escuela Ministerios ]'),
(115, 63, 62, 0, '2011-05-13 03:13:13', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Qu???? es ITAIC ],  en la secci????n: [ educacion ]  y en la categor????a: [ itaic ]'),
(117, 63, 65, 0, '2011-05-13 03:13:13', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Qu???? es ITAIC ],  en la secci????n: [ educacion ]  y en la categor????a: [ itaic ]'),
(118, 63, 62, 0, '2011-05-13 03:38:51', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Rese????a Hist????rica ],  en la secci????n: [ Educaci????n ]  y en la categor????a: [ Instituto Teol????gico ]'),
(120, 63, 65, 0, '2011-05-13 03:38:51', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Rese????a Hist????rica ],  en la secci????n: [ Educaci????n ]  y en la categor????a: [ Instituto Teol????gico ]'),
(121, 63, 62, 0, '2011-05-13 03:58:28', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Requisitos Nuevo Ingreso ITAIC ],  en la secci????n: [ Educaci????n ]  y en la categor????a: [ Instituto Teol????gico ]'),
(123, 63, 65, 0, '2011-05-13 03:58:28', 0, 0, 'Nuevo art????culo', 'Un nuevo art????culo ha sido enviado por [ fbrujan ], con el t????tulo: [ Requisitos Nuevo Ingreso ITAIC ],  en la secci????n: [ Educaci????n ]  y en la categor????a: [ Instituto Teol????gico ]');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_messages_cfg`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_messages_cfg`;
CREATE TABLE `aicrd_messages_cfg` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_migration_backlinks`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_migration_backlinks`;
CREATE TABLE `aicrd_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_modules`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_modules`;
CREATE TABLE `aicrd_modules` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_modules`
--

INSERT INTO `aicrd_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Men???? principal', '', 0, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=1\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=1\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(2, 'Acceso', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Art????culos a????adidos recientemente', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Men???? de estad????sticas', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Los mensajes no le????dos', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Usuarios Online', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Iconos r????pidos', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Usuarios identificados', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Men???? Admin', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'Estado del usuario', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'T????tulo', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(16, 'Ingreso Al Sitio', '', 2, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, 'cache=0\nmoduleclass_sfx=\npretext=\nposttext=\nlogin=1\nlogout=1\ngreeting=1\nname=1\nusesecure=0\n\n', 0, 0, ''),
(17, 'Mas Visitados', '', 2, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mostread', 0, 1, 1, 'moduleclass_sfx=\nshow_front=1\ncount=5\ncatid=\nsecid=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(18, 'De Interes', '', 0, 'bottom2', 0, '0000-00-00 00:00:00', 0, 'mod_newsflash', 0, 0, 1, 'catid=3\nlayout=default\nimage=0\nlink_titles=1\nshowLastSeparator=1\nreadmore=0\nitem_title=1\nitems=5\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(19, 'Noticias Relacionadas', '', 0, 'user1', 0, '0000-00-00 00:00:00', 1, 'mod_related_items', 0, 1, 1, 'showDate=0\nmoduleclass_sfx=\ncache_items=0\ncache_time=900\n\n', 0, 0, ''),
(20, 'Busqueda', '', 4, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_search', 0, 0, 1, 'moduleclass_sfx=\nwidth=20\ntext=Buscar....\nbutton=1\nbutton_pos=right\nimagebutton=\nbutton_text=Buscar\nset_itemid=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(21, 'Ultimas Noticias', '', 0, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_latestnews', 0, 1, 1, 'count=7\nordering=m_dsc\nuser_id=0\nshow_front=1\nsecid=\ncatid=\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(22, 'Personas en Linea', '', 3, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_whosonline', 0, 0, 1, 'cache=0\nshowmode=2\nmoduleclass_sfx=\n\n', 0, 0, ''),
(23, 'Global News', '', 0, 'bottom', 63, '2015-04-01 03:20:05', 1, 'mod_globalnews', 0, 0, 1, 'global=s\nlayout=slider\ncols=1\nmargin=2px\ncat_order=0\ncat_limit=\nempty=0\nfilter=0\ncurcat=0\ncatids=\nsecids=\ncatexc=\nsecexc=\nshow_cat=1\ncat_title=1\ncat_img_align=left\ncat_img_width=\ncat_img_height=\ncat_img_margin=3px\ncat_img_border=5\ncount=5\nordering=random\nlimittitle=150\nshow_front=0\nuser_id=0\ncurrent=1\nmore=1\nwidth=auto\nborder=1px solid #EFEFEF\nheader_color=#EFEFEF\nheader_padding=5px\nheight=100px\ncolor=#FFFFFF\npadding=5px\ndelay=9000\nnext=0\nhtml=GN_image GN_title GN_break GN_date GN_break GN_text GN_readmore\nlimittext=150\ntext=0\nstriptext=1\nallowedtags=\ndate_format=\ndate=created\nitem_img_align=left\nitem_img_width=150\nitem_img_height=200\nitem_img_margin=3px\nitem_img_border=0\nauthor=username\ncb_link=0\ncomments_table=#__comment\narticle_column=contentid\ncache=0\ncache_time=900\nmoduleclass_sfx=\n\n', 0, 0, ''),
(24, 'Filtered News', '', 6, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_filterednews', 0, 1, 1, 'count=5\nordering=c_dsc\nshow_front=1\n@spacer=FOR THE SPECIAL CONTENT LAYOUTS...\nwidth=auto\nheight=125px\npadding=5px\ncolor=#FFFFFF\nborder=1px solid #CCCCCC\ndelay=3000\nhtml=FN_title FN_image FN_break FN_date FN_break FN_text FN_readmore\nlink_title=1\nlimittext=150\nstriptext=1\ndate=created\nitem_img_align=left\nitem_img_margin=3px\nauthor=username\ncomments_table=#__comment\narticle_column=contentid\n', 0, 0, ''),
(25, 'Ruta de Acceso', '', 0, 'top1', 0, '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 0, 0, 0, 'showHome=0\nhomeText=Home\nshowLast=1\nseparator=\nmoduleclass_sfx=\ncache=0\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_modules_menu`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_modules_menu`;
CREATE TABLE `aicrd_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_modules_menu`
--

INSERT INTO `aicrd_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(16, 0),
(17, 0),
(18, 1),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_newsfeeds`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_newsfeeds`;
CREATE TABLE `aicrd_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `cache_time` int(11) UNSIGNED NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_plugins`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_plugins`;
CREATE TABLE `aicrd_plugins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_plugins`
--

INSERT INTO `aicrd_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Autenticaci????n - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Autenticaci????n - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Autenticaci????n - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Autenticaci????n - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'Usuario - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Buscar - Contenido', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Buscar - Contactos', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Buscar - Categor????as', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Buscar - Secciones', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Buscar - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Buscar - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Contenido - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Contenido - Votar', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Contenido - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Contenido - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Contenido - Cargar m????dulo', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Contenido - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'mode=extended\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=es\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=0\nvisualchars=1\nnonbreaking=1\nblockquote=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=0\ncontextmenu=1\ninlinepopups=1\nsafari=0\ncustom_plugin=\ncustom_button=\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Bot????n - Imagen', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Bot????n - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Bot????n - Leer m????s', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'Sistema - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'Sistema - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'Sistema - Legado', 'legacy', 'system', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'Sistema - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'Sistema - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'Sistema - Recordarme', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'Sistema - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'System - Mootools Upgrade', 'mtupgrade', 'system', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_poll_data`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_poll_data`;
CREATE TABLE `aicrd_poll_data` (
  `id` int(11) NOT NULL,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_poll_date`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_poll_date`;
CREATE TABLE `aicrd_poll_date` (
  `id` bigint(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_poll_menu`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_poll_menu`;
CREATE TABLE `aicrd_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_polls`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_polls`;
CREATE TABLE `aicrd_polls` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_sections`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_sections`;
CREATE TABLE `aicrd_sections` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_sections`
--

INSERT INTO `aicrd_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(1, 'Noticias', '', 'noticias', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 5, ''),
(2, 'General', '', 'general', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 2, 0, 2, ''),
(4, 'Damas', '', 'damas', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 3, 0, 2, ''),
(5, 'Caballeros', '', 'caballeros', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 4, 0, 1, ''),
(6, 'Jovenes', '', 'jovenes', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 5, 0, 1, ''),
(7, 'Juveniles', '', 'juveniles', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 6, 0, 0, ''),
(8, 'ITAIC', '', 'itaic', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 7, 0, 2, ''),
(9, 'EMAIC', '', 'emaic', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 8, 0, 1, ''),
(10, 'Ninos', '', 'ninos', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 9, 0, 0, ''),
(11, 'Asociaciones', '', 'asociaciones', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 10, 0, 5, ''),
(12, 'FAQs', '', 'faqs', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 11, 0, 0, ''),
(13, 'Departamentos', '', 'departamentos', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 12, 0, 4, ''),
(14, 'Circuitos', '', 'circuitos', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 13, 0, 19, ''),
(15, 'Educaci????n', '', 'educacion', '', 'content', 'left', '<p>Departamento de Educacion Asamblea de Iglesias Cristianas, INC.</p>\r\n<p>Distrito Rep????blica Dominicana</p>', 1, 0, '0000-00-00 00:00:00', 14, 0, 7, ''),
(16, 'Misiones', '', 'misiones', '', 'content', 'left', '<p>Departamento de Misiones Asamblea de Iglesias Cristianas, INC.</p>\r\n<p>Distrito Rep????blica Dominicana</p>', 1, 0, '0000-00-00 00:00:00', 15, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_session`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Oct 24, 2017 at 02:24 PM
-- Last check: Nov 14, 2017 at 03:44 AM
--

DROP TABLE IF EXISTS `aicrd_session`;
CREATE TABLE `aicrd_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `client_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `data` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_session`
--

INSERT INTO `aicrd_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('', '(music) (music', 'cdd101f207de4bcca0c9323d584f2a93', 1, 0, '', 0, 0, '__default|a:8:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1493729254;s:18:\"session.timer.last\";i:1493729254;s:17:\"session.timer.now\";i:1493729254;s:22:\"session.client.browser\";s:72:\"Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)\";s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:1:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":19:{s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:3:\"gid\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:3:\"aid\";i:0;s:5:\"guest\";i:1;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:66:\"/home/a3980390/public_html/libraries/joomla/html/parameter/element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}}s:13:\"session.token\";s:32:\"a1c9ea708c395250c82083c2fde33696\";}'),
('', '1493729388', '59ce08ad3e8e30485d48ad5898f696e4', 1, 0, '', 0, 0, '__default|a:8:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1493729388;s:18:\"session.timer.last\";i:1493729388;s:17:\"session.timer.now\";i:1493729388;s:22:\"session.client.browser\";s:72:\"Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)\";s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:1:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":19:{s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:3:\"gid\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:3:\"aid\";i:0;s:5:\"guest\";i:1;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:66:\"/home/a3980390/public_html/libraries/joomla/html/parameter/element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}}s:13:\"session.token\";s:32:\"a04a4f650d4c028a7db31ccec776d7a1\";}'),
('', '1493729690', '5695b2ebd9a92028255457e5cf5efc38', 1, 0, '', 0, 0, '__default|a:8:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1493729690;s:18:\"session.timer.last\";i:1493729690;s:17:\"session.timer.now\";i:1493729690;s:22:\"session.client.browser\";s:72:\"Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)\";s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:1:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":19:{s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:3:\"gid\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:3:\"aid\";i:0;s:5:\"guest\";i:1;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:66:\"/home/a3980390/public_html/libraries/joomla/html/parameter/element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}}s:13:\"session.token\";s:32:\"35e01f50c7e77db8ea5913fef95068e4\";}');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_stats_agents`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_stats_agents`;
CREATE TABLE `aicrd_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_templates_menu`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_templates_menu`;
CREATE TABLE `aicrd_templates_menu` (
  `template` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_templates_menu`
--

INSERT INTO `aicrd_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('aicrd_17', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_users`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:26 PM
-- Last check: Oct 23, 2017 at 11:46 PM
--

DROP TABLE IF EXISTS `aicrd_users`;
CREATE TABLE `aicrd_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aicrd_users`
--

INSERT INTO `aicrd_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'fbrujan@gmail.com', '0fe17725b72b5bbf3828b5e1e1ee0442:qMCbsPwh8q6cq0onClLe9UMITUqLy64V', 'Super Administrator', 0, 1, 25, '2011-03-28 20:38:32', '2011-05-07 02:01:13', '', 'admin_language=es-ES\nlanguage=es-ES\neditor=\nhelpsite=http://comunidadjoomla.org\ntimezone=-4\n\n'),
(63, 'Francisco Brujan Arias', 'fbrujan', 'fbrujan@hotmail.com', '6d37052fdc1f65832190b5056551d76e:NwFXKAYFM0bE2e9jkfVaqhNqVTtSy8Y6', 'Super Administrator', 0, 1, 25, '2011-03-29 00:42:19', '2016-12-15 16:02:36', '', 'admin_language=es-ES\nlanguage=es-ES\neditor=\nhelpsite=\ntimezone=-4\n\n'),
(70, 'Clarivel J Batel R', 'cbatel', 'claribatel@hotmail.com', 'fae8c9a403c336bfdd408f1002aa8c97:7tq3AtKh4tqirh7IJxoRZp2e0tFNPmg5', 'Administrator', 0, 1, 24, '2011-04-13 02:49:47', '2012-11-22 15:36:41', '', 'language=\ntimezone=-4\nadmin_language=\neditor=\nhelpsite=\n\n'),
(65, 'Isis Jafreisis Brujan', 'jafreisis', 'isis.jafreisis@hotmail.com', '9c74a9c5b975bd0e91208245dee08613:ovumemydCIbvlaunpGzGf6rpI0cVMhji', 'Manager', 0, 1, 23, '2011-03-29 05:20:20', '2011-05-09 14:02:53', 'd19a72326c8af6dee78ddcc6d13b4315', 'language=es-ES\ntimezone=-4\nadmin_language=es-ES\neditor=tinymce\nhelpsite=http://comunidadjoomla.org\n\n'),
(71, 'Miguel Ramon De Leon De Jesus', 'felix', 'felixdl2010@hotmail.com', '6429cfbd16c97aa9c2b6648372e3e9e7:ReGMDJK72ParUcxOqFQFJqNfQJAqEhAP', 'Registered', 0, 0, 18, '2011-04-18 01:25:14', '2011-04-28 22:22:05', '73e657444d4b4a62a4e9733ed77337fc', 'language=es-ES\ntimezone=-4\n\n'),
(72, 'Fatima Beriguete Gonzalez', 'Fati Beri', 'lanegra0513@hotmail.com', 'cd80edbcc10ed7bbbb55d1539e7775f4:rc2bSXg4usIm7VUTtuzLVp7Fi76ekxbV', 'Manager', 0, 0, 23, '2011-05-05 14:47:26', '2011-10-19 19:35:25', '', 'language=es-ES\ntimezone=-4\nadmin_language=\neditor=tinymce\nhelpsite=\n\n'),
(73, 'Jose Ariel Caro Lopez', 'Jose Ariel Caro Lopez', 'elatalayaadorador.18.es@hotmail.com', '2ff2971b73ebf6f7c3940c7e02d9c2a2:HXwnqST7qFJjZOh6cn5fOmDpyu6eSMXw', 'Registered', 0, 0, 18, '2011-05-13 20:58:15', '0000-00-00 00:00:00', '1aab06c396f1535f42f44a82e2eee0b2', '\n'),
(74, 'Jose Elias Victorino ', 'eliasv', 'elias20_11@hotmail.es', '26978d9dd2442f08d1d27f8e2500500b:3sMy8ieYBl9mQgXxaUF5aijyXehzA0tP', 'Registered', 0, 0, 18, '2011-05-15 16:35:34', '2012-12-04 02:30:39', '3ba7e5784ab6e0c760da506479ec5670', 'language=\ntimezone=0\n\n'),
(75, 'Esther Candelario', 'esther', 'esthercandelario@hotmail.com', '96ad2c9d1b86769e60a6fe6065d98bc1:fbAMq86V6agvC2rxfLxHp04Cic9WmzGI', 'Registered', 0, 0, 18, '2011-05-18 17:58:21', '0000-00-00 00:00:00', '1c6207e17212b8fa742c762d02905dab', '\n'),
(76, 'Anny Elizabeth Santos', 'annysantos', 'acacia40@hotmail.com', '8ba14324504550e35d449c3609ea7c0a:uu0dqirD7LGX4696D6Qnu8w7p4nYdej7', 'Registered', 0, 0, 18, '2011-06-22 00:31:15', '0000-00-00 00:00:00', '19980ba5e7373c58fcb94e8030ec1413', '\n'),
(77, 'Jose', 'Ariel', 'ariel-lopez1818@hotmail.com', 'f8750fc30d6b5b89b407b5def562c34d:pVJIpbXhUw45VSePB9OWHDS4dDiu7Rkj', 'Registered', 0, 0, 18, '2011-10-01 22:13:30', '2011-10-03 02:50:52', 'fb536e188e3503733b6eaa6b5c43756e', 'language=\ntimezone=0\n\n'),
(78, 'Rev. Cecilia Ruiz De Vizcaino.', 'Sec. Ministerial', 'pastoraceciliaruiz@hotmail.com', 'd0ee0848d5fe9a1045b018c58ebf6e9b:oTKlDysV6WRaHSJzEVtebbAXvwyOP6ic', 'Publisher', 0, 0, 21, '2012-11-29 16:59:16', '0000-00-00 00:00:00', '15bd68732480459be137b40bd1754470', '\n'),
(79, 'Benita Rosario', 'rosariop', 'benita_rosario@hotmail.com', 'd9a958d31c7b8a2294fabd20544b705f:5smea5ciZua1MjHoncHlFMtvWgxK162Q', 'Super Administrator', 0, 0, 25, '2012-12-04 02:03:27', '2012-12-11 13:39:57', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(80, 'Josias Montero Vargas', 'SiervoFiel002', 'el-notario@hotmail.com', 'd0160dd0dcb13fb2d601b86c2c3333a5:zM1sRpRGYsf5V4rwfWOzxepRFHZoiEfq', 'Publisher', 0, 0, 21, '2013-04-02 23:10:46', '2013-04-02 23:22:31', '', '\n'),
(81, 'PASTOR TOMAS PERALTA', 'PASTOR PERALTA', 'thomasperalta27@yahoo.es', '079e63ae1f29acced5da8fd74c389354:1aR2RZPKIRKGuLmJ6TtFBqxkMcsgAZ2V', 'Publisher', 1, 0, 21, '2013-05-26 14:35:40', '0000-00-00 00:00:00', '', '\n'),
(82, 'nicor odalis castillo', 'nicor', 'nicor881129@hotmail.com', 'a5afee52f66a52aaa369e97477008f8a:GXNk6W54kOAESAvbq7GRzH7nYm7BB9DL', 'Publisher', 0, 0, 21, '2013-05-27 12:55:30', '2013-07-17 22:00:38', '2de5c15cf737a95a636e32fdaafc6408', '\n'),
(83, 'Julio De la Rosa', 'julio777', 'iglesiaebenezer77@hotmail.com', '8012b21d53326ae95c528f97994a8929:zn91ggpfghAdwjNMXkAfdIg6QfqATAKn', 'Publisher', 0, 0, 21, '2013-05-27 18:01:08', '2016-01-06 14:47:46', '', '\n'),
(84, 'miguel angel mosquea', 'miguel angel mosquea', 'mosqueamiguelangel@gmail.com', 'd64438c34d0de8102a93bc4742484eb3:G7U3o6SXjFMJQVy6nAKtQXyjnpYZYISp', 'Publisher', 1, 0, 21, '2013-05-28 23:26:29', '0000-00-00 00:00:00', '96a7f39b4294183eae35d6c4ffdbd891', '\n'),
(85, 'Aristides D Heredia S', 'Aristides', 'aristidesheredia@hotmail.com', '20f0a6e9e1bbb659f5e83ca3d6a2cb9a:boK6PD7uSsEcTA4QSqLyFulecZlGu631', 'Publisher', 0, 0, 21, '2013-07-16 15:36:17', '2013-07-16 15:37:46', '', '\n'),
(86, 'ernesto montero pe????a', 'emontero@unevol.cu', 'emontero@unevol.cu', '42783fb66fd1c950a74aee99df0065c8:Z6sZyC0lCMszmvEiDcImUt7Uersup5zm', 'Publisher', 0, 0, 21, '2013-09-08 17:13:10', '0000-00-00 00:00:00', '', '\n'),
(87, 'Jose Rom????n Gonzalez Castillo', 'roman92', 'roman_9241@hotmail.com', '1479e7452699fa50636598ef9df7622c:1LrpabIDUp4FHQnhnoc0GTzD7yr7t0Yz', 'Publisher', 0, 0, 21, '2013-10-13 03:13:18', '0000-00-00 00:00:00', 'af052a34a81bbd1673b7a6036b337b9e', '\n'),
(88, 'Jose Roman Gonzalez ', 'jose92', 'joseroman_9241@hotmail.com', '85607802a05083d48ca8fe5870b83576:goEhxoIK7AI4UMzquWE4RcQ7jR5q9HCM', 'Publisher', 0, 0, 21, '2013-10-13 03:31:07', '2015-02-05 05:29:11', '', '\n'),
(89, 'Jose Manuel Aquino Perez', 'vaso de Jehova', 'aquinojose.manuel@gmail.com', '4b2161fc75fe104283644917428f3901:JkSmPWJYp8TbQG0LmiwTArxbd8xWztJa', 'Publisher', 1, 0, 21, '2013-11-17 17:59:15', '2013-11-17 18:03:52', '', '\n'),
(90, 'Jovanny Marte', 'Jmarte', 'jovanny23@hotmail.com', '703e9936b982a80e987c1e0d29bb88fb:X5VTHQ5ZOS9zx4hyS0qMd8XGYelGqdKo', 'Publisher', 0, 0, 21, '2013-11-18 19:35:31', '0000-00-00 00:00:00', 'edbf1fd24573aa0989a76cbe2974b482', '\n'),
(91, 'lisanna reyes ', 'eridania', 'eri300992@hotmail.com', '076a5ce2acc36ab7994ae94ca8fc1520:huaUiIVpEp11nbuEjSx6aiVxlMy1x5wV', 'Publisher', 0, 0, 21, '2014-01-03 15:53:27', '2014-01-11 19:11:36', '', '\n'),
(92, 'JOSE MONTERO VARGAS', 'JOSE', 'DJDAVIKYNG@HOTMAIL.COM', 'fbdc24bae589ea0c5f58e28f67964f5e:FNEnIaLWUXnHJB8fbdU0KPSqE2lVDqu3', 'Publisher', 1, 0, 21, '2014-03-29 15:59:51', '0000-00-00 00:00:00', '18bb0712dd966e6d2aec297c459676b4', '\n'),
(93, 'Ana morales', 'Ana morales', 'Witamorales@yahoo.com', '51481f4e7fe95c17d9904db77bf646f8:YEsFYK570bOPdckAt9RCtMegM2dOT2Wn', 'Publisher', 0, 0, 21, '2014-04-15 21:34:08', '0000-00-00 00:00:00', '83d22e442632675d04c3c4e729162b95', '\n'),
(94, 'JACQUELINE GARCIA', 'JACQUE 1526', 'jacqueline7726@hotmail.com', '5dfc5bfbb28ea59924fdd0f8ccba4972:nptd6p9QYvmzuslCuOVovHuh3n9rr1hG', 'Publisher', 0, 0, 21, '2014-04-23 19:07:26', '0000-00-00 00:00:00', '0c232f4823b180b55ac933ecbb383446', '\n'),
(95, 'ODALIS GARCIA', 'ODA1526', 'jacquelinegarcia777@hotmail.com', 'e377812e441dc722332b001bc078bfe6:jmNbH1JnP7iiCX5KlWLozBqJKQCXXGp0', 'Publisher', 0, 0, 21, '2014-04-23 19:22:26', '2015-03-26 00:29:13', '', '\n'),
(96, 'Rosa Arias P????rez', 'Rosa Arias', 'rosayinairis@hotmail.com', '4e79b3fa19325acbfc0a655e91b93fa1:FsnWXf1sDoiY7ykCpIqXO5Vgq21pfRDz', 'Publisher', 0, 0, 21, '2014-04-24 19:23:57', '0000-00-00 00:00:00', '939dc34fd7ec62f2a3e3957c4d6e487f:$1$964f43a8$', '\n'),
(98, 'Danielsasy', 'Danielsasy', 'danieldorke@outlook.com', '7fcce438b260143fd2c961b031fba821:lcMaoeDlyDOgTTmQ1ITMFllE6pUYKfzu', 'Publisher', 0, 0, 21, '2015-03-01 22:16:42', '0000-00-00 00:00:00', '0aefc04cc2369ed3431406734d59785c', '\n'),
(99, 'ricardo', 'rafael ', 'el_clinico09@hotmail.com', 'f93ac08bc0deec7083d1da54aef64a48:b4cB2aWTQcHxNEGHDneOK4HM948tPC7g', 'Publisher', 1, 0, 21, '2015-03-08 03:37:25', '0000-00-00 00:00:00', '232e5730f5db12ab6320ca704e1befca', '\n'),
(100, 'DANIEL PE?????ALO', 'DANIPEN', 'PENALOD@GMAIL.COM', '0082af0b1f3a185a65662e5cc6bf7b55:TxjB1aXz4FeJtDhk1fdBM4NMwChE4akR', 'Registered', 0, 0, 18, '2015-04-15 22:42:29', '2015-04-15 22:48:49', '', '\n'),
(139, 'Jorge Mulet Ricardo', 'pastor.mulet', 'pastor.mulet@gmail.com', 'a8c2b3097ca2de9c84a776a0122411a9:t5ISfpLKUIoWfxho3yRIklvsV1EKhGns', 'Registered', 0, 0, 18, '2016-08-24 04:25:05', '2017-03-10 06:21:27', '', '\n'),
(102, 'joel medina', 'whoismedina', 'whoismedinas@hotmail.com', '5929426bb18b8852fb33a0beab9aebd9:32rlpMBCyWJ2f8NrR0lKZyiELbqY3hwy', 'Registered', 0, 0, 18, '2015-04-28 17:30:37', '2015-04-28 17:33:21', '', '\n'),
(103, 'Kelin Espinal', 'kespinal', 'kelinespinal@gmail.com', 'e36562fe06ff6560dcb971f95fcf1cfa:j9RZeqoXQNotNzAwL1LB9ibI8hzmph85', 'Registered', 1, 0, 18, '2015-05-11 16:30:40', '0000-00-00 00:00:00', 'e6b99cd0b3953a9bc8ed8d8c579074b0', '\n'),
(104, 'MableLoxy', 'MableLoxy', 'MableLoxy@mngr5.xzzy.info', '76baa994a189b031437caecd74db8b93:X4rNweqtJ1QHxYqGIfT16XrdiNtUyiUf', 'Registered', 0, 0, 18, '2015-06-09 17:50:06', '0000-00-00 00:00:00', '', '\n'),
(105, 'Lidys ESther Ramirez Jimenez', 'LIDYS RAMIREZ JIMENEZ', 'lidysestheramirezj@gmail.com', '8acad7cf85fd147a590622ac5e0cf7ab:rvZjK2jIHH4y4J7yAWMqAx5n0okR48Ze', 'Registered', 1, 0, 18, '2015-06-20 02:58:34', '0000-00-00 00:00:00', '23749e01131cf6aec31ff481afe46dc5', '\n'),
(106, 'ROSAURA QUEZADA', 'rosauraq', 'deroseimport@hotmail.com', '53910154ac7b4579dea76e0f60daa7fd:a1DjiJRcxed3w9Urd0EKO0am1pf25RdS', 'Registered', 0, 0, 18, '2015-07-20 15:38:14', '2015-07-20 15:43:24', '', '\n'),
(107, 'Marco Antonio', 'Marco Antonio', 'Marcozeferino336@gmail.com', 'c05e892fb82426b399f791396c75d3d3:8tJixdXpugczblNlPO0uZmMnz3CxoIvH', 'Registered', 1, 0, 18, '2015-09-08 09:15:27', '0000-00-00 00:00:00', 'fc645f7b53e33c781e6628e84f022984', '\n'),
(140, 'Israel Juarbe', 'Guelo', 'i.juarbe@yahoo.com', '1310d8c0eda44312d5eb34e82a6bcc58:odmUdK3Fq7uc3ChtYB2Vy63tUpSFoZXA', 'Registered', 1, 0, 18, '2016-09-18 21:44:25', '0000-00-00 00:00:00', 'a96ac1b779a98ea9316aa10b2f6f7030', '\n'),
(109, 'E.J. Arg????elles', 'E.J. Arg????elles', 'Edgarvision@gmail.com', 'da5c6f7a607b619ea099cf2a074c0106:6rcoXrOOhbZMkebHuHvEqST0rTFQwIpH', 'Registered', 0, 0, 18, '2015-11-13 04:48:07', '0000-00-00 00:00:00', 'bcf63784fb5c6e0e12f66da2b7de31c8', '\n'),
(110, 'uvojaroyenaze', 'uvojaroyenaze', 'amuhuqodu@asooemail.net', '6f772d110d9f09a86b7fac0bcfaef711:OnKbUW4nJ5lBlxp38cOci8zssRT3IBw5', 'Registered', 1, 0, 18, '2015-11-24 11:04:45', '0000-00-00 00:00:00', 'e4d0ab47e8928e8dd451d9dc066019c0', '\n'),
(141, 'ChestHaimunc', 'ChestHaimunc', 'vse@fastshipcialis.com', 'ffac77a4ee6a16033018682c2bd047ba:UlmMMCrpcrAWZoEBb5S45TjYgrTGD4yl', 'Registered', 1, 0, 18, '2016-10-13 01:49:41', '0000-00-00 00:00:00', '1c78c5cbf267cc4cdcded1b1b3f27623', '\n'),
(113, 'yafihecove', 'yafihecove', 'qaczihib@asooemail.net', '4080ba84ea30c087c38f4a5600216bba:dK6mfLUJVxUm9KVTtaX60r102JLRbRcc', 'Registered', 1, 0, 18, '2015-11-24 11:18:46', '0000-00-00 00:00:00', '817e5e9557d2c43b2257da1737aef27a', '\n'),
(114, 'oteduzehepj', 'oteduzehepj', 'iiyuguc@asdfmail.net', '9e92bcd449b8b1feb2eb4612d417f241:Xkm6cmQWlGMWJyuayxZzVMKlSCaR17zA', 'Registered', 1, 0, 18, '2015-11-24 11:23:35', '0000-00-00 00:00:00', '66cf44a80a012d9e0d84d7c731318f4e', '\n'),
(115, 'wuzuvito', 'wuzuvito', 'atatid@apoimail.com', 'a6738f8008c074b31e637ea14a3f77a5:ctH3qdZP5ljoneNGHnAtmMvTGAfJYLLI', 'Registered', 1, 0, 18, '2015-11-24 11:27:07', '0000-00-00 00:00:00', 'db99743d4e01032389a134d43686415f', '\n'),
(138, 'David Clase', 'Dclase', 'dclase01@gmail.com', '4fe60b4397446d3e8bf598e2938bd26f:5tZO8SoenzNcGnhLokxmhg7k8Wexyul3', 'Registered', 0, 0, 18, '2016-08-11 03:25:39', '2016-08-11 03:27:09', '', '\n'),
(117, 'oogadaputesig', 'oogadaputesig', 'uguxefuu@qwkcmail.com', '387c2dd27abbd8e59884622c08d026ea:rb0hF67FVzNfefWsJXuMcMX7PFWuc0zb', 'Registered', 1, 0, 18, '2015-11-24 19:08:32', '0000-00-00 00:00:00', '383948ef6a6981c0e0286b82c04afc8c', '\n'),
(143, 'Thomsuics', 'Thomsuics', 'petya@domainseoforum.com', '3f7a06bc4612904ff2844e222d414daa:3LxqWEIxLpipCF69JWjTU8S2SOcMbpkJ', 'Registered', 1, 0, 18, '2017-01-16 09:35:23', '0000-00-00 00:00:00', '7c585191f7408d9481736839d798150b', '\n'),
(131, '76561004', '76561004', 'orp@atlasianproxy.pl', '8af42ca0e7cf0f01cbdd774e0e6420e3:KvJucmzSRDgWc6JKNVVoXzqumK9k5WBW', 'Registered', 1, 0, 18, '2016-03-09 02:35:09', '0000-00-00 00:00:00', '176826bc44c64da7ca460e26dd8e425e', '\n'),
(120, 'oluqogoitay', 'oluqogoitay', 'ejliqirq@apoimail.com', 'ea4ce91888f1431996085e4e0cb403ac:GvW6BDNr6RUh05tHgarCZiGNsELWxisv', 'Registered', 1, 0, 18, '2015-11-26 01:36:40', '0000-00-00 00:00:00', '9d07305b284796b6e1e08bf83cc58b49', '\n'),
(132, 'Yerenia sime', 'Yenelly122', 'yereniasime1@hotmail.com', '09996f88b4aece6972e5f6b426067060:YXjY5EqoVuxmIRQwCQSBrQM6rPqaocdz', 'Registered', 1, 0, 18, '2016-03-19 01:50:31', '0000-00-00 00:00:00', 'd1c0533a71637084d7433e07eecc4c34', '\n'),
(133, 'Wilchencuse', 'Wilchencuse', 'inf@fastshipcialis.com', '941d9dccd385d34bdd203266e544af57:dgy36pcQFGVBT2omoQD7bh2TMwF7cORj', 'Registered', 1, 0, 18, '2016-03-26 15:42:23', '0000-00-00 00:00:00', 'fb298b9bb62298202c9f082205d8bac5', '\n'),
(134, 'Georlowl', 'Georlowl', 'emailk@sildenafilusfor.com', '4d002cb0f690e72db0011a6e7e2d5a83:8791IkM1EoOSS9Ir3jajYS7De0RALRv4', 'Registered', 1, 0, 18, '2016-03-27 17:18:18', '0000-00-00 00:00:00', '0937a2503ac80e5bdcb83e96682a61ce', '\n'),
(124, 'ubihohifah', 'ubihohifah', 'amuyiweh@asdfasdfmail.net', '4b8755d783dbe252394fb9c67de7f9e0:4En9mdSgjK6muBG6ZuQWviz7cYLySbXv', 'Registered', 1, 0, 18, '2015-11-26 17:11:03', '0000-00-00 00:00:00', 'a3d68b4b1d439e41b4f4b51524bf39df', '\n'),
(142, 'JamArtibly', 'JamArtibly', 'vsem@fastshipcialis.com', 'f2d7d79caa6824676e867729184dd009:pHoe150ebj5OsJRbZY5NQwvrDcpukHXe', 'Registered', 1, 0, 18, '2016-10-13 14:04:17', '0000-00-00 00:00:00', '7356054a8ab13e89e55baf1abc344013', '\n'),
(135, 'rickybettis98117', 'rickybettis98117', 'ricky_bettis91@jargotgranit.pl', '744b7383333adaf68bfd6380cc4fadd7:IEmzcLNacea5nSaiANZ9HODOr9kcZ2nt', 'Registered', 1, 0, 18, '2016-04-20 04:46:31', '0000-00-00 00:00:00', 'd53ad97a6eecd213dc4d09330e11531e', '\n'),
(136, 'Stevelstus', 'Stevelstus', 'stevebrosperri@gmail.com', '78ce373ebec481615016984dff493ac3:ywgCJ0B070kI0x35bEPr2KVaDNoampWP', 'Registered', 1, 0, 18, '2016-05-26 14:12:23', '0000-00-00 00:00:00', '83d5ba654c5455283abd6c62d13c7178', '\n'),
(137, 'Ram????n Reyes', 'Maestro ', 'Cultura_delreino@hotmail.com', '751f0c5aefb184e3d675342defe702ff:1aZpLDCZ4SXSKjB8AJeA74egT0bUV1de', 'Registered', 0, 0, 18, '2016-07-26 16:21:45', '2016-07-26 16:55:48', '', '\n'),
(129, 'ounulonal', 'ounulonal', 'ujucua@qwkcmail.com', '68030909e65de914191c9733938d5fd1:CRlkRxcTFHWCTSTcSl3TjwuG7WrdrqJ5', 'Registered', 1, 0, 18, '2015-11-30 14:22:42', '0000-00-00 00:00:00', 'e7f5e20ee3def870f572d101b2d3299b', '\n'),
(130, 'Cristhian Rafael Solano Gonz????lez', 'cristhiansolano', 'cristhiane14@gmail.com', 'add5ea8a62938011dd175bba561ce2c2:iPZAHb3MRwKpiAZAsU8PuEQULmQIhZxg', 'Registered', 0, 0, 18, '2016-01-18 01:41:06', '2016-01-18 01:43:12', '', '\n'),
(144, 'kelvin ventura', 'kelvin ventura', 'kelvinventurax86@gmail.com', '195b3a513bfcb724c8c0713604555c50:wHZSfu1ZlJUpHNfPoazT2SGsAjnDCvKe', 'Registered', 1, 0, 18, '2017-01-16 14:23:49', '0000-00-00 00:00:00', '7b5e47bb4abd11d6675b83d0423bd503', '\n');

-- --------------------------------------------------------

--
-- Table structure for table `aicrd_weblinks`
--
-- Creation: Jun 26, 2017 at 02:12 PM
-- Last update: Jun 26, 2017 at 02:12 PM
--

DROP TABLE IF EXISTS `aicrd_weblinks`;
CREATE TABLE `aicrd_weblinks` (
  `id` int(11) UNSIGNED NOT NULL,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alumnos`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE `alumnos` (
  `id_alumno` int(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `id_recinto` int(4) NOT NULL DEFAULT '1',
  `id_circuito` int(2) NOT NULL,
  `iglesia` varchar(30) NOT NULL,
  `pastor` varchar(50) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fecha_nacimiento` varchar(15) NOT NULL,
  `fecha_conversion` varchar(15) NOT NULL,
  `fecha_inscripcion` varchar(15) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `id_curso` int(3) NOT NULL DEFAULT '1',
  `id_estado` int(3) NOT NULL DEFAULT '1',
  `usuario` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `nombre`, `apellidos`, `id_recinto`, `id_circuito`, `iglesia`, `pastor`, `direccion`, `telefono`, `fecha_nacimiento`, `fecha_conversion`, `fecha_inscripcion`, `matricula`, `id_curso`, `id_estado`, `usuario`) VALUES
(2, 'Francisco', 'Brujan Arias', 1, 1, 'Evang????lica Fraternal', 'Rev. Federico Claudio ????lvarez', 'Calle 19 de Marzo No. 16, Los Molina, san Crist????bal', '809-423-2642', '04/06/1977', '17/03/1992', '24-05-2012', '2012-00001', 1, 1, 'fbrujan'),
(8, 'Clarivel Jacqueline', 'Batel Ramirez', 1, 1, 'Evang????lica Fraternal', 'Rev. Federico Claudio ????lvarez', 'Calle 19 de Marzo No. 16, Los Molina, san Crist????bal', '809-436-2642', '1975-12-20', '1992-08-08', '26-05-2012', '2012-00002', 1, 6, 'fbrujan'),
(9, 'Isis Jafreisis', 'Brujan Batel', 2, 1, 'Evang????lica Fraternal', 'Rev. Federico Claudio ????lvarez', 'Calle 19 de Marzo No. 16, Los Molina, san Crist????bal', '829-409-2642', '2001-06-10', '2009-06-10', '26-05-2012', '2012-00003', 1, 6, 'fbrujan'),
(10, 'Fraider Joelfri', 'Brujan Batel', 3, 1, 'Evang????lica Fraternal', 'Rev. Federico Claudio ????lvarez', 'Calle 19 de Marzo No. 16, Los Molina, san Crist????bal', '809-422-2727', '2006-11-04', '2012-11-04', '26-05-2012', '2012-00004', 1, 6, 'fbrujan'),
(11, 'Jilfrandy Francisco', 'Brujan Batel', 4, 1, 'Evang????lica Fraternal', 'Rev. Federico Claudio ????lvarez', 'Calle 19 de Marzo No. 16, Los Molina, san Crist????bal', '809-422-2727', '2006-11-04', '2012-11-04', '27-05-2012', '2012-00005', 1, 6, 'fbrujan');

-- --------------------------------------------------------

--
-- Table structure for table `asignaturas`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `asignaturas`;
CREATE TABLE `asignaturas` (
  `id_asignatura` int(5) NOT NULL,
  `asignatura` varchar(40) NOT NULL,
  `id_curso` int(3) NOT NULL DEFAULT '1',
  `cantidad_clases` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asignaturas`
--

INSERT INTO `asignaturas` (`id_asignatura`, `asignatura`, `id_curso`, `cantidad_clases`) VALUES
(1, 'Libros Historicos', 1, 16),
(2, 'Hermeneutica', 1, 12),
(3, 'Interpretacion Biblica', 1, 0),
(4, 'Introduccion al Antiguo Testamento I', 1, 0),
(5, 'Homiletica', 1, 0),
(6, 'Introduccion al Antiguo Testamento II', 1, 0),
(7, 'Historia de la Iglesia', 1, 0),
(8, 'Historia de AIC', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `asistencia`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 18, 2018 at 07:52 PM
--

DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
  `id_asistencia` int(10) NOT NULL,
  `id_seccion` int(5) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `fecha` varchar(15) NOT NULL,
  `estado` varchar(10) NOT NULL COMMENT 'Presente o Ausente'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calificaciones`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 18, 2018 at 07:52 PM
--

DROP TABLE IF EXISTS `calificaciones`;
CREATE TABLE `calificaciones` (
  `id_calificacion` int(10) NOT NULL,
  `id_asignatura` int(3) NOT NULL,
  `id_seccion` int(3) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `califacion` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `circuitos`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `circuitos`;
CREATE TABLE `circuitos` (
  `id_circuito` int(3) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `circuitos`
--

INSERT INTO `circuitos` (`id_circuito`, `nombre`) VALUES
(1, 'San Cristobal Centro'),
(2, 'Santo Domingo Este');

-- --------------------------------------------------------

--
-- Table structure for table `concepto_pagos`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `concepto_pagos`;
CREATE TABLE `concepto_pagos` (
  `id_concepto` int(2) NOT NULL,
  `concepto` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `concepto_pagos`
--

INSERT INTO `concepto_pagos` (`id_concepto`, `concepto`) VALUES
(1, 'Inscripci????n'),
(2, 'Re-Inscripci????n'),
(3, 'Mensualidad'),
(4, 'Graduaci????n'),
(5, 'Diploma'),
(6, 'Otros');

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--
-- Creation: Apr 18, 2018 at 07:52 PM
-- Last update: Apr 23, 2018 at 12:37 PM
-- Last check: May 14, 2018 at 02:51 PM
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `id_curso` int(10) NOT NULL,
  `curso` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id_curso`, `curso`) VALUES
(1, 'Primero'),
(2, 'Segundo'),
(3, 'Tercero'),
(4, 'Escuela Ministerio');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aic_actividad`
--
ALTER TABLE `aic_actividad`
  ADD UNIQUE KEY `id_actividad` (`id_actividad`) USING BTREE;

--
-- Indexes for table `aic_asistencia`
--
ALTER TABLE `aic_asistencia`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD UNIQUE KEY `asistencia` (`id_registro`,`fecha_asistencia`,`tanda`);

--
-- Indexes for table `aic_cargos`
--
ALTER TABLE `aic_cargos`
  ADD UNIQUE KEY `ID_Cargo` (`id_cargo`) USING BTREE;

--
-- Indexes for table `aic_circuitos`
--
ALTER TABLE `aic_circuitos`
  ADD PRIMARY KEY (`id_circuito`),
  ADD UNIQUE KEY `circuito` (`id_provincia`,`nombre_circuito`,`id_pais`),
  ADD KEY `id_provincia` (`id_provincia`);

--
-- Indexes for table `aic_iglesia`
--
ALTER TABLE `aic_iglesia`
  ADD PRIMARY KEY (`id_iglesia`),
  ADD UNIQUE KEY `iglesia` (`id_circuito`,`nombre_iglesia`),
  ADD KEY `id_circuito` (`id_circuito`),
  ADD KEY `id_provincia` (`id_provincia`);

--
-- Indexes for table `aic_iglesia_detalle_hist`
--
ALTER TABLE `aic_iglesia_detalle_hist`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_iglesia` (`id_iglesia`);

--
-- Indexes for table `aic_iglesia_estadisticas`
--
ALTER TABLE `aic_iglesia_estadisticas`
  ADD PRIMARY KEY (`id_estadistica`),
  ADD KEY `id_iglesia` (`id_iglesia`),
  ADD KEY `circuito` (`id_circuito`);

--
-- Indexes for table `aic_persona`
--
ALTER TABLE `aic_persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `persona` (`nombre`,`apellidos`,`fch_nacimiento`,`sexo`);

--
-- Indexes for table `aic_persona_detalle_hist`
--
ALTER TABLE `aic_persona_detalle_hist`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_rango` (`id_rango`),
  ADD KEY `id_iglesia` (`id_iglesia`);

--
-- Indexes for table `aic_persona_imagen`
--
ALTER TABLE `aic_persona_imagen`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indexes for table `aic_rango_ministerial`
--
ALTER TABLE `aic_rango_ministerial`
  ADD PRIMARY KEY (`id_rango`),
  ADD UNIQUE KEY `rango_ministerial` (`rango`);

--
-- Indexes for table `aic_registro`
--
ALTER TABLE `aic_registro`
  ADD PRIMARY KEY (`id_registro`),
  ADD UNIQUE KEY `Asistencia` (`id_actividad`,`asociacion`,`nombres`,`apellidos`,`zona`,`iglesia`);

--
-- Indexes for table `aicrd_banner`
--
ALTER TABLE `aicrd_banner`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `viewbanner` (`showBanner`),
  ADD KEY `idx_banner_catid` (`catid`);

--
-- Indexes for table `aicrd_bannerclient`
--
ALTER TABLE `aicrd_bannerclient`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `aicrd_categories`
--
ALTER TABLE `aicrd_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_idx` (`section`,`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`);

--
-- Indexes for table `aicrd_components`
--
ALTER TABLE `aicrd_components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_option` (`parent`,`option`(32));

--
-- Indexes for table `aicrd_contact_details`
--
ALTER TABLE `aicrd_contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catid` (`catid`);

--
-- Indexes for table `aicrd_content`
--
ALTER TABLE `aicrd_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_section` (`sectionid`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`);

--
-- Indexes for table `aicrd_content_frontpage`
--
ALTER TABLE `aicrd_content_frontpage`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `aicrd_content_rating`
--
ALTER TABLE `aicrd_content_rating`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `aicrd_core_acl_aro`
--
ALTER TABLE `aicrd_core_acl_aro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aicrd_section_value_value_aro` (`section_value`(100),`value`(100)),
  ADD KEY `aicrd_gacl_hidden_aro` (`hidden`);

--
-- Indexes for table `aicrd_core_acl_aro_groups`
--
ALTER TABLE `aicrd_core_acl_aro_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aicrd_gacl_parent_id_aro_groups` (`parent_id`),
  ADD KEY `aicrd_gacl_lft_rgt_aro_groups` (`lft`,`rgt`);

--
-- Indexes for table `aicrd_core_acl_aro_map`
--
ALTER TABLE `aicrd_core_acl_aro_map`
  ADD PRIMARY KEY (`acl_id`,`section_value`,`value`);

--
-- Indexes for table `aicrd_core_acl_aro_sections`
--
ALTER TABLE `aicrd_core_acl_aro_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aicrd_gacl_value_aro_sections` (`value`),
  ADD KEY `aicrd_gacl_hidden_aro_sections` (`hidden`);

--
-- Indexes for table `aicrd_core_acl_groups_aro_map`
--
ALTER TABLE `aicrd_core_acl_groups_aro_map`
  ADD UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`);

--
-- Indexes for table `aicrd_groups`
--
ALTER TABLE `aicrd_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aicrd_menu`
--
ALTER TABLE `aicrd_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  ADD KEY `menutype` (`menutype`);

--
-- Indexes for table `aicrd_menu_types`
--
ALTER TABLE `aicrd_menu_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menutype` (`menutype`);

--
-- Indexes for table `aicrd_messages`
--
ALTER TABLE `aicrd_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `useridto_state` (`user_id_to`,`state`);

--
-- Indexes for table `aicrd_messages_cfg`
--
ALTER TABLE `aicrd_messages_cfg`
  ADD UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`);

--
-- Indexes for table `aicrd_migration_backlinks`
--
ALTER TABLE `aicrd_migration_backlinks`
  ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `aicrd_modules`
--
ALTER TABLE `aicrd_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`,`access`),
  ADD KEY `newsfeeds` (`module`,`published`);

--
-- Indexes for table `aicrd_modules_menu`
--
ALTER TABLE `aicrd_modules_menu`
  ADD PRIMARY KEY (`moduleid`,`menuid`);

--
-- Indexes for table `aicrd_newsfeeds`
--
ALTER TABLE `aicrd_newsfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`),
  ADD KEY `catid` (`catid`);

--
-- Indexes for table `aicrd_plugins`
--
ALTER TABLE `aicrd_plugins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_folder` (`published`,`client_id`,`access`,`folder`);

--
-- Indexes for table `aicrd_poll_data`
--
ALTER TABLE `aicrd_poll_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollid` (`pollid`,`text`(1));

--
-- Indexes for table `aicrd_poll_date`
--
ALTER TABLE `aicrd_poll_date`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_id` (`poll_id`);

--
-- Indexes for table `aicrd_poll_menu`
--
ALTER TABLE `aicrd_poll_menu`
  ADD PRIMARY KEY (`pollid`,`menuid`);

--
-- Indexes for table `aicrd_polls`
--
ALTER TABLE `aicrd_polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aicrd_sections`
--
ALTER TABLE `aicrd_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_scope` (`scope`);

--
-- Indexes for table `aicrd_session`
--
ALTER TABLE `aicrd_session`
  ADD PRIMARY KEY (`session_id`(64)),
  ADD KEY `whosonline` (`guest`,`usertype`),
  ADD KEY `userid` (`userid`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `aicrd_templates_menu`
--
ALTER TABLE `aicrd_templates_menu`
  ADD PRIMARY KEY (`menuid`,`client_id`,`template`);

--
-- Indexes for table `aicrd_users`
--
ALTER TABLE `aicrd_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usertype` (`usertype`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `gid_block` (`gid`,`block`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `aicrd_weblinks`
--
ALTER TABLE `aicrd_weblinks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catid` (`catid`,`published`,`archived`);

--
-- Indexes for table `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `id_circuito` (`id_circuito`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indexes for table `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id_asignatura`),
  ADD UNIQUE KEY `asignatura` (`asignatura`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indexes for table `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD KEY `id_seccion` (`id_seccion`),
  ADD KEY `matricula` (`matricula`);

--
-- Indexes for table `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id_calificacion`),
  ADD KEY `matricula` (`matricula`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_seccion` (`id_seccion`);

--
-- Indexes for table `circuitos`
--
ALTER TABLE `circuitos`
  ADD PRIMARY KEY (`id_circuito`);

--
-- Indexes for table `concepto_pagos`
--
ALTER TABLE `concepto_pagos`
  ADD PRIMARY KEY (`id_concepto`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aic_asistencia`
--
ALTER TABLE `aic_asistencia`
  MODIFY `id_asistencia` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `aic_cargos`
--
ALTER TABLE `aic_cargos`
  MODIFY `id_cargo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `aic_circuitos`
--
ALTER TABLE `aic_circuitos`
  MODIFY `id_circuito` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `aic_iglesia`
--
ALTER TABLE `aic_iglesia`
  MODIFY `id_iglesia` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT for table `aic_iglesia_detalle_hist`
--
ALTER TABLE `aic_iglesia_detalle_hist`
  MODIFY `id_detalle` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;
--
-- AUTO_INCREMENT for table `aic_iglesia_estadisticas`
--
ALTER TABLE `aic_iglesia_estadisticas`
  MODIFY `id_estadistica` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aic_persona`
--
ALTER TABLE `aic_persona`
  MODIFY `id_persona` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `aic_persona_detalle_hist`
--
ALTER TABLE `aic_persona_detalle_hist`
  MODIFY `id_detalle` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `aic_persona_imagen`
--
ALTER TABLE `aic_persona_imagen`
  MODIFY `id_imagen` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `aic_rango_ministerial`
--
ALTER TABLE `aic_rango_ministerial`
  MODIFY `id_rango` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `aic_registro`
--
ALTER TABLE `aic_registro`
  MODIFY `id_registro` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `aicrd_banner`
--
ALTER TABLE `aicrd_banner`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aicrd_bannerclient`
--
ALTER TABLE `aicrd_bannerclient`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aicrd_categories`
--
ALTER TABLE `aicrd_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `aicrd_components`
--
ALTER TABLE `aicrd_components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `aicrd_contact_details`
--
ALTER TABLE `aicrd_contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aicrd_content`
--
ALTER TABLE `aicrd_content`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574;
--
-- AUTO_INCREMENT for table `aicrd_core_acl_aro`
--
ALTER TABLE `aicrd_core_acl_aro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `aicrd_core_acl_aro_groups`
--
ALTER TABLE `aicrd_core_acl_aro_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `aicrd_core_acl_aro_sections`
--
ALTER TABLE `aicrd_core_acl_aro_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `aicrd_menu`
--
ALTER TABLE `aicrd_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `aicrd_menu_types`
--
ALTER TABLE `aicrd_menu_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `aicrd_messages`
--
ALTER TABLE `aicrd_messages`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `aicrd_modules`
--
ALTER TABLE `aicrd_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `aicrd_newsfeeds`
--
ALTER TABLE `aicrd_newsfeeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aicrd_plugins`
--
ALTER TABLE `aicrd_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `aicrd_poll_data`
--
ALTER TABLE `aicrd_poll_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aicrd_poll_date`
--
ALTER TABLE `aicrd_poll_date`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aicrd_polls`
--
ALTER TABLE `aicrd_polls`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aicrd_sections`
--
ALTER TABLE `aicrd_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `aicrd_users`
--
ALTER TABLE `aicrd_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT for table `aicrd_weblinks`
--
ALTER TABLE `aicrd_weblinks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id_asignatura` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id_asistencia` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id_calificacion` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `circuitos`
--
ALTER TABLE `circuitos`
  MODIFY `id_circuito` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `concepto_pagos`
--
ALTER TABLE `concepto_pagos`
  MODIFY `id_concepto` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;--
-- Database: `bck_iglesia`
--
DROP DATABASE IF EXISTS `bck_iglesia`;
CREATE DATABASE IF NOT EXISTS `bck_iglesia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE bck_iglesia;

-- --------------------------------------------------------

--
-- Table structure for table `asistencia`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
  `id` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_miembro` int(11) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `id_sociedad` int(11) DEFAULT NULL,
  `id_tanda` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto_pagado` int(11) DEFAULT '0',
  `exhonerado` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cargos`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cargos`
--

INSERT INTO `cargos` (`id`, `nombre`) VALUES
(1, 'Superintendente');

-- --------------------------------------------------------

--
-- Table structure for table `conceptos`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `conceptos`;
CREATE TABLE `conceptos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estados`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `elegible_lider` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iglesia`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `iglesia`;
CREATE TABLE `iglesia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ingresos_egresos`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `ingresos_egresos`;
CREATE TABLE `ingresos_egresos` (
  `id` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_tipo_transaccion` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `id_concepto` int(11) NOT NULL,
  `detalle` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lideres`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `lideres`;
CREATE TABLE `lideres` (
  `id` int(11) NOT NULL,
  `id_miembro` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `fch_inicio` date NOT NULL,
  `fch_fin` date NOT NULL,
  `vigente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `miembros`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `miembros`;
CREATE TABLE `miembros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `fch_nacimiento` date DEFAULT NULL,
  `fch_conversion` date DEFAULT NULL,
  `fch_bautismo` date DEFAULT NULL,
  `id_sociedad` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `id_sexo` int(11) NOT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `nro_documento` varchar(25) DEFAULT NULL,
  `apodo` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `id_iglesia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `servicios`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `id_tipo_servicio` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_lider` int(11) NOT NULL,
  `detalles` varchar(250) DEFAULT NULL,
  `costo` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sexo`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `sexo`;
CREATE TABLE `sexo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sexo`
--

INSERT INTO `sexo` (`id`, `nombre`) VALUES
(1, 'Femenino');

-- --------------------------------------------------------

--
-- Table structure for table `sociedad`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `sociedad`;
CREATE TABLE `sociedad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tandas`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `tandas`;
CREATE TABLE `tandas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_documento`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_servicio`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `tipo_servicio`;
CREATE TABLE `tipo_servicio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_ingreso_egreso`
--
-- Creation: Apr 10, 2018 at 04:16 PM
--

DROP TABLE IF EXISTS `tipos_ingreso_egreso`;
CREATE TABLE `tipos_ingreso_egreso` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `valor` int(11) NOT NULL,
  `comentario` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conceptos`
--
ALTER TABLE `conceptos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iglesia`
--
ALTER TABLE `iglesia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingresos_egresos`
--
ALTER TABLE `ingresos_egresos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lideres`
--
ALTER TABLE `lideres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `miembros`
--
ALTER TABLE `miembros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`,`apellidos`,`id_tipo_documento`,`nro_documento`);

--
-- Indexes for table `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sociedad`
--
ALTER TABLE `sociedad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tandas`
--
ALTER TABLE `tandas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_ingreso_egreso`
--
ALTER TABLE `tipos_ingreso_egreso`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `iglesia`
--
ALTER TABLE `iglesia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ingresos_egresos`
--
ALTER TABLE `ingresos_egresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lideres`
--
ALTER TABLE `lideres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `miembros`
--
ALTER TABLE `miembros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sexo`
--
ALTER TABLE `sexo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sociedad`
--
ALTER TABLE `sociedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tandas`
--
ALTER TABLE `tandas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipos_ingreso_egreso`
--
ALTER TABLE `tipos_ingreso_egreso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;--
-- Database: `fbrujan`
--
DROP DATABASE IF EXISTS `fbrujan`;
CREATE DATABASE IF NOT EXISTS `fbrujan` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE fbrujan;

-- --------------------------------------------------------

--
-- Table structure for table `aerolineas`
--
-- Creation: Dec 12, 2017 at 01:30 PM
--

DROP TABLE IF EXISTS `aerolineas`;
CREATE TABLE `aerolineas` (
  `id_aerolinea` int(11) NOT NULL,
  `aerolinea` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aerolineas`
--

INSERT INTO `aerolineas` (`id_aerolinea`, `aerolinea`) VALUES
(1, 'Iberia'),
(2, 'America Airline'),
(3, 'Delta'),
(4, 'Avianca'),
(5, 'Spirit'),
(6, 'Copa'),
(7, 'Pawa'),
(8, 'Air Europa'),
(9, 'Air France'),
(10, 'JetBlue'),
(11, 'United Airlines'),
(12, 'Air Canada'),
(13, 'Air Century'),
(14, 'Seaborne'),
(15, 'Cubana de Aviacion'),
(16, 'Aserca Airlines'),
(17, 'Aerolineas MAS S. A.'),
(18, 'GOL');

-- --------------------------------------------------------

--
-- Table structure for table `aeropuertos`
--
-- Creation: Dec 12, 2017 at 01:30 PM
--

DROP TABLE IF EXISTS `aeropuertos`;
CREATE TABLE `aeropuertos` (
  `id_aeropuerto` int(11) NOT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  `cod_aeropuerto` varchar(10) DEFAULT NULL,
  `aeropuerto` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aeropuertos`
--

INSERT INTO `aeropuertos` (`id_aeropuerto`, `id_ciudad`, `cod_aeropuerto`, `aeropuerto`) VALUES
(1, 1, 'SDQ', 'Aeropuerto Internacional Las Americas'),
(2, 10, 'DXB', 'Dubai International Airport'),
(3, 13, 'OSA', 'Osaka International'),
(4, 7, 'LAX', 'Los Angeles International Airport'),
(5, 9, 'RDU', 'Raleigh Durham International Airport'),
(6, 7, 'ONT', 'Ontario International Airport'),
(7, 11, 'LCY', 'London City International Airport'),
(8, 8, 'LGB', ' Long Beach Municipal Airport'),
(9, 8, 'MIA', 'Miami International Airport'),
(10, 2, 'STI', 'Santiago Airport');

-- --------------------------------------------------------

--
-- Table structure for table `aviones`
--
-- Creation: Dec 12, 2017 at 01:30 PM
--

DROP TABLE IF EXISTS `aviones`;
CREATE TABLE `aviones` (
  `id_avion` int(11) NOT NULL,
  `avion` varchar(30) DEFAULT NULL,
  `marca` varchar(15) DEFAULT NULL,
  `modelo` varchar(15) DEFAULT NULL,
  `capacidad_pasajeros` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aviones`
--

INSERT INTO `aviones` (`id_avion`, `avion`, `marca`, `modelo`, `capacidad_pasajeros`) VALUES
(1, 'Boeing 777', 'Boeing', '777', 220),
(2, 'Airbus A320', 'Airbus', 'A320', 220),
(3, 'Airbus A300', 'Airbus', 'A300', 220),
(4, 'Boeing 713', 'Boeing', '713', 550),
(5, 'Boeing 737', 'Boeing', '737', 550);

-- --------------------------------------------------------

--
-- Table structure for table `ciudades`
--
-- Creation: Dec 12, 2017 at 01:30 PM
--

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `ciudad` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `id_pais`, `ciudad`) VALUES
(1, 1, 'Santo Domingo'),
(2, 1, 'Santiago'),
(3, 1, 'Puerto Plata'),
(4, 1, 'San Cristobal'),
(5, 1, 'La Romana'),
(6, 1, 'La Altagracia'),
(7, 5, 'California'),
(8, 5, 'Florida'),
(9, 5, 'Carolina del Norte'),
(10, 12, 'Dubai'),
(11, 11, 'Londres'),
(12, 10, 'Tokio'),
(13, 10, 'Osaka'),
(14, 1, 'Barahona');

-- --------------------------------------------------------

--
-- Table structure for table `continentes`
--
-- Creation: Dec 12, 2017 at 01:30 PM
--

DROP TABLE IF EXISTS `continentes`;
CREATE TABLE `continentes` (
  `id_continente` int(11) NOT NULL,
  `continente` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `continentes`
--

INSERT INTO `continentes` (`id_continente`, `continente`) VALUES
(1, 'Asia'),
(2, 'Europa'),
(3, 'Africa'),
(4, 'America'),
(5, 'Oceania');

-- --------------------------------------------------------

--
-- Table structure for table `inventario_aerolineas`
--
-- Creation: Dec 12, 2017 at 01:30 PM
--

DROP TABLE IF EXISTS `inventario_aerolineas`;
CREATE TABLE `inventario_aerolineas` (
  `id_inventario` int(11) NOT NULL,
  `id_aerolinea` int(11) DEFAULT NULL,
  `id_avion` int(11) DEFAULT NULL,
  `serie_avion` varchar(15) DEFAULT NULL,
  `fch_compra` date DEFAULT NULL,
  `vida_util` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventario_aerolineas`
--

INSERT INTO `inventario_aerolineas` (`id_inventario`, `id_aerolinea`, `id_avion`, `serie_avion`, `fch_compra`, `vida_util`) VALUES
(1, 8, 1, 'B777-AB', '2001-01-12', 30),
(2, 1, 1, 'B777-AC', '2001-01-12', 30),
(3, 9, 1, 'B777-AD', '2001-01-12', 30),
(4, 8, 2, 'B320-AB', '2001-01-12', 30),
(5, 1, 2, 'B320-AC', '2001-01-12', 30),
(6, 9, 2, 'B320-AD', '2001-01-12', 30),
(7, 3, 1, 'C777-AB', '2001-01-12', 30),
(8, 3, 1, 'C777-AC', '2001-01-12', 30),
(9, 3, 1, 'C777-AD', '2001-01-12', 30),
(10, 3, 2, 'C320-AB', '2001-01-12', 30),
(11, 3, 2, 'C320-AC', '2001-01-12', 30),
(12, 4, 2, 'C320-AD', '2001-01-12', 30),
(13, 4, 1, 'D777-AB', '2001-01-12', 30),
(14, 4, 1, 'D777-AC', '2001-01-12', 30),
(15, 4, 1, 'D777-AD', '2001-01-12', 30),
(16, 4, 2, 'D320-AB', '2001-01-12', 30),
(17, 4, 2, 'D320-AC', '2001-01-12', 30),
(18, 4, 2, 'D320-AD', '2001-01-12', 30),
(19, 5, 1, 'E777-AB', '2001-01-12', 30),
(20, 5, 1, 'E777-AC', '2001-01-12', 30),
(21, 5, 1, 'E777-AD', '2001-01-12', 30),
(22, 5, 2, 'E320-AB', '2001-01-12', 30),
(23, 5, 2, 'E320-AC', '2001-01-12', 30),
(24, 5, 2, 'E320-AD', '2001-01-12', 30);

-- --------------------------------------------------------

--
-- Table structure for table `itinerario_vuelos`
--
-- Creation: Dec 12, 2017 at 01:30 PM
--

DROP TABLE IF EXISTS `itinerario_vuelos`;
CREATE TABLE `itinerario_vuelos` (
  `id_itinerario` int(11) NOT NULL,
  `id_vuelo` int(11) DEFAULT NULL,
  `id_inventario` int(11) DEFAULT NULL,
  `fch_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `fch_llegada` date DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itinerario_vuelos`
--

INSERT INTO `itinerario_vuelos` (`id_itinerario`, `id_vuelo`, `id_inventario`, `fch_salida`, `hora_salida`, `fch_llegada`, `hora_llegada`) VALUES
(1, 1, 1, '2017-12-11', '10:22:15', '2017-12-12', '10:22:12'),
(2, 2, 4, '2017-12-11', '10:30:18', '2017-12-12', '14:45:32'),
(3, 3, 2, '2017-12-11', '11:05:16', '2017-12-12', '13:25:19'),
(4, 4, 1, '2017-12-11', '10:22:15', '2017-12-12', '10:22:12'),
(5, 5, 5, '2017-12-11', '10:30:18', '2017-12-12', '14:45:32'),
(6, 6, 6, '2017-12-11', '11:05:16', '2017-12-12', '13:25:19'),
(7, 7, 3, '2017-12-11', '10:22:15', '2017-12-12', '10:22:12'),
(8, 8, 7, '2017-12-11', '10:30:18', '2017-12-12', '14:45:32'),
(9, 9, 6, '2017-12-11', '11:05:16', '2017-12-12', '13:25:19'),
(10, 10, 7, '2017-12-11', '10:22:15', '2017-12-12', '10:22:12'),
(11, 11, 8, '2017-12-11', '10:30:18', '2017-12-12', '14:45:32'),
(12, 12, 7, '2017-12-11', '11:05:16', '2017-12-12', '13:25:19'),
(13, 13, 9, '2017-12-11', '10:22:15', '2017-12-12', '10:22:12'),
(14, 14, 9, '2017-12-11', '10:30:18', '2017-12-12', '14:45:32'),
(15, 15, 12, '2017-12-11', '11:05:16', '2017-12-12', '13:25:19'),
(16, 16, 11, '2017-12-11', '10:22:15', '2017-12-12', '10:22:12'),
(17, 17, 14, '2017-12-11', '10:30:18', '2017-12-12', '14:45:32'),
(18, 18, 12, '2017-12-11', '11:05:16', '2017-12-12', '13:25:19');

-- --------------------------------------------------------

--
-- Table structure for table `paises`
--
-- Creation: Dec 12, 2017 at 01:30 PM
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE `paises` (
  `id_pais` int(11) NOT NULL,
  `id_continente` int(11) DEFAULT NULL,
  `pais` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paises`
--

INSERT INTO `paises` (`id_pais`, `id_continente`, `pais`) VALUES
(1, 4, 'Republica Dominicana'),
(2, 4, 'Puerto Rico'),
(3, 4, 'Mexico'),
(4, 4, 'Chile'),
(5, 4, 'Estados Unidos de America'),
(6, 4, 'Colombia'),
(7, 4, 'Argentina'),
(8, 4, 'Venezuela'),
(9, 4, 'Nicaragua'),
(10, 1, 'Japon'),
(11, 2, 'Inglaterra'),
(12, 1, 'Emiratos Arabes');

-- --------------------------------------------------------

--
-- Table structure for table `vuelos`
--
-- Creation: Dec 12, 2017 at 01:30 PM
--

DROP TABLE IF EXISTS `vuelos`;
CREATE TABLE `vuelos` (
  `id_vuelo` int(11) NOT NULL,
  `id_ciudad_origen` int(11) DEFAULT NULL,
  `id_ciudad_destino` int(11) DEFAULT NULL,
  `id_aeropuerto_origen` int(11) DEFAULT NULL,
  `id_aeropuerto_destino` int(11) DEFAULT NULL,
  `cod_vuelo` varchar(10) DEFAULT NULL,
  `horas_vuelo` int(11) DEFAULT NULL,
  `id_aerolinea` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vuelos`
--

INSERT INTO `vuelos` (`id_vuelo`, `id_ciudad_origen`, `id_ciudad_destino`, `id_aeropuerto_origen`, `id_aeropuerto_destino`, `cod_vuelo`, `horas_vuelo`, `id_aerolinea`) VALUES
(1, 9, 10, 5, 2, 'AE401', 12, 8),
(2, 1, 11, 1, 7, 'AF501', 16, 9),
(3, 7, 13, 4, 3, 'IB301', 14, 1),
(4, 1, 2, 5, 2, 'AE402', 12, 8),
(5, 2, 4, 1, 7, 'AF502', 16, 9),
(6, 7, 13, 4, 3, 'IB302', 14, 1),
(7, 6, 8, 5, 2, 'AE403', 12, 8),
(8, 11, 10, 1, 7, 'AF503', 16, 9),
(9, 3, 1, 4, 3, 'IB303', 14, 1),
(10, 2, 9, 5, 2, 'AE404', 12, 8),
(11, 3, 14, 1, 7, 'AF504', 16, 9),
(12, 4, 13, 4, 3, 'IB304', 14, 1),
(13, 6, 10, 5, 2, 'AE405', 12, 8),
(14, 8, 11, 1, 7, 'AF505', 16, 9),
(15, 10, 13, 4, 3, 'IB305', 14, 1),
(16, 11, 10, 5, 2, 'AE406', 12, 8),
(17, 12, 11, 1, 7, 'AF506', 16, 9),
(18, 14, 13, 4, 3, 'IB306', 14, 1),
(19, 16, 10, 5, 2, 'AE407', 12, 8),
(20, 13, 11, 1, 7, 'AF507', 16, 9),
(21, 14, 13, 4, 3, 'IB307', 14, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aerolineas`
--
ALTER TABLE `aerolineas`
  ADD PRIMARY KEY (`id_aerolinea`);

--
-- Indexes for table `aeropuertos`
--
ALTER TABLE `aeropuertos`
  ADD PRIMARY KEY (`id_aeropuerto`);

--
-- Indexes for table `aviones`
--
ALTER TABLE `aviones`
  ADD PRIMARY KEY (`id_avion`);

--
-- Indexes for table `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indexes for table `continentes`
--
ALTER TABLE `continentes`
  ADD PRIMARY KEY (`id_continente`);

--
-- Indexes for table `inventario_aerolineas`
--
ALTER TABLE `inventario_aerolineas`
  ADD PRIMARY KEY (`id_inventario`);

--
-- Indexes for table `itinerario_vuelos`
--
ALTER TABLE `itinerario_vuelos`
  ADD PRIMARY KEY (`id_itinerario`);

--
-- Indexes for table `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indexes for table `vuelos`
--
ALTER TABLE `vuelos`
  ADD PRIMARY KEY (`id_vuelo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aerolineas`
--
ALTER TABLE `aerolineas`
  MODIFY `id_aerolinea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `aeropuertos`
--
ALTER TABLE `aeropuertos`
  MODIFY `id_aeropuerto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `aviones`
--
ALTER TABLE `aviones`
  MODIFY `id_avion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `continentes`
--
ALTER TABLE `continentes`
  MODIFY `id_continente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `inventario_aerolineas`
--
ALTER TABLE `inventario_aerolineas`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `itinerario_vuelos`
--
ALTER TABLE `itinerario_vuelos`
  MODIFY `id_itinerario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `paises`
--
ALTER TABLE `paises`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `vuelos`
--
ALTER TABLE `vuelos`
  MODIFY `id_vuelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;--
-- Database: `iglesia`
--
DROP DATABASE IF EXISTS `iglesia`;
CREATE DATABASE IF NOT EXISTS `iglesia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE iglesia;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `actualizar_iglesia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_iglesia` (IN `v_id` INT(8), IN `v_iglesia` VARCHAR(50), IN `v_nacida_organizacion` INT(1), IN `v_fundador` VARCHAR(50), IN `v_fch_fundada` DATE, IN `v_fch_ingreso` DATE)  BEGIN

UPDATE `iglesia`.`iglesias`
SET iglesia = v_iglesia,nacida_en_organizacion=v_nacida_organizacion,
fundador=v_fundador, fch_fundada=v_fch_fundada,fch_ingreso_organizacion=v_fch_ingreso
WHERE id_iglesia=v_id;
END$$

DROP PROCEDURE IF EXISTS `buscar_iglesia_fundador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_iglesia_fundador` (IN `v_fundador` VARCHAR(50))  BEGIN
SELECT * FROM iglesia.iglesias WHERE fundador LIKE v_fundador ORDER BY iglesia ASC;
END$$

DROP PROCEDURE IF EXISTS `buscar_iglesia_nombre`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_iglesia_nombre` (IN `nombre` VARCHAR(50))  BEGIN
SELECT * FROM iglesia.iglesias WHERE iglesia LIKE nombre ORDER BY iglesia ASC;
END$$

DROP PROCEDURE IF EXISTS `eliminar_iglesia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_iglesia` (IN `id` INT(8))  begin
delete from `iglesia`.`iglesias`
where id_iglesia = id ;
end$$

DROP PROCEDURE IF EXISTS `insertar_iglesia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_iglesia` (IN `iglesia` VARCHAR(50), IN `nacida_organizacion` INT(1), IN `fundador` VARCHAR(50), IN `fch_fundada` DATE, IN `fch_ingreso` DATE)  BEGIN
  INSERT
    INTO `iglesia`.`iglesias`
    (`iglesia`, `nacida_en_organizacion`, `fundador`, `fch_fundada`, `fch_ingreso_organizacion`)
  VALUES
    (iglesia, nacida_organizacion, fundador, fch_fundada, fch_ingreso);
END$$

DROP PROCEDURE IF EXISTS `mostrar_iglesias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_iglesias` ()  BEGIN
SELECT * FROM iglesia.iglesias ORDER BY iglesia ASC;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `iglesias`
--
-- Creation: Jun 16, 2017 at 08:04 PM
--

DROP TABLE IF EXISTS `iglesias`;
CREATE TABLE `iglesias` (
  `id_iglesia` int(8) NOT NULL,
  `iglesia` varchar(50) NOT NULL,
  `nacida_en_organizacion` tinyint(1) NOT NULL DEFAULT '1',
  `fundador` varchar(50) DEFAULT NULL,
  `fch_fundada` date DEFAULT NULL,
  `fch_ingreso_organizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `iglesias`
--

INSERT INTO `iglesias` (`id_iglesia`, `iglesia`, `nacida_en_organizacion`, `fundador`, `fch_fundada`, `fch_ingreso_organizacion`) VALUES
(1, 'Filadelfia', 1, 'Francisco Brujan', '2017-01-01', '2017-06-01'),
(2, 'Filadelfia 2da', 1, 'Francisco Brujan', '2017-01-01', '2017-06-01'),
(3, 'Filadelfia 3era', 1, 'Clarivel J. Batel Ramirez', '2017-01-01', '2017-05-01'),
(5, 'Fraternal', 1, 'Claudio Alvarez', '2017-02-01', '2017-03-17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `iglesias`
--
ALTER TABLE `iglesias`
  ADD PRIMARY KEY (`id_iglesia`),
  ADD UNIQUE KEY `iglesia` (`iglesia`,`fundador`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `iglesias`
--
ALTER TABLE `iglesias`
  MODIFY `id_iglesia` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;--
-- Database: `phpmyadmin`
--
DROP DATABASE IF EXISTS `phpmyadmin`;
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE phpmyadmin;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__bookmark`;
CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__central_columns`;
CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__column_info`;
CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__designer_settings`;
CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__export_templates`;
CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__favorite`;
CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__history`;
CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__navigationhiding`;
CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__pdf_pages`;
CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__recent`;
CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"bck_iglesia\",\"table\":\"iglesia\"},{\"db\":\"bck_iglesia\",\"table\":\"lideres\"},{\"db\":\"bck_iglesia\",\"table\":\"ingresos_egresos\"},{\"db\":\"bck_iglesia\",\"table\":\"estados\"},{\"db\":\"bck_iglesia\",\"table\":\"departamentos\"},{\"db\":\"bck_iglesia\",\"table\":\"conceptos\"},{\"db\":\"bck_iglesia\",\"table\":\"cargos\"},{\"db\":\"bck_iglesia\",\"table\":\"asistencia\"},{\"db\":\"mysql\",\"table\":\"user\"},{\"db\":\"iglesia\",\"table\":\"iglesias\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__relation`;
CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__savedsearches`;
CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__table_coords`;
CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__table_info`;
CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__table_uiprefs`;
CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__tracking`;
CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__userconfig`;
CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2018-05-14 15:00:42', '{\"collation_connection\":\"utf8mb4_unicode_ci\",\"Export\\/file_template_server\":\"@SERVER@local_databases\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__usergroups`;
CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--
-- Creation: Jun 14, 2017 at 03:14 PM
--

DROP TABLE IF EXISTS `pma__users`;
CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `proyecto`
--
DROP DATABASE IF EXISTS `proyecto`;
CREATE DATABASE IF NOT EXISTS `proyecto` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE proyecto;

-- --------------------------------------------------------

--
-- Table structure for table `estudiantes`
--
-- Creation: Apr 10, 2018 at 04:17 PM
--

DROP TABLE IF EXISTS `estudiantes`;
CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `promedio` double NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `id_seccion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `secciones`
--
-- Creation: Apr 10, 2018 at 04:17 PM
--

DROP TABLE IF EXISTS `secciones`;
CREATE TABLE `secciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `secciones` (`id_seccion`);

--
-- Indexes for table `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `test`
--
DROP DATABASE IF EXISTS `test`;
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE test;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

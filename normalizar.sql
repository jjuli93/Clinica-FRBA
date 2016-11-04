TRUNCATE TABLE UsuarioDatos

/*NORMALIZAR PACIENTE*/
GO
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  object_id = OBJECT_ID('NormalizarPaciente')
                  AND type IN ( 'P' ))
  DROP PROCEDURE NormalizarPaciente

GO
CREATE PROCEDURE NormalizarPaciente
AS
BEGIN
	INSERT INTO UsuarioDatos (usu_nombre,usu_apellido, usu_nroDocumento, usu_direccionCompleta, usu_telefono, usu_mail, usu_fechaNacimiento)
	SELECT M.Paciente_Nombre,
	M.Paciente_Apellido,
	M.Paciente_Dni,
	M.Paciente_Direccion,
	M.Paciente_Telefono,
	M.Paciente_Mail,
	M.Paciente_Fecha_Nac
	FROM gd_esquema.Maestra M
END
GO

EXECUTE NormalizarPaciente
GO 

/*NORMALIZAR PROFESIONAL*/
GO
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  object_id = OBJECT_ID('NormalizarProfesional')
                  AND type IN ( 'P' ))
  DROP PROCEDURE NormalizarProfesional

GO
CREATE PROCEDURE NormalizarProfesional
AS
BEGIN
	INSERT INTO UsuarioDatos (usu_nombre,usu_apellido, usu_nroDocumento, usu_direccionCompleta, usu_telefono, usu_mail, usu_fechaNacimiento)
	SELECT M.Medico_Nombre,
	M.Medico_Apellido,
	M.Medico_Dni,
	M.Medico_Direccion,
	M.Medico_Telefono,
	M.Medico_Mail,
	M.Medico_Fecha_Nac
	FROM gd_esquema.Maestra M
END
GO

EXECUTE NormalizarProfesional
GO 



/*NORMALIZAR TIPO ESPECIALIDADES*/
GO
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  object_id = OBJECT_ID('NormalizarEspecialidades')
                  AND type IN ( 'P' ))
  DROP PROCEDURE NormalizarEspecialidades

GO
CREATE PROCEDURE NormalizarEspecialidades
AS
BEGIN
TRUNCATE TABLE Especialidad
TRUNCATE TABLE TipoEspecialidad

 
	INSERT INTO TipoEspecialidad(tipoEs_codigo,tipoEs_detalle)
	SELECT M.Tipo_Especialidad_Codigo, M.Tipo_Especialidad_Descripcion
	FROM [gd_esquema].[Maestra] M
	GROUP BY M.Tipo_Especialidad_Codigo, M.Tipo_Especialidad_Descripcion

	INSERT INTO Especialidad(espe_idTipoEspecialidad,espe_codigo,espe_descripcion)
	SELECT TE.tipoEs_idTipoEspecialidad, M.Especialidad_Codigo, M.Especialidad_Descripcion
	FROM [gd_esquema].[Maestra] M, dbo.TipoEspecialidad TE
	WHERE TE.tipoEs_codigo = M.Tipo_Especialidad_Codigo
	GROUP BY TE.tipoEs_idTipoEspecialidad,M.Especialidad_Codigo, M.Especialidad_Descripcion


END
GO

EXECUTE NormalizarEspecialidades
GO 


SELECT COUNT(distinct[Medico_Nombre]) as NombresDistintos
      ,COUNT(distinct[Medico_Apellido]) as ApellidosDistintos
	  ,COUNT(distinct CONCAT(Medico_Nombre,Medico_Apellido)) as MedicosDistintos
      ,COUNT(distinct[Medico_Dni]) as DniDistintos
       FROM [GD2C2016].[gd_esquema].[Maestra]


SELECT COUNT(distinct Tipo_Especialidad_Codigo) as CodigosTipo
      ,COUNT(distinct Tipo_Especialidad_Descripcion) as DescTipo
	  ,COUNT(distinct Especialidad_Codigo) as CodigosEspecialidades
      ,COUNT(distinct Especialidad_Descripcion) as Especialidades
       FROM [GD2C2016].[gd_esquema].[Maestra]

SELECT M.Tipo_Especialidad_Codigo, M.Tipo_Especialidad_Descripcion
FROM [gd_esquema].[Maestra] M
GROUP BY M.Tipo_Especialidad_Codigo, M.Tipo_Especialidad_Descripcion

SELECT M.Especialidad_Codigo, M.Especialidad_Descripcion
FROM [gd_esquema].[Maestra] M
GROUP BY M.Especialidad_Codigo, M.Especialidad_Descripcion
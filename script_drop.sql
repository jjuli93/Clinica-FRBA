use GD2C2016
GO

-------------------------------------------------------------------------------------
-------------------------------------DROP FKS----------------------------------------
-------------------------------------------------------------------------------------
ALTER TABLE Indexados.Turno DROP CONSTRAINT fk_Turno_to_ProfesionalXEspecialidad;
ALTER TABLE Indexados.Turno DROP CONSTRAINT fk_Turno_to_Afiliado;
ALTER TABLE Indexados.Turno DROP CONSTRAINT fk_Turno_to_Cancelacion;
ALTER TABLE Indexados.AtencionMedica DROP CONSTRAINT fk_AtencionMedica_to_Turno;
ALTER TABLE Indexados.AtencionMedica DROP CONSTRAINT fk_AtencionMedica_to_Resultado;
ALTER TABLE Indexados.AtencionMedica DROP CONSTRAINT fk_AtencionMedica_to_Bono;
ALTER TABLE Indexados.Afiliado DROP CONSTRAINT fk_Afiliado_to_PlanMedico;
ALTER TABLE Indexados.Afiliado DROP CONSTRAINT fk_Afiliado_to_Usuario;
ALTER TABLE Indexados.Bono DROP CONSTRAINT fk_Bono_to_PlanMedico;
ALTER TABLE Indexados.Bono DROP CONSTRAINT fk_Bono_to_Comprador;
ALTER TABLE Indexados.Bono DROP CONSTRAINT fk_Bono_to_UsadoPor;
ALTER TABLE Indexados.Bono DROP CONSTRAINT fk_Bono_to_Compra;
ALTER TABLE Indexados.Cancelacion DROP CONSTRAINT fk_Cancelacion_to_Afiliado;
ALTER TABLE Indexados.Cancelacion DROP CONSTRAINT fk_Cancelacion_to_Profesional;
ALTER TABLE Indexados.UsuarioXRol DROP CONSTRAINT fk_UsuarioXRol_to_Usuario;
ALTER TABLE Indexados.UsuarioXRol DROP CONSTRAINT fk_UsuarioXRol_to_Rol;
ALTER TABLE Indexados.FuncionalidadXRol DROP CONSTRAINT fk_FuncionalidadXRol_to_Funcionalidad;
ALTER TABLE Indexados.FuncionalidadXRol DROP CONSTRAINT fk_FuncionalidadXRol_to_Rol;
ALTER TABLE Indexados.Profesional DROP CONSTRAINT fk_Profesional_to_Usuario;
ALTER TABLE Indexados.Compra DROP CONSTRAINT fk_Compra_to_Afiliado;
ALTER TABLE Indexados.Usuario DROP CONSTRAINT fk_Usuario_to_EstadoCivil;
ALTER TABLE Indexados.Usuario DROP CONSTRAINT fk_Usuario_to_TipoDocumento;
ALTER TABLE Indexados.CambiosPlan DROP CONSTRAINT fk_CambiosPlan_to_PlanAnterior;
ALTER TABLE Indexados.CambiosPlan DROP CONSTRAINT fk_CambiosPlan_to_PlanActual;
ALTER TABLE Indexados.CambiosPlan DROP CONSTRAINT fk_CambiosPlan_to_Afiliado;
ALTER TABLE Indexados.ProfesionalXEspecialidad DROP CONSTRAINT fk_ProfesionalXEspecialidad_to_Profesional;
ALTER TABLE Indexados.ProfesionalXEspecialidad DROP CONSTRAINT fk_ProfesionalXEspecialidad_to_Especialidad;
ALTER TABLE Indexados.ProfesionalXEspecialidad DROP CONSTRAINT fk_ProfesionalXEspecialidad_to_Agenda;
ALTER TABLE Indexados.Especialidad DROP CONSTRAINT fk_Especialidad_to_TipoEspecialidad;


-------------------------------------------------------------------------------------
-----------------------------------DROP TABLES---------------------------------------
-------------------------------------------------------------------------------------

drop table INDEXADOS.Rol;
drop table INDEXADOS.Funcionalidad;
drop table INDEXADOS.FuncionalidadXRol;
drop table INDEXADOS.UsuarioXRol;
drop table INDEXADOS.Usuario;
drop table INDEXADOS.Profesional;
drop table INDEXADOS.Afiliado;
drop table  INDEXADOS.TipoDocumento;
drop table  INDEXADOS.EstadoCivil;
drop table INDEXADOS.ProfesionalXEspecialidad;
drop table INDEXADOS.Especialidad;
drop table  INDEXADOS.TipoEspecialidad;
drop table INDEXADOS.Agenda;
drop table INDEXADOS.Turno;
drop table INDEXADOS.PlanMedico;
drop table INDEXADOS.Bono;
drop table INDEXADOS.Compra;
drop table INDEXADOS.Cancelacion;
drop table INDEXADOS.AtencionMedica;
drop table INDEXADOS.Resultado;
drop table INDEXADOS.CambiosPlan;


-------------------------------------------------------------------------------------
----------------------------------DROP SCHEMA----------------------------------------
-------------------------------------------------------------------------------------
DROP SCHEMA INDEXADOS
GO
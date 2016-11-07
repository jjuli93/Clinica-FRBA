USE [GD2C2016]
GO
CREATE SCHEMA INDEXADOS AUTHORIZATION [gd]
GO

--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Creacion de tablas-------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

create table INDEXADOS.Rol(
rol_id int identity(1,1) not null,
rol_descripcion varchar(200),
rol_habilitado bit default(1)
);

create table INDEXADOS.Funcionalidad(
funcionalidad_id int identity(1,1) not null,
funcionalidad_descripcion varchar(200)
);

create table INDEXADOS.FuncionalidadXRol(
rol_id int not null,
funcionalidad_id int not null,
);

create table INDEXADOS.UsuarioXRol(
usuario_id int not null,
rol_id int not null,
);

create table INDEXADOS.Usuario(
usuario_id int identity(1,1) not null,
estadoCivil_id int,
tipoDocumento_id int not null,
usuario_username varchar(200),
usuario_password varchar(200),
usuario_loginFallidos int,
usuario_habilitado bit default(1),
usuario_nombre varchar(200),
usuario_apellido varchar(200),
usuario_nroDocumento int,
usuario_sexo [char](1),
usuario_direccion varchar(200),
usuario_telefono int,
usuario_mail varchar(200),
usuario_fechaNacimiento [date]
);

create table INDEXADOS.Profesional(
profesional_id int identity(1,1) not null,
usuario_id int not null,
profesional_matricula int
);

create table INDEXADOS.Afiliado(
afiliado_id int identity(1,1) not null,
usuario_id int not null,
planMedico_id int not null,
afiliado_numero int,
afiliado_habilitado bit default(1)
);

create table  INDEXADOS.TipoDocumento(
tipoDocumento_id int identity(1,1) not null,
tipoDocumento_descripcion varchar(200)
);

create table  INDEXADOS.EstadoCivil(
estadoCivil_id int identity(1,1) not null,
estadoCivil_descripcion varchar(200)
);

create table INDEXADOS.ProfesionalXEspecialidad(
profesionalXEspecialidad_id int identity(1,1) not null,
profesional_id int not null,
especialidad_id int not null,
agenda_id int
);

create table INDEXADOS.Especialidad(
especialidad_id int identity(1,1) not null,
tipoEspecialidad_id int not null,
especialidad_codigo int,
especialidad_descripcion varchar(200)
);

create table  INDEXADOS.TipoEspecialidad(
tipoEspecialidad_id int identity(1,1) not null,
tipoEspecialidad_codigo int,
tipoEspecialidad_descripcion varchar(200)
);

create table INDEXADOS.Agenda(
agenda_id int identity(1,1) not null,
agenda_dia int,
agenda_horaDesde time,
agenda_horaHasta time,
agenda_fechaDesde date,
agenda_fechaHasta date
);

create table INDEXADOS.Turno(
turno_id int identity(1,1) not null,
profesionalXEspecialidad_id int not null,
afiliado_id int not null,
cancelacion_id int,
turno_numero int,							-- ¿para que sirve?
turno_fecha datetime
);

create table INDEXADOS.PlanMedico(
planMedico_id int identity(1,1) not null,
planMedico_codigo int,
planMedico_descripcion varchar(200),
planMedico_precioBono int
);

create table INDEXADOS.Bono(
bono_id int identity(1,1) not null,
planMedico_id int not null,
comprador_id  int not null,
usadoPor_id int not null,
compra_id int not null,
bono_fechaUso datetime
);

create table INDEXADOS.Compra(
compra_id int identity(1,1) not null,
afiliado_id int not null,
compra_fecha datetime,
compra_precio int,
compra_cantidadBonos int
);

create table INDEXADOS.Cancelacion(
cancelacion_id int identity(1,1) not null,
afiliado_id int,
profesional_id int,
cancelacion_tipo int, --0 para cancelado por afiliado, 1 para cancelado por medico
cancelacion_motivo varchar(200),
cancelacion_fechaDesde datetime,
cancelacion_fechaHasta datetime
);

create table INDEXADOS.AtencionMedica(
atencionMedica_id int identity(1,1) not null,
turno_id int not null,
resultado_id int not null,
bono_id int not null,
atencionMedica_fechaLlegada datetime
);

create table INDEXADOS.Resultado(
resultado_id int identity(1,1) not null,
resultado_sintomas varchar(200),
resultado_diagnostico varchar(200)
);

create table INDEXADOS.CambiosPlan(
cambiosPlan_id int identity(1,1) not null,
planAnterior_id int,
planActual_id int not null,
afiliado_id int not null,
cambiosPlan_motivo varchar(200),
cambiosPlan_fecha datetime
);


--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Creacion de PKS----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

alter table Indexados.Rol add constraint pk_rol_id primary key (rol_id);
alter table Indexados.Funcionalidad add constraint pk_funcionalidad_id primary key (funcionalidad_id);
alter table Indexados.FuncionalidadXRol add constraint pk_funcionalidadXRol_id primary key (funcionalidad_id);
alter table Indexados.UsuarioXRol add constraint pk_usuarioXRol_id primary key (rol_id, usuario_id);
alter table Indexados.Usuario add constraint pk_usuario_id primary key (usuario_id);
alter table Indexados.Profesional add constraint pk_profesional_id primary key (profesional_id);
alter table Indexados.Afiliado add constraint pk_afiliado_id primary key (afiliado_id);
alter table Indexados.TipoDocumento add constraint pk_tipoDocumento_id primary key (tipoDocumento_id);
alter table Indexados.EstadoCivil add constraint pk_estadoCivil_id primary key (estadoCivil_id);
alter table Indexados.ProfesionalXEspecialidad add constraint pk_profesionalXEspecialidad_id primary key (profesionalXEspecialidad_id);
alter table Indexados.Especialidad add constraint pk_especialidad_id primary key (especialidad_id);
alter table Indexados.TipoEspecialidad add constraint pk_tipoEspecialidad_id primary key (tipoEspecialidad_id);
alter table Indexados.Agenda add constraint pk_agenda_id primary key (agenda_id);
alter table Indexados.Turno add constraint pk_turno_id primary key (turno_id);
alter table Indexados.PlanMedico add constraint pk_planMedico_id primary key (planMedico_id);
alter table Indexados.Bono add constraint pk_bono_id primary key (bono_id);
alter table Indexados.Compra add constraint pk_compra_id primary key (compra_id);
alter table Indexados.Cancelacion add constraint pk_cancelacion_id primary key (cancelacion_id);
alter table Indexados.AtencionMedica add constraint pk_atencionMedica_id primary key (atencionMedica_id);
alter table Indexados.Resultado add constraint pk_resultado_id primary key (resultado_id);
alter table Indexados.CambiosPlan add constraint pk_cambiosPlan_id primary key (cambiosPlan_id);


--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Creacion de FKS----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

ALTER TABLE Indexados.Turno ADD CONSTRAINT fk_Turno_to_ProfesionalXEspecialidad FOREIGN KEY (profesionalXEspecialidad_id) REFERENCES Indexados.ProfesionalXEspecialidad (profesionalXEspecialidad_id);
ALTER TABLE Indexados.Turno ADD CONSTRAINT fk_Turno_to_Afiliado FOREIGN KEY (afiliado_id) REFERENCES Indexados.Afiliado (afiliado_id);
ALTER TABLE Indexados.Turno ADD CONSTRAINT fk_Turno_to_Cancelacion FOREIGN KEY (cancelacion_id) REFERENCES Indexados.Cancelacion (cancelacion_id);
ALTER TABLE Indexados.AtencionMedica ADD CONSTRAINT fk_AtencionMedica_to_Turno FOREIGN KEY (turno_id) REFERENCES Indexados.Turno (turno_id);
ALTER TABLE Indexados.AtencionMedica ADD CONSTRAINT fk_AtencionMedica_to_Resultado FOREIGN KEY (resultado_id) REFERENCES Indexados.Resultado (resultado_id);
ALTER TABLE Indexados.AtencionMedica ADD CONSTRAINT fk_AtencionMedica_to_Bono FOREIGN KEY (bono_id) REFERENCES Indexados.Bono (bono_id);
ALTER TABLE Indexados.Afiliado ADD CONSTRAINT fk_Afiliado_to_PlanMedico FOREIGN KEY (planMedico_id) REFERENCES Indexados.PlanMedico (planMedico_id);
ALTER TABLE Indexados.Afiliado ADD CONSTRAINT fk_Afiliado_to_Usuario FOREIGN KEY (usuario_id) REFERENCES Indexados.Usuario (usuario_id);
ALTER TABLE Indexados.Bono ADD CONSTRAINT fk_Bono_to_PlanMedico FOREIGN KEY (planMedico_id) REFERENCES Indexados.PlanMedico (planMedico_id);
ALTER TABLE Indexados.Bono ADD CONSTRAINT fk_Bono_to_Comprador FOREIGN KEY (comprador_id) REFERENCES Indexados.Afiliado (afiliado_id);
ALTER TABLE Indexados.Bono ADD CONSTRAINT fk_Bono_to_UsadoPor FOREIGN KEY (usadoPor_id) REFERENCES Indexados.Afiliado (afiliado_id);
ALTER TABLE Indexados.Bono ADD CONSTRAINT fk_Bono_to_Compra FOREIGN KEY (compra_id) REFERENCES Indexados.Compra (compra_id);
ALTER TABLE Indexados.Cancelacion ADD CONSTRAINT fk_Cancelacion_to_Afiliado FOREIGN KEY (afiliado_id) REFERENCES Indexados.Afiliado (afiliado_id);
ALTER TABLE Indexados.Cancelacion ADD CONSTRAINT fk_Cancelacion_to_Profesional FOREIGN KEY (profesional_id) REFERENCES Indexados.Profesional (profesional_id);
ALTER TABLE Indexados.UsuarioXRol ADD CONSTRAINT fk_UsuarioXRol_to_Usuario FOREIGN KEY (usuario_id) REFERENCES Indexados.Usuario (usuario_id);
ALTER TABLE Indexados.UsuarioXRol ADD CONSTRAINT fk_UsuarioXRol_to_Rol FOREIGN KEY (rol_id) REFERENCES Indexados.Rol (rol_id);
ALTER TABLE Indexados.FuncionalidadXRol ADD CONSTRAINT fk_FuncionalidadXRol_to_Funcionalidad FOREIGN KEY (funcionalidad_id) REFERENCES Indexados.Funcionalidad (funcionalidad_id);
ALTER TABLE Indexados.FuncionalidadXRol ADD CONSTRAINT fk_FuncionalidadXRol_to_Rol FOREIGN KEY (rol_id) REFERENCES Indexados.Rol (rol_id);
ALTER TABLE Indexados.Profesional ADD CONSTRAINT fk_Profesional_to_Usuario FOREIGN KEY (usuario_id) REFERENCES Indexados.Usuario (usuario_id);
ALTER TABLE Indexados.Compra ADD CONSTRAINT fk_Compra_to_Afiliado FOREIGN KEY (afiliado_id) REFERENCES Indexados.Afiliado (afiliado_id);
ALTER TABLE Indexados.Usuario ADD CONSTRAINT fk_Usuario_to_EstadoCivil FOREIGN KEY (estadoCivil_id) REFERENCES Indexados.EstadoCivil (estadoCivil_id);
ALTER TABLE Indexados.Usuario ADD CONSTRAINT fk_Usuario_to_TipoDocumento FOREIGN KEY (tipoDocumento_id) REFERENCES Indexados.TipoDocumento (tipoDocumento_id);
ALTER TABLE Indexados.CambiosPlan ADD CONSTRAINT fk_CambiosPlan_to_PlanAnterior FOREIGN KEY (planAnterior_id) REFERENCES Indexados.PlanMedico (planMedico_id);
ALTER TABLE Indexados.CambiosPlan ADD CONSTRAINT fk_CambiosPlan_to_PlanActual FOREIGN KEY (planActual_id) REFERENCES Indexados.PlanMedico (planMedico_id);
ALTER TABLE Indexados.CambiosPlan ADD CONSTRAINT fk_CambiosPlan_to_Afiliado FOREIGN KEY (afiliado_id) REFERENCES Indexados.Afiliado (afiliado_id);
ALTER TABLE Indexados.ProfesionalXEspecialidad ADD CONSTRAINT fk_ProfesionalXEspecialidad_to_Profesional FOREIGN KEY (profesional_id) REFERENCES Indexados.Profesional (profesional_id);
ALTER TABLE Indexados.ProfesionalXEspecialidad ADD CONSTRAINT fk_ProfesionalXEspecialidad_to_Especialidad FOREIGN KEY (especialidad_id) REFERENCES Indexados.Especialidad (especialidad_id);
ALTER TABLE Indexados.ProfesionalXEspecialidad ADD CONSTRAINT fk_ProfesionalXEspecialidad_to_Agenda FOREIGN KEY (agenda_id) REFERENCES Indexados.Agenda (agenda_id);
ALTER TABLE Indexados.Especialidad ADD CONSTRAINT fk_Especialidad_to_TipoEspecialidad FOREIGN KEY (tipoEspecialidad_id) REFERENCES Indexados.TipoEspecialidad (tipoEspecialidad_id);
GO

--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Triggers-----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

create trigger INDEXADOS.insertar_profesional on INDEXADOS.Profesional for insert
as
begin
	insert into INDEXADOS.UsuarioXRol(usuario_id, rol_id)
	select  i.usuario_id,  R.rol_id
	from inserted i, INDEXADOS.Rol R
	where R.rol_descripcion = 'Profesional'
end
go
	
create trigger INDEXADOS.insertar_afiliado on INDEXADOS.Afiliado for insert
as
begin
	insert into INDEXADOS.UsuarioXRol(usuario_id, rol_id)
	select i.usuario_id, r.rol_id
	from inserted i, INDEXADOS.Rol r
	where R.rol_descripcion = 'Afiliado'
end
go



--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Migracion----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------
--------------------EstadoCivil-------------------------
--------------------------------------------------------
INSERT INTO INDEXADOS.EstadoCivil(estadoCivil_descripcion)
VALUES ('Soltero'),('Casado'),('Viudo'),('Divorciado')

--------------------------------------------------------
--------------------TipoDocumento-----------------------
--------------------------------------------------------
INSERT INTO INDEXADOS.TipoDocumento(tipoDocumento_descripcion)
VALUES ('DNI'),('LE'),('LC')


--------------------------------------------------------
--------------------Rol---------------------------------
--------------------------------------------------------
Insert INTO INDEXADOS.Rol(rol_descripcion)
  VALUES ('Administrador'), ('Afiliado'), ('Profesional')

--------------------------------------------------------
--------------------TipoEspecialidad--------------------
--------------------------------------------------------
Insert INTO INDEXADOS.TipoEspecialidad(tipoEspecialidad_codigo, tipoEspecialidad_descripcion)
select Tipo_Especialidad_Codigo, Tipo_Especialidad_Descripcion
from gd_esquema.Maestra
where Tipo_Especialidad_Codigo is not null
group by Tipo_Especialidad_Codigo, Tipo_Especialidad_Descripcion

--------------------------------------------------------
--------------------Especialidad------------------------
--------------------------------------------------------
insert into INDEXADOS.Especialidad(especialidad_codigo, especialidad_descripcion, tipoEspecialidad_id)
select M.Especialidad_Codigo, M.Especialidad_Descripcion, I.tipoEspecialidad_id
from gd_esquema.Maestra M, INDEXADOS.TipoEspecialidad I
where M.Especialidad_Codigo is not null
and M.Tipo_Especialidad_Codigo = I.tipoEspecialidad_codigo
group by M.Especialidad_Codigo, M.Especialidad_Descripcion, I.tipoEspecialidad_id

--------------------------------------------------------
--------------------Usuario-----------------------------
--------------------------------------------------------
insert into INDEXADOS.Usuario(usuario_nombre, usuario_apellido, usuario_nroDocumento, usuario_direccion, usuario_telefono, usuario_mail, usuario_fechaNacimiento, usuario_loginFallidos, tipoDocumento_id, usuario_username, usuario_password)
select M.Medico_Nombre, M.Medico_Apellido, M.Medico_Dni, M.Medico_Direccion, M.Medico_Telefono, M.Medico_Mail, M.Medico_Fecha_Nac,0,I.tipoDocumento_id, M.Medico_Apellido, HASHBYTES('SHA2_256', 'profesional')
from gd_esquema.Maestra M, INDEXADOS.TipoDocumento I
where M.Medico_Nombre is not null
and M.Medico_Apellido is not null
and M.Medico_Dni is not null
and I.tipoDocumento_descripcion = 'DNI'
group by M.Medico_Nombre, M.Medico_Apellido, M.Medico_Dni, M.Medico_Direccion, M.Medico_Telefono, M.Medico_Mail, M.Medico_Fecha_Nac, I.tipoDocumento_id
union
select Paciente_Nombre, Paciente_Apellido, Paciente_Dni, Paciente_Direccion, Paciente_Telefono, Paciente_Mail, Paciente_Fecha_Nac,0, i.tipoDocumento_id, Paciente_Apellido, HASHBYTES('SHA2_256', 'afiliado')
from gd_esquema.Maestra M, INDEXADOS.TipoDocumento i
where Paciente_Nombre is not null
and Paciente_Apellido is not null
and Paciente_Dni is not null
and I.tipoDocumento_descripcion = 'DNI'
group by Paciente_Nombre, Paciente_Apellido, Paciente_Dni, Paciente_Direccion, Paciente_Telefono, Paciente_Mail, Paciente_Fecha_Nac, i.tipoDocumento_id


--------------------------------------------------------
--------------------Profesional-------------------------
--------------------------------------------------------
insert into INDEXADOS.Profesional(usuario_id)
select u.usuario_id
from gd_esquema.Maestra m, INDEXADOS.Usuario u
where m.Medico_Nombre = u.usuario_nombre
and m.Medico_Apellido = u.usuario_apellido
and m.Medico_Dni = u.usuario_nroDocumento
group by m.Medico_Nombre, m.Medico_Apellido, m.Medico_Dni, u.usuario_id

--------------------------------------------------------
---------------ProfesionalXEspecialidad-----------------
--------------------------------------------------------
insert into INDEXADOS.ProfesionalXEspecialidad(profesional_id, especialidad_id)
select p.profesional_id, e.especialidad_id
from gd_esquema.Maestra m, INDEXADOS.Usuario u, INDEXADOS.Profesional p, INDEXADOS.Especialidad e
where m.Medico_Dni = u.usuario_nroDocumento
and p.usuario_id = u.usuario_id
and m.Especialidad_Codigo = e.especialidad_codigo
group by p.profesional_id, e.especialidad_id

--------------------------------------------------------
----------------------PlanMedico------------------------
--------------------------------------------------------
insert into INDEXADOS.PlanMedico(planMedico_codigo, planMedico_descripcion, planMedico_precioBono)
select m.Plan_Med_Codigo, m.Plan_Med_Descripcion, m.Plan_Med_Precio_Bono_Consulta
from gd_esquema.Maestra m
group by m.Plan_Med_Codigo, m.Plan_Med_Descripcion, m.Plan_Med_Precio_Bono_Consulta

--------------------------------------------------------
--------------------Afiliado----------------------------
--------------------------------------------------------
insert into INDEXADOS.Afiliado(usuario_id, planMedico_id)
select u.usuario_id, p.planMedico_id
from gd_esquema.Maestra m, INDEXADOS.Usuario u, INDEXADOS.PlanMedico p
where m.Paciente_Dni = u.usuario_nroDocumento
and m.Plan_Med_Codigo = p.planMedico_codigo
group by u.usuario_id, p.planMedico_id


--------------------------------------------------------
--------------------Turno-------------------------------
--------------------------------------------------------
insert into INDEXADOS.Turno(profesionalXEspecialidad_id, afiliado_id,turno_numero, turno_fecha)
select pe.profesionalXEspecialidad_id, a.afiliado_id, m.Turno_Numero, m.Turno_Fecha
from  INDEXADOS.ProfesionalXEspecialidad pe, INDEXADOS.Afiliado a, gd_esquema.Maestra m, INDEXADOS.Usuario u, INDEXADOS.Usuario u2, INDEXADOS.Profesional p
where m.Paciente_Dni = u.usuario_nroDocumento
and u.usuario_id = a.usuario_id
and m.Medico_Dni = u2.usuario_nroDocumento
and u2.usuario_id = p.usuario_id
and p.profesional_id = pe.profesional_id
group by pe.profesionalXEspecialidad_id, a.afiliado_id, m.Turno_Numero, m.Turno_Fecha

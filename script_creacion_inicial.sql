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
estadoCivil_id int not null,
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
matricula int
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
agenda_id int not null
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
cancelacion_id int not null,
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



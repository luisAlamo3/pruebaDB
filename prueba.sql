create database reportes;

create table clientes(
    id_cliente serial primary key,
    nombre varchar(100),
    tipo_cliente varchar(100),
    telefono varchar(20),
    email varchar(50)
);



create table agentes(
    id_agente serial primary key,
    nombre varchar(100),
    email varchar(100)
);



create table tickets(
    id_ticket serial primary key,
    categoria varchar(50),
    descripcion varchar(250),
    fecha_cracion date,
    estado_actual varchar(50),
    id_cliente int,
    id_agente int,
    foreign key (id_cliente) references clientes(id_cliente) on delete cascade on update cascade,
    foreign key (id_agente) references agentes(id_agente) on delete cascade on update cascade
);



create table historial(
    id_historial serial primary key,
    estado varchar(50),
    fecha date,
    comentarios varchar(200),
    id_agente int,
    id_ticket int,
    foreign key (id_agente) references agentes(id_agente) on delete cascade on update cascade,
    foreign key (id_ticket) references tickets(id_ticket) on delete cascade on update cascade
);

drop table clientes;
drop table agentes;
drop table tickets;
drop table historial;

select * from clientes;
select * from agentes;
select * from tickets;
select * from historial;

INSERT INTO agentes (nombre, email) VALUES
('Ana García', 'ana.garcia@soporte.com'),
('Luis Pérez', 'luis.perez@soporte.com'),
('Sofía Rojas', 'sofia.rojas@soporte.com'),
('Javier Mendoza', 'javier.mendoza@soporte.com'),
('Elena Torres', 'elena.torres@soporte.com');

INSERT INTO clientes (nombre, tipo_cliente, telefono, email) VALUES
('Empresa A S.A.S.', 'Corporativo', '5512340001', 'contacto@empresaA.com'),
('María López', 'Particular', '5512340002', 'maria.lopez@gmail.com'),
('Consultora Beta', 'Negocio', '5512340003', 'soporte@consultorabeta.net'),
('Juan Ramírez', 'Particular', '5512340004', 'juan.ramirez@hotmail.com'),
('Distribuidora Z', 'Corporativo', '5512340005', 'administracion@distribuidoraZ.com');

INSERT INTO tickets (categoria, descripcion, fecha_cracion, estado_actual, id_cliente, id_agente) VALUES
('Técnico', 'Error al iniciar sesión en plataforma, devuelve mensaje de "Usuario no encontrado".', '2025-09-25', 'Abierto', 1, 1),
('Facturación', 'Consulta sobre el desglose de cargos de la factura de septiembre.', '2025-09-25', 'Abierto', 2, 2),
('Rendimiento', 'Reportes tardan más de 5 minutos en cargar, se solicita revisión de performance.', '2025-09-26', 'En Progreso', 3, 1),
('App Móvil', 'El botón de "Finalizar Compra" en la app móvil (Android) no reacciona al click.', '2025-09-27', 'Abierto', 4, 3),
('Funcionalidad', 'Se solicita la opción de exportar todos los datos de las tablas a formato PDF.', '2025-09-28', 'Pendiente', 5, 4),
('Técnico', 'La integración vía API está devolviendo consistentemente errores de servidor (500).', '2025-09-29', 'En Progreso', 1, 2),
('Cuenta', 'No es posible actualizar el número de teléfono en el perfil de usuario.', '2025-09-30', 'Abierto', 2, 5),
('Configuración', 'Se requiere asistencia para dar de alta un nuevo usuario con permisos de "Solo Lectura".', '2025-09-24', 'Cerrado', 3, 3),
('General', 'Dudas sobre las políticas de cancelación de la suscripción.', '2025-09-23', 'Cerrado', 4, 4),
('Visual', 'Se observa un pequeño solapamiento de texto en el encabezado del dashboard.', '2025-10-01', 'Abierto', 5, 5);

INSERT INTO historial (estado, fecha, comentarios, id_agente, id_ticket) VALUES
('Asignado', '2025-09-25', 'Ticket asignado. Se solicitaron los logs de acceso al cliente.', 1, 1),
('En Progreso', '2025-09-26', 'Se escaló al equipo de desarrollo para revisión de índices de la base de datos.', 1, 3),
('En Progreso', '2025-09-30', 'Se pudo reproducir el error. Se está aislando la causa raíz del error 500.', 2, 6),
('Cerrado', '2025-09-24', 'Se creó el nuevo usuario y se verificó que tuviera los permisos correctos. Ticket cerrado.', 3, 8),
('Cerrado', '2025-09-23', 'Se envió el enlace a los Términos y Condiciones. Cliente conforme.', 4, 9),
('En Progreso', '2025-09-28', 'Se solicitó al cliente información detallada del dispositivo y versión de la app.', 3, 4),
('Pendiente', '2025-09-29', 'Se agregó la solicitud al backlog de desarrollo para estimación de tiempo.', 4, 5),
('Resuelto', '2025-09-27', 'Se identificó un error de caché. Se limpió y se verificó el acceso. Pendiente de cierre.', 1, 1),
('Abierto', '2025-10-01', 'Ticket recién creado. Pendiente de asignar prioridad y agente.', 5, 10),
('En Progreso', '2025-09-30', 'Validando la causa por la que la API rechaza la actualización de datos de contacto.', 5, 7);

INSERT INTO agentes (nombre, email) VALUES
('Carlos Varela', 'carlos.varela@soporte.com'), -- ID 6
('Marta Díaz', 'marta.diaz@soporte.com'),      -- ID 7
('Pedro Ruiz', 'pedro.ruiz@soporte.com'),      -- ID 8
('Nadia Castro', 'nadia.castro@soporte.com'),  -- ID 9
('Ricardo Soto', 'ricardo.soto@soporte.com');  -- ID 10

INSERT INTO clientes (nombre, tipo_cliente, telefono, email) VALUES
('Tecno Global S.A.', 'Corporativo', '5512340006', 'soporte@tecnoglobal.com'),   -- ID 6
('Roberto Gómez', 'Particular', '5512340007', 'roberto.gomez@yahoo.com'),       -- ID 7
('Academia Sigma', 'Negocio', '5512340008', 'contacto@academiasigma.com'),      -- ID 8
('Laura Fernández', 'Particular', '5512340009', 'laura.fernandez@outlook.com'), -- ID 9
('Servicios Alfa', 'Corporativo', '5512340010', 'rrhh@serviciosalfa.com');      -- ID 10

INSERT INTO tickets (categoria, descripcion, fecha_cracion, estado_actual, id_cliente, id_agente) VALUES
('Configuración', 'Error al intentar configurar un nuevo webhook para integraciones.', '2025-10-02', 'Abierto', 6, 6),
('Facturación', 'Solicitud de cambio de método de pago a transferencia bancaria.', '2025-10-02', 'Pendiente', 7, 7),
('Técnico', 'Problemas de latencia al subir archivos grandes al servidor.', '2025-10-03', 'En Progreso', 8, 6),
('App Móvil', 'La aplicación se cierra inesperadamente al intentar ver el historial de pedidos (iOS).', '2025-10-04', 'Abierto', 9, 8),
('Funcionalidad', 'Solicitud para añadir un campo de comentarios obligatorios al finalizar la compra.', '2025-10-05', 'Pendiente', 10, 9),
('General', 'Duda sobre el límite de usuarios que podemos tener en el plan actual.', '2025-10-06', 'Cerrado', 6, 10),
('Cuenta', 'Se necesita resetear la contraseña del usuario administrador.', '2025-10-07', 'Abierto', 7, 7),
('Rendimiento', 'El dashboard principal no se actualiza con datos en tiempo real.', '2025-10-08', 'En Progreso', 8, 8),
('Visual', 'El logo de la empresa aparece pixelado en la versión de escritorio.', '2025-10-09', 'Cerrado', 9, 9),
('Técnico', 'Imposibilidad de conectar la impresora de etiquetas al sistema.', '2025-10-10', 'Abierto', 10, 10);

INSERT INTO historial (estado, fecha, comentarios, id_agente, id_ticket) VALUES
('Asignado', '2025-10-02', 'Agente 6 asignado. Pendiente de contactar al cliente.', 6, 11),
('En Progreso', '2025-10-04', 'Se revisaron los logs, se identificó un cuello de botella en el proceso de subida.', 6, 13),
('Pendiente', '2025-10-03', 'Se solicitó al cliente los datos bancarios para el nuevo método de pago.', 7, 12),
('Cerrado', '2025-10-06', 'Se confirmó que el límite de usuarios es 50 en su plan. Ticket cerrado.', 10, 16),
('En Progreso', '2025-10-05', 'Se pudo reproducir el fallo de la app en un entorno de pruebas iOS.', 8, 14),
('Abierto', '2025-10-05', 'Solicitud de funcionalidad registrada. Pendiente de aprobación de producto.', 9, 15),
('En Progreso', '2025-10-08', 'Revisando la configuración de caché y la conexión con la fuente de datos.', 8, 18),
('Cerrado', '2025-10-09', 'Se corrigió la imagen del logo en el CSS. Cliente verificó y está correcto.', 9, 19),
('Asignado', '2025-10-07', 'Ticket de reseteo de clave de administrador, prioridad alta.', 7, 17),
('En Progreso', '2025-10-11', 'Se está revisando la compatibilidad de *drivers* de la impresora.', 10, 20);
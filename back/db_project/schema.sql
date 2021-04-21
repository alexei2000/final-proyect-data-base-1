DROP TABLE IF EXISTS laboratorio_medicamento;
DROP TABLE IF EXISTS orden_compra_medicamento_compra;
DROP TABLE IF EXISTS orden_compra_medicamestocknto;
DROP TABLE IF EXISTS orden_compra;
DROP TABLE IF EXISTS farmacia_medicamento;
DROP TABLE IF EXISTS compra;
DROP TABLE IF EXISTS laboratorio;
DROP TABLE IF EXISTS farmacia;
DROP TABLE IF EXISTS titulo;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS farmaceutico;
DROP TABLE IF EXISTS pasante;
DROP TABLE IF EXISTS representante;
DROP TABLE IF EXISTS medicamento;
CREATE TABLE medicamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    componentePrincipal TEXT,
    monodroga TEXT,
    cantidad INTEGER,
    acciónTerapeutica TEXT,
    unidad TEXT
);
CREATE TABLE representante (
    cedula TEXT PRIMARY KEY,
    nroPermisoPasante INTEGER,
    nombre TEXT,
    apellido TEXT,
    FOREIGN KEY (nroPermisoPasante) REFERENCES pasante (nroPermiso)
);
CREATE TABLE pasante (
    cedulaEmpleado TEXT PRIMARY KEY,
    nroPermiso INTEGER,
    especialidad TEXT,
    universidad TEXT,
    fechaInicio DATE,
    fechaFinalizacion DATE,
    FOREIGN KEY (cedulaEmpleado) REFERENCES empleado (cedula)
);
CREATE TABLE farmaceutico (
    cedulaEmpleado TEXT PRIMARY KEY,
    nroColegiatura TEXT,
    nroSanitario TEXT,
    FOREIGN KEY (cedulaEmpleado) REFERENCES empleado (cedula)
);
CREATE TABLE empleado (
    cedula TEXT PRIMARY KEY,
    idFarmacia INTEGER,
    nombre TEXT,
    apellido TEXT,
    fechaNacimiento DATE,
    telefono TEXT,
    correo TEXT,
    cargo TEXT,
    FOREIGN KEY (idFarmacia) REFERENCES farmacia (id)
);
CREATE TABLE titulo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cedulaFarmaceutico TEXT,
    nroDeRegistro TEXT,
    universidad TEXT,
    fecha DATE,
    FOREIGN KEY (cedulaFarmaceutico) REFERENCES farmaceutico
);
CREATE TABLE farmacia (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    provincia TEXT,
    ciudad TEXT,
    codigoPostal TEXT,
    telefono TEXT,
    correo TEXT,
    direccion TEXT
);
CREATE TABLE laboratorio (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    direccion TEXT,
    correo TEXT,
    telefono TEXT
);
CREATE TABLE compra (
    ordenDeCompraId INTEGER PRIMARY KEY,
    formatoDePago TEXT,
    FOREIGN KEY (ordenDeCompraId) REFERENCES orden_compra (id)
);
CREATE TABLE farmacia_medicamento (
    farmaciaId INTEGER,
    medicamentoId INTEGER,
    stock INTEGER,
    PRIMARY KEY (farmaciaId, medicamentoId),
    FOREIGN KEY (farmaciaId) REFERENCES farmacia (id),
    FOREIGN KEY (medicamentoId) REFERENCES medicamento (id)
);
CREATE TABLE orden_compra (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cedulaEmpleado TEXT,
    laboratorioId INTEGER,
    FOREIGN KEY (cedulaEmpleado) REFERENCES empleado (cedula),
    FOREIGN KEY (laboratorioId) REFERENCES laboratorio (id)
);
CREATE TABLE orden_compra_medicamestocknto (
    ordenDeCompraId INTEGER,
    medicamentoId INTEGER,
    cantidad INTEGER,
    PRIMARY KEY (ordenDeCompraId, medicamentoId),
    FOREIGN KEY (ordenDeCompraId) REFERENCES orden_compra (id),
    FOREIGN KEY (medicamentoId) REFERENCES medicamento (id)
);
CREATE TABLE orden_compra_medicamento_compra (
    ordenDeCompraId INTEGER,
    medicamentoId INTEGER,
    cantidad INTEGER,
    precioUnitario INTEGER,
    PRIMARY KEY (ordenDeCompraId, medicamentoId),
    FOREIGN KEY (ordenDeCompraId) REFERENCES orden_compra (id),
    FOREIGN KEY (medicamentoId) REFERENCES medicamento (id)
);
CREATE TABLE laboratorio_medicamento (
    laboratorioId INTEGER,
    medicamentoId INTEGER,
    cantidad INTEGER,
    PRIMARY KEY (laboratorioId, medicamentoId),
    FOREIGN KEY (laboratorioId) REFERENCES laboratorio (id),
    FOREIGN KEY (medicamentoId) REFERENCES medicamento (id)
);
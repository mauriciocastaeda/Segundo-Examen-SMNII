-- 1. Crear el tipo ENUM para 'tipo_prestamo'
CREATE TYPE tipo_prestamo_enum AS ENUM ('sueldo', 'monto_casa');

-- 2. Crear la tabla Clientes
CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    RFC VARCHAR(13) NOT NULL UNIQUE,
    edad INT NOT NULL CHECK (edad >= 18),
    fecha_alta DATE NOT NULL DEFAULT CURRENT_DATE,
    telefono VARCHAR(15) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    sueldo DECIMAL(15, 2) NOT NULL CHECK (sueldo >= 0)
);

-- 3. Crear la tabla Cotizaciones
CREATE TABLE Cotizaciones (
    id_cotizacion SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    tipo_prestamo tipo_prestamo_enum NOT NULL,
    monto_prestamo DECIMAL(15, 2) NOT NULL CHECK (monto_prestamo >= 0),
    fecha_cotizacion DATE NOT NULL DEFAULT CURRENT_DATE,
    guardado BOOLEAN NOT NULL DEFAULT FALSE,
    impreso BOOLEAN NOT NULL DEFAULT FALSE,
    valor_casa DECIMAL(15, 2) CHECK (valor_casa >= 0),
    tasa_interes DECIMAL(5, 2) NOT NULL CHECK (tasa_interes >= 0),
    plazo INT NOT NULL CHECK (plazo > 0),
    pago_mensual DECIMAL(15, 2) NOT NULL CHECK (pago_mensual >= 0),
    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- 4. Crear la tabla Tabla_Amortizacion
CREATE TABLE Tabla_Amortizacion (
    id_amortizacion SERIAL PRIMARY KEY,
    id_cotizacion INT NOT NULL,
    numero_pago INT NOT NULL CHECK (numero_pago > 0),
    fecha_pago DATE NOT NULL,
    monto_pago DECIMAL(15, 2) NOT NULL CHECK (monto_pago >= 0),
    interes DECIMAL(15, 2) NOT NULL CHECK (interes >= 0),
    capital DECIMAL(15, 2) NOT NULL CHECK (capital >= 0),
    saldo_restante DECIMAL(15, 2) NOT NULL CHECK (saldo_restante >= 0),
    CONSTRAINT fk_cotizacion
        FOREIGN KEY (id_cotizacion) REFERENCES Cotizaciones (id_cotizacion)
        ON UPDATE CASCADE ON DELETE CASCADE
);

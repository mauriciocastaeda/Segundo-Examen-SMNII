CREATE SCHEMA IF NOT EXISTS segundop;

CREATE TABLE segundop.tc_tipo_prestamo (
    id_tipo_prestamo SERIAL PRIMARY KEY,
    tipo_prestamo VARCHAR (50) NOT NULL
);

INSERT INTO segundop.tc_tipo_prestamo(tipo_prestamo)
VALUES ('Préstamo basado en sueldo', 'Préstamo por monto fijo de la casa');

CREATE TABLE segundop.tc_amortizacion (
    id_amortizacion SERIAL PRIMARY KEY,
    prestamista VARCHAR(15) NOT NULL,
    interes DECIMAL(3, 2) NOT NULL CHECK (tasa_interes >= 0),
    plazo INT NOT NULL CHECK (plazo > 0),
    enganche DECIMAL(3, 2) NOT NULL CHECK (tasa_interes >= 0)
);

--me quede aqui
INSERT INTO segundop.tc_amortizacion (prestamista, interes, plazo, enganche)

CREATE TABLE segundop.tr_prestamo_sueldo (
    id_prestamo_sueldo SERIAL PRIMARY KEY,
    sueldo_cliente DECIMAL(15, 2) NOT NULL CHECK (sueldo_cliente >= 0),
    monto_prestamo DECIMAL(15, 2) NOT NULL CHECK (monto_prestamo >= 0),
    id_tipo_prestamo INT NOT NULL,
    id_amortizacion INT NOT NULL,
    CONSTRAINT fk_tipo_prestamo
            FOREIGN KEY (id_tipo_prestamo) REFERENCES segundop.tc_tipo_prestamo (id_tipo_prestamo)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_amortizacion
            FOREIGN KEY (id_amortizacion) REFERENCES segundop.tc_amortizacion (id_amortizacion)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT chk_monto_prestamo
        CHECK (monto_prestamo <= sueldo_cliente * 0.40)
    

);

-- 2. Crear la tabla 'cliente' 
CREATE TABLE segundop.tr_cliente (
    id_cliente SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    rfc VARCHAR(13) NOT NULL UNIQUE,
    edad INT NOT NULL CHECK (edad >= 18),
    fecha_alta DATE NOT NULL DEFAULT CURRENT_DATE,
    telefono VARCHAR(15) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE PRIMARY KEY
    --,
    --sueldo DECIMAL(15, 2) NOT NULL CHECK (sueldo >= 0)
);

-- 3. Crear la tabla 'cotizacion'
CREATE TABLE segundop.cotizacion (
    id_cotizacion SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    tipo_prestamo segundop.tipo_prestamo_enum NOT NULL,
    monto_prestamo DECIMAL(15, 2) NOT NULL CHECK (monto_prestamo >= 0),
    fecha_cotizacion DATE NOT NULL DEFAULT CURRENT_DATE,
    guardado BOOLEAN NOT NULL DEFAULT FALSE,
    impreso BOOLEAN NOT NULL DEFAULT FALSE,
    valor_casa DECIMAL(15, 2) CHECK (valor_casa >= 0),
    tasa_interes DECIMAL(5, 2) NOT NULL CHECK (tasa_interes >= 0),
    plazo INT NOT NULL CHECK (plazo > 0),
    pago_mensual DECIMAL(15, 2) NOT NULL CHECK (pago_mensual >= 0),
    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente) REFERENCES segundop.cliente (id_cliente)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- 4. Crear la tabla 'amortizacion' 
CREATE TABLE segundop.amortizacion (
    id_amortizacion SERIAL PRIMARY KEY,
    id_cotizacion INT NOT NULL,
    numero_pago INT NOT NULL CHECK (numero_pago > 0),
    fecha_pago DATE NOT NULL,
    monto_pago DECIMAL(15, 2) NOT NULL CHECK (monto_pago >= 0),
    interes DECIMAL(15, 2) NOT NULL CHECK (interes >= 0),
    capital DECIMAL(15, 2) NOT NULL CHECK (capital >= 0),
    saldo_restante DECIMAL(15, 2) NOT NULL CHECK (saldo_restante >= 0),
    CONSTRAINT fk_cotizacion
        FOREIGN KEY (id_cotizacion) REFERENCES segundop.cotizacion (id_cotizacion)
        ON UPDATE CASCADE ON DELETE CASCADE
);

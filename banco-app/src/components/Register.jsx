// src/components/Register.js
import React from 'react';
// import './Register.css'; // Create a CSS file for custom styles

function Register({ switchToLogin }) {
  return (
    <div className="container d-flex justify-content-center align-items-center vh-100">
      <div className="card p-4" style={{ width: '400px' }}>
        <h2 className="text-center mb-4">Registro</h2>
        <form>
          <div className="mb-3">
            <label htmlFor="username" className="form-label">Usuario</label>
            <input type="text" className="form-control" id="username" placeholder="Crea tu usuario" />
          </div>
          <div className="mb-3">
            <label htmlFor="email" className="form-label">Correo electrónico</label>
            <input type="email" className="form-control" id="email" placeholder="Ingresa tu correo" />
          </div>
          <div className="mb-3">
            <label htmlFor="password" className="form-label">Contraseña</label>
            <input type="password" className="form-control" id="password" placeholder="Crea tu contraseña" />
          </div>
          <button type="submit" className="btn btn-primary w-100">Registrarse</button>
        </form>
        <div className="registro">
          <label className="form-label">¿Ya tienes una cuenta?</label>&nbsp;
          <a href="#" className="register-link" onClick={switchToLogin}>Inicia sesión</a>
        </div>
      </div>
    </div>
  );
}

export default Register;

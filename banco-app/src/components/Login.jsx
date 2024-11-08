// src/components/Login.js
import React from 'react';
import '../styles/Estilos.css'; // Create a CSS file for custom styles

function Login({ switchToRegister }) {
  return (
    <div className="container d-flex justify-content-center align-items-center vh-100">
      <div className="card p-4" style={{ width: '400px' }}>
        <h2 className="text-center mb-4">Inicio de sesión</h2>
        <form>
          <div className="mb-3">
            <label htmlFor="username" className="form-label">Usuario</label>
            <input type="text" className="form-control" id="username" placeholder="Ingrese su usuario" />
          </div>
          <div className="mb-3">
            <label htmlFor="password" className="form-label">Contraseña</label>
            <input type="password" className="form-control" id="password" placeholder="Ingrese su contraseña" />
          </div>
          <button type="submit" className="btn btn-primary w-100">Iniciar sesión</button>
        </form>
        <div className="registro">
          <label className="form-label">¿No tienes una cuenta?</label>&nbsp;
          <a href="#" className="register-link" onClick={switchToRegister}>Regístrate aquí</a>
        </div>
      </div>
    </div>
  );
}

export default Login;

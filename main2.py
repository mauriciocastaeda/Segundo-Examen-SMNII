from PyQt5.QtWidgets import QApplication, QMainWindow
from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtCore import Qt

class LoginWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Inicio de Sesión - Modo Oscuro con Bootstrap en PyQt5")
        self.showMaximized()  # Configurar la ventana para abrirse en tamaño completo

        # Crear un visor web
        web_view = QWebEngineView()
        web_view.setHtml("""
        <!DOCTYPE html>
        <html lang="es">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <style>
                body {
                    background-color: #121212;
                    color: #ffffff;
                }
                .card {
                    background-color: #1f1f1f;
                    border: none;
                }
                .form-label, h2 {
                    color: #ffffff; /* Cambiar el color del texto a blanco */
                }
                .form-control {
                    background-color: #2c2c2c;
                    color: #ffffff;
                    border: 1px solid #444;
                }
                .form-control::placeholder {
                    color: #bbbbbb; /* Color del texto del placeholder */
                }
                .form-control:focus {
                    background-color: #2c2c2c;
                    color: #ffffff;
                    border-color: #007bff;
                    box-shadow: none;
                }
                .btn-primary {
                    background-color: #007bff;
                    border: none;
                }
                .btn-primary:hover {
                    background-color: #0056b3;
                }
                .registro {    
                    text-align: center;
                    display: block;
                    margin-top: 10px;
                }
                .register-link {
                    color: #007bff;
                    text-decoration: none;
                }
                .register-link:hover {
                    color: #007bff;
                    text-decoration: underline;
                }
            </style>
            <title>Login - Modo Oscuro</title>
        </head>
        <body>
            <div class="container d-flex justify-content-center align-items-center vh-100">
                <div class="card p-4" style="width: 400px;">
                    <h2 class="text-center mb-4">Iniciar Sesión</h2>
                    <form>
                        <div class="mb-3">
                            <label for="username" class="form-label">Usuario</label>
                            <input type="text" class="form-control" id="username" placeholder="Ingrese su usuario">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" id="password" placeholder="Ingrese su contraseña">
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Iniciar Sesión</button>
                    </form>
                    <div class="registro">
                        <label class="form-label">¿No tienes una cuenta? </label>
                        <a href="#" class="register-link">Regístrate aquí</a>
                    </div>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>
        </html>
        """)
        self.setCentralWidget(web_view)

if __name__ == "__main__":
    import sys
    app = QApplication(sys.argv)
    window = LoginWindow()
    window.show()
    sys.exit(app.exec_())

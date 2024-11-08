from PyQt5.QtWebEngineWidgets import QWebEngineView, QWebEngineSettings
from PyQt5.QtCore import QUrl
import os

class RegisterWindow(QWebEngineView):
    def __init__(self, switch_to_login):
        super().__init__()
        self.switch_to_login = switch_to_login
        self.settings().setAttribute(QWebEngineSettings.LocalContentCanAccessFileUrls, True)  # Enable local access
        self.load_html()

    def load_html(self):
        file_path = os.path.abspath("register.html")
        self.setUrl(QUrl.fromLocalFile(file_path))

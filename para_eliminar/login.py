from PyQt5.QtWebEngineWidgets import QWebEngineView, QWebEngineSettings
from PyQt5.QtCore import QUrl
import os

class LoginWindow(QWebEngineView):
    def __init__(self, switch_to_register):
        super().__init__()
        self.switch_to_register = switch_to_register
        self.settings().setAttribute(QWebEngineSettings.LocalContentCanAccessFileUrls, True)  # Enable local access
        self.load_html()

    def load_html(self):
        file_path = os.path.abspath("login.html")
        self.setUrl(QUrl.fromLocalFile(file_path))

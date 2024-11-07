from PyQt5.QtWebEngineWidgets import QWebEngineView

class LoginWindow(QWebEngineView):
    def __init__(self, switch_to_register):
        super().__init__()
        self.switch_to_register = switch_to_register
        self.load_html()

    def load_html(self):
        with open("login.html", "r", encoding="utf-8") as file:
            html_content = file.read()
        self.setHtml(html_content)

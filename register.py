from PyQt5.QtWebEngineWidgets import QWebEngineView

class RegisterWindow(QWebEngineView):
    def __init__(self, switch_to_login):
        super().__init__()
        self.switch_to_login = switch_to_login
        self.load_html()

    def load_html(self):
        with open("register.html", "r", encoding="utf-8") as file:
            html_content = file.read()
        self.setHtml(html_content)

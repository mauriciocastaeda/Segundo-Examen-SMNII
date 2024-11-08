from PyQt5.QtWidgets import QApplication, QMainWindow, QStackedWidget
from PyQt5.QtWebChannel import QWebChannel
from login import LoginWindow
from register import RegisterWindow
from channel_object import ChannelObject  


class MainApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Aplicación de banco")
        self.showMaximized()

        self.stacked_widget = QStackedWidget()
        self.setCentralWidget(self.stacked_widget)

        self.login_window = LoginWindow(self.show_register)
        self.register_window = RegisterWindow(self.show_login)

        # Set up the QWebChannel
        self.channel = QWebChannel()
        self.channel_object = ChannelObject(self)
        self.channel.registerObject("pyqt_object", self.channel_object)

        self.login_window.page().setWebChannel(self.channel)
        self.register_window.page().setWebChannel(self.channel)

        self.stacked_widget.addWidget(self.login_window)
        self.stacked_widget.addWidget(self.register_window)

        self.show_login()

    def show_login(self):
        self.stacked_widget.setCurrentWidget(self.login_window)

    def show_register(self):
        self.stacked_widget.setCurrentWidget(self.register_window)

if __name__ == "__main__":
    import sys
    app = QApplication(sys.argv)
    window = MainApp()
    window.show()
    sys.exit(app.exec_())

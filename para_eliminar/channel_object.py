from PyQt5.QtCore import QObject, pyqtSlot

class ChannelObject(QObject):
    def __init__(self, main_app):
        super().__init__()
        self.main_app = main_app

    @pyqtSlot()
    def show_login(self):
        self.main_app.show_login()

    @pyqtSlot()
    def show_register(self):
        self.main_app.show_register()

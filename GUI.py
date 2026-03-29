import webview
import os
import subprocess

class API:
    def __init__(self):
        self.process = None

    def start_zapret(self):
        base_dir = os.path.dirname(os.path.abspath(__file__))
        bat_path = os.path.join(base_dir, "STARTME.bat")

        self.process = subprocess.Popen(
            bat_path,
            shell=True,
            creationflags=subprocess.CREATE_NO_WINDOW
        )

    def stop_zapret(self):
        if self.process:
            self.process.terminate()
            self.process = None

    def close_app(self):
        webview.windows[0].destroy()

    def minimize_app(self):
        webview.windows[0].minimize()


api = API()
webview.settings['DRAG_REGION_DIRECT_TARGET_ONLY'] = True

webview.create_window(
    "App",
    "GUI/index.html",
    frameless=True,
    easy_drag=False,
    js_api=api
)

webview.start()

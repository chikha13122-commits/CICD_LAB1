from http.server import HTTPServer, BaseHTTPRequestHandler
import datetime
import os

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        
        # Đọc biến môi trường (Environment Variable)
        env_name = os.getenv('ENV_NAME', 'Local')
        
        html = f"""
        <html>
        <body style="font-family: Arial; text-align: center; margin-top: 50px;">
            <h1>🚀 Chào mừng đến với The DevOps Journey App!</h1>
            <h2>Môi trường đang chạy: <span style="color: blue;">{env_name}</span></h2>
            <p>Thời gian server: {datetime.datetime.now()}</p>
        </body>
        </html>
        """
        self.wfile.write(html.encode('utf-8'))

print("Starting server on port 8000...")
HTTPServer(('0.0.0.0', 8000), SimpleHandler).serve_forever()

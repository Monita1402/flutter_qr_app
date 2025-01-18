import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://mocki.io/v1/6ced6e15-4fff-4906-a3e9-ffc2731d5093';

  Future<String> sendQRData(Map<String, dynamic> qrData) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/qr-data'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(qrData),
      );

      if (response.statusCode == 201) {
        return '''
          <html>
            <head>
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <style>
                body { 
                  background-color: lightblue;
                  font-family: Arial, sans-serif;
                  padding: 20px;
                  margin: 0;
                }
                h1 { 
                  color: navy;
                  text-align: center;
                }
                .data-container {
                  background: white;
                  border-radius: 8px;
                  padding: 20px;
                  margin-top: 20px;
                  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                }
                .data-item {
                  margin: 10px 0;
                  padding: 10px;
                  border-bottom: 1px solid #eee;
                }
              </style>
            </head>
            <body>
              <h1>QR Code Data Received</h1>
              <div class="data-container">
                <div class="data-item">
                  <strong>ID:</strong> ${qrData['id']}
                </div>
                <div class="data-item">
                  <strong>Info:</strong> ${qrData['info']}
                </div>
              </div>
              <script>
                console.log('QR data processed successfully!');
                document.body.innerHTML += '<p style="text-align: center; margin-top: 20px; color: #666;">Processed at: ' + new Date().toLocaleString() + '</p>';
              </script>
            </body>
          </html>
        ''';
      } else {
        throw Exception('Failed to send QR data');
      }
    } catch (e) {
      throw Exception('Error sending QR data: $e');
    }
  }
}
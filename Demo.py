import serial
import time

# Configure the serial connection
# ser = serial.Serial(
#     port='COM3',  # Replace with the appropriate port name
#     baudrate=115200,
#     parity=serial.PARITY_NONE,
#     stopbits=serial.STOPBITS_ONE,
#     bytesize=serial.EIGHTBITS,
#     timeout=1
# )

# def send_data(data):
#     ser.write(data)

# def read_data():
#     return ser.read(ser.in_waiting or 1)  # Read all available bytes

# # send_data(b'\x5A\xA5\x07\x82\x00\x84\x5A\x01\x00\x01')
# def serialPort():
#     try:
#         # while True:
#             # Send data
#             # send_data(b'\x5A\xA5\x05\x82\x50\x00\x00\x69')
#             send_data(b'\x5A\xA5\x07\x82\x00\x84\x5A\x01\x00\x01')

#             # Wait for a brief moment to allow the data to be sent
#             ser.flush()

#             # Poll for a response
#             response = read_data()
#             if response:
#                 response_hex = " ".join("{:02X}".format(byte) for byte in response)
#                 print("Received:", response_hex)
#                 # print("Received:", response.hex())
            

#     except KeyboardInterrupt:
#         print("Serial polling stopped by user.")

#     finally:
#         ser.close()



# serialPort()


class portConnection:
    def __init__(self):
        # Configure the serial connection
        self.ser = serial.Serial(
            port='COM3',  # Replace with the appropriate port name
            baudrate=115200,
            parity=serial.PARITY_NONE,
            stopbits=serial.STOPBITS_ONE,
            bytesize=serial.EIGHTBITS,
            timeout=1
        )
        # self.ser.close()
        
    
    def write_data(self, data):
        self.ser.write(data)
    
    def read_data(self):
        return self.ser.read(self.ser.in_waiting or 1)  # Read all available bytes
    
    def polling_data(self):
         # Wait for a brief moment to allow the data to be sent
        self.ser.flush()

        # Poll for a response
        response = self.read_data()
        if response:
            response_hex = " ".join("{:02X}".format(byte) for byte in response)
            print("Received:", response_hex)
            # print("Received:", response.hex())


portConnectionI = portConnection()

portConnectionI.polling_data()
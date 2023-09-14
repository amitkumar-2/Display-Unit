import serial

class PortConnection:
    def __init__(self):
        # Configure the serial connection in the constructor
        self.ser = serial.Serial(
            port='COM3',  # Replace with the appropriate port name
            baudrate=115200,
            parity=serial.PARITY_NONE,
            stopbits=serial.STOPBITS_ONE,
            bytesize=serial.EIGHTBITS,
            timeout=1
        )
    
    def write_data(self, data):
        self.ser.write(data)
    
    def read_data(self):
        return self.ser.read(self.ser.in_waiting or 1)  # Read all available bytes
    
    def polling_data(self):
        try:
            received_data = b''  # Initialize an empty bytes object to accumulate data
            
            while True:
                # Wait for a brief moment to allow the data to be sent
                self.ser.flush()

                # Poll for a response
                response = self.read_data()
                if response:
                    received_data += response  # Accumulate the received data
                    
                    # Check if the response is complete (ends with '\x00\x01')
                    if len(received_data) > 2:#.endswith(b'\x00\x01'):
                        response_hex = " ".join("{:02X}".format(byte) for byte in received_data)
                        print("Received:", response_hex)
                        received_data = b''  # Reset the accumulator for the next response
        except KeyboardInterrupt:
            print("Serial polling stopped by user.")
        finally:
            self.ser.close()  # Close the serial port when done

# Example usage:
try:
    port = PortConnection()  # Create an instance of PortConnection
    
    # Send and receive data
    port.write_data(b'\x5A\xA5\x07\x82\x00\x84\x5A\x01\x00\x00')
    port.polling_data()

except KeyboardInterrupt:
    print("Serial communication stopped by user.")

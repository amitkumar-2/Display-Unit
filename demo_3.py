import serial
import tkinter as tk

class SerialCommunication:
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
    
    def write_data(self, data):
        self.ser.write(data)
    
    def read_data(self):
        return self.ser.read(self.ser.in_waiting or 1)  # Read all available bytes

    def close_serial(self):
        self.ser.close()

class MyApp:
    def __init__(self, root):
        self.root = root
        root.title("Serial Communication App")

        # Create and configure the serial connection
        self.serial_comm = SerialCommunication()

        # Create buttons and labels
        self.send_button = tk.Button(root, text="Send Data", command=lambda: self.send_data(data=b'\x5A\xA5\x07\x82\x00\x84\x5A\x01\x00\x00'))
        self.send_button1 = tk.Button(root, text="Send Data1", command=lambda: self.send_data(data=b'\x5A\xA5\x07\x82\x00\x84\x5A\x01\x00\x01'))
        self.send_button2 = tk.Button(root, text="Send Data2", command=lambda: self.send_data(data=b'\x5A\xA5\x07\x82\x00\x84\x5A\x01\x00\x02'))
        self.send_button3 = tk.Button(root, text="Send Data3", command=lambda: self.send_data(data=b'\x5A\xA5\x07\x82\x00\x84\x5A\x01\x00\x03'))
        self.receive_label = tk.Label(root, text="Received Data:")
        self.receive_data_label = tk.Label(root, text="")

        # Pack widgets
        self.send_button.pack()
        self.send_button1.pack()
        self.send_button2.pack()
        self.send_button3.pack()
        self.receive_label.pack()
        self.receive_data_label.pack()

        # Start the data polling
        self.poll_serial_data()

    def send_data(self, data):
        # Send data when the button is clicked
        data_to_send = data
        self.serial_comm.write_data(data_to_send)

    def poll_serial_data(self):
        try:
            while True:
                # Poll for a response
                response = self.serial_comm.read_data()
                if response:
                    response_hex = " ".join("{:02X}".format(byte) for byte in response)
                    self.receive_data_label.config(text=response_hex)
                self.root.update()
        except KeyboardInterrupt:
            print("Serial polling stopped by user.")
        finally:
            self.serial_comm.close_serial()

if __name__ == "__main__":
    root = tk.Tk()
    app = MyApp(root)
    root.mainloop()

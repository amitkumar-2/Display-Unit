# Importing Libraries
import serial
import tkinter as tk
from PIL import Image, ImageTk

# defined object to make connection with serial port
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
    
    # Function to write data on serial port
    def write_data(self, data):
        self.ser.write(data)
    
    # Function to read data from serial port
    def read_data(self):
        return self.ser.read(self.ser.in_waiting or 1)  # Read all available bytes

    # Function to colse the serial port connection
    def close_serial(self):
        self.ser.close()


# Define bg color to the variable
self_background_color = '#000087'

# Defined common object to handel the app pages functions, events and behaviors
class multiplePages(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("CTI Display Project")
        self.geometry("1600x800")
        self.minsize(1400,600)
        self.container = tk.Frame(self)
        self.container.pack(fill='both', expand=True)
        self.pages = {}
        
        for PageClass in [Page1, Page2, B_Test_Sheet]:
            page_name = PageClass.__name__
            page = PageClass(self.container, self)
            self.pages[page_name] = page
            page.grid(row=0, column=0, sticky="nsew")
            
        # Configure grid weights for the container
        self.container.columnconfigure(0, weight=1)
        self.container.rowconfigure(0, weight=1)
        
        # Show the initial page
        self.show_page("Page1")
        
        
        # Create and configure the serial connection
        global serial_comm
        try:
            serial_comm = SerialCommunication()
        except:
            print("Serial port is not open!!")
        
        # Start the data polling
        try:
            self.poll_serial_data()
        except:
            print("Serial port is not open!!")
        
    def send_data(self, data):
        # Send data when the button is clicked
        data_to_send = data
        serial_comm.write_data(data_to_send)

    def poll_serial_data(self):
        try:
            while True:
                # Poll for a response
                response = serial_comm.read_data()
                if response:
                    response_hex = " ".join("{:02X}".format(byte) for byte in response)
                    if response_hex == "A5 06 83 55 00 01 00 01":
                        self.pages['B_Test_Sheet'].yes_image_label.place(x=865, y=147)
                        
                    elif response_hex == "A5 06 83 55 00 01 00 00":
                        self.pages['B_Test_Sheet'].yes_image_label.place_forget()
                        self.pages['B_Test_Sheet'].cross_image_label.place(x=865, y=147)
                    elif response_hex == "A5 06 83 55 00 01 00 02":
                        self.pages['B_Test_Sheet'].yes_image_label.place_forget()
                        self.pages['B_Test_Sheet'].cross_image_label.place_forget()
                        
                        
                self.container.update()
        except KeyboardInterrupt:
            print("Serial polling stopped by user.")
        finally:
            serial_comm.close_serial()
        
        
        
        
        
        
    # functio To show selected page
    def show_page(self, page_name):
        # Show the selected page
        page = self.pages[page_name]
        page.tkraise()
    




class Page1(tk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.config(background=self_background_color)
        
        # label = tk.Label(self, text="Page 1", font=("Arial", 20))
        # label.pack(pady=20)
        
        # self.ser_obj = SerialCommunication()
        
        
        def toggle_visibility():
            if self.product_frame.winfo_viewable():
                self.product_frame.place_forget()  # Hide the self.product_A
            else:
                self.product_frame.place(x=500, y=20)  # Show the self.product_A
        
        
        
        self.product_frame = tk.Frame(self, width=300, height=400)
        self.product_frame.config(background="#FFFFFF")
        # self.product_frame.place(x=500, y=20)
        
        self.product_A = tk.Button(self.product_frame, text="Product A", borderwidth=2, padx=20)
        self.product_A.place(x=10, y=40)
        self.product_B = tk.Button(self.product_frame, text="Product B", borderwidth=2, padx=20)
        self.product_B.place(x=10, y=100)
        
        self.product_A_sheet = tk.Button(self.product_frame, text="Select", borderwidth=2, command=lambda: serial_comm.write_data(data=b'\x5A\xA5\x07\x82\x00\x84\x5A\x01\x00\x00'))
        self.product_A_sheet.place(x=150, y=40)
        self.product_B_sheet = tk.Button(self.product_frame, text="Select", borderwidth=2, command=lambda: serial_comm.write_data(data=b'\x5A\xA5\x07\x82\x00\x84\x5A\x01\x00\x01'))
        self.product_B_sheet.place(x=150, y=100)
        
        self.product_A_select = tk.Button(self.product_frame, text="Go To", borderwidth=2, command=lambda: controller.show_page("Page2"))
        self.product_A_select.place(x=200, y=40)
        self.product_B_select = tk.Button(self.product_frame, text="Go To", borderwidth=2, command=lambda: controller.show_page("B_Test_Sheet"))
        self.product_B_select.place(x=200, y=100)
        
        
        
        self.left_frame = tk.Frame(self, width=300, height=900)
        self.left_frame.config(background="#B0D7F6")
        self.left_frame.pack(side="left")
        self.select_product = tk.Button(self.left_frame, text="Select Product", background="#FFFFFF", padx=70, pady=5, command=toggle_visibility)
        self.select_product.place(x=40, y=20)
        self.go_to_exit = tk.Button(self.left_frame, text="Go to Exit", background="#FFFFFF", padx=83, pady=5)
        self.go_to_exit.place(x=40, y=100)
        
        
        
        
        
        button = tk.Button(self, text="Next", width=10,font =
                    ('calibri', 13, 'bold'),  command=lambda: controller.show_page("Page2"))
        button.place(x=1175, y=670)


class Page2(tk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.config(background=self_background_color)
        
        label = tk.Label(self, text="Product A Test Sheet", font=("Arial", 20, 'bold'), bg=self_background_color, fg='white')
        label.pack(pady=20)
        
        
        
        
        # self.yes_image = tk.Label(self, image="images\\Yes-Check-Box.png")
        
        self.led_1_state = tk.Label(self, text="LED 1 STATE", font=('', 18, 'bold'), fg='white', bg=self_background_color)
        self.led_1_state.place(x=350, y=332)
        
        
        self.empty_image = Image.open('images\\empty-checkbox.png')
        self.empty_resized_image = self.empty_image.resize((80, 80), Image.ANTIALIAS)
        empty_photo = ImageTk.PhotoImage(self.empty_resized_image)
        self.empty_image_label = tk.Label(self, image=empty_photo, background=self_background_color)
        self.empty_image_label.image = empty_photo
        self.empty_image_label.place(x=550, y=332)
        
        
        self.cross_image = Image.open('images\\cross.png')
        self.cross_resized_image1 = self.cross_image.resize((50, 50), Image.ANTIALIAS)
        cross_photo = ImageTk.PhotoImage(self.cross_resized_image1)
        self.cross_image_label = tk.Label(self, image=cross_photo, background=self_background_color)
        self.cross_image_label.image = cross_photo
        
        
        self.yes_image = Image.open('images\\yes.png')
        self.yes_resized_image = self.yes_image.resize((50, 50), Image.ANTIALIAS)
        yes_photo = ImageTk.PhotoImage(self.yes_resized_image)
        self.yes_image_label = tk.Label(self, image=yes_photo, background=self_background_color)
        self.yes_image_label.image = yes_photo
        # self.yes_image_label.place(x=565, y=347)
        # self.yes_image_label.pack_forget()
        
        
        button = tk.Button(self, text="Prev", width=10,font =
                    ('calibri', 13, 'bold'),  command=lambda: controller.show_page("Page1"))
        button.place(x=1175, y=670)
   
    
    
def toggle_checkbox_state(checkbox):
    checkbox.select() if not checkbox.instate(['selected']) else checkbox.deselect()





class B_Test_Sheet(tk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.config(background=self_background_color)
        
        label = tk.Label(self, text="Product B Test Sheet", font=("Arial", 20, 'bold'), bg=self_background_color, fg='white')
        label.pack(pady=20)
        
        
        
        
        # self.yes_image = tk.Label(self, image="images\\Yes-Check-Box.png")
        
        self.led_1_state = tk.Label(self, text="LED 1 STATE: ", font=('', 18, 'bold'), fg='white', bg=self_background_color)
        self.led_1_state.place(x=630, y=152)
        
        self.led_2_state = tk.Label(self, text="LED 2 STATE: ", font=('', 18, 'bold'), fg='white', bg=self_background_color)
        self.led_2_state.place(x=630, y=252)
        
        
        self.empty_image = Image.open('images\\empty-checkbox.png')
        self.empty_resized_image = self.empty_image.resize((80, 80), Image.ANTIALIAS)
        empty_photo = ImageTk.PhotoImage(self.empty_resized_image)
        self.empty_image_label = tk.Label(self, image=empty_photo, background=self_background_color)
        self.empty_image_label.image = empty_photo
        self.empty_image_label.place(x=850, y=132)
        
        
        self.cross_image = Image.open('images\\cross.png')
        self.cross_resized_image1 = self.cross_image.resize((50, 50), Image.ANTIALIAS)
        cross_photo = ImageTk.PhotoImage(self.cross_resized_image1)
        self.cross_image_label = tk.Label(self, image=cross_photo, background=self_background_color)
        self.cross_image_label.image = cross_photo
        
        
        self.yes_image = Image.open('images\\yes.png')
        self.yes_resized_image = self.yes_image.resize((50, 50), Image.ANTIALIAS)
        yes_photo = ImageTk.PhotoImage(self.yes_resized_image)
        self.yes_image_label = tk.Label(self, image=yes_photo, background=self_background_color)
        self.yes_image_label.image = yes_photo
        # self.yes_image_label.place(x=565, y=347)
        # self.yes_image_label.pack_forget()
        
        
        button = tk.Button(self, text="Prev", width=10,font =
                    ('calibri', 13, 'bold'),  command=lambda: controller.show_page("Page1"))
        button.place(x=1175, y=670)







if __name__ == "__main__":
    root = multiplePages()
    root.mainloop()

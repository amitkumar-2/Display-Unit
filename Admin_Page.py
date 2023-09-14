import tkinter as tk
# from Demo import portConnection

# portConnectionI = portConnection()

self_background_color = '#000087'
class multiplePages(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("CTI Display Project")
        self.geometry("1600x800")
        self.minsize(1400,600)
        self.container = tk.Frame(self)
        self.container.pack(fill='both', expand=True)
        self.pages = {}
        
        for PageClass in [Page1, Page2]:
            page_name = PageClass.__name__
            page = PageClass(self.container, self)
            self.pages[page_name] = page
            page.grid(row=0, column=0, sticky="nsew")
            
        # Configure grid weights for the container
        self.container.columnconfigure(0, weight=1)
        self.container.rowconfigure(0, weight=1)
        
        # Show the initial page
        self.show_page("Page1")
        
    # functio To show selected page
    def show_page(self, page_name):
        # Show the selected page
        page = self.pages[page_name]
        page.tkraise()
        
class Page1(tk.Frame):
    
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.config(background=self_background_color)
        
        # self.client = mqtt_client  # Store the MQTT client instance
        # print(self.client)
        
        def toggle_visibility():
            if self.product_frame.winfo_viewable():
                self.product_frame.pack_forget()  # Hide the self.product_A
            else:
                self.product_frame.place(x=500, y=20)  # Show the self.product_A
        
        
        
        self.product_frame = tk.Frame(self, width=300, height=400)
        self.product_frame.config(background="#FFFFFF")
        # self.product_frame.place(x=500, y=20)
        
        self.product_A = tk.Button(self.product_frame, text="Product A", borderwidth=2) #, command=lambda: portConnectionI.write_data(data=b'\x5A\xA5\x07\x82\x00\x84\x5A\x01\x00\x00'))
        self.product_A.place(x=50, y=40)
        self.product_B = tk.Button(self.product_frame, text="Product B", borderwidth=2) #, command=lambda: portConnectionI.write_data(data=b'\x5A\xA5\x07\x82\x00\x84\x5A\x01\x00\x01'))
        self.product_B.place(x=50, y=70)
        
        
        
        self.left_frame = tk.Frame(self, width=300, height=900)
        self.left_frame.config(background="#B0D7F6")
        self.left_frame.pack(side="left")
        self.select_product = tk.Button(self.left_frame, text="Select Product", background="#FFFFFF", padx=70, pady=5, command=toggle_visibility)
        self.select_product.place(x=70, y=20)
        self.go_to_exit = tk.Button(self.left_frame, text="Go to Exit", background="#FFFFFF", padx=83, pady=5)
        self.go_to_exit.place(x=70, y=100)
        
        
        
        
        # def show_products():
            
        # button = tk.Button(self, text="Next", width=10,font =
        #             ('calibri', 13, 'bold'),  command=write_data.serialPort)#command=lambda: controller.show_page("Page2"))
        # button.place(x=1375, y=670)
        
        
        # self.animate_animate()
        
        
    def animate_animate(self):
        # Call the animate function to update the graph
        self.animate()
        # Schedule the next animation after 100ms (adjust the interval as needed)
        self.after(1000, self.animate_animate)
    
    
class Page2(tk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.config(background=self_background_color)
        
        label = tk.Label(self, text="Page 2", font=("Arial", 20))
        label.pack(pady=20)
        
        button = tk.Button(self, text="Prev", width=10,font =
                    ('calibri', 13, 'bold'),  command=lambda: controller.show_page("Page1"))
        button.place(x=1175, y=670)
        
if __name__ == "__main__":
    app=multiplePages()
    app.mainloop()
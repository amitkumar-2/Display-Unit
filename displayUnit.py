import tkinter as tk
import Demo

self_background_color = '#000087'
class multiplePages(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("CTI Display Project")
        self.geometry("400x400")
        self.minsize(400,400)
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
        
        label = tk.Label(self, text="Page 1", font=("Arial", 20))
        label.pack(pady=20)
        
        button = tk.Button(self, text="Next", width=10,font =
                    ('calibri', 13, 'bold'),  command=Demo.serialPort)#command=lambda: controller.show_page("Page2"))
        button.place(x=1375, y=670)
    
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
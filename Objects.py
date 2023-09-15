# # from PIL import Image, ImageTk
# # import tkinter as tk

# import tkinter as tk
# from PIL import Image, ImageTk

# class CustomImage:
#     def __init__(self, parent, image, pos_x, pos_y, width=None, height=None):
        
#         if width and height:
#             image = self.resize_image(image, width, height)
        
        
#         super().__init__(parent, image=image)
#         self.pos_x = pos_x
#         self.pos_y = pos_y
#         self.place(x=self.pos_x, y=self.pos_y)
        
        
#         # self.empty_image_label = tk.Label(self, image=empty_photo, background=self_background_color)
    
#     def resize_image(self, image, width, height):
#         pil_image = Image.open(image)
#         pil_image = pil_image.resize((width, height), Image.ANTIALIAS)
#         return ImageTk.PhotoImage(pil_image)


# # Create a tkinter window
# root = tk.Tk()
# root.geometry("400x400")

# # Create instances of the ImageLabel class with different images, positions, and sizes
# image1 = tk.PhotoImage(file="images\\empty-checkbox.png")
# image_label1 = CustomImage(root, image=image1, pos_x=50, pos_y=50, width=100, height=100)

# image2 = tk.PhotoImage(file="images\\empty-checkbox.png")
# image_label2 = CustomImage(root, image=image2, pos_x=200, pos_y=200, width=50, height=50)

# # Run the tkinter main loop
# root.mainloop()





import tkinter as tk
from PIL import Image, ImageTk

class CustomImageLabel(tk.Label):
    def __init__(self, parent, image_path, pos_x, pos_y, bg_color, width=None, height=None):
        super().__init__(parent)
        self.pos_x = pos_x
        self.pos_y = pos_y
        self.width = width
        self.height = height
        self.image_path = image_path
        self.bg_color = bg_color
        self.load_image()
        # self.place(x=self.pos_x, y=self.pos_y)
        self.config(background=self.bg_color)

    def load_image(self):
        image = Image.open(self.image_path)
        if self.width and self.height:
            image = image.resize((self.width, self.height), Image.ANTIALIAS)
        self.photo = ImageTk.PhotoImage(image=image)
        self.configure(image=self.photo)
    
    def hide_label(self):
        self.place_forget()
    
    def show_label(self):
        self.place(x=self.pos_x, y=self.pos_y)



# Create a tkinter window
# root = tk.Tk()
# root.geometry("400x400")

# Create instances of the CustomImageLabel class with different images, positions, and sizes
# image_label1 = CustomImageLabel(root, image_path="images\\empty-checkbox.png", pos_x=50, pos_y=50, width=100, height=100)
# image_label2 = CustomImageLabel(root, image_path="images\\empty-checkbox.png", pos_x=200, pos_y=200, width=50, height=50)

# Run the tkinter main loop
# root.mainloop()

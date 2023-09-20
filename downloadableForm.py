# import tkinter as tk
# from tkinter import simpledialog, filedialog

# def save_form():
#     # Get the data for the form (you can customize this part)
#     form_data = {
#         "Name": "John Doe",
#         "Email": "johndoe@example.com",
#         "Age": 30,
#         "Country": "USA"
#     }

#     # Ask the user for the file name and location to save the form
#     file_path = filedialog.asksaveasfilename(defaultextension=".txt", filetypes=[("Text files", "*.txt")])

#     if file_path:
#         # Save the form data to the selected file
#         with open(file_path, "w") as file:
#             for field, value in form_data.items():
#                 file.write(f"{field}: {value}\n")
        
#         print(f"Form saved to {file_path}")

# root = tk.Tk()
# root.geometry("400x400")

# save_button = tk.Button(root, text="Save Form", command=save_form)
# save_button.pack()

# root.mainloop()


# =========================================================================================================
# =========================================================================================================
# =========================================================================================================



# from tkinter import Button, Tk
# from reportlab.lib.pagesizes import letter
# from reportlab.pdfgen import canvas

# root = Tk()
# root.geometry("400x400")

# def create_pdf():
#     # Create a PDF file and draw content
#     c = canvas.Canvas("output.pdf", pagesize=letter)
#     c.drawString(100, 750, "Hello, PDF!")
#     c.save()

# pdf_button = Button(root, text="Generate PDF", command=create_pdf)
# pdf_button.pack()

# root.mainloop()


# ====================================================================================================
# ====================================================================================================
# ====================================================================================================

# from reportlab.lib.pagesizes import letter
# from reportlab.platypus import SimpleDocTemplate, Spacer
# from reportlab.platypus.flowables import Flowable
# from reportlab.platypus import Image
# from reportlab.lib import colors

# class CheckBox(Flowable):
#     def __init__(self, checked=False, size=10):
#         super().__init__()
#         self.checked = checked
#         self.size = size

#     def wrap(self, width, height):
#         return self.size, self.size

#     def draw(self):
#         if self.checked:
#             checkmark_empty = "images\\empty-checkbox.png"
#             checkmark = "images\\yes.png"
#         else:
#             checkmark_empty = "images\\empty-checkbox.png"
#             checkmark = "images\\cross.png"
        
#         img = Image(checkmark, width=self.size, height=self.size)
#         img_empty = Image(checkmark_empty, width=self.size, height=self.size)
#         img.drawOn(self.canv, 400, 0)
#         img_empty.drawOn(self.canv, 400, 0)

# def create_pdf():
#     doc = SimpleDocTemplate("output.pdf", pagesize=letter)
#     story = []

#     story.append(CheckBox(checked=True, size=12))
#     story.append(Spacer(1, 12))  # Add some space between checkboxes
#     story.append(CheckBox(checked=False, size=12))

#     doc.build(story)

# # Call the function to generate the PDF
# create_pdf()



# =====================================================================================================
# =====================================================================================================
# =====================================================================================================


from tkinter import filedialog
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Spacer
from reportlab.platypus.flowables import Flowable
from reportlab.platypus import Image
from reportlab.platypus import Paragraph
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.pdfbase.pdfmetrics import stringWidth

from reportlab.lib.units import mm, inch

from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont

from reportlab.lib import colors
from datetime import datetime  # Import the datetime module


# cmd_txt_dict_a = {
#     "A5 06 83 45 00": "COLORS",
#     "A5 06 83 65 00": "BRIGHTNESS"
# }

# cmd_txt_dict_b = {
#     "A5 06 83 35 00": "LED 1 STATE",
#     "A5 06 83 55 00": "LED 2 STATE",
# }

# cmd_txt_dict_state = {
#     "A5 06 83 35 00": True,
#     "A5 06 83 55 00": False,
#     "A5 06 83 45 00": False,
#     "A5 06 83 65 00": True
# }

# x = cmd_txt_dict.keys()
# x = list(x)
# print(x[1])
# print(type(cmd_txt_dict[x[1]]))



class CheckBoxWithText(Flowable):
    def __init__(self, text, checked=False, size=10, image_x=0, image_y=0, image_empty_x=0, image_empty_y=0, text_x=20, text_y=0):
        super().__init__()
        self.text = text
        self.checked = checked
        self.size = size
        self.image_x = image_x
        self.image_y = image_y
        self.img_empty_x = image_empty_x
        self.img_empty_y = image_empty_y
        self.text_x = text_x
        self.text_y = text_y

    def wrap(self, width, height):
        return self.size + 5 + self._get_text_width(), self.size

    def _get_text_width(self):
        style = getSampleStyleSheet()['Normal']
        return stringWidth(self.text, style.fontName, style.fontSize)

    def draw(self):
        if self.checked:
            checkmark_empty = "images\\empty-checkbox.png"
            checkmark = "images\\yes.png"
        else:
            checkmark_empty = "images\\empty-checkbox.png"
            checkmark = "images\\cross.png"
        
        img = Image(checkmark, width=self.size, height=self.size)
        img_empty = Image(checkmark_empty, width=self.size, height=self.size)
        img.drawOn(self.canv, self.image_x, self.image_y)
        img_empty.drawOn(self.canv, self.img_empty_x, self.img_empty_y)

        style = getSampleStyleSheet()['Normal']
        p = Paragraph(self.text, style)
        text_width = self._get_text_width()
        p.wrapOn(self.canv, text_width, self.size)
        p.drawOn(self.canv, self.text_x, self.text_y)# self.size + 5, (self.size - p.height) / 2)




def create_pdf(cmd_txt_dict, cmd_txt_dict_state): #text1, checked, image_x=0, image_y=0, image_empty_x=0, image_empty_y=0, text_x=20, text_y=0):
    
    # Prompt the user for the file location to save the PDF
    file_path = filedialog.asksaveasfilename(defaultextension=".pdf", filetypes=[("PDF files", "*.pdf")])
    
    if file_path:
        doc = SimpleDocTemplate(file_path, pagesize=letter)
        story = []
        
        # Get the current date and time
        current_datetime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        # Create a style for the date and time
        style = getSampleStyleSheet()['Normal']
        style.textColor = colors.blue  # Set text color to blue
        
        # Create a Paragraph with the date and time
        datetime_paragraph = Paragraph(f"Date and Time: {current_datetime}", style)
        
    
        # Add the date and time to the PDF
        story.append(datetime_paragraph)
        story.append(Spacer(1, 12))  # Add some space
        
        
        for i in range(len(cmd_txt_dict)):
            x = cmd_txt_dict.keys()
            x = list(x)
            # print(x[i])
            text1 = cmd_txt_dict[x[i]]
            checked = cmd_txt_dict_state[x[i]]
            story.append(CheckBoxWithText(text1, checked, size=12))
            story.append(Spacer(1, 12))  # Add some space between checkboxes
        # story.append(CheckBoxWithText(text2, checked=False, size=12))

        doc.build(story)
        
    # doc = SimpleDocTemplate("output.pdf", pagesize=((8.5*inch, 11*inch)))
    # story = []

    # # Define your dynamic text here
    # # text1 = "This is the description for Checkbox 1"
    # text2 = "This is the description for Checkbox 2"
    
    # for i in range(len(cmd_txt_dict)):
    #     x = cmd_txt_dict.keys()
    #     x = list(x)
    #     # print(x[i])
    #     text1 = cmd_txt_dict[x[i]]
    #     checked = cmd_txt_dict_state[x[i]]
    #     story.append(CheckBoxWithText(text1, checked, size=12))
    #     story.append(Spacer(1, 12))  # Add some space between checkboxes
    # # story.append(CheckBoxWithText(text2, checked=False, size=12))

    # doc.build(story)


# create_pdf()


# Define common variable for every calling function
# C_V = -12
# # Call the function to generate the PDF
# create_pdf(text1="Hello how arrre you", checked=False, image_x=0, image_y=C_V*2, image_empty_x=0, image_empty_y=C_V*2, text_x=20, text_y=C_V*2)
# create_pdf(text1="Hello how are you ravi", checked=True, image_x=0, image_y=C_V*4, image_empty_x=0, image_empty_y=C_V*4, text_x=20, text_y=C_V*4)
# create_pdf(text1="Hello how are amit", checked=False, image_x=0, image_y=C_V*6, image_empty_x=0, image_empty_y=C_V*6, text_x=20, text_y=C_V*6)
# create_pdf(text1="Hello how are you vivek", checked=False, image_x=0, image_y=C_V*8, image_empty_x=0, image_empty_y=C_V*8, text_x=20, text_y=C_V*8)


# create_pdf(text1="Hello how arrre you", checked=False, image_x=0, image_y=-12, image_empty_x=0, image_empty_y=-12, text_x=20, text_y=-12)



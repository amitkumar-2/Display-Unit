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




from tkinter import Button, Tk
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas

root = Tk()
root.geometry("400x400")

def create_pdf():
    # Create a PDF file and draw content
    c = canvas.Canvas("output.pdf", pagesize=letter)
    c.drawString(100, 750, "Hello, PDF!")
    c.save()

pdf_button = Button(root, text="Generate PDF", command=create_pdf)
pdf_button.pack()

root.mainloop()

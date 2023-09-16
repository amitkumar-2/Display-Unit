import tkinter as tk
from tkinter import simpledialog

def print_dialog():
    # Get the printer name from the user
    printer_name = simpledialog.askstring("Printer Name", "Enter the printer name:")
    if printer_name:
        # Perform printing using the selected printer
        print(f"Printing to {printer_name}...")

root = tk.Tk()
root.geometry("400x400")

print_button = tk.Button(root, text="Print", command=print_dialog)
print_button.pack()

root.mainloop()

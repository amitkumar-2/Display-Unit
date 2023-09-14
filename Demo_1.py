import tkinter as tk
import psycopg2

class DatabaseCheckboxApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Database Checkboxes")

        # self.checkbox_dict = {}  # Dictionary to store checkboxes and associated data

        # Fetch data from the database
        self.fetch_data_from_database()

    def fetch_data_from_database(self):
        # Replace with your PostgreSQL database details
        conn = psycopg2.connect(database="checkbox_data", user="user_ravi", password="user_ravi", host="54.175.148.134", port="5432")
        cursor = conn.cursor()

        query = "SELECT id, label_text, is_checked FROM checkbox_data"
        cursor.execute(query)
        data = cursor.fetchall()

        for row in data:
            checkbox_id, label_text, is_checked = row
            self.create_checkbox(checkbox_id, label_text, is_checked)

        conn.close()

    def create_checkbox(self, checkbox_id, label_text, is_checked):
        checkbox_var = tk.BooleanVar(value=is_checked)
        checkbox = tk.Checkbutton(self.root, text=label_text, variable=checkbox_var, command=lambda: self.checkbox_state_changed(checkbox_id, checkbox_var.get()))

        # self.checkbox_dict[checkbox_id] = checkbox_var
        checkbox.pack()
    
    # def animate_animate(self):
    #     # Call the animate function to update the graph
    #     self.checkbox_state_changed()
    #     # Schedule the next animation after 100ms (adjust the interval as needed)
    #     self.after(1000, self.animate_animate)
        
    # animate_animate()

    def checkbox_state_changed(self, checkbox_id, new_state):
        # Update the database entry when checkbox state changes
        # Replace with your PostgreSQL database details
        conn = psycopg2.connect(database="checkbox_data", user="user_ravi", password="user_ravi", host="54.175.148.134", port="5432")
        cursor = conn.cursor()

        query = "UPDATE checkbox_data SET is_checked = %s WHERE id = %s"
        cursor.execute(query, (new_state, checkbox_id))

        conn.commit()
        conn.close()

if __name__ == "__main__":
    root = tk.Tk()
    app = DatabaseCheckboxApp(root)
    root.mainloop()

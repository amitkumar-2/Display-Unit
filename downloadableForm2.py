from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Spacer, Paragraph
from reportlab.platypus.flowables import Flowable
from reportlab.platypus import Image
from reportlab.pdfbase.pdfmetrics import stringWidth
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib.units import inch
from reportlab.lib import colors

cmd_txt_dict = {
    "A5 06 83 35 00": "This is the description for Checkbox 1",
    "A5 06 83 55 00": "This is the description for Checkbox 2",
    "A5 06 83 45 00": "This is the description for Checkbox 3",
    "A5 06 83 65 00": "This is the description for Checkbox 4"
}

cmd_txt_dict_state = {
    "A5 06 83 35 00": True,
    "A5 06 83 55 00": False,
    "A5 06 83 45 00": False,
    "A5 06 83 65 00": True
}

class CheckBoxWithText(Flowable):
    def __init__(self, text, checked=False, size=10):
        super().__init__()
        self.text = text
        self.checked = checked
        self.size = size

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
        img.drawOn(self.canv, 0, 0)
        img_empty.drawOn(self.canv, 0, 0)
        
        width = 10

        style = getSampleStyleSheet()['Normal']
        p = Paragraph(self.text, style)
        p.wrapOn(self.canv, width - self.size - 5, self.size)
        p.drawOn(self.canv, self.size + 5, (self.size - p.height) / 2)

def create_pdf():
    doc = SimpleDocTemplate("output.pdf", pagesize=letter)
    story = []

    for cmd, description in cmd_txt_dict.items():
        checked = cmd_txt_dict_state[cmd]
        story.append(CheckBoxWithText(description, checked, size=12))
        story.append(Spacer(1, 12))  # Add some space between checkboxes

    doc.build(story)

# Call the function to generate the PDF
create_pdf()

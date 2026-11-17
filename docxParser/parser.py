import docx
def parse(file_path: str) -> list[str]:
    document: docx.Document = docx.Document(file_path)
    return [i.text for i in document.paragraphs]

if __name__ == "__main__":
    print(*parse('0.docx'), sep='\n')
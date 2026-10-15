"""DevOps Student Application — prints student info from environment variables."""
import os

DEFAULTS = {
    "STUDENT_NAME": "Akberen",
    "STUDENT_SURNAME": "Kuat",
    "STUDENT_GROUP": "IT2-2313",
    "STUDENT_ID": "000000",
}


def get_student():
    return {key: os.environ.get(key, value) for key, value in DEFAULTS.items()}


def render(student):
    line = "=" * 32
    return "\n".join([
        line,
        "DevOps Student Application",
        line,
        "",
        f"Name: {student['STUDENT_NAME']}",
        f"Surname: {student['STUDENT_SURNAME']}",
        f"Group: {student['STUDENT_GROUP']}",
        f"Student ID: {student['STUDENT_ID']}",
        "",
        "Application is running successfully!",
    ])


if __name__ == "__main__":
    print(render(get_student()), flush=True)

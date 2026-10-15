# Base image: small official Python image
FROM python:3.12-alpine

# Default student data (can be overridden with docker run -e ...)
ENV STUDENT_NAME=Akberen \
    STUDENT_SURNAME=Kuat \
    STUDENT_GROUP=IT2-2313 \
    STUDENT_ID=000000

# All following commands run inside /app
WORKDIR /app

# Copy application source and student info into the image
COPY app/ /app/
COPY Kuat_Akberen_info.txt /app/

# Run unit tests at build time — the build fails if tests fail
RUN python -m unittest -v test_app.py

# Port documented for a future web version of the app
EXPOSE 8080

# Command executed when the container starts
CMD ["python", "app.py"]

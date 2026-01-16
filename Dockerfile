# 1. Use a modern Python base (3.11 works with your newer AI libraries)
FROM python:3.11-slim

# 2. Set the directory inside the container where your code will live
WORKDIR /app

# 3. Copy the requirements file from your Windows folder to the container
COPY requirements.txt .

# 4. Install your AI libraries + Jupyter (to handle the .ipynb files)
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir jupyter

# 5. Copy the rest of your project files (snapshots your current work)
COPY . .

# 6. Open the port that Jupyter uses so your laptop can "talk" to it
EXPOSE 8888

# 7. The default command to run when the container starts
# This starts the "Brain" of your project
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
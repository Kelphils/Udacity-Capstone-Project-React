FROM node:13.8.0

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY package.json .
# Install packages from requirements.txt
RUN npm install
# copy app source code
COPY . .

## Expose port no
EXPOSE 3000

# Run app.py at container launch
CMD ["npm", "start"]
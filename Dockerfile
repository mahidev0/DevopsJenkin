# Base image with Nginx
FROM nginx:alpine

# Copy our HTML file into Nginx default site
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port 80 (Nginx default)
EXPOSE 80


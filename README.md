# **Nike Landing Page with Nginx Load Balancer**

## **Project Overview**
This project demonstrates a production-ready deployment of a Nike landing page application using Docker containers, Nginx load balancing, and SSL termination. The setup includes three backend servers behind an Nginx reverse proxy with automatic HTTP to HTTPS redirection.

---

## **Architecture**

```plaintext
User Request → Nginx (Load Balancer) → [App1, App2, App3] Docker Containers
    ↓
HTTPS (443) with SSL Termination
    ↓
HTTP to HTTPS Automatic Redirect
```

## **Quick Start**

### **Prerequisites**
Before you begin, ensure you have the following installed:
- **Docker** & **Docker Compose**
- **Nginx**

### **1. Run the Application**
To launch the application with Docker Compose:
```bash
docker-compose up -d

```
### **2. Access the Application**

- **Load Balancer**: [https://localhost](https://localhost)

- **Individual Instances**:
  - [http://localhost:3001](http://localhost:3001)
  - [http://localhost:3002](http://localhost:3002)
  - [http://localhost:3003](http://localhost:3003)

---

## **Configuration Highlights**

### **Nginx Load Balancer**
The Nginx configuration provides:
- **Round-robin load balancing** across 3 backend servers.
- **SSL termination** with self-signed certificates.
- **Automatic HTTP to HTTPS redirects**.
- **Reverse proxy setup** to route traffic to the backend instances.

### **Docker Setup**
- Multi-container orchestration using **Docker Compose**.
- Three identical Nike app instances running in separate containers.
- **Port mapping** for individual access to each app instance (`3001`, `3002`, `3003`).

### **SSL Setup**
- Self-signed certificates are included for HTTPS configuration.
- For **production use**, replace with certificates from a trusted **Certificate Authority**.

---

## **Verification**

### **Test Load Balancing**
Run the following command to generate multiple requests and observe the load distribution:
```bash
1..10 | % { curl https://localhost }

# Check which containers received requests
docker logs nginix-devopsproject-app1-1 --tail 3
docker logs nginix-devopsproject-app2-1 --tail 3
docker logs nginix-devopsproject-app3-1 --tail 3
```


 ### **Test SSL Redirect**
```bash
 # Verify HTTP to HTTPS redirect works
curl -v http://localhost
```

## **Monitoring**

### **Check System Status**

```bash
# Verify that all containers are running:
docker ps

# View application logs
docker-compose logs
```

## **Key Achievements**
This setup demonstrates:
- **Enterprise-grade load balancing** with Nginx.
- **Secure HTTPS configuration** with SSL termination.
- **Containerized microservices architecture** using Docker.
- **Production-ready deployment patterns**.
- **Automated HTTP to HTTPS redirects**.

---

## **Notes**
- Self-signed certificates will show **browser security warnings** (expected for development).
- Load balancing uses the **round-robin algorithm** by default.
- All configuration files are available in the project for reference.
- For detailed configuration files and setup instructions, refer to the source files in the project repository.


# ShopNow - Hệ thống Microservices Mua Sắm

**ShopNow** là một ứng dụng thương mại điện tử mẫu được xây dựng theo kiến trúc Microservices. Dự án bao gồm cả frontend và backend, hỗ trợ triển khai bằng Docker Compose cho môi trường phát triển cục bộ và Kubernetes cho môi trường production hoặc staging.

---

## Cấu trúc thư mục

```
deployment/
├── docker-compose.yml
├── manifests
│   ├── api-gateway.yaml
│   ├── config-server.yaml
│   ├── discovery-server.yaml
│   ├── keycloak.yaml
│   ├── product-service.yaml
│   ├── shopping-cart-service.yaml
│   ├── user-service.yaml
├── shopnow-backend
│   ├── api-gateway
│   ├── config-server
│   ├── discovery-server
│   ├── keycloak
│   ├── product-service
│   ├── shopping-cart-service
│   ├── user-service
├── shopnow-frontend
└── README.md
```

---

## Thành phần hệ thống

| Thành phần                | Mô tả                                                                 |
|---------------------------|----------------------------------------------------------------------|
| **API Gateway**           | Cổng vào duy nhất cho tất cả client, định tuyến đến các service nội bộ |
| **Config Server**         | Quản lý cấu hình tập trung cho các microservice                      |
| **Discovery Server**      | Dựa trên Eureka để đăng ký và phát hiện dịch vụ                      |
| **Keycloak**              | Cung cấp OAuth2 / OpenID Connect để xác thực người dùng              |
| **Product Service**       | Quản lý sản phẩm                                                      |
| **Shopping Cart Service** | Quản lý giỏ hàng người dùng                                          |
| **User Service**          | Quản lý thông tin người dùng                                          |
| **Frontend**              | Giao diện người dùng (React/Vue/Angular)                             |

---

## Cách triển khai

### 1. Triển khai cục bộ với Docker Compose

```bash
cd deployment
docker-compose up --build
```

Truy cập các dịch vụ tại:

- Frontend: http://localhost:3000  
- API Gateway: http://localhost:8080  
- Keycloak: http://localhost:8081  
- Eureka: http://localhost:8761  

---

### 2. Triển khai trên Kubernetes

```bash
cd deployment/manifests
kubectl apply -f .
```

---

## Xác thực và Phân quyền

- Sử dụng **Keycloak** cho xác thực người dùng.
- Hỗ trợ OAuth2, JWT, phân quyền theo vai trò.

---

## Công nghệ sử dụng

- **Java / Spring Boot**: Backend
- **React / Vue**: Frontend
- **Keycloak**: Xác thực
- **Spring Cloud Eureka**: Discovery
- **Spring Cloud Config**: Cấu hình tập trung
- **Docker / Kubernetes**: Triển khai
- **PostgreSQL / MongoDB / Redis**: Cơ sở dữ liệu

---

## Phát triển

Chạy từng service:

```bash
cd shopnow-backend/product-service
./mvnw spring-boot:run
```
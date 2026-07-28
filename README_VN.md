# 🦖 TLab Monitor (Homelab Auto-Healing System)

**TLab Monitor** là một hệ thống giám sát và tự phục hồi hạ tầng tự động, ứng dụng Trí tuệ Nhân tạo (Agentic AI) được thiết kế đặc biệt cho các hệ thống máy chủ tự lưu trữ (self-hosted) và môi trường Homelab, chạy trên nền tảng **n8n**.

Hệ thống có khả năng nhận diện cảnh báo từ Prometheus, tự động khám phá tài nguyên (Proxmox/Docker), truy vấn "trí nhớ" RAG để tìm giải pháp tức thời, hoặc nhường quyền cho AI (LLM) suy luận và tự động bắn lệnh cứu hộ với cơ chế chống Crash Loop an toàn tuyệt đối.

## 🚀 Các Tính Năng Cốt Lõi
* **Zero-Token RAG Bypass:** Tự động truy xuất bài học khắc phục sự cố thành công trong quá khứ để tự sửa lỗi (0ms delay, không tốn token AI).
* **Multi-Executor:** Tự động nhận diện `asset_type` và điều hướng lệnh chuẩn xác qua Proxmox API (QEMU/LXC) hoặc Docker Engine API.
* **Smart Guardrails:** Cơ chế Circuit Breaker chặn đứng thảm họa Crash Loop (Khóa tự động nếu ứng dụng sập > 1 lần / 10 phút).
* **Human-in-the-Loop:** Tích hợp Ntfy Push Notification kèm các nút tương tác để kỹ sư duyệt lệnh rủi ro cao ngay trên điện thoại.

## 🏗️ Kiến Trúc Hệ Thống
* **Automation Engine:** n8n
* **Database & AI Memory:** PostgreSQL (Lưu Audit Log & RAG Memory)
* **Observability:** Prometheus, Alertmanager, cAdvisor
* **AI Model Gateway:** OpenRouter (`ling-3.0-flash` hoặc các model tương đương)
* **Compute Targets:** Docker, Proxmox VE (QEMU/LXC)

## 🛠️ Hướng Dẫn Triển Khai
1. Clone dự án này về máy: `git clone https://github.com/tdev8x/tlab-monitor.git`
2. Tạo file `.env` dựa trên mẫu `.env.example` và điền các API Key của bạn.
3. Import file `database/init.sql` vào PostgreSQL để tạo bảng.
4. Nạp lần lượt 4 file JSON trong thư mục `n8n-workflows` vào hệ thống n8n của bạn.
5. Xem chi tiết cấu hình và sơ đồ kiến trúc tại `docs/TLabMonitor_EN.html`.

## 📜 Giấy phép
Dự án mã nguồn mở phục vụ cộng đồng quản trị hệ thống và DevOps.

## 🛠️ Hướng Dẫn Cài Đặt Nhanh

**Bước 1: Tải mã nguồn & Cấu hình môi trường**
Sao chép tệp mẫu và điền các API Key, IP mạng LAN của bạn vào.

`git clone https://github.com/tdev8x/tlab-monitor.git`
`cd tlab-monitor`
`cp .env.example .env`
`nano .env`

**Bước 2: Khởi chạy toàn bộ hệ thống**
Hệ thống sử dụng Docker Compose để tự động dựng Database, n8n, Proxy và Monitoring Stack.

`docker compose up -d`

**Bước 3: Nhập Workflows vào n8n**
1. Truy cập vào `http://<IP_MÁY_CHỦ>:5678` và tạo tài khoản Admin.
2. Vào mục **Settings > Credentials**, thêm một kết nối PostgreSQL với tên `PostgreSQL Homelab` (Nhập Database: `tlab_db` và mật khẩu từ file `.env`).
3. Import lần lượt 4 tệp JSON trong thư mục `n8n-workflows` và bật **Active** lên. TLab Monitor đã sẵn sàng vận hành!
# 📘 Bài tập SQL (PostgreSQL)

10 bài tập thực hành

---

## 📝 Bài tập

### Cơ bản

1. **Liệt kê tất cả sản phẩm**  
   Hiển thị `id`, `name`, `price`, `stock` từ bảng `products`.

2. **Tìm khách hàng theo email (không phân biệt hoa/thường)**  
   Tìm user có email `alice@example.com` (dùng `ILIKE` trong PostgreSQL).

3. **Đếm số lượng đơn hàng**  
   Đếm tổng số bản ghi trong bảng `orders`.

---

### Trung cấp

4. **Tính tổng tiền mỗi đơn hàng**  
   Với bảng `order_items`, tính tổng `quantity * price` cho từng `order_id`.

5. **Danh sách khách hàng và tổng chi tiêu**  
   Hiển thị `user_id`, `name`, tổng số tiền thanh toán từ bảng `payments`.

6. **Tìm sản phẩm bán chạy nhất**  
   Tính tổng số lượng (`SUM(quantity)`) từ `order_items`, sắp xếp giảm dần, lấy sản phẩm bán nhiều nhất.

7. **Danh sách đơn hàng và phương thức thanh toán**  
   JOIN bảng `orders` và `payments` để hiển thị `order_id`, `user_id`, `amount`, `method`.

---

### Nâng cao

8. **Khách hàng chưa từng mua hàng**  
   Liệt kê user trong `users` mà không tồn tại `orders` liên quan.

9. **Tính doanh thu theo phương thức thanh toán**  
   Nhóm theo `method` trong `payments`, tính tổng `amount` từng loại.

10. **Top 3 khách hàng chi tiêu nhiều nhất**  
    JOIN `users` và `payments`, tính tổng chi tiêu, sắp xếp giảm dần và lấy 3 user đầu tiên (`LIMIT 3`).

---

## 💡 Ghi chú

- Các câu lệnh này dùng cho **PostgreSQL**.
- CSDL đã bao gồm bảng: `users`, `products`, `orders`, `order_items`, `payments`.

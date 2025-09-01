-- ### Cơ bản

-- 1. **Liệt kê tất cả sản phẩm**  
--    Hiển thị `id`, `name`, `price`, `stock` từ bảng `products`.

select id, name, price, stock from products;

-- 2. **Tìm khách hàng theo email (không phân biệt hoa/thường)**  
--    Tìm user có email `alice@example.com` (dùng `ILIKE` trong PostgreSQL).

select * from users where email ILIKE 'alice@example.com';

-- 3. **Đếm số lượng đơn hàng**  
--    Đếm tổng số bản ghi trong bảng `orders`.

select count(*) from orders;

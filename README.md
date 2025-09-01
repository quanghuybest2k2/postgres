# Best Practice - PostgreSQL + pgAdmin with Docker Compose

This project provides a **PostgreSQL database** and **pgAdmin 4** UI running with Docker Compose.  
It includes a helper script (`setup.sh`) that retries up to 3 times if starting the containers fails (e.g., due to network issues).

---

## 📦 Requirements

- [Docker](https://docs.docker.com/get-docker/) installed and running
- [Docker Compose](https://docs.docker.com/compose/) v2 or later

---

## ⚙️ Setup

1. Make the script executable:
   ```bash
   chmod +x setup.sh
   ```
2. Run the script:

   ```bash
   ./setup.sh
   ```

   - The script will check if Docker is installed.
   - It will run `docker compose up -d --build`.
   - If something fails (e.g., network issue when pulling images), it retries up to **3 times**.

---

## 🌐 Accessing Services

### PostgreSQL

- **Host:** `postgres`
- **Port:** `5432` (from `.env`)
- **User:** `postgres` (from `.env`)
- **Password:** `huy` (from `.env`)
- **Database:** `best_practice` (from `.env`)

Show all table:

```bash
docker exec -it postgres psql -U postgres -d best_practice -c "\dt"
```

### pgAdmin 4

- Open in browser: [http://localhost:8080](http://localhost:8080)
- **Email:** `admin@admin.com` (from `.env`)
- **Password:** `admin` (from `.env`)

Once logged in, you can add a new server connection:

- **Host name/address:** `postgres` (Docker service name, same network)
- **Port:** `5432`
- **Username:** `postgres`
- **Password:** `huy`

Test query:

```sql
SELECT u.name, p.name AS product, oi.quantity, pay.amount, pay.method
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN users u ON o.user_id = u.id
JOIN products p ON oi.product_id = p.id
JOIN payments pay ON pay.order_id = o.id;
```

---

## 🛑 Stopping Services

To stop and remove containers (while keeping data volume):

```bash
docker compose down
```

To remove everything including the volume:

```bash
docker compose down -v
```

---

## 📝 Notes

- Data is persisted in a Docker volume (`postgres_data`).

---

## Test with api

- Open in browser: [http://localhost:3000](http://localhost:3000)

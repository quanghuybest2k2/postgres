import express from "express";
import pkg from "pg";
import dotenv from "dotenv";
import cors from "cors";

dotenv.config();

const { Pool } = pkg;

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());

app.use(express.json());

// PostgreSQL connection
const pool = new Pool({
  user: process.env.POSTGRES_USERNAME ?? "",
  host: process.env.POSTGRES_HOST ?? "",
  database: process.env.POSTGRES_DB ?? "",
  password: process.env.POSTGRES_PASSWORD ?? "",
  port: process.env.POSTGRES_PORT ?? 5432,
});

// Test DB connection
pool
  .connect()
  .then((client) => {
    console.log("✅ Connected to PostgreSQL");
    client.release();
  })
  .catch((err) => console.error("❌ DB connection error", err.stack));

// Routes
app.get("/", (req, res) => {
  res.json({ message: "Hello from Express + PostgreSQL 🚀" });
});

app.get("/users", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM users LIMIT 10");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send("Error querying database");
  }
});

// Start server
app.listen(port, () => {
  console.log(`🚀 Server running at http://${process.env.DOMAIN}:${port}`);
});

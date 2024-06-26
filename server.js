const express = require("express");
const mysql = require("mysql2/promise");
const cors = require("cors");

const app = express();
app.use(cors());

// // 創建MySQL連接池
// const pool = mysql.createPool({
//   host: "localhost",
//   user: "root",
//   password: "123456",
//   database: "demo_db",
//   // database: "expense_tracker",
//   waitForConnections: true,
//   connectionLimit: 10,
//   queueLimit: 0,
// });

// app.get("/", (req, res) => {
//   res.send("Hello from Express!");
// });

app.get("/db", async (req, res) => {
  const sql = req.query.sql; // Extract SQL query from query string
  if (!sql.toLowerCase().startsWith("select")) {
    return res.status(400).send({ error: "Only SELECT queries are allowed" });
  }

  console.log("sql", sql);

  // replace \n with space
  // const formattedSql = sql.replace(/\n/g, " ");
  // console.log("formattedSql", formattedSql);

  try {
    // 從連接池中獲取一個連接
    // const connection = await pool.getConnection();

    const connection = await mysql.createConnection({
      host: "localhost",
      user: "root",
      password: "123456",
      database: req.query.dbName || "demo_db",
    });

    // 執行SQL查詢
    const [rows, fields] = await connection.execute(sql);
    console.log(rows);

    // 釋放連接
    // connection.release();

    await connection.end();

    // 返回查詢結果
    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).send("Server Error");
  }
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Express server listening on port ${PORT}`);
});

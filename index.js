const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get("/", (req, res) => {
  res.send("FoodExpress API is running successfully!");
});

app.get("/search", (req, res) => {
  res.send("INSIDE SEARCH API..");
});

app.get("/view", (req, res) => {
  res.json({
    message: "Viewing food items",
    items: ["Pizza", "Burger", "Pasta"]
  });
});

app.post("/login", (req, res) => {
  const { email } = req.body;

  res.json({
    message: "Login successful",
    user: email || "demo@foodexpress.com"
  });
});

app.put("/updateprofile", (req, res) => {
  res.json({
    message: "Profile updated successfully",
    data: req.body
  });
});

app.delete("/del", (req, res) => {
  res.json({
    message: "Item deleted successfully"
  });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`FoodExpress API running on port ${PORT}`);
});
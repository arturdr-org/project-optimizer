const express = require('express');
const app = express();
const PORT = process.env.PORT || 3002;

// Endpoint /health
app.get('/health', (req, res) => {
res.json({ status: 'ok', mcp: 'github' });
});

// Lógica específica para MCP GitHub aqui

app.listen(PORT, () => {
console.log(`GitHub MCP rodando na porta ${PORT}`);
});

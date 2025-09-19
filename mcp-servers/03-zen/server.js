const express = require('express');
const app = express();
const PORT = process.env.PORT || 3003;

// Endpoint /health
app.get('/health', (req, res) => {
res.json({ status: 'ok', mcp: 'zen' });
});

// Lógica específica para MCP Zen aqui

app.listen(PORT, () => {
console.log(`Zen MCP rodando na porta ${PORT}`);
});

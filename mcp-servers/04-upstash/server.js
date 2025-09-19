const express = require('express');
const app = express();
const PORT = process.env.PORT || 3004;

// Endpoint /health
app.get('/health', (req, res) => {
res.json({ status: 'ok', mcp: 'upstash' });
});

// Lógica específica para MCP Upstash aqui

app.listen(PORT, () => {
console.log(`Upstash MCP rodando na porta ${PORT}`);
});

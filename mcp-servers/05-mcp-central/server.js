const express = require('express');
const app = express();
const PORT = process.env.PORT || 3005;

// Endpoint /health
app.get('/health', (req, res) => {
res.json({ status: 'ok', mcp: 'mcp-central' });
});

// Lógica específica para MCP Central aqui

app.listen(PORT, () => {
console.log(`MCP Central rodando na porta ${PORT}`);
});

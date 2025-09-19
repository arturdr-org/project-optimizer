const express = require('express');
const app = express();
const PORT = process.env.PORT || 3001;

// Exemplo de endpoint /health
app.get('/health', (req, res) => {
res.json({ status: 'ok', mcp: 'centminmod' });
});

// Insira aqui outras rotas e lógica de negócio específicas do Centminmod MCP

app.listen(PORT, () => {
console.log(`Centminmod MCP rodando na porta ${PORT}`);
});

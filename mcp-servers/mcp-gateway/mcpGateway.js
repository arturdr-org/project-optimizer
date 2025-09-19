const express = require('express');
const bodyParser = require('body-parser');
const MCPGatewayCore = require('./mcpGateway-core');

const app = express();
const gateway = new MCPGatewayCore({
  gemini: { apiKey: process.env.GEMINI_API_KEY },
  deepseek: { apiKey: process.env.DEEPSEEK_API_KEY },
  langchain: {}
});

app.use(bodyParser.json());

app.post('/api/chat', async (req, res) => {
  try {
    const result = await gateway.handleRequest(req.body);
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`MCP Gateway rodando na porta ${PORT}`));

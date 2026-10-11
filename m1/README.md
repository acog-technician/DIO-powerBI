# Entrega do Desafio: Treinando uma IA de Aprendizagem – Explore o Poder do NotebookLM

Entrega do desafio de criar um notebook como um segundo cérebro em algum tema.

link para o notebook: https://notebook.google.com/notebook/fb60030a-ee25-4149-900f-aeb3b655ae10

## Objetivo
Ter um recurso compreensível sobre sistemas distribuídos, principalmente sobre a teoria para escrita de trabalhos acadêmicos como artigos e TCCs.

### O que é preciso saber
- Teoria dos principais mecanismos de sistemas distribuídos (processos, arquitetura, comunicação...).
- Parte do estado da arte sobre o tema, como projetos que implementam sistemas distribuídos.
- Regras ABNT, principalmente sobre formatação de citações e referências.

---

## Fontes

- **Livro (gratuito):** *Distributed Systems* por Van Steen e Andrew Tanenbaum (recomendação do meu professor).
  - Caminho: `./fontes/Distributed_Systems_4.pdf`

- **Arquivo de Regras ABNT:** Compilação própria das regras da ABNT sobre citações e referências.
  - Caminho: `./fontes/Regras Abnt Citações e Referências.md`

- **Artigo:** MapReduce (Google), fonte utilizada no meu TCC.
  - Caminho: `./fontes/mapreduce.pdf`

- **Vídeo:** Aula do MIT introduzindo o tema de sistemas distribuídos.
  - URL: [Lecture 1: Introduction](https://youtu.be/cQP8WApzIQQ?si=ZKUy7RqzJD9Hu7G)

- **Artigos (GeeksforGeeks):** Material de apoio para melhor contextualização do tema.
  - [Scheduling and Load Balancing in Distributed System](https://www.geeksforgeeks.org/computer-networks/scheduling-and-load-balancing-in-distributed-system/)
  - [What is RPC Mechanism in Distributed System](https://www.geeksforgeeks.org/computer-networks/what-is-rpc-mechanism-in-distributed-system/)
  - [Goals of Distributed System](https://www.geeksforgeeks.org/distributed-systems/goals-of-distributed-system/)

---

## Diretrizes
Enviada como a primeira mensagem antes de começar o chat.

- Respostas concisas: responda à questão diretamente, sem puxar assunto.
- Não aceite tudo o que digo: pesquise nas fontes, verifique a resposta e me corrija se necessário.
- Priorize citações de livros e artigos, utilizando vídeos e sites apenas como apoio.

## Prompt inicial:

Imagem da prompt sendo usada: `./Perguntas e Respostas/mensagem inicial.png`

Você é um assistente acadêmico especialista em Sistemas Distribuídos e normas da ABNT. Seu objetivo é atuar como um "segundo cérebro" baseado exclusivamente nas fontes carregadas neste notebook, auxiliando na escrita de trabalhos acadêmicos (artigos e TCCs).

### Diretrizes de Resposta:
1. **Concisão e Direção:** Seja conciso. Responda diretamente ao que foi perguntado, sem introduções longas ou puxar assunto.
2. **Validação Rigorosa:** Não aceite cegamente o que eu disser. Pesquise nas fontes do notebook, verifique as informações e corrija-me caso eu cometa erros conceituais ou de citação.
3. **Hierarquia de Fontes:** Priorize fortemente citações, conceitos e dados extraídos dos livros e artigos acadêmicos presentes nas fontes (como o *Distributed Systems* e o *MapReduce*). Utilize vídeos e sites da web estritamente como material de apoio secundário.
4. **Normas ABNT:** Sempre que aplicável, baseie-se no guia compilado de regras ABNT fornecido nas fontes para orientar formatações de citações e referências.

## Teste e Validação do Modelo (perguntas feitas)

Para verificar o desempenho e a precisão do modelo com base nas fontes carregadas, realizei as seguintes perguntas de teste:

- **Pergunta 1:** *Como o middleware ajuda na transparência?*
  - **Resultado:** A resposta explicou o conceito de middleware, sua relação com a transparência, os diferentes tipos de transparência e abordou o uso de *wrappers* e *adapters*. O conteúdo baseou-se diretamente no livro *Distributed Systems*, que constitui a principal fonte teórica deste notebook.
  - `./Perguntas e Respostas/pergunta 1.png`

- **Pergunta 2:** *Como o middleware funciona no MapReduce?
  - **Resultado:** Esta pergunta foi utilizada para aprofundar o tema no caso específico do MapReduce, mantendo o foco em middleware. Com base no artigo correspondente, o modelo apresentou uma revisão geral do middleware e do funcionamento do sistema. A resposta é um resumo decente: embora explique o funcionamento de maneira um pouco rasa, o resultado é aceitável, visto que o foco da consulta era o comportamento sob a perspectiva dos componentes de middleware, e não o detalhamento profundo da execução.
  - `./Perguntas e Respostas/pergunta 2.png`

- **Pergunta 3:** *De maneira geral, como funciona a distribuição de carga em um sistema distribuído? Me traga uma citação que a defina.*
  - **Resultado:** A resposta abordou a distribuição de carga conforme solicitado, utilizando como fontes o artigo do GeeksforGeeks e o livro de sistemas distribuídos. O modelo tentou extrair duas citações: uma alinhada às diretrizes (retirada do livro) e outra extraída do GeeksforGeeks. Embora a segunda citação não seja adequada para uso direto em um trabalho formal, ambas cumprem bem o papel de servir como guia para elaborar paráfrases (citações indiretas) ou para direcionar uma busca aprofundada no livro visando a uma citação direta de alta qualidade.
  - `./Perguntas e Respostas/pergunta 3.png`

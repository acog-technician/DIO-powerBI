# Relatório de Execução: Processamento e Transformação de Dados com Power BI

Documentação das etapas de ingestão, tratamento e modelagem dimensional realizadas no Power BI a partir de base de dados corporativa hospedada em nuvem no Microsoft Azure.

O arquivo do projeto finalizado está disponível neste repositório como entrega.pbix.

1. Provisionamento e Carga de Dados (Azure)

Devido a restrições de cota regional para instâncias do Azure Database for MySQL no momento da execução, a arquitetura foi adaptada com sucesso para o Azure SQL Database, mantendo a fidelidade estrutural do desafio:

    Banco de Dados: Criação do banco via Azure Portal.

    Scripts DDL/DML: As queries originais do repositório foram levemente ajustadas para a sintaxe T-SQL e executadas diretamente pelo Query Editor do Azure.

    Conexão: Ingestão no Power BI via conector nativo do SQL Server, importando as tabelas de negócio do schema relacional.

2. Transformação e Limpeza de Dados (Power Query)

Todas as transformações foram conduzidas com foco na integridade referencial, padronização e preparação para modelagem analítica:

    Saneamento Estrutural: Remoção do prefixo padrão azure_company_ no nome das tabelas e eliminação de colunas relacionais aninhadas (Table e Value) geradas na importação.

    Padronização Semântica: Tradução dos nomes das colunas para PT-BR e equalização de chaves estrangeiras com nomenclaturas divergentes (ex.: uniformização de Dno, Dnumber e Pno).

    Tipagem de Dados:

        Identificadores únicos (Ssn, Super_ssn) tipificados como inteiros.

        Campos monetários (Salary) configurados como número decimal fixo/moeda.

        Validação das cargas horárias na tabela de alocação (works_on).

    Tratamento de Campos Complexos (Endereço):

        Divisão por transição de dígito para não-dígito (isolamento do número predial).

        Divisão por posição nos dois últimos caracteres para extração da UF (Estado).

        Limpeza de caracteres especiais (- substituído por espaço) e aplicação da função Trim (Cortar) para saneamento de espaços em branco.

    Tratamento de Nulos e Hierarquia de Gestão:

        O campo Super_ssn continha valor nulo exclusivamente no cargo executivo mais alto (gerente geral).

        Criação de coluna condicional atribuindo o próprio Ssn do colaborador como seu gestor na ausência de Super_ssn, garantindo integridade para análises hierárquicas.

    Junções Hierárquicas e Nomes Completos:

        Mesclagem das colunas de primeiro nome (Fname), inicial do meio (Minit) e sobrenome (Lname) para consolidar o nome completo dos colaboradores.

        Auto-junção (Self-Join via Mesclar Consultas) da tabela de colaboradores relacionando Super_ssn com Ssn, incorporando o nome legível do gestor a cada linha de colaborador.

    Consolidação Departamento-Localidade:

        Mesclagem entre department e dept_locations através do identificador do departamento, unificando os campos em combinações únicas de Departamento - Localização.

3. Esclarecimento Teórico: Mesclar vs. Acrescentar Consultas

No contexto deste desafio, a operação correta para unificar departamentos/locais e colaboradores/gerentes é Mesclar, e não Acrescentar:

    Mesclar (Merge / JOIN): Opera horizontalmente adicionando novas colunas com base em colunas-chave coincidentes. Como um departamento pode ter múltiplas localidades físicas (relação 1:N), a mescla expande a granularidade necessária preservando a integridade dos atributos.

    Acrescentar (Append / UNION): Opera verticalmente empilhando linhas abaixo de uma estrutura de colunas compatível. Usar acrescentar geraria novas linhas com dezenas de campos nulos em vez de associar a localização ao departamento existente.

4. Agrupamento e Modelagem

    Métrica de Gestão: Criação de uma tabela agregada a partir da relação colaborador-gerente, agrupando por ssn_gerente com a contagem (COUNT) de colaboradores subordinados diretos.

    Otimização de Esquema: Remoção de colunas técnicas, IDs secundários não utilizados e campos redundantes em todas as tabelas finais.

    Relatório Visual: Construção de 2 páginas de dashboard analítico focadas no resumo de Colaboradores e monitoramento de Projetos/Alocação.

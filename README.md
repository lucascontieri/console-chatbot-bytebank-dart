<h1 align="center">ChatBot em Dart com GitHub Gist API</h1>
<p align="center">
  <img 
    src="https://github.com/user-attachments/assets/1506d243-c403-43de-9ecf-c91e4285590c"
    alt="Logo do Dart"
    width="45%"
  />
</p
<p align="center">
  Assistente virtual desenvolvido em <strong>Dart</strong>, integrado à <strong>API do GitHub Gist</strong> para consulta e manipulação dinâmica de dados.
</p>

---

## 📌 Visão Geral

Este projeto implementa um **ChatBot em Dart** que funciona como um **assistente virtual via terminal**, capaz de consumir e alterar informações armazenadas em um **GitHub Gist** por meio da **API REST do GitHub**.

O ChatBot permite controlar o fluxo da conversa, realizar consultas, atualizar dados e encerrar a interação de forma estruturada e segura.

## 🧠 Arquitetura do Projeto

O projeto segue uma separação clara de responsabilidades:

- **Screens**: Controlam a interação com o usuário
- **Services**: Responsáveis pela comunicação com a API do GitHub
- **Models**: Representação dos dados (JSON → objetos Dart)
- **Helpers**: Responsável pelos cálculos de taxas ao realizar transferências
- **Exceptions**: Trata tipos específicos de exceções implementadas da classe abstrata Exception

---

## 📁 Estrutura do Projeto

```bash
bin/
 └── main.dart                    # Ponto de entrada da aplicação

lib/
 ├── exceptions/
 │    └── transaction_exceptions.dart   # Exceções personalizadas
 │
 ├── helpers/
 │    └── helper_taxes.dart              # Função para calcular a taxa
 │
 ├── models/
 │    ├── account.dart                   # Modelo de conta
 │    └── transaction.dart               # Modelo de transação
 │
 ├── screens/
 │    └── account_screen.dart            # Interface CLI e fluxo do ChatBot
 │
 ├── services/
 │     ├── account_service.dart           # Regras de negócio da conta
 │     └── transaction_service.dart       # Regras de transações
 │
 └──  api_key.dart                   # Configuração de autenticação
```

## ⛏️ Funcionalidades

- Consulta de dados armazenados em um GitHub Gist  
- Alteração dinâmica das informações via API REST  
- Controle do fluxo de conversa do assistente virtual  
- Interação via linha de comando (CLI)  
- Comunicação autenticada com a API do GitHub  

---

## ⚙️ Tecnologias Utilizadas

- **Dart**
- **GitHub Gist API**
- **HTTP REST**
- **JSON**

---

## ▶️ Como Executar o Projeto

### 1️⃣ Pré-requisitos

- Dart SDK instalado  
  👉 https://dart.dev/get-dart
- Conta no GitHub

---

### 2️⃣ Clonar o repositório

```bash
git clone https://github.com/lucascontieri/console-chatbot-bytebank-dart.git
```

### 3️⃣ Criar seu próprio Gist no GitHub

Acesse: https://gist.github.com

`Adicione um novo Gist`

O arquivo será nomeado como:
```bash
account.json
```
`Salve o Gist e copie o ID do Gist`

### 4️⃣ Gerar uma API Key do GitHub

Para que o ChatBot consiga se comunicar com a API do GitHub:
```bash
Acesse: https://github.com/settings/tokens
```
`Clique em Generate new token`

Selecione a permissão:

`gist`

`Gere o token e copie a chave`

### 5️⃣ Configurar o código

No código do projeto:

<p>- Substitua o ID do Gist pelo seu Gist pessoal na URI </p>
<p>- Substitua a API Key do GitHub pelo token gerado</p>

Após gerar o token, configure-o no arquivo abaixo:
```text
lib/api_key.dart
```

Substitua o valor da constante pelo seu token pessoal:
```dart
const String gitHubApiKey = "SUA_API_KEY_AQUI";
```

⚠️ Importante

Nunca versionar este arquivo com a chave preenchida

Não compartilhe sua API Key publicamente

Recomenda-se adicionar o arquivo api_key.dart ao .gitignore

---

### 🧪 Como Testar o ChatBot

Para testar o ChatBot, é necessário descomentar o código abaixo e adicioná-lo dentro da função main():

```dart
AccountScreen accountScreen = AccountScreen();
accountScreen.initializeStream();
accountScreen.runChatBot();
```

📌 Ficando da seguinte forma:
```dart
void main() {
  AccountScreen accountScreen = AccountScreen();
  accountScreen.initializeStream();
  accountScreen.runChatBot();
}
```
## 6️⃣ Executar o projeto

No terminal, execute:
```bash
dart run bin/main.dart
```

🎯 Objetivo do Projeto

Este projeto tem como objetivo o aprendizado prático de:

- Consumo de APIs REST

- Autenticação com tokens

- Manipulação de dados JSON

- Estruturação de aplicações em Dart

- Criação de assistentes virtuais via terminal

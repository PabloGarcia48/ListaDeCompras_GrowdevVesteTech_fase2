# 🛒 Shopping List App (Flutter)

Aplicativo de listas de compras, desenvolvido com **Dart + Flutter**, com foco em gerenciamento de estado, organização arquitetural e boas práticas na construção de aplicações.

<p align="center">
  <img src="assets_clone_twitter_fase1/printTela.png" alt="Twitter Login Clone" width="300"/>
</p>

---

## 📱 Sobre o Projeto

Este projeto tem como objetivo **permitir a criação e gerenciamento de múltiplas listas de compras** (ex: Mercado, Farmácia, etc.), cada uma contendo seus próprios itens.

O aplicativo foi desenvolvido como exercício prático para:

- Trabalhar navegação entre telas
- Aplicar separação de responsabilidades (UI vs Modelo)
- Manipular listas dinâmicas
- Implementar CRUD básico (Create, Read, Update, Delete)
- Calcular valores e progresso dinamicamente

---

## 🛠️ Tecnologias Utilizadas

- Flutter
- Dart
- Material Design

---

## 📐 Funcionalidades Implementadas

📋 Listas Principais
- Criação de múltiplas listas
- Exibição de progresso por lista
- Indicador visual com **LinearProgressIndicator**

🧾 Itens da Lista
- Adicionar novos itens via Bottom Sheet
- Marcar/desmarcar itens (checkbox)
- Cálculo automático de:
   - Total de itens
   - Itens concluídos
   - Valor total marcado
   - Valor total não marcado
- Remover item com gesto de arrastar (Dismissible)

🔄 Atualização de Progresso
- Progresso recalculado dinamicamente
- Navegação entre telas mantendo estado
- Atualização automática ao retornar para a tela principal

---

## 🏗️ Estrutura Arquitetural

O projeto foi estruturado com separação clara entre:

📦 Modelos
- MainList
- ItemList

Responsáveis por:
- Armazenar estado
- Regras de negócio
- Cálculos derivados (getters)
- Métodos como addItem, removeItem, toggleChecked

🎨 UI
- MainListPage
- DetailListPage
- ListCardWidget
- ItemCardWidget
- AddItem

A UI apenas exibe dados e dispara eventos.

---

## 🚀 Como Executar o Projeto

1. Verifique se o Flutter está instalado:
   ```bash
   flutter --version
   ```
2. Clone o repositório:
   ```bash
   git clone https://github.com/PabloGarcia48/ListaDeCompras_GrowdevVesteTech_fase2.git
   ```
3. Acesse a pasta do projeto:
   ```bash
   cd nome-do-repo
   ```

4. Instale as dependências:
   ```bash
   flutter pub get
   ```

5. Execute o aplicativo:
   ```bash
   flutter run
   ```

---
## 📚 Aprendizados
Durante o desenvolvimento deste projeto, foram praticados:
- Manipulação de listas dinâmicas
- Uso correto de StatefulWidget e setState
- Navegação com Navigator.push e Navigator.pop
- Passagem de objetos entre telas
- Separação de lógica de negócio dos widgets
- Uso de Dismissible para remoção com gesto
- Cálculos reativos usando getters

---
## 📄 Licença
Este projeto foi desenvolvido para fins educacionais e de estudo em Flutter.
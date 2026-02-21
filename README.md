Este projeto consiste no desenvolvimento de um aplicativo mobile utilizando Flutter (Dart), com o objetivo de traduzir palavras específicas previamente cadastradas.
O aplicativo foi desenvolvido como trabalho acadêmico, com foco no aprendizado de desenvolvimento mobile multiplataforma, lógica de programação e manipulação de dados.

O sistema não realiza traduções completas de frases, apenas traduções pontuais com base em um conjunto definido de palavras e seus respectivos significados.

Objetivo:
-Aplicar os conceitos aprendidos em sala de aula
-Desenvolver um aplicativo mobile funcional em Flutter
-Trabalhar com entrada de dados do usuário
-Retornar traduções com base em um dicionário interno
-Compreender a estrutura de projetos Flutter

Tecnologias Utilizadas:
-Flutter
-Dart
-Android Studio ou Visual Studio Code
-Emulador Android ou dispositivo físico

Funcionalidades:
-Inserção de uma palavra pelo usuário
-Verificação da palavra em um dicionário interno
-Exibição da tradução correspondente
-Mensagem informativa caso a palavra não exista
-Interface simples e intuitiva

Funcionamento:
-O usuário digita uma palavra no campo de texto
-O aplicativo verifica se a palavra existe no dicionário interno
-Caso exista, a tradução é exibida na tela
-Caso não exista, o aplicativo informa que a tradução não foi encontrada

-----------------------------------
Estrutura do Projeto:
lib/
 ├── main.dart
 ├── screens/
 │    └── home_screen.dart
 ├── services/
 │    └── translator_service.dart
 └── models/
      └── word_model.dart
-----------------------------------

Pré-requisitos:
Flutter instalado;
Android Studio ou Visual Studio Code;
Emulador Android ou celular conectado;

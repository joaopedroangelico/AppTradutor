import 'package:flutter/material.dart';  
// importa o pacote principal do Flutter

void main() {
  runApp(const TradutorApp());
}
// função principal da aplicação

class TradutorApp extends StatelessWidget {
  const TradutorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tradutors',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TradutorScreen(),
    );
  }
}

class TradutorScreen extends StatefulWidget {
  const TradutorScreen({super.key});
  // tela principal do app, que precisa armazenar e mudar estados.
  // por isso, ela é um StatefulWidget(ainda não entendi exatamente a diferença entre os dois)

  @override
  State<TradutorScreen> createState() => _TradutorScreenState();
  // cria o estado da tela controlado pela classe _TradutorScreenState
}

class _TradutorScreenState extends State<TradutorScreen> {
  // Lista de palavras
  final List<Map<String, String>> _Cartas = [
    {'pt': 'Casa', 'en': 'House'},
    {'pt': 'Jogo', 'en': 'Game'},
    {'pt': 'Cachorro', 'en': 'Dog'},
    {'pt': 'Gato', 'en': 'Cat'},
    {'pt': 'Carro', 'en': 'Car'},
    {'pt': 'Sol', 'en': 'Sun'},
    {'pt': 'Lua', 'en': 'Moon'},
    {'pt': 'Mar', 'en': 'Sea'},
    {'pt': 'Amor', 'en': 'Love'},
    {'pt': 'Tradutor', 'en': 'Translator'},
    {'pt': 'Praia', 'en': 'Beach'}, // eu ia colocar "bitch" por piada, mas acho melhor nao né kkkkk
  ];

  int _currentIndex = 0; // indice da carta atual
  bool _mostrarTraducao = false; // controle de exibir ou não a tradução, basicamente vai aparecer a tradução depois de apetar no botao

  void _proximaCarta() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _Cartas.length;
      // proxima carta e se chegar no final das 10 cartas volta para a primeira.
      _mostrarTraducao = false; // some com a tradução quando mudar de carta
    });
  }

  void _revelarTraducao() {
    setState(() {
      _mostrarTraducao = true; // mostra a tradução da carta atual
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = _Cartas[_currentIndex]; // Carta que esta sendo traduzida

    return Scaffold(
      appBar: AppBar(title: const Text('Tradutor')), // barra do topo com titulo
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // borda em todos os lados
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // centraliza os elementos na tela
            children: [
              // caixa da carta principal
              Container(
                width: double.infinity, // ocupa toda a largura possivel
                padding: const EdgeInsets.all(20), // tamanho do espaço interno
                decoration: BoxDecoration(
                  color: Colors.blue[100], // Cor background da carta
                  borderRadius: BorderRadius.circular(12), // formato das bordas
                ),
                child: Column(
                  children: [
                    // mostra a palavra em portugues
                    Text(
                      current['pt'] ?? 'Palavra não encontrada',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center, // centraliza o texto.
                    ),
                    const SizedBox(height: 20), // o espaço entre os textos

                    // lugar da traduçao com efeito de fade(opacidade animada)
                    AnimatedOpacity(
                      opacity: _mostrarTraducao ? 1.0 : 0.0, // mostra ou esconde
                      duration: const Duration(milliseconds: 300), // o tempo da animaçao
                      child: Text(
                        _mostrarTraducao
                            ? (current['en'] ?? 'Tradução não encontrada') // mostra traduçao.
                            : 'Toque para traduzir', // mostra o texto inicial
                        style: const TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ), 
              ),
              const SizedBox(height: 30), // o espaço entre carta e botoes.

              // a linha dos botoes
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // centraliza os botoes
                children: [
                  ElevatedButton(
                    onPressed: _revelarTraducao, // chama a função de revelar a traducao
                    child: const Text('Traduzir'),
                  ),
                  const SizedBox(width: 20), // espaço entre os botoes
                  ElevatedButton(
                    onPressed: _proximaCarta, // chama a funçao da proxima carta.
                    child: const Text('Proximo'),
                  ), // fim do botao proximo
                ],
              ), // fim da linha dos botoes
            ],
          ), // fim da coluna principal
        ), // fim do padding
      ), // fim do center
    ); // fim do scaffold
 }
} // aqui acaba a classe _TradutorScreenState


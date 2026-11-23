import 'package:flutter/material.dart';
import 'widgets/bloco_estatistica.dart';

void main() {
  runApp(const Aula04LayoutApp());
}

class Aula04LayoutApp extends StatelessWidget {
  const Aula04LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aula 04 - Layout Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PainelLayoutScreen(),
    );
  }
}

class PainelLayoutScreen extends StatefulWidget {
  const PainelLayoutScreen({super.key});

  @override
  State<PainelLayoutScreen> createState() => _PainelLayoutScreenState();
}

class _PainelLayoutScreenState extends State<PainelLayoutScreen> {
  bool _usarGrid2x2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel de Layouts - Aula 04'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                _usarGrid2x2 = !_usarGrid2x2;
              });
            },
            icon: Icon(
              _usarGrid2x2 ? Icons.view_column : Icons.grid_view,
              color: Colors.white,
            ),
            label: Text(
              _usarGrid2x2 ? 'Ver Row (Ex.01)' : 'Ver Grid 2x2 (Ex.08)',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Estatísticas do Usuário',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 12),
            if (_usarGrid2x2)
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.35,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  BlocoEstatistica(
                    icone: Icons.article,
                    contagem: '128',
                    legenda: 'Posts',
                    cor: Colors.indigo,
                  ),
                  BlocoEstatistica(
                    icone: Icons.people,
                    contagem: '1.4K',
                    legenda: 'Seguidores',
                    cor: Colors.blue,
                  ),
                  BlocoEstatistica(
                    icone: Icons.camera_alt,
                    contagem: '45',
                    legenda: 'Fotos',
                    cor: Colors.teal,
                  ),
                  BlocoEstatistica(
                    icone: Icons.favorite,
                    contagem: '320',
                    legenda: 'Curtidas',
                    cor: Colors.redAccent,
                  ),
                ],
              )
            else
              Row(
                children: const [
                  Expanded(
                    child: BlocoEstatistica(
                      icone: Icons.article,
                      contagem: '128',
                      legenda: 'Posts',
                      cor: Colors.indigo,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: BlocoEstatistica(
                      icone: Icons.people,
                      contagem: '1.4K',
                      legenda: 'Seguidores',
                      cor: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: BlocoEstatistica(
                      icone: Icons.camera_alt,
                      contagem: '45',
                      legenda: 'Fotos',
                      cor: Colors.teal,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 24),
            const Text(
              'Card de Destaque',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.indigo.shade700, Colors.blue.shade500],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 40),
                        SizedBox(height: 8),
                        Text(
                          'Projeto Flutter - Módulo Layouts',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Destaque',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.check_circle, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Confirmado',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.indigo.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.list_alt, color: Colors.indigo, size: 26),
                      SizedBox(width: 10),
                      Text(
                        'Últimos Registros',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Ver todos'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

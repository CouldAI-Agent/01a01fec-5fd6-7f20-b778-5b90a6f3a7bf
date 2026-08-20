import 'package:flutter/material.dart';

void main() {
  runApp(const FinancialAssistantApp());
}

class FinancialAssistantApp extends StatelessWidget {
  const FinancialAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Financial Assistant',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AppShell(),
      },
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    ChatScreen(),
    DashboardScreen(),
    MemoryScreen(),
    PermissionsScreen(),
    SecurityScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.chat), label: Text('Chat')),
                NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Dashboard')),
                NavigationRailDestination(icon: Icon(Icons.memory), label: Text('Memory')),
                NavigationRailDestination(icon: Icon(Icons.security), label: Text('Permissions')),
                NavigationRailDestination(icon: Icon(Icons.shield), label: Text('Security')),
              ],
            ),
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: const [
                NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
                NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
                NavigationDestination(icon: Icon(Icons.memory), label: 'Memory'),
                NavigationDestination(icon: Icon(Icons.security), label: 'Perms'),
                NavigationDestination(icon: Icon(Icons.shield), label: 'Security'),
              ],
            ),
    );
  }
}

// Dummy screen implementations for basic layout

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Financial Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Hello! I am your private AI financial assistant. How can I help you today?', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Ask about opportunities, risks, or analysis...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24.0)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Financial Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            title: Text('Total Opportunities'),
            trailing: Text('12 Found', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Divider(),
          ListTile(
            title: Text('Risk Alerts'),
            trailing: Text('2 High Risk', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
          ),
        ],
      ),
    );
  }
}

class MemoryScreen extends StatelessWidget {
  const MemoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Memory Center (SD Card)')),
      body: const Center(child: Text('Manage Local Storage & Encryption')),
    );
  }
}

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Permission Center')),
      body: const Center(child: Text('Manage Granular API & Access Permissions')),
    );
  }
}

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Security Center')),
      body: const Center(child: Text('Audit Logs & Master Controls')),
    );
  }
}

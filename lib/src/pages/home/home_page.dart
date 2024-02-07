import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final deskNumberEC = TextEditingController();

  @override
  void dispose() {
    deskNumberEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(40),
            width: sizeOf.width * .4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Bem Vindo!',
                  style: LabClinicasTheme.titleStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Preencha o número do guichê que você está atendendo',
                  style: LabClinicasTheme.suTitleSmallStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: deskNumberEC,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: Validatorless.multiple([
                    Validatorless.required('Guichê obrigatório'),
                    Validatorless.number('Guichê deve ser um número'),
                  ]),
                  decoration: const InputDecoration(label: Text('Número do guichê')),
                ),
                const SizedBox(
                  height: 32, 
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('CHAMAR PRÓXIMO PACIENTE'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

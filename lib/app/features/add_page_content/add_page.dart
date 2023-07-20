import 'package:flutter/material.dart';

class AddPageContent extends StatelessWidget {
  const AddPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'Nazwa zadania',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: Color.fromARGB(80, 150, 87, 87),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'Opis zadania',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: Color.fromARGB(80, 150, 87, 87),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          // TextField(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(80, 150, 87, 87),
            )),
            onPressed: () {},
            child: const Text(
              'Dodaj',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

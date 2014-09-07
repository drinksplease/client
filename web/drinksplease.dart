import 'dart:html';
import 'package:force/force_browser.dart';

ForceClient client;
void main() {
    client = new ForceClient()
        ..connect();
    
    querySelector('#submit')
        ..onClick.listen(dataSubmitted);
    
    client.on('received', displayName);
}

void dataSubmitted(MouseEvent e) {
    InputElement nameInput = querySelector('#name');
    var data = {"name" : nameInput.value};
    client.send("name", data);
}

void displayName(message, sender) {
    querySelector('#names').appendHtml('<li> ${message.json['name']} </li>');
}
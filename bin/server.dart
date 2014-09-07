library drinksplease;
import 'drinkspleaseserver.dart';

DrinksPleaseServer server;

void main() {
    Map events = {
        'name' : (msg, sender) {
            sender.send('received', msg.json);
        }
    };
    
    server = new DrinksPleaseServer(events, true)
        ..start();
}
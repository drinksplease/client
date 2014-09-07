import 'package:force/force_serverside.dart';

/**
 * A class which handles the server side
 * stuff for this application
 */
class DrinksPleaseServer extends ForceServer {
    
    bool logging;
    Map events;
    
    /**
     * Construct a new Drinks please server 
     * which is an instance of a force
     * server.
     * 
     * @param Map   events      The events for this server
     * @param bool  logging     Whether or not we want to console log
     */
    DrinksPleaseServer(this.events, this.logging): super(clientFiles: '../build/web/', startPage: 'drinksplease.html', port: 7777) {
        // if it's okay to log, set it up
        if(this.logging) {
            this.setupConsoleLog();
        }
        
        this.bindEvents();
    }
    
    /**
     * Bind our given events to the
     * server
     */
    void bindEvents() {
        events.keys.forEach((key) {
           this.on(key, events[key]); 
        });
    }
}
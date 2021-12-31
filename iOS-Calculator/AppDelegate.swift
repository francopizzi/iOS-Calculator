//
//  AppDelegate.swift
//  iOS-Calculator
//
//  Created by franco pizzi on 10/12/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow? //contenedor principal de la app
    
    // Esta es la primer funcion que se ejecuta cuando se inicia la APP
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Setup
        setupView() //Aca indico cual va a ser la primer vista de la APP
        
        
        return true
    }

    // MARK: - Private Methods
    
    private func setupView() {
        
        //Genero una instancia UIWindow
        window = UIWindow(frame: UIScreen.main.bounds) // Asigno window a la pantalla y le digo que ocupe toda la pantalla (frame me indica que elegi lo de tamanio)
        
        
        let vc = HomeViewController() //Mi controlador de la vista principal
        window?.rootViewController = vc //le asigno a window mi ventana principal
        window?.makeKeyAndVisible() //hace visible la ventana
        
        
    }

}


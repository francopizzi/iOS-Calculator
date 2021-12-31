//
//  HomeViewController.swift
//  iOS-Calculator
//
//  Created by franco pizzi on 10/12/2021.
//

import UIKit
//Con el final evito que la clase se extienda,
// despues en caso de querer que se exienda se borra y listo
// La clase HomeViewController extiende de UIViewController

final class HomeViewController: UIViewController {
    
    // Mark: - Controlers
    
    //Result
    @IBOutlet weak var resultLabel: UILabel!
    
    //Numbers
    @IBOutlet weak var number0: UIButton!
    
    @IBOutlet weak var number1: UIButton!
    
    @IBOutlet weak var number2: UIButton!
    
    
    @IBOutlet weak var number3: UIButton!
    
    
    @IBOutlet weak var number4: UIButton!
    
    
    @IBOutlet weak var number5: UIButton!
    
    
    @IBOutlet weak var number6: UIButton!
    
    
    @IBOutlet weak var number7: UIButton!
    
    
    @IBOutlet weak var number8: UIButton!
    
    
    @IBOutlet weak var number9: UIButton!
    
    @IBOutlet weak var numberDecimal: UIButton!
    
    //Operators
    
    @IBOutlet weak var operatorAC: UIButton!
    
    
    @IBOutlet weak var operatorPlusMinus: UIButton!
    
    
    @IBOutlet weak var operatorPercent: UIButton!
    
    
    @IBOutlet weak var operatorResult: UIButton!
    
    
    @IBOutlet weak var operatorAddition: UIButton!
    
    @IBOutlet weak var operatorSubstraction: UIButton!
    
    
    @IBOutlet weak var operatorMultiplication: UIButton!
    
    
    
    @IBOutlet weak var operatorDivision: UIButton!
    
    
    
    // MARK: -  Initialization
    //Como quiero que se instancia este controlador
    init() {
        super.init(nibName: nil, bundle: nil) //esta es la forma de asociar el home view controller View/Home (archivo xib)
    }
    
    //Bloque necesario para que pueda inicializarce e instanciarse la clase
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDecimal.round()
        
        operatorAC.round()
        operatorResult.round()
        operatorPercent.round()
        operatorAddition.round()
        operatorDivision.round()
        operatorSubstraction.round()
        operatorMultiplication.round()
        operatorPlusMinus.round()
       
    }
    
    //MARK: - Button Actions
    
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        sender.shine()
    }
    
    
    @IBAction func numberAction(_ sender: UIButton) {
        sender.shine()
        print(sender.tag)
    }
}

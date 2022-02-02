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
    
    // MARK: - Variables
    private var total: Double = 0; //el total
    private var temp: Double = 0 //La que se muestra en pantalla en el label
    private var operating: Bool = false // Indica si se selecciono un operador
    private var resultbtn : Bool = false
    private var decimal: Bool = false // para saber si se oprimio la ,
    private var operation: OperationType = .none //Operacion actual
    
    // MARK: - Constantes
    private enum OperationType {
        case none, addiction , substraction , multiplication , division , percent
    }
    
    private let kDecimalSeparator = Locale.current.decimalSeparator!//para acceder al separador decimal de nuestro iphone dependiendo del idioma
    private let kMaxLength = 9 //el numero mas grande va a ser de 9 digitos
    private let kMaxValue: Double = 999999999
    private let kMinValue: Double = 0.00000001
    
    //Formateo de valores auxiliar
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter() //defino
        let locale = Locale.current //obtengo el local
        formatter.groupingSeparator = "" //la separacion entre los grupos va a estar vacia
        formatter.decimalSeparator = locale.decimalSeparator //tomo el separador local
        formatter.numberStyle = .decimal //estilo del numero
        return formatter
    }()
    
    //Formateo de valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter ()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator //tomo la separacion que usa el celular
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9 //maxima cantidad de enteros
        formatter.minimumFractionDigits = 0 //minima cantidad fraccional
        formatter.maximumFractionDigits = 8 //maxima cantidad fraccional
        return formatter
    }()
    
    
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
       
        // Esto es que para dependiendo del idioma del celular me coloque , o . en el boton UI
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)
        
        result() //mostrar en pantalla el resultado al iniciar
    }
    
    //MARK: - Button Actions
    
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        if (temp == 0) {
            total = total * (-1)
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }else {
            temp = temp * (-1)
            resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        }
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        
        // para terminar de ejecutar la operacion anterior
        if operation != .percent {
            result()
        }
        
        operating = true
        operation = .percent
        result()
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        resultbtn = true
        result()
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        // primero resuelvo la operacion pendiente y luego asigno la correspondiente a lo que presiono el usuario
        
        operating = true
        operation = .addiction
        result()
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        
        operating = true
        operation = .substraction
        result()
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        
        operating = true
        operation = .multiplication
        result()
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        
        operating = true
        operation = .division
        result()
        sender.shine()
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        
        //formateo el numero con el auxiliar
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        //verifico que no se este operando y que currentTemp no tenga mas numeros de los permitidos
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        
        //Le agrego al numero el . o ,
        // El ! al final va para desempaquetar por si viene vacio
        resultLabel.text = resultLabel.text! + kDecimalSeparator
        decimal = true
        sender.shine()
    }
    
    
    @IBAction func numberAction(_ sender: UIButton) {
        
        operatorAC.setTitle("C", for: .normal)
        // Al igual que antes tengo que verificar que no se supere la cantidad de numeros con mi valor temporal
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        //Hemos seleccionado una operacion?
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        // Hemos seleccionado decimales, para mantener el numero ejemplo
        // yo hice click en 5 pero antes tenia 4. entonces despues en pantalla tengo que ver 4.5
        if decimal {
            currentTemp = "\(currentTemp)."
            decimal = false
        }
        
        let number = sender.tag
        let aux = "\(currentTemp)\(String(number))"
        if let myNoNilString = Double(aux) {
            temp = myNoNilString
        }
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        
        sender.shine()
        print(sender.tag)
    }
    
    
    // Limpia los valores
    private func clear () {
        operation = .none
        // Lo hacemos porque AC se cambia por C y esto indica que existen valores temporales
        operatorAC.setTitle("AC", for: .normal)
        // Cuando el boton esta en C y lo presiono se cambia a AC y aqui se eliminan los valores temporales, luego si volvemos a pulsar en ese boton se va a eliminar el total
        // Comparamos si la variable temporal es distinto de cero para saber si hay valores temporales
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result() //La llamamos para que calcule y se vuelva a cero
        }
    }
    // Obtiene el resultado final
    private func result () {
        switch operation {
        case .none:
            // no hago nada
        break
        case .addiction:
            //Tenemos que sumar
            total = total + temp
            break
        case .substraction:
            //Tenemos que restar
            if (total == 0) {
                    total = temp
            } else {
                total = total - temp
            }
            break
        case .multiplication:
            //Tenemos que multiplicar
            if (temp != 0) {
                total = total * temp
            }
            break
        case .division:
            //Tenemos que dividir
            if (temp != 0) {
                total = total / temp
            }
            break
        case .percent:
            //Tenemos que calcular el porcentaje
            if (temp != 0) {
                total = temp / 100
            } else {
                total = total / 100
            }
            break
        }
        
        // Formateo en pantalla
        if ( total <= kMaxValue || total >= kMinValue) {
            // LLamo al formateador y lo convierto a string , lo del NSNumber es exigido por la funcion printFormatter.string
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        print("TOTAL: \(total)")
        if (resultbtn) {
            temp = 0
            resultbtn = false
        }
    }
}

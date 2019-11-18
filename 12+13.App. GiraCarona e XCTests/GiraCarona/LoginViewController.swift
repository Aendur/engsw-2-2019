//
//  ViewController.swift
//  GiraCarona
//
//  Created by Thiago Dantas on 18/11/19.
//  Copyright © 2019 Thiago Dantas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var Log_Label: UILabel!
    @IBOutlet weak var Senha_Field: UITextField!
    @IBOutlet weak var CPF_Field: UITextField!
    
    @IBAction func Logar(_ sender: Any) {
        if (validaCPF(cpf: CPF_Field.text ?? "") == false){
            Log_Label.isHidden = false
            Log_Label.text = "CPF Inválido"
        } else {
            Log_Label.isHidden = true;
            Log_Label.text = "Taquipariu"
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func aplicaRegex(cpf:String){
        let range = NSRange(location: 0, length: cpf.utf16.count)
        if let regex = try? NSRegularExpression(pattern: "[1-9]{3}.[1-9]{3}.[1-9]{3}-[1-9]{2}"){
            regex.numberOfMatches(in: cpf, options: .anchored, range: range)
        }
    }
    
    func validaCPF(cpf:String) -> Bool{
        
        let digitSet = CharacterSet.decimalDigits;
        var digits = String(cpf.unicodeScalars.filter {digitSet.contains($0)})
        let digits2 = digits;
        var sum1 = 0;
        var sum2 = 0;
        var verificador1 = 0;
        var verificador2 = 0;
        if (!digits.isEmpty) {
            for i in stride(from:10, to: 1, by: -1) {                if let num = digits.removeFirst().wholeNumberValue {
                    sum1 += num * i;
                    if i == 2 {
                        verificador1 = num;
                        verificador2 = digits.removeFirst().wholeNumberValue ?? 1;
                    }
                }
            }
            if (sum1 * 10 % 11 != verificador1) {
                return false
            }
            digits = digits2;
            for i in stride(from:11, to: 1, by: -1){
                if let num = digits.removeFirst().wholeNumberValue {
                    sum2 += num * i;
                }
            }
            if (sum2 * 10 % 11 != verificador2) {
                return false
            }
        return true
        }
        return false
    }

}

extension LoginViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let char = string.cString(using: .utf8)
        if strcmp(char, "\\b") == -92 {
            return true;
        } else {
            return (textField.text ?? "").count <= 13
        }
        ///TODO: atualizar com mascara do texto.
        
    }

}


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billAmountTextField: UITextField!;

    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!;
    @IBOutlet weak var tipAmountLbl: UILabel!;
    @IBOutlet weak var totalAmountLbl: UILabel!;
    
    @IBOutlet weak var errorLbl: UILabel!;
    override func viewDidLoad() {
        super.viewDidLoad();
        
        tipSegmentedControl.addTarget(self, action: #selector(ViewController.changeTipPercentage(_:)), for: .valueChanged);
        
        
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.view.endEditing(true)
        
        
    }
    
    
    func changeTipPercentage(_ sender: UISegmentedControl) {

        var tip: Int?;
        
        switch tipSegmentedControl.selectedSegmentIndex {
        case 0:
            tip = 10;
        case 1:
            tip = 12;
        case 2:
            tip = 15;
        default:
            print("No Tip!!");
        }
        calculateTip(tipPercentage: tip!);
        
    }
    
    func calculateTip(tipPercentage: Int) {
      
        
        if (billAmountTextField.text?.isEmpty)! {
            errorLbl.textColor = UIColor.red;
            errorLbl.text = "Please Enter Your Bill Amount."
            tipAmountLbl.text = "₪";
            totalAmountLbl.text = "₪";
            
        }else {
            errorLbl.text = "";
            let billAmount: Float = Float(billAmountTextField.text!)!;
            let tipAmount = billAmount * Float(tipPercentage) / 100;
            calculateTotalAmount(tipAmount: tipAmount, billAmount: billAmount);
        }
        
    }
    
    func calculateTotalAmount(tipAmount: Float, billAmount: Float) {
        displayTipTotalAmounts(tipAmount: tipAmount, billAmount: billAmount);
    }
    
    func displayTipTotalAmounts(tipAmount: Float, billAmount: Float) {
        tipAmountLbl.text = "\(tipAmount) ₪";
        totalAmountLbl.text = "\(billAmount + tipAmount) ₪";
    }
    
    
    
    


}


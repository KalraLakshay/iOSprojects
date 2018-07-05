import UIKit
class SettingScreenViewController : UIViewController
{
    var txt1 = " This is a Fake Police Call App. This app can be used to get bad behaving properly . You can also praise kids when they are behaving good . you'll be able to personalize it with your childs name along with the predetermined action . A fake call will then call the child and sergent friendly will come on the phone. "
    var txt2 = "यह एक नकली पुलिस कॉल ऐप है। खराब तरीके से व्यवहार करने के लिए इस ऐप का उपयोग किया जा सकता है। जब वे अच्छे व्यवहार कर रहे हों तो आप बच्चों की भी प्रशंसा कर सकते हैं। आप पूर्व निर्धारित कार्रवाई के साथ अपने बच्चों के नाम से इसे वैयक्तिकृत करने में सक्षम होंगे। एक नकली कॉल तब बच्चे को फोन करेगी और सर्जेंट दोस्ताना फोन पर आएगी।"
    var txt3 = "Esta es una aplicación de llamada policial falsa. Esta aplicación se puede utilizar para obtener un comportamiento incorrecto. También puede elogiar a los niños cuando se comportan bien. podrá personalizarlo con el nombre de su hijo junto con la acción predeterminada. Una llamada falsa luego llamará al niño y el amigable sergent vendrá al teléfono."
    @IBOutlet weak var spanOutlet: UIButton!
    @IBOutlet weak var hinOutlet: UIButton!
    @IBOutlet weak var engOutlet: UIButton!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        showText()
    }
    func showText()
    {
        textView.text = txt1
    }
    @IBAction func englishButton(_ sender: UIButton)
    {
            textView.text = txt1
        }
    @IBAction func hindiButton(_ sender: UIButton)
    {
        textView.text = txt2
    }
    @IBAction func spanishButton(_ sender: UIButton)
    {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.spanishValueGood = "spanish"
            textView.text = txt3
    }
    @IBAction func homeButtonBar(_ sender: UIBarButtonItem)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

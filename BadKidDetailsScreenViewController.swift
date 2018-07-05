import UIKit
import AVFoundation
class BadKidDetailsScreenViewController : UIViewController,AVAudioPlayerDelegate
{
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    var timer2 = Timer()
    var timerInterval2 = Int()
    var selectedAudio2 = String()
       var isDemoButton : Bool = true
    @IBOutlet weak var btnDemoChange: UIButton!
       @IBOutlet weak var btnsaveExit2: UIButton!
    var error = String()
    @IBOutlet weak var splashScreenSeven: UIImageView!
    var audioPlayer2 = AVAudioPlayer()
    var receivedString = String()
    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func btnClickedvc7(_ sender: UIButton)
    {
        if sender.tag==1
        {
            timerInterval2 = 5
        }
        else  if sender.tag==2
        {
            timerInterval2 = 10
        }
        else  if sender.tag==3
        {
            timerInterval2 = 15
        }
        else  if sender.tag==4
        {
            timerInterval2 = 20
    }
        updateButtonState2(inIndex: sender.tag)
    }
        func updateButtonState2(inIndex: Int)
        {
            buttonChange5.setImage(#imageLiteral(resourceName: "5secondsOff"), for: .normal)
            buttonChange10.setImage(#imageLiteral(resourceName: "10secondsOff"), for: .normal)
            buttonChange15.setImage(#imageLiteral(resourceName: "15secondsOff"), for: .normal)
            buttonChange20.setImage(#imageLiteral(resourceName: "20secondsOff"), for: .normal)
            if inIndex == 1
            {
                buttonChange5.setImage(#imageLiteral(resourceName: "5secondsOn"), for: .normal)
            }
            else if inIndex == 2
            {
                buttonChange10.setImage(#imageLiteral(resourceName: "10secondsOn"), for: .normal)
            }
            else if inIndex == 3
            {
                buttonChange15.setImage(#imageLiteral(resourceName: "15secondsOn"), for: .normal)
            }
            else if inIndex == 4
            {
                buttonChange20.setImage(#imageLiteral(resourceName: "20secondsOn"), for: .normal)
            }
        }
@IBAction func buttonSave(_ sender: UIButton)
    {
        self.error = nameTextField.text!
        if self.error.count == 0
        {
            let alert = UIAlertController(title: "Error", message: "Name Field cannot be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            self.timer2 = Timer.scheduledTimer(timeInterval: TimeInterval(timerInterval2) , target: self, selector: #selector(timerAction2), userInfo: nil, repeats: false)
              splashScreenSeven.isHidden = false
        }
    }
    @IBAction func buttonPlayDemo(_ sender: UIButton)
    {
        self.error = nameTextField.text!
        if error.count == 0
        {
            let alert = UIAlertController(title: "Error", message: "Name Field cannot be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(isDemoButton)
            {
                btnDemoChange.setImage(#imageLiteral(resourceName: "btnStopDemo"), for: .normal)
                self.isDemoButton = false
                myUtterance = AVSpeechUtterance(string: nameTextField.text!)
                myUtterance.rate = 0.3
                synth.speak(myUtterance)
                let soundurl = Bundle.main.url(forResource: selectedAudio2, withExtension: ".mp3")
                do
                {
                    audioPlayer2 = try AVAudioPlayer(contentsOf : soundurl! )
                    btnsaveExit2.setImage(#imageLiteral(resourceName: "saveExitBox"), for: .normal)
                    audioPlayer2.play()
                }
                catch
                {
                    print ("error")
                }
            }
            else
            {
                audioPlayer2.stop()
                  btnsaveExit2.setImage(#imageLiteral(resourceName: "btnSaveAndExit"), for: .normal)
                btnDemoChange.setImage(#imageLiteral(resourceName: "btnPlayDemo"), for: .normal)
                self.isDemoButton = true
            }
        }
      @IBOutlet weak var buttonChange5: UIButton!
    @IBOutlet weak var buttonChange10: UIButton!
    @IBOutlet weak var buttonChange15: UIButton!
    @IBOutlet weak var buttonChange20: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        splashScreenSeven.isHidden = true
    }
    @objc func timerAction2()
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CallIncomingViewController") as! CallIncomingViewController
        vc.callingAudio = selectedAudio2
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    @IBAction func button7(_ sender: UIButton)
    {
    self.navigationController?.popViewController(animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        nameTextField.resignFirstResponder()
    }
}

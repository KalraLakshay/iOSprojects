import UIKit
import  AVFoundation
class GoodKidDetailsScreenViewController: UIViewController,AVAudioPlayerDelegate
{
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    var timer = Timer()
    var timerInterval = Int()
    var selectedAudioInput = String()
    var isDemoButton2 : Bool = true
    @IBOutlet weak var btnDemoChange2: UIButton!
    @IBOutlet weak var SplashScreenSix: UIImageView!
    @IBOutlet weak var btnsaveExit: UIButton!
    var error = String()
    var receivedString = String()
       var audioPlayer = AVAudioPlayer ()
      @IBOutlet weak var nameTextField2: UITextField!
    @IBAction func btnClicked(_ sender: UIButton)
    {
        if sender.tag==1
        {
            timerInterval = 5
        }
      else  if sender.tag==2
        {
            timerInterval = 10
        }
        else  if sender.tag==3
        {
            timerInterval = 15
        }
        else  if sender.tag==4
        {
            timerInterval = 20
        }
        updateButtonState(inIndex: sender.tag)
    }
    func updateButtonState(inIndex: Int )
    {
        buttonChange5.setImage(#imageLiteral(resourceName: "5secondsOff"), for: .normal)
        buttonChange10.setImage(#imageLiteral(resourceName: "10secondsOff"), for: .normal)
        buttonChange15.setImage(#imageLiteral(resourceName: "15secondsOff"), for: .normal)
        buttonChange20.setImage(#imageLiteral(resourceName: "20secondsOff"), for: .normal)
        if inIndex == 1 {
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
    @IBAction func buttonSave2(_ sender: UIButton)
    {
        self.error = nameTextField2.text!
        if self.error.count == 0
        {
            let alert = UIAlertController(title: "Error", message: "Name Field cannot be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(timerInterval) , target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
            SplashScreenSix.isHidden = false
        }
        }
    @IBAction func buttonPlayDemo2(_ sender: UIButton)
    {
        self.error = nameTextField2.text!
        if error.count == 0
        {
            let alert = UIAlertController(title: "Error", message: "Name Field cannot be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(isDemoButton2)
            {
                btnDemoChange2.setImage(#imageLiteral(resourceName: "btnStopDemo"), for: .normal)
                btnsaveExit.isUserInteractionEnabled = false
                self.isDemoButton2 = false
                myUtterance = AVSpeechUtterance(string: nameTextField2.text!)
                myUtterance.rate = 0.3
                synth.speak(myUtterance)
                let soundurl = Bundle.main.url(forResource: selectedAudioInput, withExtension: ".mp3")
                do
                {
                    audioPlayer = try AVAudioPlayer(contentsOf : soundurl! )
                   btnsaveExit.setImage(#imageLiteral(resourceName: "saveExitBox"), for: .normal)
                    audioPlayer.play()
                }
                catch
                {
                    print ("error")
                }
            }
            else
            {
                audioPlayer.stop()
                btnsaveExit.isUserInteractionEnabled = true
                btnsaveExit.setImage(#imageLiteral(resourceName: "btnSaveAndExit"), for: .normal)
                btnDemoChange2.setImage(#imageLiteral(resourceName: "btnPlayDemo"), for: .normal)
                self.isDemoButton2 = true
        }
    }
    @IBOutlet weak var buttonChange5: UIButton!
    @IBOutlet weak var buttonChange10: UIButton!
    @IBOutlet weak var buttonChange15: UIButton!
    @IBOutlet weak var buttonChange20: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
       SplashScreenSix.isHidden = true
    }
    @objc func timerAction()
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CallIncomingViewController") as! CallIncomingViewController
                    vc.callingAudio = selectedAudioInput
                    self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    @IBAction func button6(_ sender: Any)
    {
          self.navigationController?.popViewController(animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.nameTextField2.resignFirstResponder()
    }
}

import UIKit
import AVFoundation
class CallingScreenViewController: UIViewController,AVAudioPlayerDelegate
{
   
    let audioSession = AVAudioSession.sharedInstance()
    var callingAudiovc92 = String()
    var callingAudiovc9 = String()
        var isSpeakerSelected:Bool = true
    var audioPlayer2 = AVAudioPlayer ()
   var audioPlayer = AVAudioPlayer ()
    override func viewDidLoad()
    {
        super.viewDidLoad()
    callingAudio9()
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet weak var speakerField: UIImageView!
    @IBOutlet weak var speakerButtonOutlet: UIButton!
    @IBAction func speakerButton(_ sender: UIButton)
    {
        if(isSpeakerSelected)
        {
      speakerField.image = UIImage(named: "screenSpeakerEnabled" )
            self.setAudioOutputSpeaker(enabled: true)
    self.isSpeakerSelected = false
        }
        else
        {
        speakerField.image = UIImage(named: "screenSpeakerDisabled" )
                  self.setAudioOutputSpeaker(enabled: false)
            self.isSpeakerSelected = true
        }
    }
    @IBAction func endCallButton(_ sender: UIButton)
    {
       exit(0)
    }
  func callingAudio9()
  {
   
    let soundurl = Bundle.main.url(forResource: callingAudiovc9 , withExtension: ".mp3")
    do
    {
        audioPlayer2 = try AVAudioPlayer(contentsOf : soundurl! )
    }
    catch
    {
        print ("error")
    }
    audioPlayer2.play()
    }
    func callingAudio92(){
        let soundurl = Bundle.main.url(forResource: callingAudiovc92 , withExtension: ".mp3")
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf : soundurl! )
        }
        catch
        {
            print ("error")
        }
        audioPlayer.play()
    }
    func setAudioOutputSpeaker(enabled: Bool)
    {
        let session = AVAudioSession.sharedInstance()
        var _: Error?
        try? session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try? session.setMode(AVAudioSessionModeVoiceChat)
        if enabled {
            try? session.overrideOutputAudioPort(AVAudioSessionPortOverride.speaker)
        } else {
            try? session.overrideOutputAudioPort(AVAudioSessionPortOverride.none)
        }
        try? session.setActive(true)
    }
}

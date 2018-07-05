import UIKit
import AVFoundation
class CallIncomingViewController : UIViewController,AVAudioPlayerDelegate
{
    var callingAudio2 = String()
var callingAudio = String()
    var audioPlayer2 = AVAudioPlayer()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let soundurl = Bundle.main.url(forResource: "Iphone_Ringtone", withExtension: ".mp3")
        do
        {
            audioPlayer2 = try AVAudioPlayer(contentsOf : soundurl! )
            audioPlayer2.numberOfLoops = -1
        }
        catch
        {
            print ("error")
        }
        audioPlayer2.play()
    }
    @IBAction func acceptButton(_ sender: UIButton)
    {
        self.audioPlayer2.pause()
          self.audioPlayer2.stop()
        let vc = storyboard?.instantiateViewController(withIdentifier: "CallingScreenViewController") as! CallingScreenViewController
        vc.callingAudiovc9 = callingAudio
        vc.callingAudiovc92 = callingAudio2
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func declineButton(_ sender: UIButton)
    {
        audioPlayer2.stop()
        exit(0)
    }
}

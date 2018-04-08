//
//  ViewController.swift
//  KeyboardDrummer
//
//  Created by NVT on 08.04.18.
//  Copyright © 2018 NVT. All rights reserved.
//

import Cocoa
import AudioKit

class ViewController: NSViewController {
    
    let drums = AKSampler()
    
    var bassDrumFile : AKAudioFile?
    var clapFile : AKAudioFile?
    var closedHiHatFile : AKAudioFile?
    var hiTomFile : AKAudioFile?
    var loTomFile : AKAudioFile?
    var midTomFile : AKAudioFile?
    var openHiHatFile : AKAudioFile?
    var snareDrumFile : AKAudioFile?

    override func viewDidLoad() {
        super.viewDidLoad()
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
            self.keyDown(with: $0)
            return $0
        }
        do {
            bassDrumFile = try AKAudioFile(readFileName: "Drums/bass_drum_C1.wav")
            clapFile = try AKAudioFile(readFileName: "Drums/clap_D#1.wav")
            closedHiHatFile = try AKAudioFile(readFileName: "Drums/closed_hi_hat_F#1.wav")
            hiTomFile = try AKAudioFile(readFileName: "Drums/hi_tom_D2.wav")
            loTomFile = try AKAudioFile(readFileName: "Drums/lo_tom_F1.wav")
            midTomFile = try AKAudioFile(readFileName: "Drums/mid_tom_B1.wav")
            openHiHatFile = try AKAudioFile(readFileName: "Drums/open_hi_hat_A#1.wav")
            snareDrumFile = try AKAudioFile(readFileName: "Drums/snare_D1.wav")
            try drums.loadAudioFiles([bassDrumFile!,
                                      clapFile!,
                                      closedHiHatFile!,
                                      hiTomFile!,
                                      loTomFile!,
                                      midTomFile!,
                                      openHiHatFile!,
                                      snareDrumFile!])
        }
        catch {
            print("Error while loading drums")
        }
        AudioKit.output = drums
        AudioKit.start()
    }

    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0:
            drums.play(noteNumber: 36 - 12)
        case 1:
            drums.play(noteNumber: 38 - 12)
        case 2:
            drums.stop(noteNumber: 46 - 12)
            drums.play(noteNumber: 42 - 12)
        case 3:
            drums.play(noteNumber: 46 - 12)
        case 4:
            drums.play(noteNumber: 41 - 12)
        case 5:
            drums.play(noteNumber: 47 - 12)
        case 38:
            drums.play(noteNumber: 50 - 12)
        case 40:
            drums.play(noteNumber: 39 - 12)
        default:
            break
        }
    }

}


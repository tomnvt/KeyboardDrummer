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
    
    @IBOutlet weak var kickLabel: NSTextField!
    @IBOutlet weak var snareLabel: NSTextField!
    @IBOutlet weak var closedHihatLabel: NSTextField!
    @IBOutlet weak var openHihatLabel: NSTextField!
    @IBOutlet weak var lowTomLabel: NSTextField!
    @IBOutlet weak var midTomLabel: NSTextField!
    @IBOutlet weak var highTomLabel: NSTextField!
    @IBOutlet weak var clapLabel: NSTextField!
    
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
        NSEvent.addLocalMonitorForEvents(matching: .keyUp) {
            self.keyUp(with: $0)
            return $0
        }
        loadDrums()
    }

    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0:
            drums.play(noteNumber: 36 - 12)
            kickLabel.backgroundColor = NSColor.lightGray
        case 1:
            drums.play(noteNumber: 38 - 12)
            snareLabel.backgroundColor = NSColor.lightGray
        case 2:
            drums.stop(noteNumber: 46 - 12)
            drums.play(noteNumber: 42 - 12)
            closedHihatLabel.backgroundColor = NSColor.lightGray
        case 3:
            drums.play(noteNumber: 46 - 12)
            openHihatLabel.backgroundColor = NSColor.lightGray
        case 4:
            drums.play(noteNumber: 47 - 12)
            midTomLabel.backgroundColor = NSColor.lightGray
        case 5:
            drums.play(noteNumber: 41 - 12)
            lowTomLabel.backgroundColor = NSColor.lightGray
        case 38:
            drums.play(noteNumber: 50 - 12)
            highTomLabel.backgroundColor = NSColor.lightGray
        case 40:
            drums.play(noteNumber: 39 - 12)
            clapLabel.backgroundColor = NSColor.lightGray
        default:
            break
        }
    }
    
    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 0:
            kickLabel.backgroundColor = NSColor.white
        case 1:
            snareLabel.backgroundColor = NSColor.white
        case 2:
            closedHihatLabel.backgroundColor = NSColor.white
        case 3:
            openHihatLabel.backgroundColor = NSColor.white
        case 4:
            midTomLabel.backgroundColor = NSColor.white
        case 5:
            lowTomLabel.backgroundColor = NSColor.white
        case 38:
            highTomLabel.backgroundColor = NSColor.white
        case 40:
            clapLabel.backgroundColor = NSColor.white
        default:
            break
        }
    }

    @IBAction func popUpChange(_ sender: NSPopUpButton) {
        switch sender.tag {
        case 0:
            print("0")
            if let number = sender.titleOfSelectedItem {
                print(number)
            }
        case 1:
            print("1")
            if let number = sender.titleOfSelectedItem {
                print(number)
            }
        case 2:
            print("2")
            if let number = sender.titleOfSelectedItem {
                print(number)
            }
        case 3:
            print("3")
            if let number = sender.titleOfSelectedItem {
                print(number)
            }
        case 4:
            print("4")
            if let number = sender.titleOfSelectedItem {
                print(number)
            }
        case 5:
            print("5")
            if let number = sender.titleOfSelectedItem {
                print(number)
            }
        case 6:
            print("6")
            if let number = sender.titleOfSelectedItem {
                print(number)
            }
        case 7:
            print("7")
            if let number = sender.titleOfSelectedItem {
                print(number)
            }
        default:
            break
        }
    }
    
    func loadDrums() {
        do {
            bassDrumFile = try AKAudioFile(readFileName: "Drums/bass_drum_C1.wav")
            clapFile = try AKAudioFile(readFileName: "Drums/clap_D#1.wav")
            closedHiHatFile = try AKAudioFile(readFileName: "Drums/closed_hi_hat_F#1.wav")
            hiTomFile = try AKAudioFile(readFileName: "Drums/hi_tom_D2.wav")
            loTomFile = try AKAudioFile(readFileName: "Drums/lo_tom_F1.wav")
            midTomFile = try AKAudioFile(readFileName: "Drums/mid_tom_B1.wav")
            openHiHatFile = try AKAudioFile(readFileName: "Drums/open_hi_hat_A#1.wav")
            snareDrumFile = try AKAudioFile(readFileName: "Drums/snare_D1.wav")
        }
        catch {
            print("Error while loading drums")
        }
        do {
            try drums.loadAudioFiles([bassDrumFile!,
                                      clapFile!,
                                      closedHiHatFile!,
                                      hiTomFile!,
                                      loTomFile!,
                                      midTomFile!,
                                      openHiHatFile!,
                                      snareDrumFile!])
        } catch {
            print("Error while loading drums")
        }
        AudioKit.output = drums
        AudioKit.start()
    }
    
}


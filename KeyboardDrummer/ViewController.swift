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
    
    var drumFilesArray : [AKAudioFile?] = {
        var bassDrumFile : AKAudioFile?
        var snareDrumFile : AKAudioFile?
        var closedHiHatFile : AKAudioFile?
        var loTomFile : AKAudioFile?
        var midTomFile : AKAudioFile?
        var hiTomFile : AKAudioFile?
        var openHiHatFile : AKAudioFile?
        var clapFile : AKAudioFile?
        let array = [bassDrumFile, clapFile, closedHiHatFile, loTomFile, midTomFile, hiTomFile, openHiHatFile, snareDrumFile]
        return array
    }()
    
    let drumFilesPartOne = ["Drums/bass_drum",
                            "Drums/snare",
                            "Drums/closed_hi_hat",
                            "Drums/open_hi_hat",
                            "Drums/lo_tom",
                            "Drums/mid_tom",
                            "Drums/hi_tom",
                            "Drums/clap"]
    
    let drumFilesPartTwo = ["_C1.wav",
                            "_D1.wav",
                            "_F#1.wav",
                            "_A#1.wav",
                            "_F1.wav",
                            "_B1.wav",
                            "_D2.wav",
                            "_D#1.wav"]

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
        
        for index in 0..<drumFilesArray.count {
            do {
                drumFilesArray[index] = try AKAudioFile(readFileName: drumFilesPartOne[index] + "1" + drumFilesPartTwo[index])
            }
            catch {
                print("Error while setting drum paths")
            }
        }
        
        loadDrums()
        AudioKit.output = drums
        AudioKit.start()
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
        if let number = sender.titleOfSelectedItem {
            let newDrumFile = drumFilesPartOne[sender.tag] + number + drumFilesPartTwo[sender.tag]
            drumFilesArray[sender.tag] = try? AKAudioFile(readFileName: newDrumFile)
        }
        loadDrums()
    }
    
    func loadDrums() {
        var drumFiles = [AKAudioFile]()
        for drum in drumFilesArray {
            if let drumFile = drum { drumFiles.append(drumFile) }
        }
        do {
            try drums.loadAudioFiles(drumFiles)
        } catch {
            print("Error while loading drums")
        }
    }
    
    
}


//
//  sinewave.swift
//  testAV
//
//  Created by nixinyu on 15/6/28.
//  Copyright (c) 2015年 nixinyu. All rights reserved.
//

import Foundation

import AVFoundation

class SinePlayer{
    // store persistent objects
    var ae:AVAudioEngine
    var player:AVAudioPlayerNode
    var mixer:AVAudioMixerNode
    var buffer:AVAudioPCMBuffer
    
    let sr:Float
    let n_channels:AVAudioChannelCount
    
    init(){
        // initialize objects
        ae = AVAudioEngine()
        player = AVAudioPlayerNode()
        mixer = ae.mainMixerNode
        buffer = AVAudioPCMBuffer(PCMFormat: player.outputFormatForBus(0), frameCapacity: 100)
        buffer.frameLength = 100

        // generate sine wave
        sr = Float(mixer.outputFormatForBus(0).sampleRate)
        n_channels = mixer.outputFormatForBus(0).channelCount
        

        
        

        // setup audio engine
        ae.attachNode(player)
        ae.connect(player, to: mixer, format: player.outputFormatForBus(0))
        do {
            try ae.start()
        } catch {
            print("error")
        }
        
        //ae.startAndReturnError(nil)
        
    }
    
    func playAV(){
        
        buffer.floatChannelData.memory.destroy()
        for var i = 0; i < Int(buffer.frameLength); i+=Int(n_channels) {
            let val = sinf(441.0*Float(i)*2*Float(M_PI)/sr)
            
            buffer.floatChannelData.memory[i] = val * 0.5
        }
        // play player and buffer
        player.play()
        player.scheduleBuffer(buffer, atTime: nil, options: .Interrupts, completionHandler: nil)
    }
    
    func test(){
    print("fds")
    }
    
}


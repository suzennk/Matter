//
//  SetupPayloadParser.swift
//  
//
//  Created by Alsey Coleman Miller on 6/9/22.
//

@_implementationOnly import CMatter

internal final class QRCodeSetupPayloadParser: CXXReference {
    
    typealias CXXObject = chip.QRCodeSetupPayloadParser
    
    private(set) var cxxObject: CXXObject
    
    init(_ cxxObject: CXXObject) {
        let _ = MemoryAllocator.initialize
        self.cxxObject = cxxObject
    }
    
    init(base38Encoded string: String) {
        let _ = MemoryAllocator.initialize
        let cxxObject = string.withCString { cString in
            var cxxString = std.string()
            cxxString.append(cString)
            return CXXObject(cxxString)
        }
        self.cxxObject = cxxObject
    }
    
    func populatePayload() throws -> SetupPayload {
        var payload = MatterSetupPayload()
        let cxxError = cxxObject.populatePayload(&payload)
        guard cxxError.AsInteger() == 0 else {
            throw MatterError(cxxError)
        }
        return SetupPayload(payload)
    }
}

public extension SetupPayload {
    
    static func qrCode(base38Encoded string: String) throws -> SetupPayload {
        let parser = QRCodeSetupPayloadParser(base38Encoded: string)
        return try parser.populatePayload()
    }
}

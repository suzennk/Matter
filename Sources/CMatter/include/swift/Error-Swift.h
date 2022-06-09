//
//  Error-Swift.h
//  
//
//  Created by Alsey Coleman Miller on 6/9/22.
//

#import <lib/core/CHIPError.h>

using MatterError = ::chip::ChipError;

static inline bool MatterErrorIsEqual(MatterError error, MatterError other)
__attribute__((swift_name("MatterError.isEqual(self:_:)")))
{
    return error == other;
}

//
//  byteorder.h
//  tun2socks
//
//  Created by LEI on 7/24/16.
//  Copyright © 2016 TouchingApp. All rights reserved.
//

#ifndef byteorder_h
#define byteorder_h

#include <stdint.h>

//#ifdef LITTLE_ENDIAN
//#undef LITTLE_ENDIAN
//#endif
//
//#ifdef BIG_ENDIAN
//#undef BIG_ENDIAN
//#endif

//// for BYTE_ORDER
//#ifdef _WIN32 // note the underscore: without it, it's not msdn official!
//// Windows (x64 and x86)
//#elif __unix__ // all unices, not all compilers
//// Unix
//#elif __linux__
//// linux
//#include <endian.h>
//#elif __APPLE__
//// Mac OS, not sure if this is covered by __posix__ and/or __unix__ though...
#include <machine/endian.h>
//#endif

#endif /* byteorder_h */

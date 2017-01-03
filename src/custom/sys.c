//
//  sys.c
//  Potatso
//
//  Created by icodesign on 28/12/2016.
//  Copyright © 2016 Potatso. All rights reserved.
//
#include "lwip/opt.h"

#ifdef __MACH__
#include <mach/clock.h>
#include <mach/mach.h>
#endif

u32_t sys_now(void) {
    struct timespec tp;
    /* CLOCK_BOOTTIME includes time spent in suspend */
#ifdef __MACH__ // OS X does not have clock_gettime, use clock_get_time
    clock_serv_t cclock;
    mach_timespec_t mts;
    host_get_clock_service(mach_host_self(), CALENDAR_CLOCK, &cclock);
    clock_get_time(cclock, &mts);
    mach_port_deallocate(mach_task_self(), cclock);
    tp.tv_sec = mts.tv_sec;
    tp.tv_nsec = mts.tv_nsec;
#else
    clock_gettime(CLOCK_REALTIME, &ts);
#endif
    return (int)(tp.tv_sec * 1000 + tp.tv_nsec / 1000000);
}

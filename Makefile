CCDEP=$(CC)

#CFLAGS += -DLWIP_DEBUG
ARFLAGS=rs

TOPDIR=.
TARGETDIR=$(TOPDIR)/tmplib
LWIPARCH=$(TOPDIR)

#Set this to where you have the lwip core module checked out from CVS
#default assumes it's a dir named lwip at the same level as the contrib module
LWIPDIR=$(TOPDIR)/src
COREDIR=$(LWIPDIR)/core
MCHINCDIR=$(TOPDIR)/include

CFLAGS += $(CPPFLAGS) -I$(LWIPDIR)/include

COREFILES=$(COREDIR)/def.c	\
    $(COREDIR)/dns.c	\
    $(COREDIR)/inet_chksum.c	\
    $(COREDIR)/init.c	\
    $(COREDIR)/ip.c	\
    $(COREDIR)/mem.c	\
    $(COREDIR)/memp.c	\
    $(COREDIR)/netif.c	\
    $(COREDIR)/pbuf.c	\
    $(COREDIR)/stats.c	\
    $(COREDIR)/tcp.c	\
    $(COREDIR)/tcp_in.c	\
    $(COREDIR)/tcp_out.c	\
    $(COREDIR)/timeouts.c	\
    $(COREDIR)/udp.c	\
    $(COREDIR)/ipv4/ip4.c	\
    $(COREDIR)/ipv4/ip4_addr.c	\
    $(COREDIR)/ipv4/ip4_frag.c	\
    $(COREDIR)/ipv6/icmp6.c	\
    $(COREDIR)/ipv6/ip6.c	\
    $(COREDIR)/ipv6/ip6_addr.c	\
    $(COREDIR)/ipv6/ip6_frag.c	\
    $(COREDIR)/ipv6/nd6.c	\
    $(COREDIR)/sys_custom.c

# LWIPFILES: All the above.
LWIPFILES=$(COREFILES)
LWIPFILESW=$(wildcard $(LWIPFILES))
LWIPOBJS=$(notdir $(LWIPFILESW:.c=.o))

LWIPLIB=liblwip.a

%.o:
	$(CC) $(CFLAGS) -c $(<:.o=.c)

all: $(LWIPLIB) 
.PHONY: all

clean:
	rm -f *.o $(LWIPLIB) *.s .depend* *.core core

depend dep: .depend

include .depend

$(LWIPLIB): $(LWIPOBJS)
	$(CC) -g -nostartfiles -shared -o $@ $^

.depend: $(LWIPFILES)
	$(CCDEP) $(CFLAGS) -MM $^ > .depend || rm -f .depend

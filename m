From: jerj@coplanar.net (Jeremy Jackson)
Date: 14 Mar 2003 11:00:19 -0500
Subject: devbios port to MTD
Message-ID: <1047657619.2134.40.camel@contact.skynet.coplanar.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,

I've been hacking away for a few days at the devbios code, my goal being
to port it to the MTD framework.  Apart from being "the right thing" in
my opinion, as well as in the devbios TODO, it solves a few practical
problems:  

It will let BIOS EEPROMS or DoC be programmed in a network card socket
(eepro100 only just now with Eric Biederman's patch - PLCC32 socket.  I
want to do tulip next so I have a DIP32 as well) to avoid having to swap
chips with the power on.  

It also lets the BIOS chip be made read-only, yet have a DoC that is R/W
(well they have to be).

And many more.

So far I have refactored devbios to eliminate global variables (void
*bios), and static flashdevice structures.  The flash probing routine is
now a separate "library", which can use devbios flash_{readb,writeb}, or
when linked into MTD, will use the map driver's access routines.  The
MTD chip driver which uses the probe routine is about half done.  Any
enhancements to the devbios probe routine "library" will automatically
enhance the MTD chip probe routine as well.

I plan to make map drivers out of the devbios pcisets.c code in a
similar manner.

I'm posting this to elicit comments from the respective parties, words
of wisdom, cautions, etc.

I will post the initial devbios refactoring patch once I've checked it
over again.

Regards,

Jeremy
-- 
Jeremy Jackson <jerj@coplanar.net>

Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZYNR-0001MI-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 13:44:29 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZYNQ-0001MC-00
	for mtd@infradead.org; Thu, 14 Sep 2000 13:44:28 +0100
From: "Alex J Lennon" <ajlennon@arcom.co.uk>
To: <mtd@infradead.org>
Subject: FW: sbc-mediagx
Date: Thu, 14 Sep 2000 13:43:27 +0100
Message-ID: <NEBBLLDBMLGONJHPHHEKEEMMCHAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


David,

> Am I right in assuming that the partition sizes in sbc_mediagx.c are
> hard-coded and don't necessarily correspond to any particular
> region on the
> disk? FXINFO claims that the VBF partition starts at 256kB. Looking at
> dev/mtd/0, there's a ROM image in the bottom 8kB, and at 256kB there's
> something that looks suspiciously like a VBF header. I can
> certainly identify
> things like the volume serial number and various pieces of
> information that
> FXINFO gave me. These are then repeated every megabyte.
>
> ...
>

FlashFx implements VBF to support block access to the media and to provide
wear levelling amongst other things (I believe). The "Variable Block Flash"
component
is *not* a filesystem. It simply translates logical sector requests to
physical flash locations.

e.g. You might want to try to put together a FATxx filesystem on a FATxx
partition.
Linux would see the FAT structures when talking to the FlashFx driver but
the data
physically on the flash device would be FAT data blocks encapsulated within
the VBF
structure.

The VBF structures containing the FAT partition do start at 256Kb. The
SBC-MediaGX
(as supplied) utilises the bottom two erase zones for purposes other than
filesystem support.
NB. The JFFS implementation looks nothing like this.

>
> [...]
> >You won't beable to have both Linux and Dos booting of the flash.  Just
> >make sure you have a floppy drive to boot from...
>
> I have one, yes. However I'm extremely wary of playing with the
> flash; as far
> as I can determine, the FlashFX BIOS extension and, possibly, the
> Award BIOS
> itself are in the flash. If I erased it all from within Linux, I
> might nuke
> those as well and render the board unbootable. If anyone can
> comfirm that this
> is not the case, I would be most grateful.

Don't worry - the SBC-MediaGX BIOS is contained within a physically
independent
flash device (for exactly the reasons you outline above). You cannot corrupt
the BIOS by experimenting with the resident flash array.

> Am I right in assuming that VBF is patented and closed? Is any
> information on
> it at all available, even just enough to identify the start of the VBF
> partition?

VBF is closed and proprietary as you suggest.

For the above reasons there is unlikely to be compatibility between a
FlashFx formatted
flash device (whatever filesystem you use) and MTD in the near future.

> >Arcom is currently in the process of producing a Linux dev. kit which
> >will do all this + booting for you.
> > Excellent.
>

Regards,


	Alex Lennon, Arcom Control Systems ltd.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

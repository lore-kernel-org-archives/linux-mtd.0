Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148NB2-0001I6-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 13:51:36 +0000
From: Shane Nay <shane@agendacomputing.com>
Reply-To: shane@agendacomputing.com
To: mstumpf@pobox.com, Michael Stumpf <michaelstumpf@yahoo.com>,
   David Woodhouse <dwmw2@infradead.org>, shane@agendacomputing.com
Subject: Re: MTD, generic physmap memory, MTD_BLOCK
Date: Tue, 19 Dec 2000 02:51:42 +0000
Content-Type: text/plain;
  charset="us-ascii"
Cc: Nicolas Pitre <nico@cam.org>, mstumpf@pobox.com, mtd@infradead.org
References: <20001219133239.24180.qmail@web2103.mail.yahoo.com>
In-Reply-To: <20001219133239.24180.qmail@web2103.mail.yahoo.com>
MIME-Version: 1.0
Message-Id: <0012190251422T.11759@www.easysolutions.net>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> I did some work in the direction suggested by (thanks!) Nicolas--modified
> mtdram.c to act as a conduit device for plain memory.  I did get a
> successful boot from a cramfs rootdisk.
>
> When I said XIP, I didn't realize that this crowd had a very "serious"
> definition of it.  I simply meant I was trying to get around the initrd
> buffering issue:  As far as I can tell, up until now the only mechanism
> that a CPU (with only RAM and ROM visibility) has at its disposal to boot
> from is initrd, that would copy all the ROM image into RAM buffer cache..
> and only understand three file systems (cramfs is not one of them).  I
> don't mind cramfs using a buffer page (4k, LinuxPPC) or two to do its
> work--I was trying to slay the complete-image-copy daemon.  (My embedded
> system is 6 meg RAM, 8 meg ROM.. and I want shared libraries, etc)

It's 32k BTW.  Boot from initrd?..., initial romdisk?..., nope.  Try this 
instead..., /dev/rom.  Patches are on ftp.agendacomputing.com site.  Make a 
cramfs partition with the headers necessary to tag it as a cramfs partition 
(in the scripts/ directory on linux-vr.org ..., mkromfs I think applied to a 
cramfs filesystem)  Then enable /dev/rom, and set it's address at the start 
of the rom.  Then root=/dev/rom as the boot options.

> It seems to me that for the time being and the immediate future, XIP as
> we're talking about it would be overkill.  The streamlining and elegance
> gained in the operation of XIP is probably offset by the ugliness of
> implementation and the potential loss of compression that seems so crucial
> in embedded devices, the primary target (right?) of MTD.  I like XIP but I
> don't think I'd ever use it.

With only 6MB of ram..., it might be a good thing for your device, but I 
don't know what you're planning on running on it.

> One very relevant topic that I'd like to discuss is where a generic memory
> conduit device belongs.  I would suspect it belongs as a fallback default
> if CFI devices can't be probed (I forget the file), but it also might make
> sense to give it a separate file for "neatness" sake.
Thanks,
Shane.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

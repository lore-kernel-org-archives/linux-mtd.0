Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13fKhP-0006WX-00
	for mtd-list@infradead.org; Sat, 30 Sep 2000 12:20:59 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13fKhN-0006WR-00
	for mtd@infradead.org; Sat, 30 Sep 2000 12:20:58 +0100
From: "Alex J Lennon" <ajlennon@arcom.co.uk>
To: <mtd@infradead.org>
Subject: RE: SBC-MediaGX
Date: Sat, 30 Sep 2000 12:19:55 +0100
Message-ID: <NEBBLLDBMLGONJHPHHEKCEGFCIAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-reply-to: <200009291744.KAA05725@firegate.datalight.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> >>  >Another question: why is the BIOS extension area soo big as
> >>  >the extension itself is only about 14kB? The autoexec.bat file
> >>  >on the Arcom bootfloppy mentions that the extension was enlarged
> >>  >some time ago to 256KB in order to accomodate the Windows CE
> >>  >registry???
> >>  Don't know. I stuck with 256kB on my board for the same 
> reason you did. I 
> >>  don't think it's critical; what's the maximum size for a ROM 
> extension?
> >>   16kB?  32kB?
> 
> What is the erase zone size on that board?  You would need to 
> reserve space in erase zone sized chunks; On a flash part with 
> 128KB erase zones, the minimum you would need to reserve would be 
> 128KB, no matter how large your BIOS extensions are.  You do not 
> want the area that your BIOS extension is in being moved around 
> by FlashFX, or any wear leveling system as it would need to stay 
> put in the beginning of the flash -- The reason for 256k escapes 
> me at this moment, as I remember that the BIOS Extension for 
> FlashFx is probably 16kb, but I am sure they were using the other 
> area for CE related issues.  It may very well be that the first 
> 128k (or 64k) was reserved as a full sector to handle the 16kb 
> BIOS extension, and the rest was done for future growth.

True - The area at the start of the flash array is 256Kb to support
a non-volatile CE registry. No harm will come of you reducing
this to the erase zone size of 128kb (unless of course you'll
be wanting to run CE ;)


Alex 




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

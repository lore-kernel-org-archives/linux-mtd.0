Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rhMl-0005to-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 15:31:03 +0100
Received: from mailserver.arcom.co.uk ([194.200.159.162])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rhMk-0005ti-00
	for mtd@infradead.org; Mon, 23 Apr 2001 15:31:02 +0100
From: "Alex Lennon" <ajlennon@arcom.co.uk>
To: <rob@sysgo.de>
Cc: <mtd@infradead.org>
Subject: RE: Elan SC520 - problem with MTD
Date: Mon, 23 Apr 2001 15:26:25 +0100
Message-ID: <NEBBKJHOALKOLCFPGELEIEJLCJAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <01042316161301.01109@rob>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Rob,

>>Though I'm not sure if I understand that BIOS extension part right. As
far as I
>>can tell, the BIOS is not compressed, but it occupies the only ROM socket
on the
>>board. A BIOS extension would have to be put in a seperate ROM, along with
an
>>0xaa55 header and a checksum so the BIOS calls it, right ?

Yes indeed - a cut and paste job with an EPROM burner should do the job,
given
there is a couple of Kb free up there :-) Alternatively, and I guess this is
_particularly_
implementation specific, if the flash array is visible at boot time around
0xC000:0 - DFFF:0
you can put the BIOS extension in the flash array where the BIOS should pick
it up

>>In principle this could work. One would basically have to put part of the
>>MTD code into the BIOS extension to do the flash accesses. Keep in mind
though
>>that the BIOS must be entered and left in real-mode (i.e. no access beyond
>>1MB), so the BIOS extension would have to make the transition to protected
mode
>>and back. I've done this a couple of times but this stuff is sooo ugly
>>that I always want to forget all about  it immediately after the job is
done ;-)

I'm looking at this myself at the moment - the simplest solution is to
perform the hook,
load a zImage into low mem and let the Linux startup code handle the nasty
protected
mode bits 'n' pieces. Works fine for me under 2.2. Unfortunately I really
can't seem to
manage to get 2.4 down to < 500Kb so I need bzImage which means that - yes -
there is some protected mode support required. Alternatively it might be
possible to
throw the kernel up to 0x100000 using 32-bit real mode. I need to check on
this....

Regards,

	Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sTC7-0003DK-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 18:35:15 +0100
From: "Alex Lennon" <ajlennon@arcom.co.uk>
To: "Michel STEMPIN" <mstempin@com1.fr>
Cc: "mtd" <mtd@infradead.org>,
	<wjf@arcom.co.uk>,
	"David Woodhouse" <dwmw2@infradead.org>
Subject: RE: Booting from StrataFlash on SBC-104 
Date: Wed, 25 Apr 2001 18:33:34 +0100
Message-ID: <NEBBKJHOALKOLCFPGELEKEPGCJAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <27955.988215062@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Michel,

>> 	- I saw a "boot" directory under the CVS: what is its status?
>> 	- under "boot" the Makefile is building 2 targets "flashloader.rom"
>> and "sbc_mediagx.rom": what are they for? Which one should I get,
>> since the sbc_mediagx and the sbc_104 are from the same manufacturer?
>
>I'll let the people from Arcom answer those.

I hope my colleague Will Frazer passed on my reply to you ?

you can modify the code in sbc_mediagx_boot.c to boot your zImage
out of a linear boot partition as mentioned.

To do this you would change the flash window base and size, flash paging I/O
port etc. - Technical details are in the SBC-104 board manual.

Also you would need to change the partition sizes (possibly having
only the boot and and application partition) for the 4Mb onboard flash part.

You cannot flash update the BIOS on the SBC-104 so you would need access to
an EPROM programmer: you would have to update your BIOS to add in the
custom 'sbc_mediagx.rom' BIOS extension.

I think that should get you up and running... Please contact Will or myself
offline
if you have any further board specific queries.

Alternatively you might want to look at the ROM bootloader:
ftp://ftp.sysgo.de/pub/elinos/1.0/updates/rolo_1.1_src.tar.gz

(see the list archives for further details - this was mentioned a couple of
days ago
 and looks _very_ interesting. I can't comment further as I haven't had a
change to
 investigate yet)

Finally (and by far the easiest of options I think) you could plug a D-o-C
onto the board ...

Regards,

	Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

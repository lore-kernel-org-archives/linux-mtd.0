Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14kppd-0005z5-00
	for mtd-list@infradead.org; Wed, 04 Apr 2001 17:08:29 +0100
Received: from mail.addcoinc.com
	([12.47.38.2] helo=exchange.addcoinc.com ident=fwuser)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14kppb-0005yz-00
	for mtd@infradead.org; Wed, 04 Apr 2001 17:08:28 +0100
Message-ID: <5B08DC7C9AA6D411930E00105A19794B3E23B3@EXCHANGE>
From: "Carson, Jon A." <JACarson@addcoinc.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: GRUB'y Stuff
Date: Wed, 4 Apr 2001 11:04:42 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi All,

I am trying to use GRUB to boot an embedded system with a  Linux kernel in
my DiskOnChip 2000 ( on m-systems ISA card plugged into a PII 300 system)
but I am having some trouble.

I downloadded the latest GRUB, and I also downloadded the latest MTD/GRUB
patches.  I built all of the stuff and did the "doc_loadbios grub_firmware".
that part of it seems to have gone well.  

My DiskOnChip now boots GRUB, but thats all.  It boots to the GRUB command
prompt and sits there.  This tells me that the Bios extension has been
properly found and GRUB has been loaded correctly.......I just kinda loose
it at this point.  I would like to be able to boot directly into my kernel
but I am ignorant of how to do this.

Some backround info:  I am using a 2.4 kernel I built with the MTD/NFTL
stuff built in. The kernel recognises the DOC 2000 at 0xd0000 during the
boot process.  I have sucessfully formatted, fdisked, and mkfs.ext2'ed it
and subsequently put directories on it.  I am using /doc as my mount point.
I then put the kernel into /doc/boot.

I suspect that I put my kernel in the wrong place, but at any rate I do not
know the incantation to get GRUB to load it.

If anyone has had any experience with this, please set me straight.

Thanks much in advance,
Jon Carson
ADDCO Inc..




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

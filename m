Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pyec-0001SR-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 21:34:22 +0100
Received: from [199.221.73.29] (helo=marconi-gfw.marconicommerce.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pyeV-0001SJ-00
	for mtd@infradead.org; Wed, 18 Apr 2001 21:34:20 +0100
Message-ID: <A3E34B558F5CD211B4980008C7A4A99003163E70@sparrow.eng.gilbarco.com>
From: "Williams, Kevin M." <kevin.m.williams@marconi.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: RE: JFFS2 as root FS
Date: Wed, 18 Apr 2001 16:33:18 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Vipin wrote:
>Well, the kernel may not be able to understand the 
>"mtdblock1" device by name unless you patched the 
>init/main.c file to list a conversion table from 
>mtdblockxx to a *device number*.

Can you please tell me where I can find more information on doing this?  I
have downloaded and grepped the mailing list archives, and looked in the
patches, but only the 2.2.x patches seem to have any changes to main.c
included and those changes do not do what you are describing here.  Reading
mailinglist archives shows I may also need to modify filesystems.c.

Is there a patch file for anything after the official 2.4.0 kernel
available?

I am using a mainline 2.4.3-pre3 kernel and simply copied from the latest
ftp snapshot into my kernel's /fs, /include, and /kernel directories.  It
worked (at least the CFI_probe part did), and if I mknod I can create
entries in my /dev directory and erase them ok (maybe mknod is the wrong
thing to do, I don't know, but erase really does work now!), but mount is
still not working (it returns "bad area!!" and says something like I may
have "wrong device # or fstype not supported").  

I tried enabling CONFIG_MTD_CHAR and CONFIG_MTD_BLOCK but that did not make
anything come up in my /dev directory.

I think I have not completely updated my kernel...

Thank you.

Kevin
 



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

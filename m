Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14IzFA-0001oy-00
	for mtd-list@infradead.org; Wed, 17 Jan 2001 20:31:44 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14IzF8-0001os-00
	for mtd@infradead.org; Wed, 17 Jan 2001 20:31:43 +0000
Date: Wed, 17 Jan 2001 20:31:31 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Kyle Harris <kharris@nexus-tech.net>
cc: mtd <mtd@infradead.org>
Subject: Re: Newbie: more questions
In-Reply-To: <3A65F6B3.B7842663@nexus-tech.net>
Message-ID: <Pine.LNX.4.30.0101172017260.1101-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 17 Jan 2001, Kyle Harris wrote:

> 1) What is the difference between JFFS and JFFS2?

Main fundamental difference: JFFS exists and JFFS2 is a little more 
than twinkle in our collective eyes and a few kilobytes of code on my 
workstation which doesn't compile.

JFFS2 will support compression and hardlinks, forward compatibility, will
(hopefully) have formal proof the the GC can't get stuck, and will have
NAND flash support designed in from the start. Oh, and it'll make the tea.

Discussion of JFFS is best taken to jffs-dev@axis.com

> 2) Is NAND flash supported by JFFS? Is NAND flash supported by the
> character device?

Yes, Steve Hill modified the existing JFFS code to meet the requirements 
of NAND flash. I haven't used or checked it myself, but having discussed 
stuff with him, I expect his code to be good.

He also provided a driver for certain types of NAND flash, and an an ECC
mechanism for use with JFFS on NAND flash.

> 3) Can the filesystem be limited to using only part of a device? For
> example, can I write a compressed image to a well-known area in flash 
> (that the boot is aware of) and prevent the fs from using this? Does
> this apply to both NOR and NAND flash?

Yes. You register a handful of MTD devices, one for each 'partition' you 
desire, with methods which simply subtract an offset from the requested 
addresses and pass the call through to the original physical MTD device. 
See mtdpart.c and anything which calls add_mtd_partitions() for more 
information.
 
> > 4) How are different blocks/sectors within a device accessed by the
> character device? Do I use different device minors or do I seek to an
> address?

See above. They appear as different devices to the MTD layer, and hence 
appear on different device minors, yes.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14WFCI-00046a-00
	for mtd-list@infradead.org; Fri, 23 Feb 2001 10:11:34 +0000
Received: from jump.org.uk ([194.153.168.194])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14WFCH-00046U-00
	for mtd@infradead.org; Fri, 23 Feb 2001 10:11:33 +0000
Received: from marvin.jump.org.uk ([194.153.168.194])
	by jump.org.uk with esmtp (Exim 3.15 #1)
	id 14WFCG-0005Tc-00
	for mtd@infradead.org; Fri, 23 Feb 2001 10:11:32 +0000
Date: Fri, 23 Feb 2001 10:11:32 +0000 (GMT)
From: Tim Hurman <kano-mtd@kano.org.uk>
Reply-To: Tim Hurman <kano-mtd@kano.org.uk>
To: <mtd@infradead.org>
Subject: linuxbios
Message-ID: <Pine.BSO.4.30.0102231004360.20457-100000@marvin.jump.org.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I am fairly new to the whole mtd thing and wonder if anyone help me. I am
currently developing linuxbios on a motherboard (lanner em-370b). Recently
however I have found that the ROM is not big enough for the kernel. The
board comes with a DiskOnChip socket and wondered if it was possible to
use this to store the kernel + ramdisk etc. However, as I would have to
re-write the filesystem support I am curious as to whether it is possible
to use ROMfs on the device as it is very simple.

Also, are there any docs the basic layout of DOC devices and how they are
accessed?

Thanks,

Tim.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

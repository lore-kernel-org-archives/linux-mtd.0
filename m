Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141Xfr-0007Y5-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 17:39:11 +0000
Received: from firewall.unidec.co.uk ([195.166.19.2])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141Xfq-0007Xz-00
	for mtd@infradead.org; Thu, 30 Nov 2000 17:39:10 +0000
From: dr john halewood <john@frumious.unidec.co.uk>
Reply-To: john@frumious.unidec.co.uk
To: Simon Wood <Simon.Wood@pace.co.uk>
Subject: RE: M-System DOC Millennium with MTD.
Date: Fri, 9 Mar 71685 18:45:56 +0000
Content-Type: text/plain
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
References: <44632C76B97BD211AF6B00805FADCAB202D738E9@exchange.saltaire.pace.co.uk>
In-Reply-To: <44632C76B97BD211AF6B00805FADCAB202D738E9@exchange.saltaire.pace.co.uk>
MIME-Version: 1.0
Message-Id: <0011301739080I.00533@frumious.unidec.co.uk>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 30 Nov 2000, Simon Wood wrote:
>Hello again David,
>I've updated my patch to your latest CVS (mtd-patch-2.2.17-20001130) and built that, but alas still no joy.
>
>Just to re-iterate what I have and am doing.
>I have a DoC Millennium (don't know how different this is to the 2000) eval board with a single MD-2810-D08 fitted. Jumpers are set to JP1 3,4 (0xD000) and JP2 3,4 (No connect, No wait state disabled).
>
>And /proc/mtd is empty
>
>However if I use the DoC1000 driver I get more of a response...
>	Nov 30 15:35:34 leper kernel: mtd: Giving out device 0 to M-Systems DiskOnChip 1000
>	Nov 30 15:35:44 leper kernel: M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
>
>And /proc/mtd reports 'mtd0: 00100000 "M-Systems DiskOnChip 1000"' - which it most definately is not !!
>

Yup. Been there, done that. What's happened is that when you used the M-Systems
utilities you put the doc2.fff firmware onto the flash. This is a dud firmware
which M-Systems use to get around a problem with lilo/their MTD driver (see the
MSys pdf document about using Doc with Linux for more explanation). Reflash the
DoC with another image (doc42.exb or something) and it'll reappear.
  The problem, I think (haven't gone far enough through the code) is that this
firmware doesn't have the hooks that the MTD drivers use to identify the chip,
but there is something in there that looks enough like the doc1000 signature
for it to be mis-identified.
  FWIW this is purely theoretical, but what you've done exactly follows what I
did about a month ago, and it's working here again now.

cheers
john


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

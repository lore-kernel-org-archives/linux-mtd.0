Received: from stone.tmok.com ([204.17.163.2] ident=pla)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15W4dj-00008s-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 00:27:27 +0100
Received: (from pla@localhost)
	by stone.tmok.com (8.9.3/8.9.3) id TAA14506
	for linux-mtd@lists.infradead.org; Sun, 12 Aug 2001 19:33:18 -0400 (EDT)
Date: Sun, 12 Aug 2001 19:33:18 -0400 (EDT)
From: pla <pla@tmok.com>
Message-Id: <200108122333.TAA14506@stone.tmok.com>
To: linux-mtd@lists.infradead.org
Subject: DOC2000 erase size of 16k?
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I have a problem with a DOC2000.  I use the 2.4.5 kernel, and the
20010807 MTD snapshot for the utils.
 
Everything goes just fine at boot.  The NFTL driver reports
"Could not find valid boot record."
"Could not mount NFTL device."
Okay, I think, not a problem, the MTD-JFFS HowTo specifically
says to run nftl_format for that problem.
 
Now for the problem... nftl_format reports "Erase size not
8Kb - I'm confused".  I do a "cat /proc/mtd", and it shows
me "mtd0: 02000000 "DiskOnChip 2000".  Note the lack of an
erase size in there (someone posted about a similar problem
about two months ago, with no replies, but he also reported
an odd boot message from the MTD driver).
 
So, I quickly hacked nftl_format.c to show me what *it* sees as
the erase size, and it tells me 16K.
 
Anyone have any ideas?  In case it matters, I use devfs, but had
no problems with it recognizing the DiskOnChip or any "normal"
devices.
 
Thank you.
 
 
 
                                      - Ben

Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Hmmz-0007HL-00
	for mtd-list@infradead.org; Thu, 27 Jul 2000 13:29:25 +0100
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Hmmy-0007HF-00
	for mtd@infradead.org; Thu, 27 Jul 2000 13:29:24 +0100
Message-ID: <00B4D286538DD311BC6E005004E9EFC729B498@M4EXCH>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: "JFFS (E-mail)" <jffs-dev@axis.com>, "MTD (E-mail)"
	 <mtd@infradead.org>
Subject: RE: intrep.c update to handle gaps in the middle of the log.
Date: Thu, 27 Jul 2000 13:29:13 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This update seems to bring about another problem.

My flash image (size = 0x7e0000) looks like this:
	0x000000 - 0x2c8cff:	valid nodes
	0x2c8d00 - 0x75ffff:	all 0xff
	0x760000 - 0x76049f:	all zero
	0x7604a0 - 0x7dffff:	valid nodes

With this update it results in the whole 0xff area being treated as dirty.
If I try and copy a file on to it, it reports that the file system is full. 

garbage collection doesn't. 

debug output looks like this (and this message is repeated every few
seconds):
	***jffs_garbage_collect(): round #1, fmc->dirty_size = 4815352
	struct jffs_fmcontrol: 0xc0093590
	{
        0x00000000, /* flash_start  */
        8257536, /* flash_size  */
        3442184, /* used_size  */
        4815352, /* dirty_size  */
        131072, /* sector_size  */
        196608, /* min_free_size  */
        65536, /* max_chunk_size  */
        0xc01cf700, /* mtd  */
        0xc03adf30, /* head  */    (head->offset = 0x00000000)
        0xc0f6b9e0, /* tail  */    (tail->offset + tail->size = 0x007e0000)
        0x00000000, /* head_extra  */
        0x00000000, /* tail_extra  */
	}
	jffs_try_to_erase(): erase_size = 0
	   jffs_garbage_collect(): erased: 0, free_size: 0

I think you need to restrict the amount of space treated as dirty to be in a
single erase sector. Also, if the end of the area is at an erase sector
boundary, don't treat as dirty at all.
Do you need to check if nodes have already been found? Won't you also get
the problem at the very start of the flash? (your original failure happened
when you powered off mid update - but the sector being updated could easily
have been the very first one).

Simon

========================================================
Simon Munton				simonm@m4data.co.uk
M4 Data Ltd					Tel: 44-1749-683800
Mendip Court, Bath Rd, Wells		Fax: 44-1749-673928
Somerset, BA5 3DG, England



-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: 26 July 2000 04:36 pm
To: jffs-dev@axis.com
Subject: intrep.c update to handle gaps in the middle of the log.


This appears to fix the problem for me, so I've committed it to CVS. 

Index: intrep.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/intrep.c,v
retrieving revision 1.23
retrieving revision 1.24
diff -u -w -r1.23 -r1.24
--- intrep.c	2000/07/26 15:02:10	1.23
+++ intrep.c	2000/07/26 15:34:10	1.24
@@ -10,7 +10,7 @@
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  *
- * $Id: intrep.c,v 1.23 2000/07/26 15:02:10 dwmw2 Exp $
+ * $Id: intrep.c,v 1.24 2000/07/26 15:34:10 dwmw2 Exp $
  *
  * Ported to Linux 2.3.x and MTD:
  * Copyright (C) 2000  Alexander Larsson (alex@cendio.se), Cendio Systems
AB
@@ -626,6 +626,20 @@
 			     pos += 4);
 			D1(printk("jffs_scan_flash(): 0xff ended at "
 				  "pos 0x%lx.\n", (long)pos));
+
+			/* Added by dwmw2: if we have already found nodes, 
+			   then treat this space as dirty rather than clean,
+			   unless it extends to the very end of the flash.
+			   This is to handle the case where one thread 
+			   allocated space for a node, but didn't get to
+			   actually _write_ it before power was lost,
leaving
+			   a gap in the log. Shifting all node writes into
+			   a single kernel thread will fix the original
problem.+			*/
+			if (fmc->head && pos < end) {
+				jffs_fmalloced(fmc, (__u32) start,
+					       (__u32) (pos - start), 0);
+			}
 			continue;
 
 		case JFFS_DIRTY_BITMASK:


--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

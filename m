Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13RYkJ-0007gd-00
	for mtd-list@infradead.org; Wed, 23 Aug 2000 12:31:03 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13RYkH-0007gW-00
	for mtd@infradead.org; Wed, 23 Aug 2000 12:31:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39A39051.CAF6DA66@arcom.co.uk> 
References: <39A39051.CAF6DA66@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: JFFS: free_size == 0 after mounting 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 23 Aug 2000 12:30:56 +0100
Message-ID: <29404.967030256@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  I'm using the latest CVS JFFS and get endless
>    jffs_garbage_collect_thread(): free_size == 0. This is BAD.
> messages after mounting.

> I have images of the flash if anyone is interested. 

Thanks. cvs update and break it again :)

Index: intrep.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/intrep.c,v
retrieving revision 1.67
retrieving revision 1.68
diff -u -r1.67 -r1.68
--- intrep.c	2000/08/22 09:32:28	1.67
+++ intrep.c	2000/08/23 11:27:35	1.68
@@ -10,7 +10,7 @@
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  *
- * $Id: intrep.c,v 1.67 2000/08/22 09:32:28 dwmw2 Exp $
+ * $Id: intrep.c,v 1.68 2000/08/23 11:27:35 dwmw2 Exp $
  *
  * Ported to Linux 2.3.x and MTD:
  * Copyright (C) 2000  Alexander Larsson (alex@cendio.se), Cendio Systems AB
@@ -644,6 +644,16 @@
 			   a single kernel thread will fix the original problem.
 			*/
 			if ((__u32) pos % fmc->sector_size) {
+				/* If there was free space in previous 
+				   sectors, don't mark that dirty too - 
+				   only from the beginning of this sector
+				   (or from start) 
+				*/
+				if (start < (pos & ~(fmc->sector_size-1))) {
+					D1(printk("Reducing start to 0x%x from 0x%x\n", pos & ~(fmc->sector_size-1), start));
+					start = pos & ~(fmc->sector_size-1);
+				}
+				D1(printk("Dirty space: 0x%x for 0x%x bytes\n", start, (pos - start)));
 				jffs_fmalloced(fmc, (__u32) start,
 					       (__u32) (pos - start), 0);
 			}


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14T8Wl-0000Ys-00
	for mtd-list@infradead.org; Wed, 14 Feb 2001 20:27:51 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14T8Wk-0000Ym-00
	for mtd@infradead.org; Wed, 14 Feb 2001 20:27:50 +0000
Message-ID: <3A8AF07B.D89B76F@danielind.com>
Date: Wed, 14 Feb 2001 14:54:19 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: mtd <mtd@infradead.org>
Subject: mtdpart.c not compiled with mtdcore.c ?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Any reason that mtdpart.c is not compiled by default with mtdcore.c when
CONFIG_MTD is "y" ?

The problem is that if one hacks physmap.c to add partitions for one's
own hardware then add_mtd_partitions() are unresolved till one
manually modifies the Makefile.

Can we enable mtdpart.o by default in cases?

Vipin

Index: Makefile
===================================================================
RCS file: /home/cvs/mtd/kernel/Makefile,v
retrieving revision 1.43
diff -u -r1.43 Makefile
--- Makefile    2001/01/05 23:26:26     1.43
+++ Makefile    2001/02/14 20:24:11
@@ -74,7 +74,7 @@
 endif

 # MTD devices
-obj-$(CONFIG_MTD)              += mtdcore.o
+obj-$(CONFIG_MTD)              += mtdcore.o mtdpart.o
 obj-$(CONFIG_MTD_DOC1000)      += doc1000.o
 obj-$(CONFIG_MTD_DOC2000)      += doc2000.o
 obj-$(CONFIG_MTD_DOC2001)      += doc2001.o



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

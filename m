Received: from inbox2.nyi.net ([64.147.100.114])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6NmY-0000IR-FS
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 05:37:56 -0400
Received: from webmail.calsoftinc.com (mail.calsofthq.com [172.16.0.7])
	by mail.calsofthq.com (8.13.6/8.13.6) with ESMTP id l659bZ67016020
	for <linux-mtd@lists.infradead.org>; Thu, 5 Jul 2007 15:07:35 +0530
Message-ID: <41876.172.16.0.34.1183628255.squirrel@webmail.calsoftinc.com>
Date: Thu, 5 Jul 2007 15:07:35 +0530 (IST)
Subject: Signed Unsigned multiplication in io.c
From: brijesh.singh@calsoftinc.com
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is signed multiplication assigned to unsigned ei.addr in io.c.
This causes wrong addresses for big multiplication.This patch solves the
problem.

Signed-off-by: Brijesh Singh <brijesh.s.singh@gmail.com>

Index: mtd-2.6/drivers/mtd/ubi/io.c
===================================================================
--- mtd-2.6.orig/drivers/mtd/ubi/io.c	2007-07-05 13:53:21.000000000 +0530
+++ mtd-2.6/drivers/mtd/ubi/io.c	2007-07-05 14:05:40.000000000 +0530
@@ -298,7 +298,7 @@
 	memset(&ei, 0, sizeof(struct erase_info));

 	ei.mtd      = ubi->mtd;
-	ei.addr     = pnum * ubi->peb_size;
+	ei.addr     = (loff_t)pnum * ubi->peb_size;
 	ei.len      = ubi->peb_size;
 	ei.callback = erase_callback;
 	ei.priv     = (unsigned long)&wq;

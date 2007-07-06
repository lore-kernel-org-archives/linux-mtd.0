Received: from inbox2.nyi.net ([64.147.100.114])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6jm7-0003Dz-Hx
	for linux-mtd@lists.infradead.org; Fri, 06 Jul 2007 05:06:55 -0400
Received: from webmail.calsoftinc.com (mail.calsofthq.com [172.16.0.7])
	by mail.calsofthq.com (8.13.6/8.13.6) with ESMTP id l669080E016365
	for <linux-mtd@lists.infradead.org>; Fri, 6 Jul 2007 14:30:08 +0530
Message-ID: <31331.172.16.0.34.1183712408.squirrel@webmail.calsoftinc.com>
Date: Fri, 6 Jul 2007 14:30:08 +0530 (IST)
Subject: UBI Patch: Max Sequence no not updated in scan.c
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

Hi,I came across problem of having two leb with same sequence no.This
happens when we continuously write one block again and again and reboot
machine before background thread erases those blocks.
The problem here was,when we find two blocks with same sequence no,we take
the higher one,but we were not updating max seq no,so next block may have
the same seqnum.
This patch solves this problem.


Signed-off-by: Brijesh Singh <brijesh.s.singh@gmail.com>

Index: mtd-2.6/drivers/mtd/ubi/scan.c
===================================================================
--- mtd-2.6.orig/drivers/mtd/ubi/scan.c	2007-07-04 16:58:43.000000000 +0530
+++ mtd-2.6/drivers/mtd/ubi/scan.c	2007-07-06 13:57:53.000000000 +0530
@@ -510,6 +510,9 @@
 				sv->last_data_size =
 					ubi32_to_cpu(vid_hdr->data_size);

+			if (si->max_sqnum < sqnum)
+				si->max_sqnum = sqnum;
+
 			return 0;
 		} else {
 			/*

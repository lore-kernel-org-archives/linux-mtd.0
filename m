Received: from mail.broadpark.no ([217.13.4.2])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLdCz-0006z2-8C
	for linux-mtd@lists.infradead.org; Thu, 06 May 2004 08:22:18 +0100
Received: from famine (217-13-20-38.dd.nextgentel.com [217.13.20.38])
	by mail.broadpark.no (Postfix) with ESMTP id D843A2478
	for <linux-mtd@lists.infradead.org>;
	Thu,  6 May 2004 09:22:17 +0200 (MEST)
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-XMAXgspNaoBff7w9liG0"
Message-Id: <1083828124.24504.11.camel@famine>
Mime-Version: 1.0
Date: Thu, 06 May 2004 09:22:05 +0200
Subject: fix for small jffs2 disks(resend)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-XMAXgspNaoBff7w9liG0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

With this patch, it is possible to write to small (e.g. single sector)
flash disks.

Single sector flash disks are useful for writing configuration data that
never change, e.g. in embedded devices for serial numbers, hardware
configuration, feature selection and the like.

It has been applied to the eCos repository. To read more:

http://ecos.sourceware.org/ml/ecos-patches/2004-04/msg00043.html

-- 

Øyvind Harboe
http://www.zylin.com



--=-XMAXgspNaoBff7w9liG0
Content-Disposition: attachment; filename=smalljffs2.txt
Content-Type: text/plain; name=smalljffs2.txt; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

? smalljffs2.txt
Index: build.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/build.c,v
retrieving revision 1.55
diff -w -u -r1.55 build.c
--- build.c	28 Oct 2003 17:02:44 -0000	1.55
+++ build.c	29 Apr 2004 07:35:07 -0000
@@ -259,6 +259,14 @@
 
 	c->resv_blocks_write = c->resv_blocks_deletion + (size / c->sector_size);
 
+	// If the flash disk is smaller than resv_blocks_write, then we 
+	// allow writing to the disk anyway. The flash disk is then most likely
+	// being used as write once - read many medimum, e.g. configuration of 
+	// static paramters.
+	if (c->resv_blocks_write * c->sector_size > c->flash_size) {
+	  c->resv_blocks_write = 0; 
+	}
+
 	/* When do we let the GC thread run in the background */
 
 	c->resv_blocks_gctrigger = c->resv_blocks_write + 1;

--=-XMAXgspNaoBff7w9liG0--

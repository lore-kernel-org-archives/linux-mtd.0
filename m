Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 153Be6-0008Fk-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 08:04:26 +0100
Received: from cherry.napri.sk ([194.1.128.4] ident=postfix)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 153Bi7-0004va-00
	for linux-mtd@lists.infradead.org; Fri, 25 May 2001 08:08:36 +0100
Received: from ham.pkx.sk (unknown [194.1.139.234])
	by cherry.napri.sk (Postfix) with ESMTP id 2C32139048
	for <mtd@infradead.org>; Fri, 25 May 2001 07:43:54 +0200 (CEST)
Received: (from kundrat@localhost)
	by ham.pkx.sk (8.9.3/8.9.3/Debian/GNU) id WAA05644
	for mtd@infradead.org; Thu, 24 May 2001 22:07:38 +0200
Date: Thu, 24 May 2001 22:07:37 +0200
From: Peter Kundrat <kundrat@kundrat.sk>
To: linux-mtd@lists.infradead.org
Subject: nftl partitions not missing in /proc/partitions anymore
Message-ID: <20010524220737.A5635@napri.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hola,

Having kgdb compiled in i had a look why we didnt have nftl
partitions listed in /proc/partitions. The reason is that
nr_real field of struct gendisk wasnt set. Patch is against
kernel version, but applies on CVS as well (providing you give
patch correct name). Anyways its a one-liner, so its trivial.

--- Linux-2.4.3.orig/drivers/mtd/nftl.c	Fri Apr  6 08:07:24 2001
+++ linux-magic3/drivers/mtd/nftl.c	Thu May 24 21:23:23 2001
@@ -204,6 +204,8 @@
 	nftl_sizes[firstfree * 16] = nftl->nr_sects;
 	//nftl_blocksizes[firstfree*16] = 512;
 	part_table[firstfree * 16].nr_sects = nftl->nr_sects;
+	
+	nftl_gendisk.nr_real++;
 
 	/* partition check ... */
 #if LINUX_VERSION_CODE < 0x20328


Regards,

	pkx
-- 
Peter Kundrat
peter@kundrat.sk

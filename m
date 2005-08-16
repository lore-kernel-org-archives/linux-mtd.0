Received: from fed1rmmtai10.cox.net ([68.230.241.49])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E4w9M-0002Q0-Ob
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 03:46:27 -0400
Received: from liberty.homelinux.org ([70.190.160.125]) by fed1rmmtao01.cox.net
	(InterMail vM.6.01.04.00 201-2131-118-20041027) with ESMTP id
	<20050816071811.QZJY19627.fed1rmmtao01.cox.net@liberty.homelinux.org>
	for <linux-mtd@lists.infradead.org>; Tue, 16 Aug 2005 03:18:11 -0400
Received: (from mmporter@localhost)
	by liberty.homelinux.org (8.9.3/8.9.3/Debian 8.9.3-21) id AAA29552
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 00:18:12 -0700
Date: Tue, 16 Aug 2005 00:18:11 -0700
From: Matt Porter <mporter@kernel.crashing.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20050816001811.G28706@cox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [PATCH][MTD] MAPS: ocotea.c compile fix and add Id keyword
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[MTD] MAPS: ocotea.c compile fix and add Id keyword

Signed-off-by: Matt Porter <mporter@kernel.crashing.org>

Index: drivers/mtd/maps/ocotea.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/ocotea.c,v
retrieving revision 1.3
diff -u -r1.3 ocotea.c
--- drivers/mtd/maps/ocotea.c	4 Nov 2004 13:24:15 -0000	1.3
+++ drivers/mtd/maps/ocotea.c	16 Aug 2005 07:11:11 -0000
@@ -1,9 +1,10 @@
 /*
- * Mapping for Ocotea user flash
+ * $Id: $
  *
- * Matt Porter <mporter@kernel.crashing.org>
+ * Mapping for Ocotea user flash
  *
  * Copyright 2002-2004 MontaVista Software Inc.
+ * Copyright 2005 Matt Porter <mporter@kernel.crashing.org>
  *
  * This program is free software; you can redistribute  it and/or modify it
  * under  the terms of  the GNU General  Public License as published by the
@@ -29,13 +30,13 @@
 static struct map_info ocotea_small_map = {
 	.name =		"Ocotea small flash",
 	.size =		OCOTEA_SMALL_FLASH_SIZE,
-	.buswidth =	1,
+	.bankwidth =	1,
 };
 
 static struct map_info ocotea_large_map = {
 	.name =		"Ocotea large flash",
 	.size =		OCOTEA_LARGE_FLASH_SIZE,
-	.buswidth =	1,
+	.bankwidth =	1,
 };
 
 static struct mtd_partition ocotea_small_partitions[] = {
@@ -67,11 +68,11 @@
 	u8 *fpga0_adr;
 	unsigned long long small_flash_base, large_flash_base;
 
-	fpga0_adr = ioremap64(OCOTEA_FPGA_ADDR, 16);
+	fpga0_adr = ioremap64(OCOTEA_FPGA_REG_0, 16);
 	if (!fpga0_adr)
 		return -ENOMEM;
 
-	fpga0_reg = readb((unsigned long)fpga0_adr);
+	fpga0_reg = readb(fpga0_adr);
 	iounmap(fpga0_adr);
 
 	if (OCOTEA_BOOT_LARGE_FLASH(fpga0_reg)) {

Received: from fg-out-1718.google.com ([72.14.220.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUmVf-00053I-8C
	for linux-mtd@lists.infradead.org; Tue, 12 Jan 2010 19:34:39 +0000
Received: by fg-out-1718.google.com with SMTP id e21so269925fga.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 11:34:33 -0800 (PST)
Subject: [PATCH 6/9] MTD: common module for smartmedia/xD support
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
In-Reply-To: <1263324518.6236.18.camel@maxim-laptop>
References: <1263324518.6236.18.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Jan 2010 21:34:30 +0200
Message-ID: <1263324870.6236.24.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern <joern@logfs.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 612ced620304d1991cca9c4f4f49b257d0931fdf Mon Sep 17 00:00:00 2001
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Tue, 12 Jan 2010 21:09:29 +0200
Subject: [PATCH 6/9] MTD: common module for smartmedia/xD support

This small module implements few helpers that are usefull
for nand drivers for SmartMedia/xD card readers.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/Kconfig     |    9 +++
 drivers/mtd/nand/Makefile    |    1 +
 drivers/mtd/nand/sm_common.c |  126 ++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/sm_common.h |   46 +++++++++++++++
 4 files changed, 182 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/nand/sm_common.c
 create mode 100644 drivers/mtd/nand/sm_common.h

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 677cd53..13c1fb2 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -18,6 +18,10 @@ config MTD_NAND_VERIFY_WRITE
 	  device thinks the write was successful, a bit could have been
 	  flipped accidentally due to device wear or something else.
 
+config MTD_NAND_SMARTMEDIA
+	boolean
+	default n
+
 config MTD_NAND_ECC_SMC
 	bool "NAND ECC Smart Media byte order"
 	default n
@@ -25,6 +29,11 @@ config MTD_NAND_ECC_SMC
 	  Software ECC according to the Smart Media Specification.
 	  The original Linux implementation had byte 0 and 1 swapped.
 
+config MTD_SM_COMMON
+	select MTD_NAND_SMARTMEDIA
+	tristate
+	default n
+
 config MTD_NAND_MUSEUM_IDS
 	bool "Enable chip ids for obsolete ancient NAND devices"
 	depends on MTD_NAND
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 1407bd1..09891f6 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -4,6 +4,7 @@
 
 obj-$(CONFIG_MTD_NAND)			+= nand.o nand_ecc.o
 obj-$(CONFIG_MTD_NAND_IDS)		+= nand_ids.o
+obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
 
 obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
 obj-$(CONFIG_MTD_NAND_SPIA)		+= spia.o
diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
new file mode 100644
index 0000000..55ae3ff
--- /dev/null
+++ b/drivers/mtd/nand/sm_common.c
@@ -0,0 +1,126 @@
+/*
+ * Copyright (C) 2009 - Maxim Levitsky
+ * Common routines & support for xD format
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <linux/kernel.h>
+#include <linux/bitops.h>
+#include <linux/log2.h>
+#include "sm_common.h"
+
+static struct nand_ecclayout nand_oob_sm = {
+	.eccbytes = 6,
+	.eccpos = {8, 9, 10, 13, 14, 15},
+	.oobfree = {
+		{.offset = 0 , .length = 4}, /* reserved */
+		{.offset = 6 , .length = 2}, /* LBA1 */
+		{.offset = 11, .length = 2}  /* LBA2 */
+	}
+};
+
+/* Tests if block (more correctly page) is bad */
+static int sm_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
+{
+	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
+	struct mtd_oob_ops ops;
+	struct sm_oob_raw oob;
+	int bad = 1, ret;
+
+	ops.mode = MTD_OOB_RAW;
+	ops.ooboffs = 0;
+	ops.ooblen = SM_OOB_SIZE;
+	ops.oobbuf = (void *)&oob;
+	ops.datbuf = NULL;
+
+	if (getchip) {
+		nand_get_device(chip, mtd, FL_READING);
+		chip->select_chip(mtd, 0);
+	}
+
+	ret = nand_do_read_oob(mtd, ofs, &ops);
+	if (ret < 0 || ops.oobretlen != SM_OOB_SIZE)
+		goto out;
+
+	if (hweight16(oob.block_status) < 7 ||
+		hweight16(oob.data_status) < 5)
+		goto out;
+
+	bad = 0;
+out:
+	if (getchip)
+		nand_release_device(mtd);
+	return bad;
+}
+
+/* Marks block as bad */
+static int sm_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	struct nand_chip *chip = (struct nand_chip *)mtd->priv;	
+	struct mtd_oob_ops ops;
+	struct sm_oob_raw oob;
+	int ret, error = 0;
+
+	memset(&oob, -1, SM_OOB_SIZE);
+	oob.block_status = 0xF0;
+
+	ops.mode = MTD_OOB_RAW;
+	ops.ooboffs = 0;
+	ops.ooblen = SM_OOB_SIZE;
+	ops.oobbuf = (void *)&oob;
+	ops.datbuf = NULL;
+
+	nand_get_device(chip, mtd, FL_WRITING);
+
+	ret = nand_do_write_oob(mtd, ofs, &ops);
+	if (ret < 0 || ops.oobretlen != SM_OOB_SIZE) {
+		printk(KERN_NOTICE "sm_common: can't mark sector at %i as bad\n",
+					(int)ofs);
+		error = -EIO;
+	} else
+		mtd->ecc_stats.badblocks++;
+
+	nand_release_device(mtd);
+	return error;
+}
+
+int sm_register_device(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
+	int ret;
+
+	chip->options |= NAND_SKIP_BBTSCAN;
+
+	/* Scan for card properties */
+	ret = nand_scan_ident(mtd, 1);
+
+	if (ret)
+		return ret;
+
+	/* Set oob handling functions. */
+	if (mtd->writesize == SM_SECTOR_SIZE) {
+		chip->block_bad = sm_block_bad;
+		chip->block_markbad = sm_block_markbad;
+		chip->ecc.layout = &nand_oob_sm;
+
+	/* SmartMedia on small page nand, has page depedent oob layout,
+		thus let FTL do that hard job */
+	} else if (mtd->writesize != SM_SMALL_PAGE)
+		return -ENODEV;
+
+	ret = nand_scan_tail(mtd);
+	if (ret)
+		return ret;
+
+	ret = add_mtd_device(mtd);
+	if (ret)
+		return ret;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(sm_register_device);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Maxim Levitsky <maximlevitsky@gmail.com>");
+MODULE_DESCRIPTION("Common SmartMedia/xD functions");
diff --git a/drivers/mtd/nand/sm_common.h b/drivers/mtd/nand/sm_common.h
new file mode 100644
index 0000000..8f74a73
--- /dev/null
+++ b/drivers/mtd/nand/sm_common.h
@@ -0,0 +1,46 @@
+/*
+ * Copyright (C) 2009 - Maxim Levitsky
+ * Common routines & support for SmartMedia/xD format
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/mtd/nand.h>
+
+/* Full oob structure as written on the flash */
+struct sm_oob_raw {
+	u32 reserved;
+	u8  data_status;
+	u8  block_status;
+	u8 lba_copy1[2];
+	u8  ecc2[3];
+	u8 lba_copy2[2];
+	u8  ecc1[3];
+} __attribute__((packed));
+
+
+/* Oob structure , exposed to external interfaces */
+struct sm_oob {
+	u32 reserved;
+	u8 lba_copy1[2];
+	u8 lba_copy2[2];
+} __attribute__((packed));
+
+
+
+/* one sector is always 512 bytes, but it can consist of two nand pages */
+#define SM_SECTOR_SIZE		512
+
+/* minumum size of the page */
+#define SM_SMALL_PAGE 		256
+
+/* oob area is also 16 bytes, but might be from two pages */
+#define SM_OOB_SIZE		16
+
+/* This is maximum zone size, and all devices that have more that one zone
+   have this size */
+#define SM_MAX_ZONE_SIZE 	1024
+
+extern int sm_register_device(struct mtd_info *mtd);
-- 
1.6.3.3

Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NhrmU-0005RK-Pi
	for linux-mtd@lists.infradead.org; Wed, 17 Feb 2010 21:50:09 +0000
Received: by mail-fx0-f209.google.com with SMTP id 1so8377503fxm.4
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Feb 2010 13:50:02 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 11/14] MTD: common module for smartmedia/xD support
Date: Wed, 17 Feb 2010 23:49:21 +0200
Message-Id: <1266443364-4538-12-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1266443364-4538-1-git-send-email-maximlevitsky@gmail.com>
References: <1266443364-4538-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, joern <joern@logfs.org>,
	Vitaly Wool <vitalywool@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"stanley.miao" <stanley.miao@windriver.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This small module implements few helpers that are usefull
for nand drivers for SmartMedia/xD card readers.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/Kconfig     |    9 ++++
 drivers/mtd/nand/Makefile    |    1 +
 drivers/mtd/nand/sm_common.c |  107 ++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/sm_common.h |   61 ++++++++++++++++++++++++
 4 files changed, 178 insertions(+), 0 deletions(-)
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
index 0000000..fc4ff71
--- /dev/null
+++ b/drivers/mtd/nand/sm_common.c
@@ -0,0 +1,107 @@
+/*
+ * Copyright (C) 2009 - Maxim Levitsky
+ * Common routines & support for xD format
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <linux/kernel.h>
+#include <linux/mtd/nand.h>
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
+/* NOTE: This layout is is not compatabable with SmartMedia, */
+/* because the 256 byte devices have page depenent oob layout */
+/* However it does preserve the bad block markers */
+/* If you use smftl, it will bypass this and work correctly */
+/* If you not, then you break SmartMedia compliance anyway */
+
+static struct nand_ecclayout nand_oob_sm_small = {
+	.eccbytes = 3,
+	.eccpos = {0, 1, 2},
+	.oobfree = {
+		{.offset = 3 , .length = 2}, /* reserved */
+		{.offset = 6 , .length = 2}, /* LBA1 */
+	}
+};
+
+
+static int sm_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	struct mtd_oob_ops ops;
+	struct sm_oob oob;
+	int ret, error = 0;
+
+	memset(&oob, -1, SM_OOB_SIZE);
+	oob.block_status = 0x0F;
+
+	/* As long as this function is called on erase block boundaries
+		it will work correctly for 256 byte nand */
+	ops.mode = MTD_OOB_PLACE;
+	ops.ooboffs = 0;
+	ops.ooblen = mtd->oobsize;
+	ops.oobbuf = (void *)&oob;
+	ops.datbuf = NULL;
+
+
+	ret = mtd->write_oob(mtd, ofs, &ops);
+	if (ret < 0 || ops.oobretlen != SM_OOB_SIZE) {
+		printk(KERN_NOTICE
+			"sm_common: can't mark sector at %i as bad\n",
+								(int)ofs);
+		error = -EIO;
+	} else
+		mtd->ecc_stats.badblocks++;
+
+	return error;
+}
+
+
+int sm_register_device(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
+	int ret;
+
+	chip->options |= NAND_SKIP_BBTSCAN | NAND_SMARTMEDIA;
+
+	/* Scan for card properties */
+	ret = nand_scan_ident(mtd, 1);
+
+	if (ret)
+		return ret;
+
+	/* Bad block marker postion */
+	chip->badblockpos = 0x05;
+	chip->badblockbits = 7;
+	chip->block_markbad = sm_block_markbad;
+
+	/* ECC layout */
+	if (mtd->writesize == SM_SECTOR_SIZE)
+		chip->ecc.layout = &nand_oob_sm;
+	else if (mtd->writesize == SM_SMALL_PAGE)
+		chip->ecc.layout = &nand_oob_sm_small;
+	else
+		return -ENODEV;
+
+	ret = nand_scan_tail(mtd);
+
+	if (ret)
+		return ret;
+
+	return add_mtd_device(mtd);
+}
+EXPORT_SYMBOL_GPL(sm_register_device);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Maxim Levitsky <maximlevitsky@gmail.com>");
+MODULE_DESCRIPTION("Common SmartMedia/xD functions");
diff --git a/drivers/mtd/nand/sm_common.h b/drivers/mtd/nand/sm_common.h
new file mode 100644
index 0000000..2e6b517
--- /dev/null
+++ b/drivers/mtd/nand/sm_common.h
@@ -0,0 +1,61 @@
+/*
+ * Copyright (C) 2009 - Maxim Levitsky
+ * Common routines & support for SmartMedia/xD format
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <linux/bitops.h>
+#include <linux/mtd/mtd.h>
+
+/* Full oob structure as written on the flash */
+struct sm_oob {
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
+/* one sector is always 512 bytes, but it can consist of two nand pages */
+#define SM_SECTOR_SIZE		512
+
+/* oob area is also 16 bytes, but might be from two pages */
+#define SM_OOB_SIZE		16
+
+/* This is maximum zone size, and all devices that have more that one zone
+   have this size */
+#define SM_MAX_ZONE_SIZE 	1024
+
+/* support for small page nand */
+#define SM_SMALL_PAGE 		256
+#define SM_SMALL_OOB_SIZE	8
+
+
+extern int sm_register_device(struct mtd_info *mtd);
+
+
+inline int sm_sector_valid(struct sm_oob *oob)
+{
+	return hweight16(oob->data_status) >= 5;
+}
+
+inline int sm_block_valid(struct sm_oob *oob)
+{
+	return hweight16(oob->block_status) >= 7;
+}
+
+inline int sm_block_erased(struct sm_oob *oob)
+{
+	static const u32 erased_pattern[4] = {
+		0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF };
+
+	/* First test for erased block */
+	if (!memcmp(oob, erased_pattern, sizeof(*oob)))
+		return 1;
+	return 0;
+}
-- 
1.6.3.3

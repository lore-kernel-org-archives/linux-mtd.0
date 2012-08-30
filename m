Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6xVM-0006Pj-00
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 05:41:25 +0000
Received: by wgbdt14 with SMTP id dt14so772763wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2012 22:41:20 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V5] mtd: bcm47part driver for BCM47XX chipsets
Date: Thu, 30 Aug 2012 07:41:16 +0200
Message-Id: <1346305276-28208-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver provides parser detecting partitions on BCM47XX flash
memories. It has many differences in comparison to BCM63XX, like:
1) Different CFE with no more trivial MAGICs
2) More partitions types (board_data, ML, POT)
3) Supporting more than 1 flash on a device
which resulted in decision of writing new parser.

It uses generic mtd interface and was successfully tested with Netgear
WNDR4500 router which has 2 flash memories: serial one and NAND one.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
V2: 1) Add support for more partitinos (ML and POT)
     2) Optimize: don't scan whole flash (like up to 128 MiB)
     3) Optimize: don't scan TRX partitions after detecting header

 V3: 1) More defines less magic numbers
     2) Less duplication by adding bcm47part_add_part
     3) Mask out MTD_WRITEABLE only when needed

V4: 1) Use u32 *buf (no more fourcc casting)
    2) Fix buf size
    3) Optimize: put continue where possible
    4) Don't check for filled .size - it was an old idea
    5) Rename driver to match bcm64xx naming schema
    6) Coding style fixes
V5: 1) Free memory
    2) Add help in Kconfig
---
 drivers/mtd/Kconfig       |    7 ++
 drivers/mtd/Makefile      |    1 +
 drivers/mtd/bcm47xxpart.c |  202 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 210 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/bcm47xxpart.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index ee2330f..a7b3c34 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -156,6 +156,13 @@ config MTD_BCM63XX_PARTS
 	  This provides partions parsing for BCM63xx devices with CFE
 	  bootloaders.
 
+config MTD_BCM47XX_PARTS
+	tristate "BCM47XX partitioning support"
+	depends on BCM47XX
+	help
+	  This provides partitions parser for devices based on BCM47xx
+	  boards.
+
 comment "User Modules And Translation Layers"
 
 config MTD_CHAR
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index f901354..18a38e5 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
 obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
 obj-$(CONFIG_MTD_AR7_PARTS)	+= ar7part.o
 obj-$(CONFIG_MTD_BCM63XX_PARTS)	+= bcm63xxpart.o
+obj-$(CONFIG_MTD_BCM47XX_PARTS)	+= bcm47xxpart.o
 
 # 'Users' - code which presents functionality to userspace.
 obj-$(CONFIG_MTD_CHAR)		+= mtdchar.o
diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
new file mode 100644
index 0000000..9b12cea
--- /dev/null
+++ b/drivers/mtd/bcm47xxpart.c
@@ -0,0 +1,202 @@
+/*
+ * BCM47XX MTD partitioning
+ *
+ * Copyright (C) 2012 Rafał Miłecki <zajec5@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <asm/mach-bcm47xx/nvram.h>
+
+/* 10 parts were found on sflash on Netgear WNDR4500 */
+#define BCM47XXPART_MAX_PARTS		12
+
+/*
+ * Amount of bytes we read when analyzing each block of flash memory.
+ * Set it big enough to allow detecting partition and reading important data.
+ */
+#define BCM47XXPART_BYTES_TO_READ	0x404
+
+/* Magics */
+#define BOARD_DATA_MAGIC		0x5246504D	/* MPFR */
+#define POT_MAGIC1			0x54544f50	/* POTT */
+#define POT_MAGIC2			0x504f		/* OP */
+#define ML_MAGIC1			0x39685a42
+#define ML_MAGIC2			0x26594131
+#define TRX_MAGIC			0x30524448
+
+struct trx_header {
+	u32 magic;
+	u32 length;
+	u32 crc32;
+	u16 flags;
+	u16 version;
+	u32 offset[3];
+} __packed;
+
+static void bcm47xxpart_add_part(struct mtd_partition *part, char *name,
+				 u64 offset, u32 mask_flags)
+{
+	part->name = name;
+	part->offset = offset;
+	part->mask_flags = mask_flags;
+}
+
+static int bcm47xxpart_parse(struct mtd_info *master,
+			     struct mtd_partition **pparts,
+			     struct mtd_part_parser_data *data)
+{
+	struct mtd_partition *parts;
+	u8 i, curr_part = 0;
+	u32 *buf;
+	size_t bytes_read;
+	u32 offset;
+	u32 blocksize = 0x10000;
+	struct trx_header *trx;
+
+	/* Alloc */
+	parts = kzalloc(sizeof(struct mtd_partition) * BCM47XXPART_MAX_PARTS,
+			GFP_KERNEL);
+	buf = kzalloc(BCM47XXPART_BYTES_TO_READ, GFP_KERNEL);
+
+	/* Parse block by block looking for magics */
+	for (offset = 0; offset <= master->size - blocksize;
+	     offset += blocksize) {
+		/* Nothing more in higher memory */
+		if (offset >= 0x2000000)
+			break;
+
+		if (curr_part > BCM47XXPART_MAX_PARTS) {
+			pr_warn("Reached maximum number of partitions, scanning stopped!\n");
+			break;
+		}
+
+		/* Read beginning of the block */
+		if (mtd_read(master, offset, BCM47XXPART_BYTES_TO_READ,
+			     &bytes_read, (u8 *)buf) < 0) {
+			pr_err("mtd_read error while parsing (offset: 0x%X)!\n",
+			       offset);
+			continue;
+		}
+
+		/* CFE has small NVRAM at 0x400 */
+		if (buf[0x400 / 4] == NVRAM_HEADER) {
+			bcm47xxpart_add_part(&parts[curr_part++], "boot",
+					     offset, MTD_WRITEABLE);
+			continue;
+		}
+
+		/* Standard NVRAM */
+		if (buf[0x000 / 4] == NVRAM_HEADER) {
+			bcm47xxpart_add_part(&parts[curr_part++], "nvram",
+					     offset, 0);
+			continue;
+		}
+
+		/*
+		 * board_data starts with board_id which differs across boards,
+		 * but we can use 'MPFR' (hopefully) magic at 0x100
+		 */
+		if (buf[0x100 / 4] == BOARD_DATA_MAGIC) {
+			bcm47xxpart_add_part(&parts[curr_part++], "board_data",
+					     offset, MTD_WRITEABLE);
+			continue;
+		}
+
+		/* POT(TOP) */
+		if (buf[0x000 / 4] == POT_MAGIC1 &&
+		    (buf[0x004 / 4] & 0xFFFF) == POT_MAGIC2) {
+			bcm47xxpart_add_part(&parts[curr_part++], "POT", offset,
+					     MTD_WRITEABLE);
+			continue;
+		}
+
+		/* ML */
+		if (buf[0x010 / 4] == ML_MAGIC1 &&
+		    buf[0x014 / 4] == ML_MAGIC2) {
+			bcm47xxpart_add_part(&parts[curr_part++], "ML", offset,
+					     MTD_WRITEABLE);
+			continue;
+		}
+
+		/* TRX */
+		if (buf[0x000 / 4] == TRX_MAGIC) {
+			trx = (struct trx_header *)buf;
+
+			i = 0;
+			/* We have LZMA loader if offset[2] points to sth */
+			if (trx->offset[2]) {
+				bcm47xxpart_add_part(&parts[curr_part++],
+						     "loader",
+						     offset + trx->offset[i],
+						     0);
+				i++;
+			}
+
+			bcm47xxpart_add_part(&parts[curr_part++], "linux",
+					     offset + trx->offset[i], 0);
+			i++;
+
+			/*
+			 * Pure rootfs size is known and can be calculated as:
+			 * trx->length - trx->offset[i]. We don't fill it as
+			 * we want to have jffs2 (overlay) in the same mtd.
+			 */
+			bcm47xxpart_add_part(&parts[curr_part++], "rootfs",
+					     offset + trx->offset[i], 0);
+			i++;
+
+			/*
+			 * We have whole TRX scanned, skip to the next part. Use
+			 * roundown (not roundup), as the loop will increase
+			 * offset in next step.
+			 */
+			offset = rounddown(offset + trx->length, blocksize);
+			continue;
+		}
+	}
+	kfree(buf);
+
+	/*
+	 * Assume that partitions end at the beginning of the one they are
+	 * followed by.
+	 */
+	for (i = 0; i < curr_part - 1; i++)
+		parts[i].size = parts[i + 1].offset - parts[i].offset;
+	if (curr_part > 0)
+		parts[curr_part - 1].size =
+				master->size - parts[curr_part - 1].offset;
+
+	*pparts = parts;
+	return curr_part;
+};
+
+static struct mtd_part_parser bcm47xxpart_mtd_parser = {
+	.owner = THIS_MODULE,
+	.parse_fn = bcm47xxpart_parse,
+	.name = "bcm47xxpart",
+};
+
+static int __init bcm47xxpart_init(void)
+{
+	return register_mtd_parser(&bcm47xxpart_mtd_parser);
+}
+
+static void __exit bcm47xxpart_exit(void)
+{
+	deregister_mtd_parser(&bcm47xxpart_mtd_parser);
+}
+
+module_init(bcm47xxpart_init);
+module_exit(bcm47xxpart_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MTD partitioning for BCM47XX flash memories");
-- 
1.7.7

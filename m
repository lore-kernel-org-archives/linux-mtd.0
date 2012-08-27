Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5sU7-0002kH-T3
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 06:07:40 +0000
Received: by wgbdt14 with SMTP id dt14so1533219wgb.18
 for <linux-mtd@lists.infradead.org>; Sun, 26 Aug 2012 23:07:36 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V3] mtd: bcm47part driver for BCM47XX chipsets
Date: Mon, 27 Aug 2012 08:15:55 +0200
Message-Id: <1346048155-28829-1-git-send-email-zajec5@gmail.com>
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
memories. It has many differences in comparision to older BCM63XX, like:
1) Different CFE with no more trivial MAGICs
2) More partitions types (board_data, ML, POT)
3) Supporting more than 1 flash on a device
which resulted in decision of writing new parser.

It uses generic mtd interface and was successfully tested with Netgear
WNDR4500 router which has 2 flash memories: serial one and NAND one.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
After talking with OpenWRT guys, it's now clear behaviour of this patch
is correct. We register partitions like they are, without any additional
garbage. Re-sending V3 without RFC.

V2: 1) Add support for more partitinos (ML and POT)
    2) Optimize: don't scan whole flash (like up to 128 MiB)
    3) Optimize: don't scan TRX partitions after detecting header

V3: 1) More defines less magic numbers
    2) Less duplication by adding bcm47part_add_part
    3) Mask out MTD_WRITEABLE only when needed
---
 drivers/mtd/Kconfig     |    4 +
 drivers/mtd/Makefile    |    1 +
 drivers/mtd/bcm47part.c |  188 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 193 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/bcm47part.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index ee2330f..b7db855 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -156,6 +156,10 @@ config MTD_BCM63XX_PARTS
 	  This provides partions parsing for BCM63xx devices with CFE
 	  bootloaders.
 
+config MTD_BCM47_PARTS
+	tristate "BCM47XX partitioning support"
+	depends on BCM47XX
+
 comment "User Modules And Translation Layers"
 
 config MTD_CHAR
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index f901354..dac90e6 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
 obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
 obj-$(CONFIG_MTD_AR7_PARTS)	+= ar7part.o
 obj-$(CONFIG_MTD_BCM63XX_PARTS)	+= bcm63xxpart.o
+obj-$(CONFIG_MTD_BCM47_PARTS)	+= bcm47part.o
 
 # 'Users' - code which presents functionality to userspace.
 obj-$(CONFIG_MTD_CHAR)		+= mtdchar.o
diff --git a/drivers/mtd/bcm47part.c b/drivers/mtd/bcm47part.c
new file mode 100644
index 0000000..2a9c027
--- /dev/null
+++ b/drivers/mtd/bcm47part.c
@@ -0,0 +1,188 @@
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
+#define BCM47PART_MAX_PARTS		12
+
+/* Amount of bytes we read when analyzing each block of flash memory.
+ * Set it big enough to allow detecting partition and reading important data. */
+#define BCM47PART_BYTES_TO_READ		0x401
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
+static void bcm47part_add_part(struct mtd_partition *part, char *name,
+			       u64 offset, u32 mask_flags)
+{
+	part->name = name;
+	part->offset = offset;
+	part->mask_flags = mask_flags;
+}
+
+static int bcm47part_parse(struct mtd_info *master,
+			   struct mtd_partition **pparts,
+			   struct mtd_part_parser_data *data)
+{
+	struct mtd_partition *parts;
+	u8 i, curr_part = 0;
+	u8 *buf;
+	u32 *fourcc, *fourcc2;
+	size_t bytes_read;
+	u32 offset;
+	u32 blocksize = 0x10000;
+	struct trx_header *trx;
+
+	/* Alloc */
+	parts = kzalloc(sizeof(struct mtd_partition) * BCM47PART_MAX_PARTS,
+			GFP_KERNEL);
+	buf = kzalloc(sizeof(*buf) * BCM47PART_BYTES_TO_READ, GFP_KERNEL);
+
+	/* Parse block by block looking for magics */
+	for (offset = 0; offset <= master->size - blocksize;
+	     offset += blocksize) {
+		/* Nothing more in higher memory */
+		if (offset >= 0x2000000)
+			break;
+
+		/* Read beginning of the block */
+		if (mtd_read(master, offset, BCM47PART_BYTES_TO_READ,
+		    &bytes_read, buf) < 0) {
+			pr_err("mtd_read error while parsing (offset: 0x%X)!\n",
+			       offset);
+			continue;
+		}
+
+		/* CFE has small NVRAM at 0x400 */
+		fourcc = (u32 *)&buf[0x400];
+		if (*fourcc == NVRAM_HEADER)
+			bcm47part_add_part(&parts[curr_part++], "boot", offset,
+					   MTD_WRITEABLE);
+
+		/* Standard NVRAM */
+		fourcc = (u32 *)&buf[0x000];
+		if (*fourcc == NVRAM_HEADER)
+			bcm47part_add_part(&parts[curr_part++], "nvram", offset,
+					   0);
+
+		/* board_data starts with board_id which differs across boards,
+		 * but we can use 'MPFR' (hopefully) magic at 0x100 */
+		fourcc = (u32 *)&buf[0x100];
+		if (*fourcc == BOARD_DATA_MAGIC)
+			bcm47part_add_part(&parts[curr_part++], "board_data",
+					   offset, MTD_WRITEABLE);
+
+		/* POT(TOP) */
+		fourcc = (u32 *)&buf[0x000];
+		fourcc2 = (u32 *)&buf[0x004];
+		if (*fourcc == POT_MAGIC1 &&
+		    (*fourcc2 & 0xFFFF) == POT_MAGIC2)
+			bcm47part_add_part(&parts[curr_part++], "POT", offset,
+					   MTD_WRITEABLE);
+
+		/* ML */
+		fourcc = (u32 *)&buf[0x010];
+		fourcc2 = (u32 *)&buf[0x014];
+		if (*fourcc == ML_MAGIC1 && *fourcc2 == ML_MAGIC2)
+			bcm47part_add_part(&parts[curr_part++], "ML", offset,
+					   MTD_WRITEABLE);
+
+		/* TRX */
+		fourcc = (u32 *)&buf[0x000];
+		if (*fourcc == TRX_MAGIC) {
+			trx = (struct trx_header *)buf;
+
+			i = 0;
+			/* We have LZMA loader if offset[2] points to sth */
+			if (trx->offset[2]) {
+				/* TODO: should we add LZMA loader partition? */
+				i++;
+			}
+
+			bcm47part_add_part(&parts[curr_part++], "linux",
+					   offset + trx->offset[i], 0);
+			i++;
+
+			/* Pure rootfs size is known and can be calculated as:
+			 * trx->length - trx->offset[i]. We don't fill it as
+			 * we want to have jffs2 (overlay) in the same mtd. */
+			bcm47part_add_part(&parts[curr_part++], "rootfs",
+					   offset + trx->offset[i], 0);
+			i++;
+
+			/* We have whole TRX scanned, skip to the next part. Use
+			 * roundown (not roundup), as the loop will increase
+			 * offset in next step. */
+			offset = rounddown(offset + trx->length, blocksize);
+		}
+
+		if (curr_part == BCM47PART_MAX_PARTS) {
+			pr_warn("Reached maximum number of partitions, scanning stopped!\n");
+			break;
+		}
+	}
+
+	/* We can't read sizes of some (most of) partitions. Assume that
+	 * these partitions end at the beginning of the one they are
+	 * followed by. */
+	for (i = 0; i < curr_part - 1; i++) {
+		if (parts[i].size == 0)
+			parts[i].size = parts[i + 1].offset - parts[i].offset;
+	}
+	if (curr_part > 0 && parts[curr_part - 1].size == 0)
+		parts[curr_part - 1].size =
+				master->size - parts[curr_part - 1].offset;
+
+	*pparts = parts;
+	return curr_part;
+};
+
+static struct mtd_part_parser bcm47part_mtd_parser = {
+	.owner = THIS_MODULE,
+	.parse_fn = bcm47part_parse,
+	.name = "bcm47part",
+};
+
+static int __init bcm47part_init(void)
+{
+	return register_mtd_parser(&bcm47part_mtd_parser);
+}
+
+static void __exit bcm47part_exit(void)
+{
+	deregister_mtd_parser(&bcm47part_mtd_parser);
+}
+
+module_init(bcm47part_init);
+module_exit(bcm47part_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MTD partitioning for BCM47XX flash memories");
-- 
1.7.7

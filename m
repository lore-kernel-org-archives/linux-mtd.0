Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T52O2-00079J-M2
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 22:29:55 +0000
Received: by wibhq4 with SMTP id hq4so1100199wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 15:29:52 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?q?=5BRFC=5D=5BPATCH=5D=20mtd=3A=20bcm47part=20driver=20for=20BCM47XX=20chipsets?=
Date: Sat, 25 Aug 2012 00:30:12 +0200
Message-Id: <1345847412-24509-1-git-send-email-zajec5@gmail.com>
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
---
Example of scanning (from my WNDR4500):

[    3.144000] Creating 3 MTD partitions on "bcm47sflash":
[    3.148000] 0x000000000000-0x0000001e0000 : "boot"
[    3.156000] 0x0000001e0000-0x0000001f0000 : "board_data"
[    3.164000] 0x0000001f0000-0x000000200000 : "nvram"

[    4.632000] Creating 2 MTD partitions on "NAND 128MiB 3,3V 8-bit":
[    4.636000] 0x00000000001c-0x0000001416a4 : "linux"
[    4.644000] 0x0000001416a4-0x0000007ba000 : "rootfs"

Right now there aren't any mainline MTD devices driver using this
parser. It was tested with out-of-tree drivers floating around (for
example on linux-wireless mailing list).

As this driver uses generic mtd interface, it should be safe to include
it in kernel without breaking anything in the future.

TODO:
1) Add support for more partitinos (ML and POT)
2) Optimize: don't scan whole flash (like up to 128 MiB)
3) Optimize: don't scan TRX partitions after detecting header
---
 drivers/mtd/Kconfig     |    4 +
 drivers/mtd/Makefile    |    1 +
 drivers/mtd/bcm47part.c |  154 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 159 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/bcm47part.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 27143e0..0cd4096 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -148,6 +148,10 @@ config MTD_BCM63XX_PARTS
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
index 0000000..cb06c52
--- /dev/null
+++ b/drivers/mtd/bcm47part.c
@@ -0,0 +1,154 @@
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
+#define BCM47PART_MAX_PARTS		12
+
+/* Amount of bytes we read when analyzing each block of flash memory.
+ * Set it big enough to allow detecting partition and reading important data. */
+#define BCM47PART_BYTES_TO_READ		0x401
+
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
+static int bcm47part_parse(struct mtd_info *master,
+			   struct mtd_partition **pparts,
+			   struct mtd_part_parser_data *data)
+{
+	struct mtd_partition *parts;
+	u8 i, curr_part = 0;
+	u8 *buf;
+	u32 *fourcc;
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
+		if (mtd_read(master, offset, BCM47PART_BYTES_TO_READ,
+		    &bytes_read, buf) < 0) {
+			pr_err("mtd_read error while parsing (offset: 0x%X)!\n",
+			       offset);
+			continue;
+		}
+
+		/* CFE has small NVRAM at 0x400 */
+		fourcc = (u32 *)&buf[0x400];
+		if (*fourcc == NVRAM_HEADER) {
+			parts[curr_part].name = "boot";
+			parts[curr_part].mask_flags = MTD_WRITEABLE;
+			parts[curr_part].offset = offset;
+			curr_part++;
+		}
+
+		/* Standard NVRAM */
+		fourcc = (u32 *)&buf[0x000];
+		if (*fourcc == NVRAM_HEADER) {
+			parts[curr_part].name = "nvram";
+			parts[curr_part].mask_flags = MTD_WRITEABLE;
+			parts[curr_part].offset = offset;
+			curr_part++;
+		}
+
+		/* board_data starts with board_id which differs across boards,
+		 * but we can use 'MPFR' (hopefully) magic at 0x100 */
+		fourcc = (u32 *)&buf[0x100];
+		if (*fourcc == 0x5246504D) { /* MPFR */
+			parts[curr_part].name = "board_data";
+			parts[curr_part].mask_flags = MTD_WRITEABLE;
+			parts[curr_part].offset = offset;
+			curr_part++;
+		}
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
+			parts[curr_part].name = "linux";
+			parts[curr_part].mask_flags = MTD_WRITEABLE;
+			parts[curr_part].offset = offset + trx->offset[i];
+			curr_part++;
+			i++;
+
+			parts[curr_part].name = "rootfs";
+			parts[curr_part].mask_flags = MTD_WRITEABLE;
+			parts[curr_part].offset = offset + trx->offset[i];
+			parts[curr_part].size = trx->length - trx->offset[i];
+			curr_part++;
+			i++;
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

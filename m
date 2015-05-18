Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuKGc-0006HE-HV
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 12:35:35 +0000
Received: by wicmc15 with SMTP id mc15so88051727wic.1
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 05:35:12 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH PROOF 2/1] mtd: add TRX parser splitting firmware partition
Date: Mon, 18 May 2015 14:34:54 +0200
Message-Id: <1431952494-6403-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1431952494-6403-1-git-send-email-zajec5@gmail.com>
References: <1431952494-6403-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Gabor Juhos <juhosg@openwrt.org>, Felix Fietkau <nbd@openwrt.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is just a proof of concept, not clean enough for being applied.

It results in creating subpartitions in a following way:
[    1.890000] Creating 3 MTD partitions on "bcm47xxsflash":                                                                                        
[    1.900000] 0x000000000000-0x000000020000 : "boot"                                                                                               
[    1.900000] 0x000000020000-0x0000007f0000 : "firmware"                                                                                           
[    1.940000] 3 trx_parser partitions found on MTD device firmware
[    1.980000] 0x00000002001c-0x00000002090c : "loader"
[    2.000000] 0x00000002090c-0x00000013b800 : "linux"
[    2.030000] 0x00000013b800-0x0000007f0000 : "rootfs"
[    2.060000] 0x0000007f0000-0x000000800000 : "nvram"

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/Makefile           |   1 +
 drivers/mtd/mtdsplit_trx.c     | 124 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/partitions.h |   1 +
 3 files changed, 126 insertions(+)
 create mode 100644 drivers/mtd/mtdsplit_trx.c

diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 99bb9a1..c43742f 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
 obj-$(CONFIG_MTD_AR7_PARTS)	+= ar7part.o
 obj-$(CONFIG_MTD_BCM63XX_PARTS)	+= bcm63xxpart.o
 obj-$(CONFIG_MTD_BCM47XX_PARTS)	+= bcm47xxpart.o
+obj-y				+= mtdsplit_trx.o
 
 # 'Users' - code which presents functionality to userspace.
 obj-$(CONFIG_MTD_BLKDEVS)	+= mtd_blkdevs.o
diff --git a/drivers/mtd/mtdsplit_trx.c b/drivers/mtd/mtdsplit_trx.c
new file mode 100644
index 0000000..d075cc0e
--- /dev/null
+++ b/drivers/mtd/mtdsplit_trx.c
@@ -0,0 +1,124 @@
+/*
+ * TRX subpartitioning
+ *
+ * Copyright (C) 2015 Rafał Miłecki <zajec5@gmail.com>
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
+
+#define TRX_PARSER_MAX_PARTS		4
+#define TRX_MAGIC			0x30524448
+
+struct trx_header {
+	uint32_t magic;
+	uint32_t length;
+	uint32_t crc32;
+	uint16_t flags;
+	uint16_t version;
+	uint32_t offset[3];
+} __packed;
+
+static void trx_parser_add_part(struct mtd_partition *part, char *name,
+				 u64 offset, uint32_t mask_flags)
+{
+	part->name = name;
+	part->offset = offset;
+	part->mask_flags = mask_flags;
+}
+
+static int trx_parser_parse(struct mtd_info *master,
+			    struct mtd_partition **pparts,
+			    struct mtd_part_parser_data *data)
+{
+	struct mtd_partition *parts;
+	struct trx_header trx;
+	size_t bytes_read;
+	int curr_part = 0;
+	int ret, i;
+
+	/* Alloc */
+	parts = kzalloc(sizeof(struct mtd_partition) * TRX_PARSER_MAX_PARTS,
+			GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
+
+	/* Read beginning of the block */
+	ret = mtd_read(master, 0, sizeof(trx), &bytes_read, (uint8_t *)&trx);
+	if (ret < 0 || bytes_read != sizeof(trx)) {
+		kfree(parts);
+		return -EIO;
+	}
+
+	/* TRX */
+	if (le32_to_cpu(trx.magic) != TRX_MAGIC) {
+		kfree(parts);
+		return -EIO;
+	}
+
+	i = 0;
+	/* We have LZMA loader if offset[2] points to sth */
+	if (trx.offset[2]) {
+		trx_parser_add_part(&parts[curr_part++], "loader",
+				    trx.offset[i], 0);
+		i++;
+	}
+
+	if (trx.offset[i]) {
+		trx_parser_add_part(&parts[curr_part++], "linux",
+				    trx.offset[i], 0);
+		i++;
+	}
+
+	if (trx.offset[i]) {
+		trx_parser_add_part(&parts[curr_part++], "rootfs",
+				    trx.offset[i], 0);
+		i++;
+	}
+
+	/*
+	 * Assume that partitions end at the beginning of the one they are
+	 * followed by.
+	 */
+	for (i = 0; i < curr_part; i++) {
+		u64 next_part_offset = (i < curr_part - 1) ?
+				       parts[i + 1].offset : master->size;
+
+		parts[i].size = next_part_offset - parts[i].offset;
+	}
+
+	*pparts = parts;
+	return curr_part;
+};
+
+static struct mtd_part_parser trx_parser = {
+	.owner = THIS_MODULE,
+	.parse_fn = trx_parser_parse,
+	.name = "trx_parser",
+	.type = MTD_PARTITION_TYPE_FIRMWARE,
+};
+
+static int __init trx_parser_init(void)
+{
+	register_mtd_parser(&trx_parser);
+	return 0;
+}
+
+static void __exit trx_parser_exit(void)
+{
+	deregister_mtd_parser(&trx_parser);
+}
+
+module_init(trx_parser_init);
+module_exit(trx_parser_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("TRX subpartitioning");
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 4d2432a..295e417 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -13,6 +13,7 @@
 
 enum mtd_partition_type {
 	MTD_PARTITION_TYPE_GENERIC = 0,
+	MTD_PARTITION_TYPE_FIRMWARE,
 };
 
 /*
-- 
1.8.4.5

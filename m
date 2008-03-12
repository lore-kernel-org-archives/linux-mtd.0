Received: from smtp-out25.alice.it ([85.33.2.25])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JZFvO-0003Uh-5c
	for linux-mtd@lists.infradead.org; Wed, 12 Mar 2008 01:38:34 +0000
From: Matteo Croce <technoboy85@gmail.com>
To: linux-mips@linux-mips.org
Subject: [PATCH][MIPS][2/6]: AR7 mtd partition map
Date: Wed, 12 Mar 2008 02:25:06 +0100
References: <200803120221.25044.technoboy85@gmail.com>
In-Reply-To: <200803120221.25044.technoboy85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200803120225.06990.technoboy85@gmail.com>
Cc: Eugene Konev <ejka@imfi.kspu.ru>, Felix Fietkau <nbd@openwrt.org>,
	linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	openwrt-devel@lists.openwrt.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Matteo Croce <technoboy85@gmail.com>
Signed-off-by: Felix Fietkau <nbd@openwrt.org>
Signed-off-by: Eugene Konev <ejka@imfi.kspu.ru>

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index e850334..eed06d0 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -158,6 +158,12 @@ config MTD_OF_PARTS
 	  the partition map from the children of the flash node,
 	  as described in Documentation/powerpc/booting-without-of.txt.
 
+config MTD_AR7_PARTS
+	tristate "TI AR7 partitioning support"
+	depends on MTD_PARTITIONS
+	---help---
+	  TI AR7 partitioning support
+
 comment "User Modules And Translation Layers"
 
 config MTD_CHAR
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 538e33d..4b77335 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_MTD_CONCAT)	+= mtdconcat.o
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
 obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
+obj-$(CONFIG_MTD_AR7_PARTS)	+= ar7part.o
 obj-$(CONFIG_MTD_OF_PARTS)      += ofpart.o
 
 # 'Users' - code which presents functionality to userspace.
diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/ar7part.c
new file mode 100644
index 0000000..3d160d4
--- /dev/null
+++ b/drivers/mtd/ar7part.c
@@ -0,0 +1,146 @@
+/*
+ * Copyright (C) 2007 Eugene Konev <ejka@openwrt.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ *
+ * TI AR7 flash partition table.
+ * Based on ar7 map by Felix Fietkau <nbd@openwrt.org>
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/bootmem.h>
+#include <linux/magic.h>
+
+#define AR7_PARTS	4
+#define ROOT_OFFSET	0xe0000
+
+#define LOADER_MAGIC1	le32_to_cpu(0xfeedfa42)
+#define LOADER_MAGIC2	le32_to_cpu(0xfeed1281)
+
+struct ar7_bin_rec {
+	unsigned int checksum;
+	unsigned int length;
+	unsigned int address;
+};
+
+static struct mtd_partition ar7_parts[AR7_PARTS];
+
+static int create_mtd_partitions(struct mtd_info *master,
+				 struct mtd_partition **pparts,
+				 unsigned long origin)
+{
+	struct ar7_bin_rec header;
+	unsigned int offset, len;
+	unsigned int pre_size = master->erasesize, post_size = 0;
+	unsigned int root_offset = ROOT_OFFSET;
+
+	int retries = 10;
+
+	ar7_parts[0].name = "loader";
+	ar7_parts[0].offset = 0;
+	ar7_parts[0].size = master->erasesize;
+	ar7_parts[0].mask_flags = MTD_WRITEABLE;
+
+	ar7_parts[1].name = "config";
+	ar7_parts[1].offset = 0;
+	ar7_parts[1].size = master->erasesize;
+	ar7_parts[1].mask_flags = 0;
+
+	do { /* Try 10 blocks starting from master->erasesize */
+		offset = pre_size;
+		master->read(master, offset,
+			sizeof(header), &len, (u8 *)&header);
+		if (!strncmp((char *)&header, "TIENV0.8", 8))
+			ar7_parts[1].offset = pre_size;
+		if (header.checksum == LOADER_MAGIC1)
+			break;
+		if (header.checksum == LOADER_MAGIC2)
+			break;
+		pre_size += master->erasesize;
+	} while (retries--);
+
+	pre_size = offset;
+
+	if (!ar7_parts[1].offset) {
+		ar7_parts[1].offset = master->size - master->erasesize;
+		post_size = master->erasesize;
+	}
+
+	switch (header.checksum) {
+	case LOADER_MAGIC1:
+		while (header.length) {
+			offset += sizeof(header) + header.length;
+			master->read(master, offset, sizeof(header),
+				     &len, (u8 *)&header);
+		}
+		root_offset = offset + sizeof(header) + 4;
+		break;
+	case LOADER_MAGIC2:
+		while (header.length) {
+			offset += sizeof(header) + header.length;
+			master->read(master, offset, sizeof(header),
+				     &len, (u8 *)&header);
+		}
+		root_offset = offset + sizeof(header) + 4 + 0xff;
+		root_offset &= ~(u32)0xff;
+		break;
+	default:
+		printk(KERN_WARNING "Unknown magic: %08x\n", header.checksum);
+		break;
+	}
+
+	master->read(master, root_offset,
+		sizeof(header), &len, (u8 *)&header);
+	if (header.checksum != SQUASHFS_MAGIC) {
+		root_offset += master->erasesize - 1;
+		root_offset &= ~(master->erasesize - 1);
+	}
+
+	ar7_parts[2].name = "linux";
+	ar7_parts[2].offset = pre_size;
+	ar7_parts[2].size = master->size - pre_size - post_size;
+	ar7_parts[2].mask_flags = 0;
+
+	ar7_parts[3].name = "rootfs";
+	ar7_parts[3].offset = root_offset;
+	ar7_parts[3].size = master->size - root_offset - post_size;
+	ar7_parts[3].mask_flags = 0;
+
+	*pparts = ar7_parts;
+	return AR7_PARTS;
+}
+
+static struct mtd_part_parser ar7_parser = {
+	.owner = THIS_MODULE,
+	.parse_fn = create_mtd_partitions,
+	.name = "ar7part",
+};
+
+static int __init ar7_parser_init(void)
+{
+	return register_mtd_parser(&ar7_parser);
+}
+
+module_init(ar7_parser_init);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR(	"Felix Fietkau <nbd@openwrt.org>, "
+		"Eugene Konev <ejka@openwrt.org>");
+MODULE_DESCRIPTION("MTD partitioning for TI AR7");

Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuc2j-000416-Gv
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 11:20:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id w11-v6so1212242wrc.5
 for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2018 04:20:05 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 3/5] mtd: bcm63xxpart: move imagetag parsing to its own parser
Date: Tue, 28 Aug 2018 13:19:42 +0200
Message-Id: <20180828111944.5956-4-jonas.gorski@gmail.com>
In-Reply-To: <20180828111944.5956-1-jonas.gorski@gmail.com>
References: <20180828111944.5956-1-jonas.gorski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move the bcm963xx Image Tag parsing into its own partition parser. This
Allows reusing the parser with different full flash parsers.

While moving it, rename it to bcm963* to better reflect it isn't chip,
but reference implementation specific.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/Kconfig                   |   1 +
 drivers/mtd/bcm63xxpart.c             | 155 ++----------------------
 drivers/mtd/parsers/Kconfig           |  11 ++
 drivers/mtd/parsers/Makefile          |   1 +
 drivers/mtd/parsers/parser_imagetag.c | 214 ++++++++++++++++++++++++++++++++++
 5 files changed, 235 insertions(+), 147 deletions(-)
 create mode 100644 drivers/mtd/parsers/parser_imagetag.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index c77f537323ec..a3bd0e315990 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -143,6 +143,7 @@ config MTD_BCM63XX_PARTS
 	tristate "BCM63XX CFE partitioning support"
 	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
 	select CRC32
+	select MTD_PARSER_IMAGETAG
 	help
 	  This provides partions parsing for BCM63xx devices with CFE
 	  bootloaders.
diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index f639b4c960f0..b2bd04764e95 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -94,51 +94,19 @@ static int bcm63xx_read_nvram(struct mtd_info *master,
 	return 0;
 }
 
-static int bcm63xx_read_image_tag(struct mtd_info *master, const char *name,
-	loff_t tag_offset, struct bcm_tag *buf)
-{
-	int ret;
-	size_t retlen;
-	u32 computed_crc;
-
-	ret = mtd_read(master, tag_offset, sizeof(*buf), &retlen, (void *)buf);
-	if (ret)
-		return ret;
-
-	if (retlen != sizeof(*buf))
-		return -EIO;
-
-	computed_crc = crc32_le(IMAGETAG_CRC_START, (u8 *)buf,
-				offsetof(struct bcm_tag, header_crc));
-	if (computed_crc == buf->header_crc) {
-		STR_NULL_TERMINATE(buf->board_id);
-		STR_NULL_TERMINATE(buf->tag_version);
-
-		pr_info("%s: CFE image tag found at 0x%llx with version %s, board type %s\n",
-			name, tag_offset, buf->tag_version, buf->board_id);
-
-		return 0;
-	}
-
-	pr_warn("%s: CFE image tag at 0x%llx CRC invalid (expected %08x, actual %08x)\n",
-		name, tag_offset, buf->header_crc, computed_crc);
-	return 1;
-}
+static const char * const bcm63xx_cfe_part_types[] = {
+	"bcm963xx-imagetag",
+	NULL,
+};
 
 static int bcm63xx_parse_cfe_nor_partitions(struct mtd_info *master,
 	const struct mtd_partition **pparts, struct bcm963xx_nvram *nvram)
 {
-	/* CFE, NVRAM and global Linux are always present */
-	int nrparts = 3, curpart = 0;
-	struct bcm_tag *buf = NULL;
 	struct mtd_partition *parts;
-	int ret;
-	unsigned int rootfsaddr, kerneladdr, spareaddr;
-	unsigned int rootfslen, kernellen, sparelen, totallen;
+	int nrparts = 3, curpart = 0;
 	unsigned int cfelen, nvramlen;
 	unsigned int cfe_erasesize;
 	int i;
-	bool rootfs_first = false;
 
 	cfe_erasesize = max_t(uint32_t, master->erasesize,
 			      BCM963XX_CFE_BLOCK_SIZE);
@@ -147,83 +115,9 @@ static int bcm63xx_parse_cfe_nor_partitions(struct mtd_info *master,
 	nvramlen = nvram->psi_size * SZ_1K;
 	nvramlen = roundup(nvramlen, cfe_erasesize);
 
-	buf = vmalloc(sizeof(struct bcm_tag));
-	if (!buf)
-		return -ENOMEM;
-
-	/* Get the tag */
-	ret = bcm63xx_read_image_tag(master, "rootfs", cfelen, buf);
-	if (!ret) {
-		STR_NULL_TERMINATE(buf->flash_image_start);
-		if (kstrtouint(buf->flash_image_start, 10, &rootfsaddr) ||
-				rootfsaddr < BCM963XX_EXTENDED_SIZE) {
-			pr_err("invalid rootfs address: %*ph\n",
-				(int)sizeof(buf->flash_image_start),
-				buf->flash_image_start);
-			goto invalid_tag;
-		}
-
-		STR_NULL_TERMINATE(buf->kernel_address);
-		if (kstrtouint(buf->kernel_address, 10, &kerneladdr) ||
-				kerneladdr < BCM963XX_EXTENDED_SIZE) {
-			pr_err("invalid kernel address: %*ph\n",
-				(int)sizeof(buf->kernel_address),
-				buf->kernel_address);
-			goto invalid_tag;
-		}
-
-		STR_NULL_TERMINATE(buf->kernel_length);
-		if (kstrtouint(buf->kernel_length, 10, &kernellen)) {
-			pr_err("invalid kernel length: %*ph\n",
-				(int)sizeof(buf->kernel_length),
-				buf->kernel_length);
-			goto invalid_tag;
-		}
-
-		STR_NULL_TERMINATE(buf->total_length);
-		if (kstrtouint(buf->total_length, 10, &totallen)) {
-			pr_err("invalid total length: %*ph\n",
-				(int)sizeof(buf->total_length),
-				buf->total_length);
-			goto invalid_tag;
-		}
-
-		kerneladdr = kerneladdr - BCM963XX_EXTENDED_SIZE;
-		rootfsaddr = rootfsaddr - BCM963XX_EXTENDED_SIZE;
-		spareaddr = roundup(totallen, master->erasesize) + cfelen;
-
-		if (rootfsaddr < kerneladdr) {
-			/* default Broadcom layout */
-			rootfslen = kerneladdr - rootfsaddr;
-			rootfs_first = true;
-		} else {
-			/* OpenWrt layout */
-			rootfsaddr = kerneladdr + kernellen;
-			rootfslen = spareaddr - rootfsaddr;
-		}
-	} else if (ret > 0) {
-invalid_tag:
-		kernellen = 0;
-		rootfslen = 0;
-		rootfsaddr = 0;
-		spareaddr = cfelen;
-	} else {
-		goto out;
-	}
-	sparelen = master->size - spareaddr - nvramlen;
-
-	/* Determine number of partitions */
-	if (rootfslen > 0)
-		nrparts++;
-
-	if (kernellen > 0)
-		nrparts++;
-
 	parts = kzalloc(sizeof(*parts) * nrparts + 10 * nrparts, GFP_KERNEL);
-	if (!parts) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!parts)
+		return -ENOMEM;
 
 	/* Start building partition list */
 	parts[curpart].name = "CFE";
@@ -231,30 +125,6 @@ static int bcm63xx_parse_cfe_nor_partitions(struct mtd_info *master,
 	parts[curpart].size = cfelen;
 	curpart++;
 
-	if (kernellen > 0) {
-		int kernelpart = curpart;
-
-		if (rootfslen > 0 && rootfs_first)
-			kernelpart++;
-		parts[kernelpart].name = "kernel";
-		parts[kernelpart].offset = kerneladdr;
-		parts[kernelpart].size = kernellen;
-		curpart++;
-	}
-
-	if (rootfslen > 0) {
-		int rootfspart = curpart;
-
-		if (kernellen > 0 && rootfs_first)
-			rootfspart--;
-		parts[rootfspart].name = "rootfs";
-		parts[rootfspart].offset = rootfsaddr;
-		parts[rootfspart].size = rootfslen;
-		if (sparelen > 0  && !rootfs_first)
-			parts[rootfspart].size += sparelen;
-		curpart++;
-	}
-
 	parts[curpart].name = "nvram";
 	parts[curpart].offset = master->size - nvramlen;
 	parts[curpart].size = nvramlen;
@@ -264,22 +134,13 @@ static int bcm63xx_parse_cfe_nor_partitions(struct mtd_info *master,
 	parts[curpart].name = "linux";
 	parts[curpart].offset = cfelen;
 	parts[curpart].size = master->size - cfelen - nvramlen;
+	parts[curpart].types = bcm63xx_cfe_part_types;
 
 	for (i = 0; i < nrparts; i++)
 		pr_info("Partition %d is %s offset %llx and length %llx\n", i,
 			parts[i].name, parts[i].offset,	parts[i].size);
 
-	pr_info("Spare partition is offset %x and length %x\n",	spareaddr,
-		sparelen);
-
 	*pparts = parts;
-	ret = 0;
-
-out:
-	vfree(buf);
-
-	if (ret)
-		return ret;
 
 	return nrparts;
 }
diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index ee5ab994132f..a17d751af8da 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -1,3 +1,14 @@
+config MTD_PARSER_IMAGETAG
+	tristate "Parser for BCM963XX Image Tag format partitions"
+	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
+	select CRC32
+	help
+	  Image Tag is the firmware header used by broadcom on their xDSL line
+	  of devices. It is used to describe the offsets and lengths of kernel
+	  and rootfs partitions.
+	  This driver adds support for parsing a partition with an Image Tag
+	  header and creates up to two partitions, kernel and rootfs.
+
 config MTD_PARSER_TRX
 	tristate "Parser for TRX format partitions"
 	depends on MTD && (BCM47XX || ARCH_BCM_5301X || COMPILE_TEST)
diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
index 5b1bcc3d90d9..02d7a9db8370 100644
--- a/drivers/mtd/parsers/Makefile
+++ b/drivers/mtd/parsers/Makefile
@@ -1,2 +1,3 @@
+obj-$(CONFIG_MTD_PARSER_IMAGETAG)	+= parser_imagetag.o
 obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
 obj-$(CONFIG_MTD_SHARPSL_PARTS)		+= sharpslpart.o
diff --git a/drivers/mtd/parsers/parser_imagetag.c b/drivers/mtd/parsers/parser_imagetag.c
new file mode 100644
index 000000000000..81e2fc70c889
--- /dev/null
+++ b/drivers/mtd/parsers/parser_imagetag.c
@@ -0,0 +1,214 @@
+/*
+ * BCM63XX CFE image tag parser
+ *
+ * Copyright © 2006-2008  Florian Fainelli <florian@openwrt.org>
+ *			  Mike Albon <malbon@openwrt.org>
+ * Copyright © 2009-2010  Daniel Dickinson <openwrt@cshore.neomailbox.net>
+ * Copyright © 2011-2013  Jonas Gorski <jonas.gorski@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/bcm963xx_tag.h>
+#include <linux/crc32.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+
+/* Ensure strings read from flash structs are null terminated */
+#define STR_NULL_TERMINATE(x) \
+	do { char *_str = (x); _str[sizeof(x) - 1] = 0; } while (0)
+
+static int bcm963xx_read_imagetag(struct mtd_info *master, const char *name,
+	loff_t tag_offset, struct bcm_tag *buf)
+{
+	int ret;
+	size_t retlen;
+	u32 computed_crc;
+
+	ret = mtd_read(master, tag_offset, sizeof(*buf), &retlen, (void *)buf);
+	if (ret)
+		return ret;
+
+	if (retlen != sizeof(*buf))
+		return -EIO;
+
+	computed_crc = crc32_le(IMAGETAG_CRC_START, (u8 *)buf,
+				offsetof(struct bcm_tag, header_crc));
+	if (computed_crc == buf->header_crc) {
+		STR_NULL_TERMINATE(buf->board_id);
+		STR_NULL_TERMINATE(buf->tag_version);
+
+		pr_info("%s: CFE image tag found at 0x%llx with version %s, board type %s\n",
+			name, tag_offset, buf->tag_version, buf->board_id);
+
+		return 0;
+	}
+
+	pr_warn("%s: CFE image tag at 0x%llx CRC invalid (expected %08x, actual %08x)\n",
+		name, tag_offset, buf->header_crc, computed_crc);
+	return -EINVAL;
+}
+
+static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
+					const struct mtd_partition **pparts,
+					struct mtd_part_parser_data *data)
+{
+	/* CFE, NVRAM and global Linux are always present */
+	int nrparts = 0, curpart = 0;
+	struct bcm_tag *buf = NULL;
+	struct mtd_partition *parts;
+	int ret;
+	unsigned int rootfsaddr, kerneladdr, spareaddr, offset;
+	unsigned int rootfslen, kernellen, sparelen, totallen;
+	int i;
+	bool rootfs_first = false;
+
+	buf = vmalloc(sizeof(struct bcm_tag));
+	if (!buf)
+		return -ENOMEM;
+
+	/* Get the tag */
+	ret = bcm963xx_read_imagetag(master, "rootfs", 0, buf);
+	if (!ret) {
+		STR_NULL_TERMINATE(buf->flash_image_start);
+		if (kstrtouint(buf->flash_image_start, 10, &rootfsaddr) ||
+				rootfsaddr < BCM963XX_EXTENDED_SIZE) {
+			pr_err("invalid rootfs address: %*ph\n",
+				(int)sizeof(buf->flash_image_start),
+				buf->flash_image_start);
+			goto out;
+		}
+
+		STR_NULL_TERMINATE(buf->kernel_address);
+		if (kstrtouint(buf->kernel_address, 10, &kerneladdr) ||
+				kerneladdr < BCM963XX_EXTENDED_SIZE) {
+			pr_err("invalid kernel address: %*ph\n",
+				(int)sizeof(buf->kernel_address),
+				buf->kernel_address);
+			goto out;
+		}
+
+		STR_NULL_TERMINATE(buf->kernel_length);
+		if (kstrtouint(buf->kernel_length, 10, &kernellen)) {
+			pr_err("invalid kernel length: %*ph\n",
+				(int)sizeof(buf->kernel_length),
+				buf->kernel_length);
+			goto out;
+		}
+
+		STR_NULL_TERMINATE(buf->total_length);
+		if (kstrtouint(buf->total_length, 10, &totallen)) {
+			pr_err("invalid total length: %*ph\n",
+				(int)sizeof(buf->total_length),
+				buf->total_length);
+			goto out;
+		}
+
+		/*
+		 * Addresses are flash absolute, so convert to partition
+		 * relative addresses. Assume either kernel or rootfs will
+		 * directly follow the image tag.
+		 */
+		if (rootfsaddr < kerneladdr)
+			offset = rootfsaddr - sizeof(struct bcm_tag);
+		else
+			offset = kerneladdr - sizeof(struct bcm_tag);
+
+		kerneladdr = kerneladdr - offset;
+		rootfsaddr = rootfsaddr - offset;
+		spareaddr = roundup(totallen, master->erasesize);
+
+		if (rootfsaddr < kerneladdr) {
+			/* default Broadcom layout */
+			rootfslen = kerneladdr - rootfsaddr;
+			rootfs_first = true;
+		} else {
+			/* OpenWrt layout */
+			rootfsaddr = kerneladdr + kernellen;
+			rootfslen = spareaddr - rootfsaddr;
+		}
+	} else {
+		goto out;
+	}
+	sparelen = master->size - spareaddr;
+
+	/* Determine number of partitions */
+	if (rootfslen > 0)
+		nrparts++;
+
+	if (kernellen > 0)
+		nrparts++;
+
+	parts = kzalloc(sizeof(*parts) * nrparts + 10 * nrparts, GFP_KERNEL);
+	if (!parts) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* Start building partition list */
+	if (kernellen > 0) {
+		int kernelpart = curpart;
+
+		if (rootfslen > 0 && rootfs_first)
+			kernelpart++;
+		parts[kernelpart].name = "kernel";
+		parts[kernelpart].offset = kerneladdr;
+		parts[kernelpart].size = kernellen;
+		curpart++;
+	}
+
+	if (rootfslen > 0) {
+		int rootfspart = curpart;
+
+		if (kernellen > 0 && rootfs_first)
+			rootfspart--;
+		parts[rootfspart].name = "rootfs";
+		parts[rootfspart].offset = rootfsaddr;
+		parts[rootfspart].size = rootfslen;
+		if (sparelen > 0  && !rootfs_first)
+			parts[rootfspart].size += sparelen;
+		curpart++;
+	}
+
+	for (i = 0; i < nrparts; i++)
+		pr_info("Partition %d is %s offset %llx and length %llx\n", i,
+			parts[i].name, parts[i].offset,	parts[i].size);
+
+	pr_info("Spare partition is offset %x and length %x\n",	spareaddr,
+		sparelen);
+
+	*pparts = parts;
+	ret = 0;
+
+out:
+	vfree(buf);
+
+	if (ret)
+		return ret;
+
+	return nrparts;
+}
+
+static struct mtd_part_parser bcm963xx_imagetag_parser = {
+	.parse_fn = bcm963xx_parse_imagetag_partitions,
+	.name = "bcm963xx-imagetag",
+};
+module_mtd_part_parser(bcm963xx_imagetag_parser);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Daniel Dickinson <openwrt@cshore.neomailbox.net>");
+MODULE_AUTHOR("Florian Fainelli <florian@openwrt.org>");
+MODULE_AUTHOR("Mike Albon <malbon@openwrt.org>");
+MODULE_AUTHOR("Jonas Gorski <jonas.gorski@gmail.com");
+MODULE_DESCRIPTION("MTD parser for BCM963XX CFE Image Tag partitions");
-- 
2.13.2

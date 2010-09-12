Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OumyE-000103-AL
	for linux-mtd@lists.infradead.org; Sun, 12 Sep 2010 13:51:52 +0000
Received: by wwb24 with SMTP id 24so5804274wwb.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 06:51:48 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Sun, 12 Sep 2010 15:52:59 +0200
Subject: [PATCH] mtd: add Broadcom BCM63xx image tag partition parser
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201009121553.01374.florian@openwrt.org>
Reply-To: Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This patch adds support for parsing Broadcom BCM63xx image tag format and
creating MTD partitions accordingly. This driver is a platform_device which
can be instantiated accordingly by bcm63xx board support code.

Signed-off-by: Daniel Dickinson <cshore@csolve.net>
Signed-off-by: Mike Albon <malbon@openwrt.org>
Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm963xx_tag.h b/arch/mips/include/asm/mach-bcm63xx/bcm963xx_tag.h
new file mode 100644
index 0000000..5325084
--- /dev/null
+++ b/arch/mips/include/asm/mach-bcm63xx/bcm963xx_tag.h
@@ -0,0 +1,97 @@
+#ifndef __BCM963XX_TAG_H
+#define __BCM963XX_TAG_H
+
+#define TAGVER_LEN		4	/* Length of Tag Version */
+#define TAGLAYOUT_LEN		4	/* Length of FlashLayoutVer */
+#define SIG1_LEN		20	/* Company Signature 1 Length */
+#define SIG2_LEN		14	/* Company Signature 2 Lenght */
+#define BOARDID_LEN		16	/* Length of BoardId */
+#define ENDIANFLAG_LEN		2	/* Endian Flag Length */
+#define CHIPID_LEN		6	/* Chip Id Length */
+#define IMAGE_LEN		10	/* Length of Length Field */
+#define ADDRESS_LEN		12	/* Length of Address field */
+#define DUALFLAG_LEN		2	/* Dual Image flag Length */
+#define INACTIVEFLAG_LEN	2	/* Inactie Flag Length */
+#define RSASIG_LEN		20	/* Length of RSA Signature in tag */
+#define TAGINFO1_LEN		30	/* Length of vendor information field1 in tag */
+#define FLASHLAYOUTVER_LEN	4	/* Length of Flash Layout Version String tag */
+#define TAGINFO2_LEN		16	/* Length of vendor information field2 in tag */
+#define CRC_LEN			4	/* Length of CRC in bytes */
+#define ALTTAGINFO_LEN		54	/* Alternate length for vendor information; Pirelli */
+
+#define NUM_PIRELLI		2
+#define IMAGETAG_CRC_START	0xFFFFFFFF
+
+#define PIRELLI_BOARDS { \
+	"AGPF-S0", \
+	"DWV-S0", \
+}
+
+/*
+ * The broadcom firmware assumes the rootfs starts the image,
+ * therefore uses the rootfs start (flash_image_address)
+ * to determine where to flash the image.  Since we have the kernel first
+ * we have to give it the kernel address, but the crc uses the length
+ * associated with this address (root_length), which is added to the kernel
+ * length (kernel_length) to determine the length of image to flash and thus
+ * needs to be rootfs + deadcode (jffs2 EOF marker)
+*/
+
+struct bcm_tag {
+	/* 0-3: Version of the image tag */
+	char tag_version[TAGVER_LEN];
+	/* 4-23: Company Line 1 */
+	char sig_1[SIG1_LEN];
+	/*  24-37: Company Line 2 */
+	char sig_2[SIG2_LEN];
+	/* 38-43: Chip this image is for */
+	char chip_id[CHIPID_LEN];
+	/* 44-59: Board name */
+	char board_id[BOARDID_LEN];
+	/* 60-61: Map endianness -- 1 BE 0 LE */
+	char big_endian[ENDIANFLAG_LEN];
+	/* 62-71: Total length of image */
+	char total_length[IMAGE_LEN];
+	/* 72-83: Address in memory of CFE */
+	char cfe__address[ADDRESS_LEN];
+	/* 84-93: Size of CFE */
+	char cfe_length[IMAGE_LEN];
+	/* 94-105: Address in memory of image start
+	 * (kernel for OpenWRT, rootfs for stock firmware)
+	 */
+	char flash_image_start[ADDRESS_LEN];
+	/* 106-115: Size of rootfs */
+	char root_length[IMAGE_LEN];
+	/* 116-127: Address in memory of kernel */
+	char kernel_address[ADDRESS_LEN];
+	/* 128-137: Size of kernel */
+	char kernel_length[IMAGE_LEN];
+	/* 138-139: Unused at the moment */
+	char dual_image[DUALFLAG_LEN];
+	/* 140-141: Unused at the moment */
+	char inactive_flag[INACTIVEFLAG_LEN];
+	/* 142-161: RSA Signature (not used; some vendors may use this) */
+	char rsa_signature[RSASIG_LEN];
+	/* 162-191: Compilation and related information (not used in OpenWrt) */
+	char information1[TAGINFO1_LEN];
+	/* 192-195: Version flash layout */
+	char flash_layout_ver[FLASHLAYOUTVER_LEN];
+	/* 196-199: kernel+rootfs CRC32 */
+	char fskernel_crc[CRC_LEN];
+	/* 200-215: Unused except on Alice Gate where is is information */
+	char information2[TAGINFO2_LEN];
+	/* 216-219: CRC32 of image less imagetag (kernel for Alice Gate) */
+	char image_crc[CRC_LEN];
+	/* 220-223: CRC32 of rootfs partition */
+	char rootfs_crc[CRC_LEN];
+	/* 224-227: CRC32 of kernel partition */
+	char kernel_crc[CRC_LEN];
+	/* 228-235: Unused at present */
+	char reserved1[8];
+	/* 236-239: CRC32 of header excluding tagVersion */
+	char header_crc[CRC_LEN];
+	/* 240-255: Unused at present */
+	char reserved2[16];
+};
+
+#endif /* __BCM63XX_TAG_H */
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 701d942..e5eb65c 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -251,6 +251,15 @@ config MTD_NETtel
 	help
 	  Support for flash chips on NETtel/SecureEdge/SnapGear boards.
 
+config MTD_BCM963XX
+        tristate "Map driver for Broadcom BCM963xx boards"
+        depends on BCM63XX
+	select MTD_MAP_BANK_WIDTH_2
+	select MTD_CFI_I1
+        help
+	  Support for parsing CFE image tag and creating MTD partitions on
+	  Broadcom BCM63xx boards.
+
 config MTD_DILNETPC
 	tristate "CFI Flash device mapped on DIL/Net PC"
 	depends on X86 && MTD_CONCAT && MTD_PARTITIONS && MTD_CFI_INTELEXT && BROKEN
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index f216bb5..c7869c7 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -58,3 +58,4 @@ obj-$(CONFIG_MTD_BFIN_ASYNC)	+= bfin-async-flash.o
 obj-$(CONFIG_MTD_RBTX4939)	+= rbtx4939-flash.o
 obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
 obj-$(CONFIG_MTD_GPIO_ADDR)	+= gpio-addr-flash.o
+obj-$(CONFIG_MTD_BCM963XX)	+= bcm963xx-flash.o
diff --git a/drivers/mtd/maps/bcm963xx-flash.c b/drivers/mtd/maps/bcm963xx-flash.c
new file mode 100644
index 0000000..9c3a26e
--- /dev/null
+++ b/drivers/mtd/maps/bcm963xx-flash.c
@@ -0,0 +1,271 @@
+/*
+ * Copyright (C) 2006-2008  Florian Fainelli <florian@openwrt.org>
+ *			    Mike Albon <malbon@openwrt.org>
+ * Copyright (C) 2009-2010  Daniel Dickinson <openwrt@cshore.neomailbox.net>
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
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/vmalloc.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+
+#include <asm/mach-bcm63xx/bcm963xx_tag.h>
+
+#define BCM63XX_BUSWIDTH	2		/* Buswidth */
+#define BCM63XX_EXTENDED_SIZE	0xBFC00000	/* Extended flash address */
+
+#define PFX KBUILD_MODNAME ": "
+
+static struct mtd_partition *parsed_parts;
+
+static struct mtd_info *bcm963xx_mtd_info;
+
+static struct map_info bcm963xx_map = {
+	.name		= "bcm963xx",
+	.bankwidth	= BCM63XX_BUSWIDTH,
+};
+
+static int parse_cfe_partitions(struct mtd_info *master,
+						struct mtd_partition **pparts)
+{
+	/* CFE, NVRAM and global Linux are always present */
+	int nrparts = 3, curpart = 0;
+	struct bcm_tag *buf;
+	struct mtd_partition *parts;
+	int ret;
+	size_t retlen;
+	unsigned int rootfsaddr, kerneladdr, spareaddr;
+	unsigned int rootfslen, kernellen, sparelen, totallen;
+	int namelen = 0;
+	int i;
+	char *boardid;
+	char *tagversion;
+
+	/* Allocate memory for buffer */
+	buf = vmalloc(sizeof(struct bcm_tag));
+	if (!buf)
+		return -ENOMEM;
+
+	/* Get the tag */
+	ret = master->read(master, master->erasesize, sizeof(struct bcm_tag),
+							&retlen, (void *)buf);
+	if (retlen != sizeof(struct bcm_tag)) {
+		vfree(buf);
+		return -EIO;
+	}
+
+	sscanf(buf->kernel_address, "%u", &kerneladdr);
+	sscanf(buf->kernel_length, "%u", &kernellen);
+	sscanf(buf->total_length, "%u", &totallen);
+	tagversion = &(buf->tag_version[0]);
+	boardid = &(buf->board_id[0]);
+
+	printk(KERN_INFO PFX "CFE boot tag found with version %s "
+				"and board type %s\n", tagversion, boardid);
+
+	kerneladdr = kerneladdr - BCM63XX_EXTENDED_SIZE;
+	rootfsaddr = kerneladdr + kernellen;
+	spareaddr = roundup(totallen, master->erasesize) + master->erasesize;
+	sparelen = master->size - spareaddr - master->erasesize;
+	rootfslen = spareaddr - rootfsaddr;
+
+	/* Determine number of partitions */
+	namelen = 8;
+	if (rootfslen > 0) {
+		nrparts++;
+		namelen += 6;
+	};
+	if (kernellen > 0) {
+		nrparts++;
+		namelen += 6;
+	};
+
+	/* Ask kernel for more memory */
+	parts = kzalloc(sizeof(*parts) * nrparts + 10 * nrparts, GFP_KERNEL);
+	if (!parts) {
+		vfree(buf);
+		return -ENOMEM;
+	};
+
+	/* Start building partition list */
+	parts[curpart].name = "CFE";
+	parts[curpart].offset = 0;
+	parts[curpart].size = master->erasesize;
+	curpart++;
+
+	if (kernellen > 0) {
+		parts[curpart].name = "kernel";
+		parts[curpart].offset = kerneladdr;
+		parts[curpart].size = kernellen;
+		curpart++;
+	};
+
+	if (rootfslen > 0) {
+		parts[curpart].name = "rootfs";
+		parts[curpart].offset = rootfsaddr;
+		parts[curpart].size = rootfslen;
+		if (sparelen > 0)
+			parts[curpart].size += sparelen;
+		curpart++;
+	};
+
+	parts[curpart].name = "nvram";
+	parts[curpart].offset = master->size - master->erasesize;
+	parts[curpart].size = master->erasesize;
+
+	/* Global partition "linux" to make easy firmware upgrade */
+	curpart++;
+	parts[curpart].name = "linux";
+	parts[curpart].offset = parts[0].size;
+	parts[curpart].size = master->size - parts[0].size - parts[3].size;
+
+	for (i = 0; i < nrparts; i++)
+		printk(KERN_INFO PFX "Partition %d is %s offset %lx and "
+					"length %lx\n", i, parts[i].name,
+					(long unsigned int)(parts[i].offset),
+					(long unsigned int)(parts[i].size));
+
+	printk(KERN_INFO PFX "Spare partition is %x offset and length %x\n",
+							spareaddr, sparelen);
+	*pparts = parts;
+	vfree(buf);
+
+	return nrparts;
+};
+
+static int bcm963xx_detect_cfe(struct mtd_info *master)
+{
+	int idoffset = 0x4e0;
+	static char idstring[8] = "CFE1CFE1";
+	char buf[9];
+	int ret;
+	size_t retlen;
+
+	ret = master->read(master, idoffset, 8, &retlen, (void *)buf);
+	buf[retlen] = 0;
+	printk(KERN_INFO PFX "Read Signature value of %s\n", buf);
+
+	return strncmp(idstring, buf, 8);
+}
+
+static int bcm963xx_probe(struct platform_device *pdev)
+{
+	int err = 0;
+	int parsed_nr_parts = 0;
+	char *part_type;
+	struct resource *r;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r) {
+		dev_err(&pdev->dev, "no resource supplied\n");
+		return -ENODEV;
+	}
+
+	bcm963xx_map.phys = r->start;
+	bcm963xx_map.size = resource_size(r);
+	bcm963xx_map.virt = ioremap(r->start, resource_size(r));
+	if (!bcm963xx_map.virt) {
+		dev_err(&pdev->dev, "failed to ioremap\n");
+		return -EIO;
+	}
+
+	dev_info(&pdev->dev, "0x%08lx at 0x%08x\n",
+					bcm963xx_map.size, bcm963xx_map.phys);
+
+	simple_map_init(&bcm963xx_map);
+
+	bcm963xx_mtd_info = do_map_probe("cfi_probe", &bcm963xx_map);
+	if (!bcm963xx_mtd_info) {
+		dev_err(&pdev->dev, "failed to probe using CFI\n");
+		err = -EIO;
+		goto err_probe;
+	}
+
+	bcm963xx_mtd_info->owner = THIS_MODULE;
+
+	/* This is mutually exclusive */
+	if (bcm963xx_detect_cfe(bcm963xx_mtd_info) == 0) {
+		dev_info(&pdev->dev, "CFE bootloader detected\n");
+		if (parsed_nr_parts == 0) {
+			int ret = parse_cfe_partitions(bcm963xx_mtd_info,
+							&parsed_parts);
+			if (ret > 0) {
+				part_type = "CFE";
+				parsed_nr_parts = ret;
+			}
+		}
+	} else {
+		dev_info(&pdev->dev, "unsupported bootloader\n");
+		err = -ENODEV;
+		goto err_probe;
+	}
+
+	return add_mtd_partitions(bcm963xx_mtd_info, parsed_parts,
+						parsed_nr_parts);
+
+err_probe:
+	iounmap(bcm963xx_map.virt);
+	return err;
+}
+
+static int bcm963xx_remove(struct platform_device *pdev)
+{
+	if (bcm963xx_mtd_info) {
+		del_mtd_partitions(bcm963xx_mtd_info);
+		map_destroy(bcm963xx_mtd_info);
+	}
+
+	if (bcm963xx_map.virt) {
+		iounmap(bcm963xx_map.virt);
+		bcm963xx_map.virt = 0;
+	}
+
+	return 0;
+}
+
+static struct platform_driver bcm63xx_mtd_dev = {
+	.probe	= bcm963xx_probe,
+	.remove = bcm963xx_remove,
+	.driver = {
+		.name	= "bcm963xx-flash",
+		.owner	= THIS_MODULE,
+	},
+};
+
+static int __init bcm963xx_mtd_init(void)
+{
+	return platform_driver_register(&bcm63xx_mtd_dev);
+}
+
+static void __exit bcm963xx_mtd_exit(void)
+{
+	platform_driver_unregister(&bcm63xx_mtd_dev);
+}
+
+module_init(bcm963xx_mtd_init);
+module_exit(bcm963xx_mtd_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Broadcom BCM63xx MTD driver for CFE and RedBoot");
+MODULE_AUTHOR("Daniel Dickinson <openwrt@cshore.neomailbox.net>");
+MODULE_AUTHOR("Florian Fainelli <florian@openwrt.org>");
+MODULE_AUTHOR("Mike Albon <malbon@openwrt.org>");

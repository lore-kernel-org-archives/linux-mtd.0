Received: from mail-ee0-x234.google.com ([2a00:1450:4013:c00::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIB6w-0004wd-IN
 for linux-mtd@lists.infradead.org; Tue, 25 Feb 2014 06:03:24 +0000
Received: by mail-ee0-f52.google.com with SMTP id c41so2810431eek.11
 for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2014 22:02:58 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [WIP V2] mtd: bcm53xxnflash: add driver for NAND on new BCMA SoCs
Date: Tue, 25 Feb 2014 07:02:50 +0100
Message-Id: <1393308170-19565-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1393233946-8760-1-git-send-email-zajec5@gmail.com>
References: <1393233946-8760-1-git-send-email-zajec5@gmail.com>
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
This version implements NAND_CMD_READID and few other simple ones.
---
 drivers/mtd/nand/Kconfig         |   9 ++
 drivers/mtd/nand/Makefile        |   1 +
 drivers/mtd/nand/bcm53xxnflash.c | 254 +++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/bcm53xxnflash.h | 159 ++++++++++++++++++++++++
 4 files changed, 423 insertions(+)
 create mode 100644 drivers/mtd/nand/bcm53xxnflash.c
 create mode 100644 drivers/mtd/nand/bcm53xxnflash.h

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index a5bb738..d33c80a 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -397,6 +397,15 @@ config MTD_NAND_BCM47XXNFLASH
 	  registered by bcma as platform devices. This enables driver for
 	  NAND flash memories. For now only BCM4706 is supported.
 
+config MTD_NAND_BCM53XXNFLASH
+	tristate "Support for BCMA NAND attached as standalone core"
+	depends on BCMA
+	help
+	  This enables support for NAND flash memories attached to BCMA bus as
+	  separated bus cores. They most probably can be found only on ARM based
+	  Broadcom SoCs. System reports such devices as:
+	  bcma: bus0: Core N found: NAND flash controller (...)
+
 config MTD_NAND_PLATFORM
 	tristate "Support for generic platform NAND driver"
 	depends on HAS_IOMEM
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 542b568..680c356 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -49,5 +49,6 @@ obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
 obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
 obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
 obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
+obj-$(CONFIG_MTD_NAND_BCM53XXNFLASH)	+= bcm53xxnflash.o
 
 nand-objs := nand_base.o nand_bbt.o
diff --git a/drivers/mtd/nand/bcm53xxnflash.c b/drivers/mtd/nand/bcm53xxnflash.c
new file mode 100644
index 0000000..8bde1e9
--- /dev/null
+++ b/drivers/mtd/nand/bcm53xxnflash.c
@@ -0,0 +1,254 @@
+/*
+ * BCM53XX NAND driver
+ *
+ * Copyright © 2014 Rafał Miłecki <zajec5@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/platform_device.h>
+#include <linux/bcma/bcma.h>
+
+#include "bcm53xxnflash.h"
+
+MODULE_DESCRIPTION("NAND flash driver for BCMA bus");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Rafał Miłecki");
+
+static const char *probes[] = { "bcm47xxpart", NULL };
+
+static void b53n_cmd(struct b53n *b53n, u32 code)
+{
+	b53n_write(b53n, B53N_CMD_START, code);
+}
+
+static int b53n_poll(struct b53n *b53n)
+{
+	u32 bits = B53_INTFC_ST_CTRL_READY | B53_INTFC_ST_FLASH_READY;
+	int i;
+
+	for (i = 0; i < 10000; i++) {
+		if ((b53n_read(b53n, B53N_INTFC_STATUS) & bits) == bits) {
+			if (i > 600)
+				pr_info("Polling success in %d loop\n", i);
+			return 0;
+		}
+	}
+
+	pr_err("Polling timeout!\n");
+	return -EBUSY;
+}
+
+/**************************************************
+ * NAND chip ops
+ **************************************************/
+
+static u8 b53n_nand_read_byte(struct mtd_info *mtd)
+{
+	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
+	struct b53n *b53n = (struct b53n *)nand_chip->priv;
+
+	switch (b53n->curr_command) {
+	case NAND_CMD_STATUS:
+		return b53n_read(b53n, B53N_INTFC_STATUS) & B53_INTFC_ST_STATUS;
+	case NAND_CMD_READID:
+		if (b53n->curr_column >= ARRAY_SIZE(b53n->id_data)) {
+			pr_debug("Invalid id_data idx: %d\n", b53n->curr_column);
+			break;
+		}
+		return b53n->id_data[b53n->curr_column++];
+	}
+
+	return 0;
+}
+
+static void b53n_nand_select_chip(struct mtd_info *mtd, int chip)
+{
+	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
+	struct b53n *b53n = (struct b53n *)nand_chip->priv;
+	u32 tmp;
+
+	WARN_ON(chip > 0);
+
+	tmp = b53n_read(b53n, B53N_CMD_EXT_ADDRESS);
+	tmp &= ~B53N_CMD_EXT_ADDR_CS_SEL_MASK;
+	tmp |= chip << B53N_CMD_EXT_ADDR_CS_SEL_SHIFT;
+	b53n_write(b53n, B53N_CMD_EXT_ADDRESS, tmp);
+}
+
+static void b53n_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
+			      int column, int page_addr)
+{
+
+	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
+	struct b53n *b53n = (struct b53n *)nand_chip->priv;
+
+	switch (command) {
+	case NAND_CMD_STATUS:
+		b53n_cmd(b53n, B53N_CMD_START_STATUS_RD);
+		b53n_poll(b53n);
+		break;
+	case NAND_CMD_READID:
+		b53n_cmd(b53n, B53N_CMD_START_ID_RD);
+		b53n_poll(b53n);
+		b53n->curr_column = column;
+		break;
+	case NAND_CMD_RESET:
+		b53n_cmd(b53n, B53N_CMD_START_FLASH_RESET);
+		b53n_poll(b53n);
+		break;
+	default:
+		pr_err("Command 0x%X unsupported\n", command);
+		break;
+	}
+
+	b53n->curr_command = command;
+}
+
+static int b53n_nand_waitfunc(struct mtd_info *mtd, struct nand_chip *nand_chip)
+{
+	struct b53n *b53n = (struct b53n *)nand_chip->priv;
+
+	return b53n_poll(b53n);
+}
+
+static int b53n_init(struct b53n *b53n)
+{
+	struct bcma_device *core = b53n->core;
+	u32 id, id_ext;
+	int i, err;
+
+	/* Verify access */
+	b53n_cmd(b53n, B53N_CMD_START_ID_RD);
+	err = b53n_poll(b53n);
+	if (err)
+		return err;
+
+	/* Cache ID, we need it to fake read_byte for NAND_CMD_READID */
+	bcma_awrite32(core, BCMA_IOCTL,
+		      bcma_aread32(core, BCMA_IOCTL) | B53N_BCMA_IOCTL_APB_LITTLE_ENDIAN);
+	id = b53n_read(b53n, B53N_FLASH_DEVICE_ID);
+	id_ext = b53n_read(b53n, B53N_FLASH_DEVICE_ID_EXT);
+	bcma_awrite32(core, BCMA_IOCTL,
+		      bcma_aread32(core, BCMA_IOCTL) & ~B53N_BCMA_IOCTL_APB_LITTLE_ENDIAN);
+	for (i = 0; i < 5; i++) {
+		if (i < 4)
+			b53n->id_data[i] = (id >> (8 * i)) & 0xff;
+		else
+			b53n->id_data[i] = (id_ext >> (8 * (i - 4))) & 0xff;
+	}
+
+	/* Setup mtd */
+	b53n->mtd.owner = THIS_MODULE;
+	b53n->mtd.priv = &b53n->nand_chip;
+
+	/* Setup nand_chip */
+	b53n->nand_chip.priv = b53n;
+	b53n->nand_chip.read_byte = b53n_nand_read_byte;
+	b53n->nand_chip.select_chip = b53n_nand_select_chip;
+	b53n->nand_chip.cmdfunc = b53n_nand_cmdfunc;
+	b53n->nand_chip.waitfunc = b53n_nand_waitfunc;
+
+	b53n->nand_chip.ecc.mode = NAND_ECC_HW;
+	b53n->nand_chip.ecc.mode = NAND_ECC_NONE;
+	b53n->nand_chip.options = NAND_NO_SUBPAGE_WRITE;
+	if (b53n_read(b53n, B53N_CONFIG_CS0) & B53N_CFG_CS0_DEVICE_WIDTH)
+		b53n->nand_chip.options |= NAND_BUSWIDTH_16;
+
+	err = nand_scan(&b53n->mtd, 1);
+	pr_info("Scanning: %d\n", err);
+
+	//err = mtd_device_parse_register(&b53n->mtd, probes, NULL, NULL, 0);
+	//pr_info("mtd_device_parse_register: %d\n", err);
+
+	pr_info("Device ID: 0x%08X\n", b53n_read(b53n, B53N_FLASH_DEVICE_ID));
+
+	return 0;
+}
+
+/**************************************************
+ * BCMA
+ **************************************************/
+
+static const struct bcma_device_id bcm53xxnflash_bcma_tbl[] = {
+	BCMA_CORE(BCMA_MANUF_BCM, BCMA_CORE_NAND, BCMA_ANY_REV, BCMA_ANY_CLASS),
+	BCMA_CORETABLE_END
+};
+MODULE_DEVICE_TABLE(bcma, bcm53xxnflash_bcma_tbl);
+
+static int bcm53xxnflash_bcma_probe(struct bcma_device *core)
+{
+	struct b53n *b53n;
+	int err;
+
+	if (core->bus->drv_cc.core->id.rev != 42) {
+		pr_err("NAND on SoC with unsupported ChipCommon rev\n");
+		return -ENOTSUPP;
+	}
+
+	if (bcma_read32(core, B53N_FLASH_DEVICE_ID) == 0) {
+		pr_err("Unable to read NAND registers\n");
+		return -ENODEV;
+	}
+
+	b53n = kzalloc(sizeof(*b53n), GFP_KERNEL);
+	if (!b53n)
+		return -ENOMEM;
+	b53n->core = core;
+	bcma_set_drvdata(core, b53n);
+
+	err = b53n_init(b53n);
+	if (err) {
+		bcma_set_drvdata(core, NULL);
+		kfree(b53n);
+		return err;
+	}
+
+	return 0;
+}
+
+static void bcm53xxnflash_bcma_remove(struct bcma_device *core)
+{
+	struct b53n *b53n = bcma_get_drvdata(core);
+
+	kfree(b53n);
+}
+
+static struct bcma_driver bcm53xxnflash_bcma_driver = {
+	.name		= KBUILD_MODNAME,
+	.id_table	= bcm53xxnflash_bcma_tbl,
+	.probe		= bcm53xxnflash_bcma_probe,
+	.remove		= bcm53xxnflash_bcma_remove,
+};
+
+/**************************************************
+ * Init & exit
+ **************************************************/
+
+static int __init bcm53xxnflash_init(void)
+{
+	int err;
+
+	err = bcma_driver_register(&bcm53xxnflash_bcma_driver);
+	if (err)
+		pr_err("Failed to register bcma driver: %d\n", err);
+
+	return err;
+}
+
+static void __exit bcm53xxnflash_exit(void)
+{
+	bcma_driver_unregister(&bcm53xxnflash_bcma_driver);
+}
+
+module_init(bcm53xxnflash_init);
+module_exit(bcm53xxnflash_exit);
diff --git a/drivers/mtd/nand/bcm53xxnflash.h b/drivers/mtd/nand/bcm53xxnflash.h
new file mode 100644
index 0000000..b87be34
--- /dev/null
+++ b/drivers/mtd/nand/bcm53xxnflash.h
@@ -0,0 +1,159 @@
+#ifndef __BCM53XXNFLASH_H
+#define __BCM53XXNFLASH_H
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+
+#define B53N_FLASH_DEVICE_ID			0x194
+#define B53N_REVISION				0x000
+#define B53N_CMD_START				0x004
+#define  B53N_CMD_START_NULL			0x00000000
+#define  B53N_CMD_START_PAGE_RD			0x01000000
+#define  B53N_CMD_START_SPARE_RD		0x02000000
+#define  B53N_CMD_START_STATUS_RD		0x03000000
+#define  B53N_CMD_START_PAGE_PROG		0x04000000
+#define  B53N_CMD_START_SPARE_PROG		0x05000000
+#define  B53N_CMD_START_COPY_BACK		0x06000000
+#define  B53N_CMD_START_ID_RD			0x07000000
+#define  B53N_CMD_START_BLOCK_ERASE		0x08000000
+#define  B53N_CMD_START_FLASH_RESET		0x09000000
+#define  B53N_CMD_START_LOCK			0x0a000000
+#define  B53N_CMD_START_LOCK_DOWN		0x0b000000
+#define  B53N_CMD_START_UNLOCK			0x0c000000
+#define  B53N_CMD_START_LOCK_STATUS		0x0d000000
+#define  B53N_CMD_START_PARAMETER_READ		0x0e000000
+#define  B53N_CMD_START_PARAMETER_CHANGE_COL	0x0f000000
+#define  B53N_CMD_START_LOW_LEVEL_OP		0x10000000
+#define  B53N_CMD_START_PAGE_READ_MULTI		0x11000000
+#define  B53N_CMD_START_STATUS_READ_MULTI	0x12000000
+#define  B53N_CMD_START_OPCODE_MASK		0x1f000000
+#define B53N_CMD_EXT_ADDRESS			0x008
+#define  B53N_CMD_EXT_ADDR_CS_SEL_MASK		0x00070000
+#define  B53N_CMD_EXT_ADDR_CS_SEL_SHIFT		16
+#define  B53N_CMD_EXT_ADDR_EXT_ADDR_MASK	0x0000ffff
+#define B53N_CMD_ADDRESS			0x00c
+#define B53N_CMD_END_ADDRESS			0x010
+#define B53N_INTFC_STATUS			0x014
+#define  B53_INTFC_ST_CTRL_READY		0x80000000
+#define  B53_INTFC_ST_FLASH_READY		0x40000000
+#define  B53_INTFC_ST_CACHE_VALID		0x20000000
+#define  B53_INTFC_ST_SPARE_VALID		0x10000000
+#define  B53_INTFC_ST_ERASED			0x08000000
+#define  B53_INTFC_ST_STATUS			0x000000ff
+#define  B53_INTFC_ST_STATUS_FAIL		0x00000001
+#define B53N_CS_NAND_SELECT			0x018
+#define  B53N_CS_NAND_SEL_NAND_WP		0x20000000
+#define  B53N_CS_NAND_SEL_AUTO_ID_CFG		0x40000000
+#define B53N_CS_NAND_XOR			0x01c
+#define B53N_LL_OP				0x020
+#define B53N_MPLANE_BASE_EXT_ADDRESS		0x024
+#define B53N_MPLANE_BASE_ADDRESS		0x028
+#define B53N_ACC_CONTROL_CS0			0x050
+#define  B53N_A_CTL_CS0_RD_ECC_EN		0x80000000
+#define  B53N_A_CTL_CS0_WR_ECC_EN		0x40000000
+#define  B53N_A_CTL_CS0_RD_ECC_BLK0_EN		0x20000000
+#define  B53N_A_CTL_CS0_FAST_PGM_RDIN		0x10000000
+#define  B53N_A_CTL_CS0_RD_ERASED_ECC_EN	0x08000000
+#define  B53N_A_CTL_CS0_PARTIAL_PAGE_EN		0x04000000
+#define  B53N_A_CTL_CS0_WR_PREEMPT_EN		0x02000000
+#define  B53N_A_CTL_CS0_PAGE_HIT_EN		0x01000000
+#define  B53N_A_CTL_CS0_PREFETCH_EN		0x00800000
+#define  B53N_A_CTL_CS0_CACHE_MODE_EN		0x00400000
+#define  B53N_A_CTL_CS0_CACHE_MODE_LAST_PAGE	0x00200000
+#define  B53N_A_CTL_CS0_ECC_LEVEL_MASK		0x001f0000
+#define  B53N_A_CTL_CS0_ECC_LEVEL_SHIFT		16
+#define  B53N_A_CTL_CS0_SECTOR_SIZE_1K		0x00000080
+#define  B53N_A_CTL_CS0_SPARE_AREA_SIZE		0x0000007f
+#define B53N_CONFIG_CS0				0x054
+#define  B53N_CFG_CS0_CONFIG_LOCK		0x80000000
+#define  B53N_CFG_CS0_BLOCK_SIZE_MASK		0x70000000
+#define  B53N_CFG_CS0_BLOCK_SIZE_SHIFT		28
+#define  B53N_CFG_CS0_DEVICE_SIZE_MASK		0x0f000000
+#define  B53N_CFG_CS0_DEVICE_SIZE_SHIFT		24
+#define  B53N_CFG_CS0_DEVICE_WIDTH		0x00800000
+#define  B53N_CFG_CS0_PAGE_SIZE_MASK		0x00300000
+#define  B53N_CFG_CS0_PAGE_SIZE_SHIFT		20
+#define  B53N_CFG_CS0_FULL_ADDR_BYTES_MASK	0x00070000
+#define  B53N_CFG_CS0_FULL_ADDR_BYTES_SHIFT	16
+#define  B53N_CFG_CS0_COL_ADDR_BYTES_MASK	0x00007000
+#define  B53N_CFG_CS0_COL_ADDR_BYTES_SHIFT	12
+#define  B53N_CFG_CS0_BLK_ADDR_BYTES_MASK	0x00000700
+#define  B53N_CFG_CS0_BLK_ADDR_BYTES_SHIFT	8
+#define B53N_TIMING_1_CS0			0x058
+#define B53N_TIMING_2_CS0			0x05c
+#define B53N_ACC_CONTROL_CS1			0x060
+#define B53N_CONFIG_CS1				0x064
+#define B53N_TIMING_1_CS1			0x068
+#define B53N_TIMING_2_CS1			0x06c
+#define B53N_CORR_STAT_THRESHOLD		0x0c0
+#define B53N_BLK_WR_PROTECT			0x0c8
+#define B53N_MULTIPLANE_OPCODES_1		0x0cc
+#define B53N_MULTIPLANE_OPCODES_2		0x0d0
+#define B53N_MULTIPLANE_CTRL			0x0d4
+#define B53N_UNCORR_ERROR_COUNT			0x0fc
+#define B53N_CORR_ERROR_COUNT			0x100
+#define B53N_READ_ERROR_COUNT			0x104
+#define B53N_BLOCK_LOCK_STATUS			0x108
+#define B53N_ECC_CORR_EXT_ADDR			0x10c
+#define B53N_ECC_CORR_ADDR			0x110
+#define B53N_ECC_UNC_EXT_ADDR			0x114
+#define B53N_ECC_UNC_ADDR			0x118
+#define B53N_FLASH_READ_EXT_ADDR		0x11c
+#define B53N_FLASH_READ_ADDR			0x120
+#define B53N_PROGRAM_PAGE_EXT_ADDR		0x124
+#define B53N_PROGRAM_PAGE_ADDR			0x128
+#define B53N_COPY_BACK_EXT_ADDR			0x12c
+#define B53N_COPY_BACK_ADDR			0x130
+#define B53N_BLOCK_ERASE_EXT_ADDR		0x134
+#define B53N_BLOCK_ERASE_ADDR			0x138
+#define B53N_INV_READ_EXT_ADDR			0x13c
+#define B53N_INV_READ_ADDR			0x140
+#define B53N_INIT_STATUS			0x144
+#define B53N_ONFI_STATUS			0x148
+#define B53N_ONFI_DEBUG_DATA			0x14c
+#define B53N_SEMAPHORE				0x150
+#define B53N_FLASH_DEVICE_ID			0x194
+#define B53N_FLASH_DEVICE_ID_EXT		0x198
+#define B53N_LL_RDDATA				0x19c
+#define B53N_SPARE_AREA_READ_OFS_BASE		0x200 /* 16 registers, up to 0x23c */
+#define B53N_SPARE_AREA_WRITE_OFS_BASE		0x280 /* 16 registers, up to 0x2bc */
+#define B53N_FLASH_CACHE_BASE			0x400 /* 128 registers, up to 0x5fc, access to current sector (512B) */
+#define B53N_DIRECT_READ_RD_MISS		0xf00
+#define B53N_BLOCK_ERASE_COMPLETE		0xf04
+#define B53N_COPY_BACK_COMPLETE			0xf08
+#define B53N_PROGRAM_PAGE_COMPLETE		0xf0c
+#define B53N_NO_CTLR_READY			0xf10
+#define B53N_NAND_RB_B				0xf14
+#define B53N_ECC_MIPS_UNCORR			0xf18
+#define B53N_ECC_MIPS_CORR			0xf1c
+
+/* BCMA core specific IO Control (BCMA_IOCTL) flags */
+#define B53N_BCMA_IOCTL_RO_CTRL_READY		0x00000001
+#define B53N_BCMA_IOCTL_APB_LITTLE_ENDIAN	0x01000000
+
+struct b53n {
+	struct bcma_device *core;
+
+	struct nand_chip nand_chip;
+	struct mtd_info mtd;
+
+	unsigned curr_command;
+	int curr_page_addr;
+	int curr_column;
+
+	u8 id_data[8];
+};
+
+#define b53n_read(b53n, offset) \
+	bcma_read32((b53n)->core, offset)
+#define b53n_write(b53n, offset, val) \
+	bcma_write32((b53n)->core, offset, val)
+
+#define b53n_mask(b53n, offset, mask) \
+	b53n_write(b53n, offset, b53n_read(b53n, offset) & (mask))
+#define b53n_set(b53n, offset, set) \
+	b53n_write(b53n, offset, b53n_read(b53n, offset) | (set))
+#define b53n_maskset(b53n, offset, mask, set) \
+	b53n_write(b53n, offset, (b53n_read(b53n, offset) & (mask)) | (set))
+
+#endif /* BCM53XXNFLASH */
-- 
1.8.4.5

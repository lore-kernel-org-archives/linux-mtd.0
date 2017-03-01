Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cizpJ-0002MT-O2
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 08:41:46 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v2 1/6] nand: spi: Add init/release function
Date: Wed, 1 Mar 2017 16:52:05 +0800
Message-ID: <1488358330-23832-2-git-send-email-peterpandong@micron.com>
In-Reply-To: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the first commit for spi nand framkework.
This commit is to add spi nand initialization and
release functions.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/Kconfig            |   1 +
 drivers/mtd/nand/Makefile           |   1 +
 drivers/mtd/nand/spi/Kconfig        |   5 +
 drivers/mtd/nand/spi/Makefile       |   2 +
 drivers/mtd/nand/spi/spinand_base.c | 469 ++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/spinand_ids.c  |  29 +++
 include/linux/mtd/spinand.h         | 315 ++++++++++++++++++++++++
 7 files changed, 822 insertions(+)
 create mode 100644 drivers/mtd/nand/spi/Kconfig
 create mode 100644 drivers/mtd/nand/spi/Makefile
 create mode 100644 drivers/mtd/nand/spi/spinand_base.c
 create mode 100644 drivers/mtd/nand/spi/spinand_ids.c
 create mode 100644 include/linux/mtd/spinand.h

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 1c1a1f4..7695fd8 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -2,3 +2,4 @@ config MTD_NAND_CORE
 	tristate
 
 source "drivers/mtd/nand/raw/Kconfig"
+source "drivers/mtd/nand/spi/Kconfig"
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index fe430d9..6221958 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
 nandcore-objs :=  bbt.o
 
 obj-y	+= raw/
+obj-$(CONFIG_MTD_SPI_NAND)	+= spi/
diff --git a/drivers/mtd/nand/spi/Kconfig b/drivers/mtd/nand/spi/Kconfig
new file mode 100644
index 0000000..04a7b71
--- /dev/null
+++ b/drivers/mtd/nand/spi/Kconfig
@@ -0,0 +1,5 @@
+menuconfig MTD_SPI_NAND
+	tristate "SPI-NAND device Support"
+	depends on MTD_NAND
+	help
+	  This is the framework for the SPI NAND device drivers.
diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
new file mode 100644
index 0000000..6f0d622
--- /dev/null
+++ b/drivers/mtd/nand/spi/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MTD_SPI_NAND) += spinand_base.o
+obj-$(CONFIG_MTD_SPI_NAND) += spinand_ids.o
diff --git a/drivers/mtd/nand/spi/spinand_base.c b/drivers/mtd/nand/spi/spinand_base.c
new file mode 100644
index 0000000..97d47146
--- /dev/null
+++ b/drivers/mtd/nand/spi/spinand_base.c
@@ -0,0 +1,469 @@
+/**
+* spi-nand-base.c
+*
+* Copyright (c) 2009-2017 Micron Technology, Inc.
+*
+* This program is free software; you can redistribute it and/or
+* modify it under the terms of the GNU General Public License
+* as published by the Free Software Foundation; either version 2
+* of the License, or (at your option) any later version.
+*
+* This program is distributed in the hope that it will be useful,
+* but WITHOUT ANY WARRANTY; without even the implied warranty of
+* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+* GNU General Public License for more details.
+*/
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/mtd/spinand.h>
+#include <linux/slab.h>
+
+
+static u64 spinand_get_chip_size(struct spinand_device *chip)
+{
+	struct nand_device *nand = &chip->base;
+
+	return nand_diesize(nand) * nand_ndies(nand);
+}
+
+static inline int spinand_exec_cmd(struct spinand_device *chip,
+				struct spinand_op *cmd)
+{
+	return chip->controller.ops->exec_op(chip, cmd);
+}
+
+static inline void spinand_op_init(struct spinand_op *op)
+{
+	memset(op, 0, sizeof(struct spinand_op));
+	op->addr_nbits = 1;
+	op->data_nbits = 1;
+}
+
+/**
+ * spinand_read_reg - send command 0Fh to read register
+ * @chip: SPI-NAND device structure
+ * @reg; register to read
+ * @buf: buffer to store value
+ */
+static int spinand_read_reg(struct spinand_device *chip,
+			uint8_t reg, uint8_t *buf)
+{
+	struct spinand_op cmd;
+	int ret;
+
+	spinand_op_init(&cmd);
+	cmd.cmd = SPINAND_CMD_GET_FEATURE;
+	cmd.n_addr = 1;
+	cmd.addr[0] = reg;
+	cmd.n_rx = 1;
+	cmd.rx_buf = buf;
+
+	ret = spinand_exec_cmd(chip, &cmd);
+	if (ret < 0)
+		pr_err("err: %d read register %d\n", ret, reg);
+
+	return ret;
+}
+
+/**
+ * spinand_write_reg - send command 1Fh to write register
+ * @chip: SPI-NAND device structure
+ * @reg; register to write
+ * @buf: buffer stored value
+ */
+static int spinand_write_reg(struct spinand_device *chip,
+			uint8_t reg, uint8_t *buf)
+{
+	struct spinand_op cmd;
+	int ret;
+
+	spinand_op_init(&cmd);
+	cmd.cmd = SPINAND_CMD_SET_FEATURE;
+	cmd.n_addr = 1;
+	cmd.addr[0] = reg;
+	cmd.n_tx = 1,
+	cmd.tx_buf = buf,
+
+	ret = spinand_exec_cmd(chip, &cmd);
+	if (ret < 0)
+		pr_err("err: %d write register %d\n", ret, reg);
+
+	return ret;
+}
+
+/**
+ * spinand_read_status - get status register value
+ * @chip: SPI-NAND device structure
+ * @status: buffer to store value
+ * Description:
+ *   After read, write, or erase, the Nand device is expected to set the
+ *   busy status.
+ *   This function is to allow reading the status of the command: read,
+ *   write, and erase.
+ *   Once the status turns to be ready, the other status bits also are
+ *   valid status bits.
+ */
+static int spinand_read_status(struct spinand_device *chip, uint8_t *status)
+{
+	return spinand_read_reg(chip, REG_STATUS, status);
+}
+
+/**
+ * spinand_wait - wait until the command is done
+ * @chip: SPI-NAND device structure
+ * @s: buffer to store status register(can be NULL)
+ */
+static int spinand_wait(struct spinand_device *chip, u8 *s)
+{
+	unsigned long timeo = msecs_to_jiffies(400);
+	u8 status;
+
+	do {
+		spinand_read_status(chip, &status);
+		if ((status & STATUS_OIP_MASK) == STATUS_READY)
+			goto out;
+	} while (time_before(jiffies, timeo));
+
+	/*
+	 * Extra read, just in case the STATUS_READY bit has changed
+	 * since out last check
+	 */
+	spinand_read_status(chip, &status);
+out:
+	if (s)
+		*s = status;
+
+	return (status & STATUS_OIP_MASK) == STATUS_READY ? 0 :	-ETIMEDOUT;;
+}
+
+/**
+ * spinand_read_id - send 9Fh command to get ID
+ * @chip: SPI-NAND device structure
+ * @buf: buffer to store id
+ */
+static int spinand_read_id(struct spinand_device *chip, u8 *buf)
+{
+	struct spinand_op cmd;
+
+	spinand_op_init(&cmd);
+	cmd.cmd = SPINAND_CMD_READ_ID;
+	if (chip->manufacturer.ops->get_dummy)
+		cmd.dummy_bytes = chip->manufacturer.ops->get_dummy(chip, &cmd);
+	cmd.n_rx = 2;
+	cmd.rx_buf = buf;
+
+	return spinand_exec_cmd(chip, &cmd);
+}
+
+/**
+ * spinand_reset - send command FFh to reset chip.
+ * @chip: SPI-NAND device structure
+ */
+static int spinand_reset(struct spinand_device *chip)
+{
+	struct spinand_op cmd;
+	int ret;
+
+	spinand_op_init(&cmd);
+	cmd.cmd = SPINAND_CMD_RESET;
+
+	ret = spinand_exec_cmd(chip, &cmd);
+	if (ret < 0) {
+		pr_err("spinand reset failed!\n");
+		goto out;
+	}
+	ret = spinand_wait(chip, NULL);
+out:
+	return ret;
+}
+
+/**
+ * spinand_lock_block - write block lock register to
+ * lock/unlock device
+ * @spi: spi device structure
+ * @lock: value to set to block lock register
+ * Description:
+ *   After power up, all the Nand blocks are locked.  This function allows
+ *   one to unlock the blocks, and so it can be written or erased.
+ */
+static int spinand_lock_block(struct spinand_device *chip, u8 lock)
+{
+	return spinand_write_reg(chip, REG_BLOCK_LOCK, &lock);
+}
+
+/**
+ * spinand_scan_id_table - scan chip info in id table
+ * @chip: SPI-NAND device structure
+ * @id: point to manufacture id and device id
+ * Description:
+ *   If found in id table, config chip with table information.
+ */
+static bool spinand_scan_id_table(struct spinand_device *chip, u8 *id)
+{
+	struct nand_device *nand = &chip->base;
+	struct spinand_flash *type = spinand_table;
+	struct nand_memory_organization *memorg = &nand->memorg;
+	struct spinand_ecc_engine *ecc_engine = &chip->ecc_engine;
+
+	for (; type->name; type++) {
+		if (id[0] == type->mfr_id && id[1] == type->dev_id) {
+			chip->name = type->name;
+			memorg->eraseblocksize = type->page_size
+					* type->pages_per_blk;
+			memorg->pagesize = type->page_size;
+			memorg->oobsize = type->oob_size;
+			memorg->diesize =
+				memorg->eraseblocksize * type->blks_per_lun;
+			memorg->ndies = type->luns_per_chip;
+			ecc_engine->strength = type->ecc_strength;
+			chip->rw_mode = type->rw_mode;
+
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/**
+ * spinand_set_rd_wr_op - Chose the best read write command
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   Chose the fastest r/w command according to spi controller's ability.
+ * Note:
+ *   If 03h/0Bh follows SPI NAND protocol, there is no difference,
+ *   while if follows SPI NOR protocol, 03h command is working under
+ *   <=20Mhz@3.3V,<=5MHz@1.8V; 0Bh command is working under
+ *   133Mhz@3.3v, 83Mhz@1.8V.
+ */
+static void spinand_set_rd_wr_op(struct spinand_device *chip)
+{
+	u32 controller_cap = chip->controller.caps;
+	u32 rw_mode = chip->rw_mode;
+
+	if ((controller_cap & SPINAND_CAP_RD_QUAD) && (rw_mode & SPINAND_RD_QUAD))
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_QUAD_IO;
+	else if ((controller_cap & SPINAND_CAP_RD_X4) && (rw_mode & SPINAND_RD_X4))
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_X4;
+	else if ((controller_cap & SPINAND_CAP_RD_DUAL) && (rw_mode & SPINAND_RD_DUAL))
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_DUAL_IO;
+	else if ((controller_cap & SPINAND_CAP_RD_X2) && (rw_mode & SPINAND_RD_X2))
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_X2;
+	else
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_FAST;
+
+	if ((controller_cap & SPINAND_CAP_WR_X4) && (rw_mode & SPINAND_WR_X4))
+		chip->write_cache_op = SPINAND_CMD_PROG_LOAD_X4;
+	else
+		chip->write_cache_op = SPINAND_CMD_PROG_LOAD;
+}
+
+/*
+ * Manufacturer detection. Only used when the NAND is not ONFI or JEDEC
+ * compliant and does not have a full-id or legacy-id entry in the nand_ids
+ * table.
+ */
+static bool spinand_manufacturer_detect(struct spinand_device *chip)
+{
+	if (chip->manufacturer.ops && chip->manufacturer.ops->detect)
+		return chip->manufacturer.ops->detect(chip);
+	return false;
+}
+
+/*
+ * Manufacturer initialization. This function is called for all NANDs including
+ * ONFI and JEDEC compliant ones.
+ * Manufacturer drivers should put all their specific initialization code in
+ * their ->init() hook.
+ */
+static int spinand_manufacturer_init(struct spinand_device *chip)
+{
+	if (chip->manufacturer.ops && chip->manufacturer.ops->init)
+		return chip->manufacturer.ops->init(chip);
+
+	return 0;
+}
+
+/*
+ * Manufacturer cleanup. This function is called for all NANDs including
+ * ONFI and JEDEC compliant ones.
+ * Manufacturer drivers should put all their specific cleanup code in their
+ * ->cleanup() hook.
+ */
+static void spinand_manufacturer_cleanup(struct spinand_device *chip)
+{
+	/* Release manufacturer private data */
+	if (chip->manufacturer.ops && chip->manufacturer.ops->cleanup)
+		return chip->manufacturer.ops->cleanup(chip);
+}
+
+static void spinand_fill_id(struct spinand_device *chip, u8 *id)
+{
+	memcpy(chip->id.data, id, SPINAND_MAX_ID_LEN);
+	chip->id.len = SPINAND_MAX_ID_LEN;
+}
+
+static u8 spinand_get_mfr_id(struct spinand_device *chip)
+{
+	return chip->id.data[SPINAND_MFR_ID];
+}
+
+static u8 spinand_get_dev_id(struct spinand_device *chip)
+{
+	return chip->id.data[SPINAND_DEV_ID];
+}
+
+static void spinand_set_manufacturer_ops(struct spinand_device *chip, u8 mfr_id)
+{
+	int i = 0;
+
+	for (; spinand_manuf_ids[i].id != 0x0; i++) {
+		if (spinand_manuf_ids[i].id == mfr_id)
+			break;
+	}
+	chip->manufacturer.ops = spinand_manuf_ids[i].ops;
+}
+
+/**
+ * spinand_scan_ident - [SPI-NAND Interface] Scan for the SPI-NAND device
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   This is the first phase of the initiazation. It reads the flash ID and
+ *   sets up spinand_device fields accordingly.
+ */
+int spinand_scan_ident(struct spinand_device *chip, u8 expect_mfr_id)
+{
+	struct nand_device *nand = &chip->base;
+	u8 id[SPINAND_MAX_ID_LEN] = {0};
+	int id_retry = 2;
+
+	spinand_set_manufacturer_ops(chip, expect_mfr_id);
+	spinand_reset(chip);
+read_id:
+	spinand_read_id(chip, id);
+	if (spinand_scan_id_table(chip, id))
+		goto ident_done;
+	if (id_retry--)
+		goto read_id;
+	pr_info("SPI-NAND type mfr_id: %x, dev_id: %x is not in id table.\n",
+				id[SPINAND_MFR_ID], id[SPINAND_DEV_ID]);
+	if (spinand_manufacturer_detect(chip))
+		goto ident_done;
+
+	return -ENODEV;
+
+ident_done:
+	spinand_fill_id(chip, id);
+
+	pr_info("SPI-NAND: %s is found.\n", chip->name);
+	pr_info("Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
+		spinand_get_mfr_id(chip), spinand_get_dev_id(chip));
+	pr_info("%d MiB, block size: %d KiB, page size: %d, OOB size: %d\n",
+		(int)(spinand_get_chip_size(chip) >> 20), nand_eraseblock_size(nand) >> 10,
+		nand_page_size(nand), nand_per_page_oobsize(nand));
+	spinand_set_manufacturer_ops(chip, spinand_get_mfr_id(chip));
+	spinand_manufacturer_init(chip);
+	spinand_set_rd_wr_op(chip);
+
+	chip->buf = kzalloc(nand_page_size(nand) + nand_per_page_oobsize(nand), GFP_KERNEL);
+	if (!chip->buf)
+		return -ENOMEM;
+
+	chip->oobbuf = chip->buf + nand_page_size(nand);
+	spinand_lock_block(chip, BL_ALL_UNLOCKED);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spinand_scan_ident);
+
+/**
+ * spinand_scan_tail - [SPI-NAND Interface] Scan for the SPI-NAND device
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   This is the second phase of the initiazation. It fills out all the
+ *   uninitialized fields of spinand_device and mtd fields.
+ */
+int spinand_scan_tail(struct spinand_device *chip)
+{
+	struct mtd_info *mtd = spinand_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct spinand_ecc_engine *ecc_engine = &chip->ecc_engine;
+	int ret;
+
+	mutex_init(&chip->lock);
+
+	mtd->name = chip->name;
+	mtd->size = spinand_get_chip_size(chip);
+	mtd->erasesize = nand_eraseblock_size(nand);
+	mtd->writesize = nand_page_size(nand);
+	mtd->writebufsize = mtd->writesize;
+	mtd->owner = THIS_MODULE;
+	mtd->type = MTD_NANDFLASH;
+	mtd->flags = MTD_CAP_NANDFLASH;
+	if (!mtd->ecc_strength)
+		mtd->ecc_strength = ecc_engine->strength ?
+				    ecc_engine->strength : 1;
+
+	mtd->oobsize = nand_per_page_oobsize(nand);
+	ret = mtd_ooblayout_count_freebytes(mtd);
+	if (ret < 0)
+		ret = 0;
+	mtd->oobavail = ret;
+
+	if (!mtd->bitflip_threshold)
+		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spinand_scan_tail);
+
+/**
+ * spinand_scan_ident_release - [SPI-NAND Interface] Free resources
+ * applied by spinand_scan_ident
+ * @chip: SPI-NAND device structure
+ */
+int spinand_scan_ident_release(struct spinand_device *chip)
+{
+	spinand_manufacturer_cleanup(chip);
+	kfree(chip->buf);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spinand_scan_ident_release);
+
+/**
+ * spinand_scan_tail_release - [SPI-NAND Interface] Free resources
+ * applied by spinand_scan_tail
+ * @chip: SPI-NAND device structure
+ */
+int spinand_scan_tail_release(struct spinand_device *chip)
+{
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spinand_scan_tail_release);
+
+/**
+ * spinand_release - [SPI-NAND Interface] Free resources held by the SPI-NAND
+ * device
+ * @chip: SPI-NAND device structure
+ */
+int spinand_release(struct spinand_device *chip)
+{
+	struct mtd_info *mtd = spinand_to_mtd(chip);
+
+	mtd_device_unregister(mtd);
+	spinand_manufacturer_cleanup(chip);
+	kfree(chip->buf);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spinand_release);
+
+MODULE_DESCRIPTION("SPI NAND framework");
+MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/mtd/nand/spi/spinand_ids.c b/drivers/mtd/nand/spi/spinand_ids.c
new file mode 100644
index 0000000..7706ae3
--- /dev/null
+++ b/drivers/mtd/nand/spi/spinand_ids.c
@@ -0,0 +1,29 @@
+/**
+* spi-nand-base.c
+*
+* Copyright (c) 2009-2017 Micron Technology, Inc.
+*
+* This program is free software; you can redistribute it and/or
+* modify it under the terms of the GNU General Public License
+* as published by the Free Software Foundation; either version 2
+* of the License, or (at your option) any later version.
+*
+* This program is distributed in the hope that it will be useful,
+* but WITHOUT ANY WARRANTY; without even the implied warranty of
+* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+* GNU General Public License for more details.
+*/
+
+#include <linux/module.h>
+#include <linux/mtd/spinand.h>
+
+struct spinand_flash spinand_table[] = {
+	{.name = NULL},
+};
+
+
+struct spinand_manufacturer spinand_manuf_ids[] = {
+	{0x0, "Unknown"}
+};
+
+EXPORT_SYMBOL(spinand_manuf_ids);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
new file mode 100644
index 0000000..f3d0351
--- /dev/null
+++ b/include/linux/mtd/spinand.h
@@ -0,0 +1,315 @@
+/**
+* spinand.h
+*
+* Copyright (c) 2009-2017 Micron Technology, Inc.
+*
+* This program is free software; you can redistribute it and/or
+* modify it under the terms of the GNU General Public License
+* as published by the Free Software Foundation; either version 2
+* of the License, or (at your option) any later version.
+*
+* This program is distributed in the hope that it will be useful,
+* but WITHOUT ANY WARRANTY; without even the implied warranty of
+* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+* GNU General Public License for more details.
+*/
+#ifndef __LINUX_MTD_SPINAND_H
+#define __LINUX_MTD_SPINAND_H
+
+#include <linux/wait.h>
+#include <linux/spinlock.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/flashchip.h>
+#include <linux/mtd/nand.h>
+
+/*
+ * Standard SPI-NAND flash commands
+ */
+#define SPINAND_CMD_RESET			0xff
+#define SPINAND_CMD_GET_FEATURE			0x0f
+#define SPINAND_CMD_SET_FEATURE			0x1f
+#define SPINAND_CMD_PAGE_READ			0x13
+#define SPINAND_CMD_READ_PAGE_CACHE_RDM		0x30
+#define SPINAND_CMD_READ_PAGE_CACHE_LAST	0x3f
+#define SPINAND_CMD_READ_FROM_CACHE		0x03
+#define SPINAND_CMD_READ_FROM_CACHE_FAST	0x0b
+#define SPINAND_CMD_READ_FROM_CACHE_X2		0x3b
+#define SPINAND_CMD_READ_FROM_CACHE_DUAL_IO	0xbb
+#define SPINAND_CMD_READ_FROM_CACHE_X4		0x6b
+#define SPINAND_CMD_READ_FROM_CACHE_QUAD_IO	0xeb
+#define SPINAND_CMD_BLK_ERASE			0xd8
+#define SPINAND_CMD_PROG_EXC			0x10
+#define SPINAND_CMD_PROG_LOAD			0x02
+#define SPINAND_CMD_PROG_LOAD_RDM_DATA		0x84
+#define SPINAND_CMD_PROG_LOAD_X4		0x32
+#define SPINAND_CMD_PROG_LOAD_RDM_DATA_X4	0x34
+#define SPINAND_CMD_READ_ID			0x9f
+#define SPINAND_CMD_WR_DISABLE			0x04
+#define SPINAND_CMD_WR_ENABLE			0x06
+#define SPINAND_CMD_END				0x0
+
+
+/* feature registers */
+#define REG_BLOCK_LOCK		0xa0
+#define REG_CFG			0xb0
+#define REG_STATUS		0xc0
+#define REG_DIE_SELECT		0xd0
+
+/* status */
+#define STATUS_OIP_MASK		0x01
+#define STATUS_CRBSY_MASK	0x80
+#define STATUS_READY		(0 << 0)
+#define STATUS_BUSY		(1 << 0)
+
+#define STATUS_E_FAIL_MASK	0x04
+#define STATUS_E_FAIL		(1 << 2)
+
+#define STATUS_P_FAIL_MASK	0x08
+#define STATUS_P_FAIL		(1 << 3)
+
+
+/*Configuration register defines*/
+#define CFG_QE_MASK		0x01
+#define CFG_QE_ENABLE		0x01
+#define CFG_ECC_MASK		0x10
+#define CFG_ECC_ENABLE		0x10
+#define CFG_LOT_MASK		0x20
+#define CFG_LOT_ENABLE		0x20
+#define CFG_OTP_MASK		0xc2
+#define CFG_OTP_ENTER		0x40
+#define CFG_OTP_EXIT		0x00
+
+/* block lock */
+#define BL_ALL_LOCKED		0x7c
+#define BL_U_1_1024_LOCKED		0x08
+#define BL_U_1_512_LOCKED		0x10
+#define BL_U_1_256_LOCKED		0x18
+#define BL_U_1_128_LOCKED		0x20
+#define BL_U_1_64_LOCKED		0x28
+#define BL_U_1_32_LOCKED		0x30
+#define BL_U_1_16_LOCKED		0x38
+#define BL_U_1_8_LOCKED		0x40
+#define BL_U_1_4_LOCKED		0x48
+#define BL_U_1_2_LOCKED		0x50
+#define BL_L_1_1024_LOCKED		0x0c
+#define BL_L_1_512_LOCKED		0x14
+#define BL_L_1_256_LOCKED		0x1c
+#define BL_L_1_128_LOCKED		0x24
+#define BL_L_1_64_LOCKED		0x2c
+#define BL_L_1_32_LOCKED		0x34
+#define BL_L_1_16_LOCKED		0x3c
+#define BL_L_1_8_LOCKED		0x44
+#define BL_L_1_4_LOCKED		0x4c
+#define BL_L_1_2_LOCKED		0x54
+#define BL_ALL_UNLOCKED		0X00
+
+/* die select */
+#define DIE_SELECT_MASK		0x40
+#define DIE_SELECT_DS0		0x00
+#define DIE_SELECT_DS1		0x40
+
+
+struct spinand_op;
+struct spinand_device;
+
+#define SPINAND_MAX_ID_LEN		2
+/**
+ * struct nand_id - NAND id structure
+ * @data: buffer containing the id bytes. Currently 8 bytes large, but can
+ *	  be extended if required.
+ * @len: ID length.
+ */
+struct spinand_id {
+	#define SPINAND_MFR_ID		0
+	#define SPINAND_DEV_ID		1
+	u8 data[SPINAND_MAX_ID_LEN];
+	int len;
+};
+
+struct spinand_controller_ops {
+	int (*exec_op)(struct spinand_device *chip,
+		       struct spinand_op *op);
+};
+
+struct spinand_manufacturer_ops {
+	bool(*detect)(struct spinand_device *chip);
+	int (*init)(struct spinand_device *chip);
+	void (*cleanup)(struct spinand_device *chip);
+	int (*get_dummy)(struct spinand_device *chip, struct spinand_op *op);
+};
+
+struct spinand_manufacturer {
+	u8 id;
+	char *name;
+	struct spinand_manufacturer_ops *ops;
+};
+
+extern struct spinand_manufacturer spinand_manuf_ids[];
+
+struct spinand_ecc_engine_ops {
+	void (*get_ecc_status)(struct spinand_device *chip, unsigned int status,
+	                       unsigned int *corrected, unsigned int *ecc_errors);
+	void (*disable_ecc)(struct spinand_device *chip);
+	void (*enable_ecc)(struct spinand_device *chip);
+};
+
+typedef enum {
+	SPINAND_ECC_ONDIE,
+	SPINAND_ECC_HW,
+} spinand_ecc_modes_t;
+
+
+struct spinand_ecc_engine {
+	spinand_ecc_modes_t mode;
+	u32 strength;
+	u32 steps;
+	struct spinand_ecc_engine_ops *ops;
+};
+
+/**
+ * struct spinand_device - SPI-NAND Private Flash Chip Data
+ * @base: NAND device instance
+ * @lock: protection lock
+ * @name: name of the chip
+ * @id: ID structure
+ * @read_cache_op: Opcode of read from cache
+ * @write_cache_op: Opcode of program load
+ * @buf: buffer for read/write data
+ * @oobbuf: buffer for read/write oob
+ * @rw_mode: read/write mode of SPI NAND chip
+ * @controller: SPI NAND controller instance
+ * @manufacturer: SPI NAND manufacturer instance, describe
+ *                manufacturer related objects
+ * @ecc_engine: SPI NAND ECC engine instance
+ */
+struct spinand_device {
+	struct nand_device base;
+	struct mutex lock;
+	char *name;
+	struct spinand_id id;
+	u8 read_cache_op;
+	u8 write_cache_op;
+	u8 *buf;
+	u8 *oobbuf;
+	u32 rw_mode;
+	struct {
+		struct spinand_controller_ops *ops;
+#define SPINAND_CAP_RD_X1 (1 << 0)
+#define SPINAND_CAP_RD_X2 (1 << 1)
+#define SPINAND_CAP_RD_X4 (1 << 2)
+#define SPINAND_CAP_RD_DUAL (1 << 3)
+#define SPINAND_CAP_RD_QUAD (1 << 4)
+#define SPINAND_CAP_WR_X1 (1 << 5)
+#define SPINAND_CAP_WR_X2 (1 << 6)
+#define SPINAND_CAP_WR_X4 (1 << 7)
+#define SPINAND_CAP_WR_DUAL (1 << 8)
+#define SPINAND_CAP_WR_QUAD (1 << 9)
+#define SPINAND_CAP_HW_ECC (1 << 10)
+		u32 caps;
+		void *priv;
+	} controller;
+	struct {
+		struct spinand_manufacturer_ops *ops;
+		void *priv;
+	} manufacturer;
+	struct spinand_ecc_engine ecc_engine;
+};
+
+static inline struct spinand_device *mtd_to_spinand(struct mtd_info *mtd)
+{
+	return container_of(mtd_to_nand(mtd), struct spinand_device, base);
+}
+
+static inline struct mtd_info *spinand_to_mtd(struct spinand_device *chip)
+{
+	return nand_to_mtd(&chip->base);
+}
+
+static inline void spinand_set_controller_data(struct spinand_device *chip,
+					            void *data)
+{
+	chip->controller.priv = data;
+}
+
+static inline void *spinand_get_controller_data(struct spinand_device *chip)
+{
+	return chip->controller.priv;
+}
+
+
+struct spinand_flash {
+	char *name;
+	u8 mfr_id;
+	u8 dev_id;
+	u32 page_size;
+	u32 oob_size;
+	u32 pages_per_blk;
+	u32 blks_per_lun;
+	u32 luns_per_chip;
+	u32 ecc_strength;
+	u32 options;
+	u32 rw_mode;
+};
+
+extern struct spinand_flash spinand_table[];
+
+#define SPINAND_MAX_ADDR_LEN		4
+
+struct spinand_op {
+	u8 cmd;
+	u8 n_addr;
+	u8 addr_nbits;
+	u8 dummy_bytes;
+	u8 addr[SPINAND_MAX_ADDR_LEN];
+	u32 n_tx;
+	const u8 *tx_buf;
+	u32 n_rx;
+	u8 *rx_buf;
+	u8 data_nbits;
+};
+
+struct spinand_op_def {
+	u8 opcode;
+	u8 addr_bytes;
+	u8 addr_bits;
+	u8 dummy_bytes;
+	u8 data_bits;
+};
+
+/* SPI NAND supported OP mode */
+#define SPINAND_RD_X1		0x00000001
+#define SPINAND_RD_X2		0x00000002
+#define SPINAND_RD_X4		0x00000004
+#define SPINAND_RD_DUAL		0x00000008
+#define SPINAND_RD_QUAD		0x00000010
+#define SPINAND_WR_X1		0x00000020
+#define SPINAND_WR_X2		0x00000040
+#define SPINAND_WR_X4		0x00000080
+#define SPINAND_WR_DUAL		0x00000100
+#define SPINAND_WR_QUAD		0x00000200
+
+#define SPINAND_RD_COMMON	SPINAND_RD_X1 | SPINAND_RD_X2 | \
+				SPINAND_RD_X4 | SPINAND_RD_DUAL | \
+				SPINAND_RD_QUAD
+#define SPINAND_WR_COMMON	SPINAND_WR_X1 | SPINAND_WR_X4
+#define SPINAND_OP_COMMON	SPINAND_RD_COMMON | SPINAND_WR_COMMON
+
+#define SPI_NAND_INFO(nm, mid, did, pagesz, oobsz, pg_per_blk,\
+	blk_per_lun, lun_per_chip, ecc_stren, rwmode)	\
+	{ .name = (nm), .mfr_id = (mid), .dev_id = (did),\
+	.page_size = (pagesz), .oob_size = (oobsz),\
+	.pages_per_blk = (pg_per_blk), .blks_per_lun = (blk_per_lun),\
+	.luns_per_chip = (lun_per_chip), .ecc_strength = (ecc_stren),\
+	.rw_mode = (rwmode) }
+
+/*SPI NAND manufacture ID definition*/
+#define SPINAND_MFR_MICRON		0x2C
+
+int spinand_scan_ident(struct spinand_device *chip, u8 expect_mfr_id);
+int spinand_scan_tail(struct spinand_device *chip);
+int spinand_scan_ident_release(struct spinand_device *chip);
+int spinand_scan_tail_release(struct spinand_device *chip);
+int spinand_release(struct spinand_device *chip);
+int spinand_set_cmd_cfg_table(int mfr);
+struct spinand_op_def *spinand_get_cmd_cfg(u8 opcode);
+#endif /* __LINUX_MTD_SPINAND_H */
-- 
1.9.1

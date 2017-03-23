Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqz6z-0000y9-CV
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 09:33:07 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@atmel.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v4 4/9] nand: spi: add basic blocks for infrastructure
Date: Thu, 23 Mar 2017 17:43:41 +0800
Message-ID: <1490262226-29092-5-git-send-email-peterpandong@micron.com>
In-Reply-To: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
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
This commit is to add add basic building blocks
for the SPI NAND infrastructure.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/Kconfig            |   1 +
 drivers/mtd/nand/Makefile           |   1 +
 drivers/mtd/nand/spi/Kconfig        |   5 +
 drivers/mtd/nand/spi/Makefile       |   2 +
 drivers/mtd/nand/spi/core.c         | 464 ++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/manufactures.c |  24 ++
 include/linux/mtd/spinand.h         | 270 +++++++++++++++++++++
 7 files changed, 767 insertions(+)
 create mode 100644 drivers/mtd/nand/spi/Kconfig
 create mode 100644 drivers/mtd/nand/spi/Makefile
 create mode 100644 drivers/mtd/nand/spi/core.c
 create mode 100644 drivers/mtd/nand/spi/manufactures.c
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
index 0000000..d77c46e
--- /dev/null
+++ b/drivers/mtd/nand/spi/Kconfig
@@ -0,0 +1,5 @@
+menuconfig MTD_SPI_NAND
+	tristate "SPI NAND device Support"
+	depends on MTD_NAND
+	help
+	  This is the framework for the SPI NAND device drivers.
diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
new file mode 100644
index 0000000..eabdb81
--- /dev/null
+++ b/drivers/mtd/nand/spi/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MTD_SPI_NAND) += core.o
+obj-$(CONFIG_MTD_SPI_NAND) += manufactures.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
new file mode 100644
index 0000000..d1ac522
--- /dev/null
+++ b/drivers/mtd/nand/spi/core.c
@@ -0,0 +1,464 @@
+/*
+ *
+ * Copyright (c) 2009-2017 Micron Technology, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#define pr_fmt(fmt) "SPI NAND: " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/jiffies.h>
+#include <linux/mtd/spinand.h>
+#include <linux/slab.h>
+
+/*
+ * spinand_exec_op - execute SPI NAND operation by controller ->exec_op() hook
+ * @chip: SPI NAND device structure
+ * @op: pointer to spinand_op struct
+ */
+static inline int spinand_exec_op(struct spinand_device *chip,
+				  struct spinand_op *op)
+{
+	return chip->controller.controller->ops->exec_op(chip, op);
+}
+
+/*
+ * spinand_op_init - initialize spinand_op struct
+ * @op: pointer to spinand_op struct
+ */
+static inline void spinand_op_init(struct spinand_op *op)
+{
+	memset(op, 0, sizeof(struct spinand_op));
+	op->addr_nbits = 1;
+	op->data_nbits = 1;
+}
+
+/*
+ * spinand_read_reg - send command 0Fh to read register
+ * @chip: SPI NAND device structure
+ * @reg; register to read
+ * @buf: buffer to store value
+ */
+static int spinand_read_reg(struct spinand_device *chip, u8 reg, u8 *buf)
+{
+	struct spinand_op op;
+	int ret;
+
+	spinand_op_init(&op);
+	op.cmd = SPINAND_CMD_GET_FEATURE;
+	op.n_addr = 1;
+	op.addr[0] = reg;
+	op.n_rx = 1;
+	op.rx_buf = buf;
+
+	ret = spinand_exec_op(chip, &op);
+	if (ret < 0)
+		pr_err("err: %d read register %d\n", ret, reg);
+
+	return ret;
+}
+
+/*
+ * spinand_write_reg - send command 1Fh to write register
+ * @chip: SPI NAND device structure
+ * @reg; register to write
+ * @buf: buffer stored value
+ */
+static int spinand_write_reg(struct spinand_device *chip, u8 reg, u8 *buf)
+{
+	struct spinand_op op;
+	int ret;
+
+	spinand_op_init(&op);
+	op.cmd = SPINAND_CMD_SET_FEATURE;
+	op.n_addr = 1;
+	op.addr[0] = reg;
+	op.n_tx = 1,
+	op.tx_buf = buf,
+
+	ret = spinand_exec_op(chip, &op);
+	if (ret < 0)
+		pr_err("err: %d write register %d\n", ret, reg);
+
+	return ret;
+}
+
+/*
+ * spinand_read_status - get status register value
+ * @chip: SPI NAND device structure
+ * @status: buffer to store value
+ * Description:
+ *   After read, write, or erase, the NAND device is expected to set the
+ *   busy status.
+ *   This function is to allow reading the status of the command: read,
+ *   write, and erase.
+ */
+static int spinand_read_status(struct spinand_device *chip, uint8_t *status)
+{
+	return spinand_read_reg(chip, REG_STATUS, status);
+}
+
+/*
+ * spinand_wait - wait until the command is done
+ * @chip: SPI NAND device structure
+ * @s: buffer to store status register value (can be NULL)
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
+	 * since our last check
+	 */
+	spinand_read_status(chip, &status);
+out:
+	if (s)
+		*s = status;
+
+	return (status & STATUS_OIP_MASK) == STATUS_READY ? 0 :	-ETIMEDOUT;
+}
+
+/*
+ * spinand_read_id - send 9Fh command to get ID
+ * @chip: SPI NAND device structure
+ * @buf: buffer to store id
+ * Description:
+ *   Manufacturers' read ID method is not unique. Some need a dummy before
+ *   reading, some's ID has three byte.
+ *   This function send one byte opcode (9Fh) and then read
+ *   SPINAND_MAX_ID_LEN (4 currently) bytes. Manufacturer's detect function
+ *   need to filter out real ID from the 4 bytes.
+ */
+static int spinand_read_id(struct spinand_device *chip, u8 *buf)
+{
+	struct spinand_op op;
+
+	spinand_op_init(&op);
+	op.cmd = SPINAND_CMD_READ_ID;
+	op.n_rx = SPINAND_MAX_ID_LEN;
+	op.rx_buf = buf;
+
+	return spinand_exec_op(chip, &op);
+}
+
+/*
+ * spinand_reset - reset device by FFh command.
+ * @chip: SPI NAND device structure
+ */
+static int spinand_reset(struct spinand_device *chip)
+{
+	struct spinand_op op;
+	int ret;
+
+	spinand_op_init(&op);
+	op.cmd = SPINAND_CMD_RESET;
+
+	ret = spinand_exec_op(chip, &op);
+	if (ret < 0) {
+		pr_err("spinand reset failed!\n");
+		goto out;
+	}
+	ret = spinand_wait(chip, NULL);
+
+out:
+	return ret;
+}
+
+/*
+ * spinand_lock_block - write block lock register to lock/unlock device
+ * @chip: SPI NAND device structure
+ * @lock: value to set to block lock register
+ */
+static int spinand_lock_block(struct spinand_device *chip, u8 lock)
+{
+	return spinand_write_reg(chip, REG_BLOCK_LOCK, &lock);
+}
+
+/*
+ * spinand_set_rd_wr_op - choose the best read write command
+ * @chip: SPI NAND device structure
+ * Description:
+ *   Chose the fastest r/w command according to spi controller's and
+ *   device's ability.
+ */
+static void spinand_set_rd_wr_op(struct spinand_device *chip)
+{
+	u32 controller_cap = chip->controller.controller->caps;
+	u32 rw_mode = chip->rw_mode;
+
+	if ((controller_cap & SPINAND_CAP_RD_QUAD) &&
+	    (rw_mode & SPINAND_RD_QUAD))
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_QUAD_IO;
+	else if ((controller_cap & SPINAND_CAP_RD_X4) &&
+		 (rw_mode & SPINAND_RD_X4))
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_X4;
+	else if ((controller_cap & SPINAND_CAP_RD_DUAL) &&
+		 (rw_mode & SPINAND_RD_DUAL))
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_DUAL_IO;
+	else if ((controller_cap & SPINAND_CAP_RD_X2) &&
+		 (rw_mode & SPINAND_RD_X2))
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_X2;
+	else
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_FAST;
+
+	if ((controller_cap & SPINAND_CAP_WR_X4) &&
+	    (rw_mode & SPINAND_WR_X4))
+		chip->write_cache_op = SPINAND_CMD_PROG_LOAD_X4;
+	else
+		chip->write_cache_op = SPINAND_CMD_PROG_LOAD;
+}
+
+/*
+ * spinand_manufacturer_detect - detect SPI NAND device by each manufacturer
+ * @chip: SPI NAND device structure
+ *
+ * ->detect() should decode raw id in chip->id.data and initialize device
+ * related part in spinand_device structure if it is the right device.
+ * ->detect() can not be NULL.
+ */
+static int spinand_manufacturer_detect(struct spinand_device *chip)
+{
+	int i = 0;
+
+	for (; spinand_manufacturers[i]->id != 0x0; i++) {
+		if (!spinand_manufacturers[i]->ops ||
+		    !spinand_manufacturers[i]->ops->detect) {
+			pr_err("%s's ops or ops->detect() is be NULL!\n",
+			       spinand_manufacturers[i]->name);
+			return -EINVAL;
+		}
+		if (spinand_manufacturers[i]->ops->detect(chip)) {
+			chip->manufacturer.manu = spinand_manufacturers[i];
+			return 0;
+		}
+	}
+
+	return -ENODEV;
+}
+
+/*
+ * spinand_manufacturer_init - manufacturer initialization function.
+ * @chip: SPI NAND device structure
+ *
+ * Manufacturer drivers should put all their specific initialization code in
+ * their ->init() hook.
+ */
+static int spinand_manufacturer_init(struct spinand_device *chip)
+{
+	if (chip->manufacturer.manu->ops->init)
+		return chip->manufacturer.manu->ops->init(chip);
+
+	return 0;
+}
+
+/*
+ * spinand_manufacturer_cleanup - manufacturer cleanup function.
+ * @chip: SPI NAND device structure
+ *
+ * Manufacturer drivers should put all their specific cleanup code in their
+ * ->cleanup() hook.
+ */
+static void spinand_manufacturer_cleanup(struct spinand_device *chip)
+{
+	/* Release manufacturer private data */
+	if (chip->manufacturer.manu->ops->cleanup)
+		return chip->manufacturer.manu->ops->cleanup(chip);
+}
+
+/*
+ * spinand_dt_init - Initialize SPI NAND by device tree node
+ * @chip: SPI NAND device structure
+ *
+ * TODO: put ecc_mode, ecc_strength, ecc_step, bbt, etc in here
+ * and move it in generic NAND core.
+ */
+static void spinand_dt_init(struct spinand_device *chip)
+{
+}
+
+/*
+ * spinand_detect - detect the SPI NAND device
+ * @chip: SPI NAND device structure
+ */
+static int spinand_detect(struct spinand_device *chip)
+{
+	struct nand_device *nand = &chip->base;
+	int ret;
+
+	spinand_reset(chip);
+	spinand_read_id(chip, chip->id.data);
+	chip->id.len = SPINAND_MAX_ID_LEN;
+
+	ret = spinand_manufacturer_detect(chip);
+	if (ret) {
+		pr_err("SPI NAND: unknown raw ID %*phN\n",
+		       SPINAND_MAX_ID_LEN, chip->id.data);
+		goto out;
+	}
+
+	pr_info("%s (%s) is found.\n",
+		chip->name, chip->manufacturer.manu->name);
+	pr_info("%d MiB, block size: %d KiB, page size: %d, OOB size: %d\n",
+		(int)(nand_size(nand) >> 20), nand_eraseblock_size(nand) >> 10,
+		nand_page_size(nand), nand_per_page_oobsize(nand));
+
+out:
+	return ret;
+}
+
+/*
+ * spinand_init - initialize the SPI NAND device
+ * @chip: SPI NAND device structure
+ */
+static int spinand_init(struct spinand_device *chip)
+{
+	struct mtd_info *mtd = spinand_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct spinand_ecc_engine *ecc_engine;
+	int ret;
+
+	spinand_dt_init(chip);
+	spinand_set_rd_wr_op(chip);
+
+	chip->buf = kzalloc(nand_page_size(nand) + nand_per_page_oobsize(nand),
+			    GFP_KERNEL);
+	if (!chip->buf) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	chip->oobbuf = chip->buf + nand_page_size(nand);
+
+	spinand_manufacturer_init(chip);
+
+	mtd->name = chip->name;
+	mtd->size = nand_size(nand);
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
+		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3,
+						      4);
+	/* After power up, all blocks are locked, so unlock it here. */
+	spinand_lock_block(chip, BL_ALL_UNLOCKED);
+
+	return nand_register(nand);
+
+err:
+	return ret;
+}
+
+/*
+ * spinand_alloc - [SPI NAND Interface] allocate SPI NAND device instance
+ * @dev: pointer to device model structure
+ */
+struct spinand_device *spinand_alloc(struct device *dev)
+{
+	struct spinand_device *chip;
+	struct spinand_ecc_engine *ecc_engine;
+
+	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		goto err1;
+
+	ecc_engine = kzalloc(sizeof(*ecc_engine), GFP_KERNEL);
+	if (!ecc_engine)
+		goto err2;
+
+	ecc_engine->mode = SPINAND_ECC_ONDIE;
+	chip->ecc.engine = ecc_engine;
+	spinand_set_of_node(chip, dev->of_node);
+	mutex_init(&chip->lock);
+
+	return chip;
+
+err2:
+	kfree(chip);
+err1:
+	return ERR_PTR(-ENOMEM);
+}
+EXPORT_SYMBOL_GPL(spinand_alloc);
+
+/*
+ * spinand_free - [SPI NAND Interface] free SPI NAND device instance
+ * @chip: SPI NAND device structure
+ */
+void spinand_free(struct spinand_device *chip)
+{
+	kfree(chip->ecc.engine);
+	kfree(chip);
+}
+EXPORT_SYMBOL_GPL(spinand_free);
+
+/*
+ * spinand_register - [SPI NAND Interface] register SPI NAND device
+ * @chip: SPI NAND device structure
+ */
+int spinand_register(struct spinand_device *chip)
+{
+	int ret;
+
+	ret = spinand_detect(chip);
+	if (ret) {
+		pr_err("Detect SPI NAND failed with error %d.\n", ret);
+		return ret;
+	}
+
+	ret = spinand_init(chip);
+	if (ret)
+		pr_err("Init SPI NAND failed with error %d.\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(spinand_register);
+
+/*
+ * spinand_unregister - [SPI NAND Interface] unregister SPI NAND device
+ * @chip: SPI NAND device structure
+ */
+int spinand_unregister(struct spinand_device *chip)
+{
+	struct nand_device *nand = &chip->base;
+
+	nand_unregister(nand);
+	spinand_manufacturer_cleanup(chip);
+	kfree(chip->buf);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spinand_unregister);
+
+MODULE_DESCRIPTION("SPI NAND framework");
+MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/mtd/nand/spi/manufactures.c b/drivers/mtd/nand/spi/manufactures.c
new file mode 100644
index 0000000..7e0b42d
--- /dev/null
+++ b/drivers/mtd/nand/spi/manufactures.c
@@ -0,0 +1,24 @@
+/**
+ *
+ * Copyright (c) 2009-2017 Micron Technology, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/module.h>
+#include <linux/mtd/spinand.h>
+
+struct spinand_manufacturer spinand_manufacturer_end = {0x0, "Unknown", NULL};
+
+struct spinand_manufacturer *spinand_manufacturers[] = {
+	&spinand_manufacturer_end,
+};
+EXPORT_SYMBOL(spinand_manufacturers);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
new file mode 100644
index 0000000..44748b4
--- /dev/null
+++ b/include/linux/mtd/spinand.h
@@ -0,0 +1,270 @@
+/**
+ *
+ * Copyright (c) 2009-2017 Micron Technology, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#ifndef __LINUX_MTD_SPINAND_H
+#define __LINUX_MTD_SPINAND_H
+
+#include <linux/mutex.h>
+#include <linux/mtd/mtd.h>
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
+#define BL_U_1_1024_LOCKED	0x08
+#define BL_U_1_512_LOCKED	0x10
+#define BL_U_1_256_LOCKED	0x18
+#define BL_U_1_128_LOCKED	0x20
+#define BL_U_1_64_LOCKED	0x28
+#define BL_U_1_32_LOCKED	0x30
+#define BL_U_1_16_LOCKED	0x38
+#define BL_U_1_8_LOCKED		0x40
+#define BL_U_1_4_LOCKED		0x48
+#define BL_U_1_2_LOCKED		0x50
+#define BL_L_1_1024_LOCKED	0x0c
+#define BL_L_1_512_LOCKED	0x14
+#define BL_L_1_256_LOCKED	0x1c
+#define BL_L_1_128_LOCKED	0x24
+#define BL_L_1_64_LOCKED	0x2c
+#define BL_L_1_32_LOCKED	0x34
+#define BL_L_1_16_LOCKED	0x3c
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
+struct spinand_op;
+struct spinand_device;
+
+#define SPINAND_MAX_ID_LEN	4
+
+/**
+ * struct nand_id - NAND id structure
+ * @data: buffer containing the id bytes. Currently 8 bytes large, but can
+ *	  be extended if required.
+ * @len: ID length.
+ */
+struct spinand_id {
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
+	bool (*detect)(struct spinand_device *chip);
+	int (*init)(struct spinand_device *chip);
+	void (*cleanup)(struct spinand_device *chip);
+};
+
+struct spinand_manufacturer {
+	u8 id;
+	char *name;
+	const struct spinand_manufacturer_ops *ops;
+};
+
+extern struct spinand_manufacturer *spinand_manufacturers[];
+
+struct spinand_ecc_engine_ops {
+	void (*get_ecc_status)(struct spinand_device *chip,
+			       unsigned int status, unsigned int *corrected,
+			       unsigned int *ecc_errors);
+	void (*disable_ecc)(struct spinand_device *chip);
+	void (*enable_ecc)(struct spinand_device *chip);
+};
+
+enum spinand_ecc_mode {
+	SPINAND_ECC_ONDIE,
+	SPINAND_ECC_HW,
+};
+
+struct spinand_ecc_engine {
+	enum spinand_ecc_mode mode;
+	u32 strength;
+	u32 steps;
+	struct spinand_ecc_engine_ops *ops;
+};
+
+#define SPINAND_CAP_RD_X1 BIT(0)
+#define SPINAND_CAP_RD_X2 BIT(1)
+#define SPINAND_CAP_RD_X4 BIT(2)
+#define SPINAND_CAP_RD_DUAL BIT(3)
+#define SPINAND_CAP_RD_QUAD BIT(4)
+#define SPINAND_CAP_WR_X1 BIT(5)
+#define SPINAND_CAP_WR_X2 BIT(6)
+#define SPINAND_CAP_WR_X4 BIT(7)
+#define SPINAND_CAP_WR_DUAL BIT(8)
+#define SPINAND_CAP_WR_QUAD BIT(9)
+#define SPINAND_CAP_HW_ECC BIT(10)
+
+struct spinand_controller {
+	struct spinand_controller_ops *ops;
+	u32 caps;
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
+		struct spinand_controller *controller;
+		void *priv;
+	} controller;
+	struct {
+		const struct spinand_manufacturer *manu;
+		void *priv;
+	} manufacturer;
+	struct {
+		struct spinand_ecc_engine *engine;
+		void *context;
+	} ecc;
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
+static inline void spinand_set_of_node(struct spinand_device *chip,
+				       struct device_node *np)
+{
+	nand_set_of_node(&chip->base, np);
+}
+
+#define SPINAND_MAX_ADDR_LEN	4
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
+#define SPINAND_RD_COMMON	(SPINAND_RD_X1 | SPINAND_RD_X2 | \
+				 SPINAND_RD_X4 | SPINAND_RD_DUAL | \
+				 SPINAND_RD_QUAD)
+#define SPINAND_WR_COMMON	(SPINAND_WR_X1 | SPINAND_WR_X4)
+#define SPINAND_OP_COMMON	(SPINAND_RD_COMMON | SPINAND_WR_COMMON)
+
+struct spinand_device *spinand_alloc(struct device *dev);
+void spinand_free(struct spinand_device *chip);
+int spinand_register(struct spinand_device *chip);
+int spinand_unregister(struct spinand_device *chip);
+#endif /* __LINUX_MTD_SPINAND_H */
-- 
1.9.1

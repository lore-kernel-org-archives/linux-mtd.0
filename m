Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDQHy-0000MM-FW
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 07:01:19 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v6 10/15] nand: spi: add basic blocks for infrastructure
Date: Wed, 24 May 2017 15:07:06 +0800
Message-ID: <1495609631-18880-11-git-send-email-peterpandong@micron.com>
In-Reply-To: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
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
 drivers/mtd/nand/Kconfig      |   1 +
 drivers/mtd/nand/Makefile     |   1 +
 drivers/mtd/nand/spi/Kconfig  |   5 +
 drivers/mtd/nand/spi/Makefile |   1 +
 drivers/mtd/nand/spi/core.c   | 419 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   | 267 +++++++++++++++++++++++++++
 6 files changed, 694 insertions(+)
 create mode 100644 drivers/mtd/nand/spi/Kconfig
 create mode 100644 drivers/mtd/nand/spi/Makefile
 create mode 100644 drivers/mtd/nand/spi/core.c
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
index 0000000..a677a4d
--- /dev/null
+++ b/drivers/mtd/nand/spi/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MTD_SPI_NAND) += core.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
new file mode 100644
index 0000000..93ce212
--- /dev/null
+++ b/drivers/mtd/nand/spi/core.c
@@ -0,0 +1,419 @@
+/*
+ *
+ * Copyright (c) 2016-2017 Micron Technology, Inc.
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
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/jiffies.h>
+#include <linux/mtd/spinand.h>
+#include <linux/slab.h>
+
+/**
+ * spinand_exec_op - execute SPI NAND operation by controller ->exec_op() hook
+ * @spinand: SPI NAND device structure
+ * @op: pointer to spinand_op struct
+ */
+static inline int spinand_exec_op(struct spinand_device *spinand,
+				  struct spinand_op *op)
+{
+	return spinand->controller.controller->ops->exec_op(spinand, op);
+}
+
+/**
+ * spinand_init_op - initialize spinand_op struct
+ * @op: pointer to spinand_op struct
+ */
+static inline void spinand_init_op(struct spinand_op *op)
+{
+	memset(op, 0, sizeof(struct spinand_op));
+	op->addr_nbits = 1;
+	op->data_nbits = 1;
+}
+
+/**
+ * spinand_read_reg - read SPI NAND register
+ * @spinand: SPI NAND device structure
+ * @reg; register to read
+ * @buf: buffer to store value
+ */
+static int spinand_read_reg(struct spinand_device *spinand, u8 reg, u8 *buf)
+{
+	struct spinand_op op;
+	int ret;
+
+	spinand_init_op(&op);
+	op.cmd = SPINAND_CMD_GET_FEATURE;
+	op.n_addr = 1;
+	op.addr[0] = reg;
+	op.n_rx = 1;
+	op.rx_buf = buf;
+
+	ret = spinand_exec_op(spinand, &op);
+	if (ret < 0)
+		dev_err(spinand->dev, "err: %d read register %d\n", ret, reg);
+
+	return ret;
+}
+
+/**
+ * spinand_write_reg - write SPI NAND register
+ * @spinand: SPI NAND device structure
+ * @reg; register to write
+ * @value: value to write
+ */
+static int spinand_write_reg(struct spinand_device *spinand, u8 reg, u8 value)
+{
+	struct spinand_op op;
+	int ret;
+
+	spinand_init_op(&op);
+	op.cmd = SPINAND_CMD_SET_FEATURE;
+	op.n_addr = 1;
+	op.addr[0] = reg;
+	op.n_tx = 1;
+	op.tx_buf = &value;
+
+	ret = spinand_exec_op(spinand, &op);
+	if (ret < 0)
+		dev_err(spinand->dev, "err: %d write register %d\n", ret, reg);
+
+	return ret;
+}
+
+/**
+ * spinand_read_status - get status register value
+ * @spinand: SPI NAND device structure
+ * @status: buffer to store value
+ * Description:
+ *   After read, write, or erase, the NAND device is expected to set the
+ *   busy status.
+ *   This function is to allow reading the status of the command: read,
+ *   write, and erase.
+ */
+static int spinand_read_status(struct spinand_device *spinand, u8 *status)
+{
+	return spinand_read_reg(spinand, REG_STATUS, status);
+}
+
+/**
+ * spinand_wait - wait until the command is done
+ * @spinand: SPI NAND device structure
+ * @s: buffer to store status register value (can be NULL)
+ */
+static int spinand_wait(struct spinand_device *spinand, u8 *s)
+{
+	unsigned long timeo =  jiffies + msecs_to_jiffies(400);
+	u8 status;
+
+	do {
+		spinand_read_status(spinand, &status);
+		if ((status & STATUS_OIP_MASK) == STATUS_READY)
+			goto out;
+	} while (time_before(jiffies, timeo));
+
+	/*
+	 * Extra read, just in case the STATUS_READY bit has changed
+	 * since our last check
+	 */
+	spinand_read_status(spinand, &status);
+out:
+	if (s)
+		*s = status;
+
+	return (status & STATUS_OIP_MASK) == STATUS_READY ? 0 :	-ETIMEDOUT;
+}
+
+/**
+ * spinand_read_id - read SPI NAND ID
+ * @spinand: SPI NAND device structure
+ * @buf: buffer to store id
+ * Description:
+ *   Manufacturers' read ID method is not unique. Some need a dummy before
+ *   reading, some's ID has three byte.
+ *   This function send one byte opcode (9Fh) and then read
+ *   SPINAND_MAX_ID_LEN (4 currently) bytes. Manufacturer's detect function
+ *   need to filter out real ID from the 4 bytes.
+ */
+static int spinand_read_id(struct spinand_device *spinand, u8 *buf)
+{
+	struct spinand_op op;
+
+	spinand_init_op(&op);
+	op.cmd = SPINAND_CMD_READ_ID;
+	op.n_rx = SPINAND_MAX_ID_LEN;
+	op.rx_buf = buf;
+
+	return spinand_exec_op(spinand, &op);
+}
+
+/**
+ * spinand_reset - reset SPI NAND device
+ * @spinand: SPI NAND device structure
+ */
+static int spinand_reset(struct spinand_device *spinand)
+{
+	struct spinand_op op;
+	int ret;
+
+	spinand_init_op(&op);
+	op.cmd = SPINAND_CMD_RESET;
+
+	ret = spinand_exec_op(spinand, &op);
+	if (ret < 0) {
+		dev_err(spinand->dev, "reset failed!\n");
+		goto out;
+	}
+
+	ret = spinand_wait(spinand, NULL);
+
+out:
+	return ret;
+}
+
+/**
+ * spinand_lock_block - write block lock register to lock/unlock device
+ * @spinand: SPI NAND device structure
+ * @lock: value to set to block lock register
+ */
+static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
+{
+	return spinand_write_reg(spinand, REG_BLOCK_LOCK, lock);
+}
+
+/**
+ * spinand_set_rd_wr_op - choose the best read write command
+ * @spinand: SPI NAND device structure
+ * Description:
+ *   Chose the fastest r/w command according to spi controller's and
+ *   device's ability.
+ */
+static void spinand_set_rd_wr_op(struct spinand_device *spinand)
+{
+	u32 controller_cap = spinand->controller.controller->caps;
+	u32 rw_mode = spinand->rw_mode;
+
+	if ((controller_cap & SPINAND_CAP_RD_QUAD) &&
+	    (rw_mode & SPINAND_RD_QUAD))
+		spinand->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_QUAD_IO;
+	else if ((controller_cap & SPINAND_CAP_RD_X4) &&
+		 (rw_mode & SPINAND_RD_X4))
+		spinand->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_X4;
+	else if ((controller_cap & SPINAND_CAP_RD_DUAL) &&
+		 (rw_mode & SPINAND_RD_DUAL))
+		spinand->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_DUAL_IO;
+	else if ((controller_cap & SPINAND_CAP_RD_X2) &&
+		 (rw_mode & SPINAND_RD_X2))
+		spinand->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_X2;
+	else
+		spinand->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_FAST;
+
+	if ((controller_cap & SPINAND_CAP_WR_X4) &&
+	    (rw_mode & SPINAND_WR_X4))
+		spinand->write_cache_op = SPINAND_CMD_PROG_LOAD_X4;
+	else
+		spinand->write_cache_op = SPINAND_CMD_PROG_LOAD;
+}
+
+static const struct spinand_manufacturer *spinand_manufacturers[] = {};
+
+/**
+ * spinand_manufacturer_detect - detect SPI NAND device by each manufacturer
+ * @spinand: SPI NAND device structure
+ *
+ * ->detect() should decode raw id in spinand->id.data and initialize device
+ * related part in spinand_device structure if it is the right device.
+ * ->detect() can not be NULL.
+ */
+static int spinand_manufacturer_detect(struct spinand_device *spinand)
+{
+	int i = 0;
+
+	for (; i < ARRAY_SIZE(spinand_manufacturers); i++) {
+		if (spinand_manufacturers[i]->ops->detect(spinand)) {
+			spinand->manufacturer.manu = spinand_manufacturers[i];
+
+			return 0;
+		}
+	}
+
+	return -ENODEV;
+}
+
+/**
+ * spinand_manufacturer_init - manufacturer initialization function.
+ * @spinand: SPI NAND device structure
+ *
+ * Manufacturer drivers should put all their specific initialization code in
+ * their ->init() hook.
+ */
+static int spinand_manufacturer_init(struct spinand_device *spinand)
+{
+	if (spinand->manufacturer.manu->ops->init)
+		return spinand->manufacturer.manu->ops->init(spinand);
+
+	return 0;
+}
+
+/**
+ * spinand_manufacturer_cleanup - manufacturer cleanup function.
+ * @spinand: SPI NAND device structure
+ *
+ * Manufacturer drivers should put all their specific cleanup code in their
+ * ->cleanup() hook.
+ */
+static void spinand_manufacturer_cleanup(struct spinand_device *spinand)
+{
+	/* Release manufacturer private data */
+	if (spinand->manufacturer.manu->ops->cleanup)
+		return spinand->manufacturer.manu->ops->cleanup(spinand);
+}
+
+/**
+ * spinand_detect - detect the SPI NAND device
+ * @spinand: SPI NAND device structure
+ */
+static int spinand_detect(struct spinand_device *spinand)
+{
+	struct nand_device *nand = &spinand->base;
+	int ret;
+
+	spinand_reset(spinand);
+	spinand_read_id(spinand, spinand->id.data);
+	spinand->id.len = SPINAND_MAX_ID_LEN;
+
+	ret = spinand_manufacturer_detect(spinand);
+	if (ret) {
+		dev_err(spinand->dev, "unknown raw ID %*phN\n",
+			SPINAND_MAX_ID_LEN, spinand->id.data);
+		goto failed;
+	}
+
+	dev_info(spinand->dev, "%s (%s) is found.\n", spinand->name,
+		 spinand->manufacturer.manu->name);
+	dev_info(spinand->dev,
+		 "%d MiB, block size: %d KiB, page size: %d, OOB size: %d\n",
+		 (int)(nand_size(nand) >> 20), nand_eraseblock_size(nand) >> 10,
+		 nand_page_size(nand), nand_per_page_oobsize(nand));
+
+failed:
+	return ret;
+}
+
+/**
+ * devm_spinand_alloc - [SPI NAND Interface] allocate SPI NAND device instance
+ * @dev: pointer to device model structure
+ */
+struct spinand_device *devm_spinand_alloc(struct device *dev)
+{
+	struct spinand_device *spinand;
+	struct mtd_info *mtd;
+
+	spinand = devm_kzalloc(dev, sizeof(*spinand), GFP_KERNEL);
+	if (!spinand)
+		return ERR_PTR(-ENOMEM);
+
+	spinand_set_of_node(spinand, dev->of_node);
+	mutex_init(&spinand->lock);
+	spinand->dev = dev;
+	mtd = spinand_to_mtd(spinand);
+	mtd->dev.parent = dev;
+
+	return spinand;
+}
+EXPORT_SYMBOL_GPL(devm_spinand_alloc);
+
+/**
+ * spinand_init - [SPI NAND Interface] initialize the SPI NAND device
+ * @spinand: SPI NAND device structure
+ */
+int spinand_init(struct spinand_device *spinand)
+{
+	struct mtd_info *mtd = spinand_to_mtd(spinand);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret;
+
+	ret = spinand_detect(spinand);
+	if (ret) {
+		dev_err(spinand->dev,
+			"Detect SPI NAND failed with error %d.\n", ret);
+		goto err_out;
+	}
+
+	spinand_set_rd_wr_op(spinand);
+
+	/*
+	 * Use kzalloc() instead of devm_kzalloc() here, beacause some drivers
+	 * may use this buffer for DMA access.
+	 * Memory allocated by devm_ does not guarantee DMA-safe alignment.
+	 */
+	spinand->buf = kzalloc(nand_page_size(nand) +
+			       nand_per_page_oobsize(nand),
+			       GFP_KERNEL);
+	if (!spinand->buf) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+
+	spinand->oobbuf = spinand->buf + nand_page_size(nand);
+
+	ret = spinand_manufacturer_init(spinand);
+	if (ret) {
+		dev_err(spinand->dev,
+			"Manufacurer init SPI NAND failed with err %d.\n",
+			ret);
+		goto err_free_buf;
+	}
+
+	mtd->name = spinand->name;
+	mtd->size = nand_size(nand);
+	mtd->erasesize = nand_eraseblock_size(nand);
+	mtd->writesize = nand_page_size(nand);
+	mtd->writebufsize = mtd->writesize;
+	mtd->owner = THIS_MODULE;
+	mtd->type = MTD_NANDFLASH;
+	mtd->flags = MTD_CAP_NANDFLASH;
+	mtd->oobsize = nand_per_page_oobsize(nand);
+	/*
+	 * Right now, we don't support ECC, so let the whole oob
+	 * area is available for user.
+	 */
+	mtd->oobavail = mtd->oobsize;
+
+	/* After power up, all blocks are locked, so unlock it here. */
+	spinand_lock_block(spinand, BL_ALL_UNLOCKED);
+
+	return 0;
+
+err_free_buf:
+	kfree(spinand->buf);
+err_out:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(spinand_init);
+
+/**
+ * spinand_cleanup - [SPI NAND Interface] clean SPI NAND device
+ * @spinand: SPI NAND device structure
+ */
+void spinand_cleanup(struct spinand_device *spinand)
+{
+	spinand_manufacturer_cleanup(spinand);
+	kfree(spinand->buf);
+}
+EXPORT_SYMBOL_GPL(spinand_cleanup);
+
+MODULE_DESCRIPTION("SPI NAND framework");
+MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
new file mode 100644
index 0000000..dd9da71
--- /dev/null
+++ b/include/linux/mtd/spinand.h
@@ -0,0 +1,267 @@
+/*
+ *
+ * Copyright (c) 2016-2017 Micron Technology, Inc.
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
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+
+/**
+ * Standard SPI NAND flash commands
+ */
+#define SPINAND_CMD_RESET			0xff
+#define SPINAND_CMD_GET_FEATURE			0x0f
+#define SPINAND_CMD_SET_FEATURE			0x1f
+#define SPINAND_CMD_PAGE_READ			0x13
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
+/* feature register */
+#define REG_BLOCK_LOCK		0xa0
+#define REG_CFG			0xb0
+#define REG_STATUS		0xc0
+
+/* status register */
+#define STATUS_OIP_MASK		BIT(0)
+#define STATUS_CRBSY_MASK	BIT(7)
+#define STATUS_READY		0
+#define STATUS_BUSY		BIT(0)
+
+#define STATUS_E_FAIL_MASK	BIT(2)
+#define STATUS_E_FAIL		BIT(2)
+
+#define STATUS_P_FAIL_MASK	BIT(3)
+#define STATUS_P_FAIL		BIT(3)
+
+/* configuration register */
+#define CFG_ECC_MASK		BIT(4)
+#define CFG_ECC_ENABLE		BIT(4)
+
+/* block lock register */
+#define BL_ALL_UNLOCKED		0X00
+
+struct spinand_op;
+struct spinand_device;
+
+#define SPINAND_MAX_ID_LEN	4
+
+/**
+ * struct spinand_id - SPI NAND id structure
+ * @data: buffer containing the id bytes. Currently 4 bytes large, but can
+ *	  be extended if required.
+ * @len: ID length
+ */
+struct spinand_id {
+	u8 data[SPINAND_MAX_ID_LEN];
+	int len;
+};
+
+/**
+ * struct spinand_controller_ops - SPI NAND controller operations
+ * @exec_op: executute SPI NAND operation
+ */
+struct spinand_controller_ops {
+	int (*exec_op)(struct spinand_device *spinand,
+		       struct spinand_op *op);
+};
+
+/**
+ * struct manufacurer_ops - SPI NAND manufacturer specified operations
+ * @detect: detect SPI NAND device, should bot be NULL.
+ *          ->detect() implementation for manufacturer A never sends
+ *          any manufacturer specific SPI command to a SPI NAND from
+ *          manufacturer B, so the proper way is to decode the raw id
+ *          data in spinand->id.data first, if manufacture ID dismatch,
+ *          return directly and let others to detect.
+ * @init: initialize SPI NAND device.
+ * @cleanup: clean SPI NAND device footprint.
+ */
+struct spinand_manufacturer_ops {
+	bool (*detect)(struct spinand_device *spinand);
+	int (*init)(struct spinand_device *spinand);
+	void (*cleanup)(struct spinand_device *spinand);
+};
+
+/**
+ * struct spinand_manufacturer - SPI NAND manufacturer instance
+ * @id: manufacturer ID
+ * @name: manufacturer name
+ * @ops: point to manufacturer operations
+ */
+struct spinand_manufacturer {
+	u8 id;
+	char *name;
+	const struct spinand_manufacturer_ops *ops;
+};
+
+#define SPINAND_CAP_RD_X1	BIT(0)
+#define SPINAND_CAP_RD_X2	BIT(1)
+#define SPINAND_CAP_RD_X4	BIT(2)
+#define SPINAND_CAP_RD_DUAL	BIT(3)
+#define SPINAND_CAP_RD_QUAD	BIT(4)
+#define SPINAND_CAP_WR_X1	BIT(5)
+#define SPINAND_CAP_WR_X2	BIT(6)
+#define SPINAND_CAP_WR_X4	BIT(7)
+#define SPINAND_CAP_WR_DUAL	BIT(8)
+#define SPINAND_CAP_WR_QUAD	BIT(9)
+
+/**
+ * struct spinand_controller - SPI NAND controller instance
+ * @ops: point to controller operations
+ * @caps: controller capabilities
+ */
+struct spinand_controller {
+	struct spinand_controller_ops *ops;
+	u32 caps;
+};
+
+/**
+ * struct spinand_device - SPI NAND device instance
+ * @base: NAND device instance
+ * @lock: protection lock
+ * @name: name of the device
+ * @dev: struct device pointer
+ * @id: ID structure
+ * @read_cache_op: Opcode of read from cache
+ * @write_cache_op: Opcode of program load
+ * @buf: buffer for read/write data
+ * @oobbuf: buffer for read/write oob
+ * @rw_mode: read/write mode of SPI NAND device
+ * @controller: SPI NAND controller instance
+ * @manufacturer: SPI NAND manufacturer instance, describe
+ *                manufacturer related objects
+ */
+struct spinand_device {
+	struct nand_device base;
+	struct mutex lock;
+	char *name;
+	struct device *dev;
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
+};
+
+/**
+ * mtd_to_spinand - Get the SPI NAND device attached to the MTD instance
+ * @mtd: MTD instance
+ *
+ * Returns the SPI NAND device attached to @mtd.
+ */
+static inline struct spinand_device *mtd_to_spinand(struct mtd_info *mtd)
+{
+	return container_of(mtd_to_nand(mtd), struct spinand_device, base);
+}
+
+/**
+ * spinand_to_mtd - Get the MTD device attached to the SPI NAND device
+ * @spinand: SPI NAND device
+ *
+ * Returns the MTD device attached to @spinand.
+ */
+static inline struct mtd_info *spinand_to_mtd(struct spinand_device *spinand)
+{
+	return nand_to_mtd(&spinand->base);
+}
+
+/**
+ * spinand_set_of_node - Attach a DT node to a SPI NAND device
+ * @spinand: SPI NAND device
+ * @np: DT node
+ *
+ * Attach a DT node to a SPI NAND device.
+ */
+static inline void spinand_set_of_node(struct spinand_device *spinand,
+				       struct device_node *np)
+{
+	nand_set_of_node(&spinand->base, np);
+}
+
+#define SPINAND_MAX_ADDR_LEN	4
+
+/**
+ * struct spinand_op - SPI NAND operation description
+ * @cmd: opcode to send
+ * @n_addr: address bytes
+ * @addr_nbits: number of bit used to transfer address
+ * @dummy_types: dummy bytes followed address
+ * @addr: buffer held address
+ * @n_tx: size of tx_buf
+ * @tx_buf: data to be written
+ * @n_rx: size of rx_buf
+ * @rx_buf: data to be read
+ * @data_nbits: number of bit used to transfer data
+ */
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
+#define SPINAND_RD_X1		BIT(0)
+#define SPINAND_RD_X2		BIT(1)
+#define SPINAND_RD_X4		BIT(2)
+#define SPINAND_RD_DUAL		BIT(3)
+#define SPINAND_RD_QUAD		BIT(4)
+#define SPINAND_WR_X1		BIT(5)
+#define SPINAND_WR_X2		BIT(6)
+#define SPINAND_WR_X4		BIT(7)
+#define SPINAND_WR_DUAL		BIT(8)
+#define SPINAND_WR_QUAD		BIT(9)
+
+#define SPINAND_RD_COMMON	(SPINAND_RD_X1 | SPINAND_RD_X2 | \
+				 SPINAND_RD_X4 | SPINAND_RD_DUAL | \
+				 SPINAND_RD_QUAD)
+#define SPINAND_WR_COMMON	(SPINAND_WR_X1 | SPINAND_WR_X4)
+#define SPINAND_OP_COMMON	(SPINAND_RD_COMMON | SPINAND_WR_COMMON)
+
+struct spinand_device *devm_spinand_alloc(struct device *dev);
+int spinand_init(struct spinand_device *spinand);
+void spinand_cleanup(struct spinand_device *spinand);
+#endif /* __LINUX_MTD_SPINAND_H */
-- 
1.9.1

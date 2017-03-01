Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cizpT-0002NX-O4
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 08:41:59 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v2 6/6] nand: spi: Add generic SPI controller support
Date: Wed, 1 Mar 2017 16:52:10 +0800
Message-ID: <1488358330-23832-7-git-send-email-peterpandong@micron.com>
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

This commit supports to use generic spi controller
as spi nand controller.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/Kconfig             |   2 +
 drivers/mtd/nand/spi/Makefile            |   1 +
 drivers/mtd/nand/spi/chips/Kconfig       |   5 +
 drivers/mtd/nand/spi/chips/Makefile      |   1 +
 drivers/mtd/nand/spi/chips/generic_spi.c | 158 +++++++++++++++++++++++++++++++
 5 files changed, 167 insertions(+)
 create mode 100644 drivers/mtd/nand/spi/chips/Kconfig
 create mode 100644 drivers/mtd/nand/spi/chips/Makefile
 create mode 100644 drivers/mtd/nand/spi/chips/generic_spi.c

diff --git a/drivers/mtd/nand/spi/Kconfig b/drivers/mtd/nand/spi/Kconfig
index 04a7b71..07ebbb0 100644
--- a/drivers/mtd/nand/spi/Kconfig
+++ b/drivers/mtd/nand/spi/Kconfig
@@ -3,3 +3,5 @@ menuconfig MTD_SPI_NAND
 	depends on MTD_NAND
 	help
 	  This is the framework for the SPI NAND device drivers.
+
+source "drivers/mtd/nand/spi/chips/Kconfig"
diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 84b9bcc..700878d 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_MTD_SPI_NAND) += spinand_base.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand_ids.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand_micron.o
+obj-$(CONFIG_MTD_SPI_NAND) += chips/
diff --git a/drivers/mtd/nand/spi/chips/Kconfig b/drivers/mtd/nand/spi/chips/Kconfig
new file mode 100644
index 0000000..337a94f
--- /dev/null
+++ b/drivers/mtd/nand/spi/chips/Kconfig
@@ -0,0 +1,5 @@
+config GENERIC_SPI_NAND
+	tristate "SPI-NAND with generic SPI bus Support"
+	depends on MTD_SPI_NAND && SPI
+	help
+	  This is to support SPI NAND device with generic SPI bus.
diff --git a/drivers/mtd/nand/spi/chips/Makefile b/drivers/mtd/nand/spi/chips/Makefile
new file mode 100644
index 0000000..2cb7763
--- /dev/null
+++ b/drivers/mtd/nand/spi/chips/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_GENERIC_SPI_NAND) += generic_spi.o
diff --git a/drivers/mtd/nand/spi/chips/generic_spi.c b/drivers/mtd/nand/spi/chips/generic_spi.c
new file mode 100644
index 0000000..4f47144
--- /dev/null
+++ b/drivers/mtd/nand/spi/chips/generic_spi.c
@@ -0,0 +1,158 @@
+/*
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
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/spi/spi.h>
+#include <linux/mtd/spinand.h>
+
+/*
+ * generic_spinand_cmd_fn - to process a command to send to the SPI-NAND
+ * by generic SPI bus
+ * @chip: SPI-NAND device structure
+ * @cmd: command structure
+ * Description:
+ *   Set up the command buffer to send to the SPI controller.
+ *   The command buffer has to initialized to 0.
+ */
+static int generic_spinand_cmd_fn(struct spinand_device *chip,
+				struct spinand_op *cmd)
+{
+	struct spi_message message;
+	struct spi_transfer x[3];
+	struct spi_device *spi = spinand_get_controller_data(chip);
+
+	spi_message_init(&message);
+	memset(x, 0, sizeof(x));
+	x[0].len = 1;
+	x[0].tx_nbits = 1;
+	x[0].tx_buf = &cmd->cmd;
+	spi_message_add_tail(&x[0], &message);
+
+	if (cmd->n_addr + cmd->dummy_bytes) {
+		x[1].len = cmd->n_addr + cmd->dummy_bytes;
+		x[1].tx_nbits = cmd->addr_nbits;
+		x[1].tx_buf = cmd->addr;
+		spi_message_add_tail(&x[1], &message);
+	}
+	if (cmd->n_tx) {
+		x[2].len = cmd->n_tx;
+		x[2].tx_nbits = cmd->data_nbits;
+		x[2].tx_buf = cmd->tx_buf;
+		spi_message_add_tail(&x[2], &message);
+	} else if (cmd->n_rx) {
+		x[2].len = cmd->n_rx;
+		x[2].rx_nbits = cmd->data_nbits;
+		x[2].rx_buf = cmd->rx_buf;
+		spi_message_add_tail(&x[2], &message);
+	}
+	return spi_sync(spi, &message);
+}
+
+static struct spinand_controller_ops generic_spi_ops = {
+	.exec_op = generic_spinand_cmd_fn,
+};
+
+static int generic_spinand_probe(struct spi_device *spi)
+{
+	struct spinand_device *chip;
+	int mfr;
+	struct mtd_info *mtd;
+	int ret;
+	u32 max_speed_hz = spi->max_speed_hz;
+
+	chip = kzalloc(sizeof(struct spinand_device), GFP_KERNEL);
+	if (!chip) {
+		ret = -ENOMEM;
+		goto err1;
+	}
+	mtd = spinand_to_mtd(chip);
+	chip->controller.ops = &generic_spi_ops;
+	chip->controller.caps = SPINAND_CAP_RD_X1 | SPINAND_CAP_WR_X1;
+	if (spi->mode & SPI_RX_QUAD)
+		chip->controller.caps |= SPINAND_CAP_RD_QUAD | SPINAND_CAP_RD_X4;
+	if (spi->mode & SPI_RX_DUAL)
+		chip->controller.caps |= SPINAND_CAP_RD_DUAL | SPINAND_CAP_RD_X2;
+	if (spi->mode & SPI_TX_QUAD)
+		chip->controller.caps |= SPINAND_CAP_WR_QUAD | SPINAND_CAP_WR_X4;
+	if (spi->mode & SPI_TX_DUAL)
+		chip->controller.caps |= SPINAND_CAP_WR_DUAL | SPINAND_CAP_WR_X2;
+
+	spinand_set_controller_data(chip, spi);
+	spi_set_drvdata(spi, chip);
+	/*
+	 * read ID command format might be different for different manufactory
+	 * such as, Micron SPI NAND need extra one dummy byte after perform
+	 * read ID command but Giga device don't need.
+	 *
+	 * So, specify manufactory of device in device tree is obligatory
+	 */
+	mfr = spi_get_device_id(spi)->driver_data;
+	spi->max_speed_hz = min_t(int, 25000000, max_speed_hz);
+	ret = spinand_scan_ident(chip, mfr);
+	if (ret)
+		goto err2;
+
+	spi->max_speed_hz = max_speed_hz;
+	ret = spinand_scan_tail(chip);
+	if (ret)
+		goto err3;
+
+	mtd_set_of_node(mtd, spi->dev.of_node);
+
+	ret = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	if (!ret)
+		return 0;
+
+	spinand_scan_tail_release(chip);
+err3:
+	spinand_scan_ident_release(chip);
+err2:
+	kfree(chip);
+err1:
+	return ret;
+}
+
+static int generic_spinand_remove(struct spi_device *spi)
+{
+	struct spinand_device *chip = spi_get_drvdata(spi);
+
+	spinand_release(chip);
+	kfree(chip);
+
+	return 0;
+}
+
+
+static const struct spi_device_id spinand_id_table[] = {
+	{ "mt29f", SPINAND_MFR_MICRON },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, spinand_id_table);
+
+static struct spi_driver generic_spinand_driver = {
+	.driver = {
+		.name	= "generic_spinand",
+		.owner	= THIS_MODULE,
+	},
+	.id_table = spinand_id_table,
+	.probe	= generic_spinand_probe,
+	.remove	= generic_spinand_remove,
+};
+module_spi_driver(generic_spinand_driver);
+
+
+MODULE_DESCRIPTION("Generic SPI controller to support SPI NAND");
+MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1

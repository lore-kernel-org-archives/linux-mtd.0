Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDQII-0000nF-Fy
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 07:01:57 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v6 14/15] nand: spi: Add generic SPI controller support
Date: Wed, 24 May 2017 15:07:10 +0800
Message-ID: <1495609631-18880-15-git-send-email-peterpandong@micron.com>
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

This commit supports to use generic spi controller
as spi nand controller.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/Kconfig                   |   2 +
 drivers/mtd/nand/spi/Makefile                  |   1 +
 drivers/mtd/nand/spi/controllers/Kconfig       |   5 +
 drivers/mtd/nand/spi/controllers/Makefile      |   1 +
 drivers/mtd/nand/spi/controllers/generic-spi.c | 162 +++++++++++++++++++++++++
 5 files changed, 171 insertions(+)
 create mode 100644 drivers/mtd/nand/spi/controllers/Kconfig
 create mode 100644 drivers/mtd/nand/spi/controllers/Makefile
 create mode 100644 drivers/mtd/nand/spi/controllers/generic-spi.c

diff --git a/drivers/mtd/nand/spi/Kconfig b/drivers/mtd/nand/spi/Kconfig
index d77c46e..6bd1c65 100644
--- a/drivers/mtd/nand/spi/Kconfig
+++ b/drivers/mtd/nand/spi/Kconfig
@@ -3,3 +3,5 @@ menuconfig MTD_SPI_NAND
 	depends on MTD_NAND
 	help
 	  This is the framework for the SPI NAND device drivers.
+
+source "drivers/mtd/nand/spi/controllers/Kconfig"
diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index df6c2ea..822e48d 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MTD_SPI_NAND) += core.o
 obj-$(CONFIG_MTD_SPI_NAND) += micron.o
+obj-$(CONFIG_MTD_SPI_NAND) += controllers/
diff --git a/drivers/mtd/nand/spi/controllers/Kconfig b/drivers/mtd/nand/spi/controllers/Kconfig
new file mode 100644
index 0000000..8ab7023
--- /dev/null
+++ b/drivers/mtd/nand/spi/controllers/Kconfig
@@ -0,0 +1,5 @@
+config GENERIC_SPI_NAND
+	tristate "SPI NAND with generic SPI bus Support"
+	depends on MTD_SPI_NAND && SPI
+	help
+	  This is to support SPI NAND device with generic SPI bus.
diff --git a/drivers/mtd/nand/spi/controllers/Makefile b/drivers/mtd/nand/spi/controllers/Makefile
new file mode 100644
index 0000000..46cbf29
--- /dev/null
+++ b/drivers/mtd/nand/spi/controllers/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_GENERIC_SPI_NAND) += generic-spi.o
diff --git a/drivers/mtd/nand/spi/controllers/generic-spi.c b/drivers/mtd/nand/spi/controllers/generic-spi.c
new file mode 100644
index 0000000..93ccafc
--- /dev/null
+++ b/drivers/mtd/nand/spi/controllers/generic-spi.c
@@ -0,0 +1,162 @@
+/*
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
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+#include <linux/mtd/spinand.h>
+#include <linux/mtd/mtd.h>
+
+struct gen_spi_spinand_controller {
+	struct spinand_controller ctrl;
+	struct spi_device *spi;
+};
+
+#define to_gen_spi_spinand_controller(c) \
+	container_of(c, struct gen_spi_spinand_controller, ctrl)
+
+/*
+ * gen_spi_spinand_exec_op - to process a command to send to the
+ * SPI NAND by generic SPI bus
+ * @spinand: SPI NAND device structure
+ * @op: SPI NAND operation descriptor
+ */
+static int gen_spi_spinand_exec_op(struct spinand_device *spinand,
+				   struct spinand_op *op)
+{
+	struct spi_message message;
+	struct spi_transfer x[3];
+	struct spinand_controller *spinand_controller;
+	struct gen_spi_spinand_controller *controller;
+
+	spinand_controller = spinand->controller.controller;
+	controller = to_gen_spi_spinand_controller(spinand_controller);
+	spi_message_init(&message);
+	memset(x, 0, sizeof(x));
+	x[0].len = 1;
+	x[0].tx_nbits = 1;
+	x[0].tx_buf = &op->cmd;
+	spi_message_add_tail(&x[0], &message);
+
+	if (op->n_addr + op->dummy_bytes) {
+		x[1].len = op->n_addr + op->dummy_bytes;
+		x[1].tx_nbits = op->addr_nbits;
+		x[1].tx_buf = op->addr;
+		spi_message_add_tail(&x[1], &message);
+	}
+
+	if (op->n_tx) {
+		x[2].len = op->n_tx;
+		x[2].tx_nbits = op->data_nbits;
+		x[2].tx_buf = op->tx_buf;
+		spi_message_add_tail(&x[2], &message);
+	} else if (op->n_rx) {
+		x[2].len = op->n_rx;
+		x[2].rx_nbits = op->data_nbits;
+		x[2].rx_buf = op->rx_buf;
+		spi_message_add_tail(&x[2], &message);
+	}
+
+	return spi_sync(controller->spi, &message);
+}
+
+static struct spinand_controller_ops gen_spi_spinand_ops = {
+	.exec_op = gen_spi_spinand_exec_op,
+};
+
+static int gen_spi_spinand_probe(struct spi_device *spi)
+{
+	struct spinand_device *spinand;
+	struct gen_spi_spinand_controller *controller;
+	struct spinand_controller *spinand_controller;
+	struct device *dev = &spi->dev;
+	u16 mode = spi->mode;
+	int ret;
+
+	spinand = devm_spinand_alloc(dev);
+	if (IS_ERR(spinand)) {
+		ret = PTR_ERR(spinand);
+		goto out;
+	}
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	controller->spi = spi;
+	spinand_controller = &controller->ctrl;
+	spinand_controller->ops = &gen_spi_spinand_ops;
+	spinand_controller->caps = SPINAND_CAP_RD_X1 | SPINAND_CAP_WR_X1;
+
+	if ((mode & SPI_RX_QUAD) && (mode & SPI_TX_QUAD))
+		spinand_controller->caps |= SPINAND_CAP_RD_QUAD;
+
+	if ((mode & SPI_RX_DUAL) && (mode & SPI_TX_DUAL))
+		spinand_controller->caps |= SPINAND_CAP_RD_DUAL;
+
+	if (mode & SPI_RX_QUAD)
+		spinand_controller->caps |= SPINAND_CAP_RD_X4;
+
+	if (mode & SPI_RX_DUAL)
+		spinand_controller->caps |= SPINAND_CAP_RD_X2;
+
+	if (mode & SPI_TX_QUAD)
+		spinand_controller->caps |= SPINAND_CAP_WR_QUAD |
+					    SPINAND_CAP_WR_X4;
+
+	if (mode & SPI_TX_DUAL)
+		spinand_controller->caps |= SPINAND_CAP_WR_DUAL |
+					    SPINAND_CAP_WR_X2;
+
+	spinand->controller.controller = spinand_controller;
+	spi_set_drvdata(spi, spinand);
+
+	ret = spinand_init(spinand);
+	if (ret)
+		goto out;
+
+	ret = mtd_device_register(spinand_to_mtd(spinand), NULL, 0);
+
+out:
+	return ret;
+}
+
+static int gen_spi_spinand_remove(struct spi_device *spi)
+{
+	struct spinand_device *spinand = spi_get_drvdata(spi);
+	int ret;
+
+	ret = mtd_device_unregister(spinand_to_mtd(spinand));
+	if (ret)
+		return ret;
+
+	spinand_cleanup(spinand);
+
+	return 0;
+}
+
+static struct spi_driver gen_spi_spinand_driver = {
+	.driver = {
+		.name	= "generic_spinand",
+		.owner	= THIS_MODULE,
+	},
+	.probe	= gen_spi_spinand_probe,
+	.remove	= gen_spi_spinand_remove,
+};
+module_spi_driver(gen_spi_spinand_driver);
+
+MODULE_DESCRIPTION("Generic SPI controller to support SPI NAND");
+MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1

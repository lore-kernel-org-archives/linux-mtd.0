Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5DG-0007yM-32
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 07:50:28 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH 10/11] nand: spi: Add generic SPI controller support
Date: Tue, 21 Feb 2017 16:00:09 +0800
Message-ID: <1487664010-25926-11-git-send-email-peterpandong@micron.com>
In-Reply-To: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
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
as SPI NAND controller.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/Kconfig             |   2 +
 drivers/mtd/nand/spi/Makefile            |   1 +
 drivers/mtd/nand/spi/chips/Kconfig       |   5 +
 drivers/mtd/nand/spi/chips/Makefile      |   1 +
 drivers/mtd/nand/spi/chips/generic_spi.c | 269 +++++++++++++++++++++++++++++++
 5 files changed, 278 insertions(+)
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
index 3c617d6..f0775d2 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MTD_SPI_NAND) += spi-nand-base.o
 obj-$(CONFIG_MTD_SPI_NAND) += spi-nand-cmd.o
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
index 0000000..38d8613
--- /dev/null
+++ b/drivers/mtd/nand/spi/chips/generic_spi.c
@@ -0,0 +1,269 @@
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
+#include <linux/mtd/spi-nand.h>
+
+static int micron_ooblayout_ecc_64(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	oobregion->length = 8;
+	oobregion->offset = (section * 2 + 1) * 8;
+
+	return 0;
+}
+
+static int micron_ooblayout_free_64(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	oobregion->length = section ? 8 : 6;
+	oobregion->offset = section ? section * 16 : 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops micron_ooblayout_64_ops = {
+	.ecc = micron_ooblayout_ecc_64,
+	.free = micron_ooblayout_free_64,
+};
+
+static int micron_ooblayout_ecc_128(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = 64;
+	oobregion->offset = 64;
+
+	return 0;
+}
+
+static int micron_ooblayout_free_128(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = 62;
+	oobregion->offset = 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops micron_ooblayout_128_ops = {
+	.ecc = micron_ooblayout_ecc_128,
+	.free = micron_ooblayout_free_128,
+};
+
+static void spi_nand_mt29f_ecc_status(struct spi_nand_chip *chip,
+					unsigned int status,
+					unsigned int *corrected,
+					unsigned int *ecc_error)
+{
+	unsigned int ecc_status = status & SPI_NAND_MT29F_ECC_MASK;
+
+	*ecc_error = (ecc_status == SPI_NAND_MT29F_ECC_UNCORR);
+	switch (ecc_status) {
+	case SPI_NAND_MT29F_ECC_0_BIT:
+		*corrected = 0;
+		break;
+	case SPI_NAND_MT29F_ECC_1_3_BIT:
+		*corrected = 3;
+		break;
+	case SPI_NAND_MT29F_ECC_4_6_BIT:
+		*corrected = 6;
+		break;
+	case SPI_NAND_MT29F_ECC_7_8_BIT:
+		*corrected = 8;
+		break;
+	}
+}
+
+static int spi_nand_manufacture_init(struct spi_nand_chip *chip)
+{
+	struct mtd_info *mtd = spi_nand_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+
+	switch (chip->mfr_id) {
+	case SPINAND_MFR_MICRON:
+		chip->get_ecc_status = spi_nand_mt29f_ecc_status;
+		if (nand_per_page_oobsize(nand) == 64)
+			mtd_set_ooblayout(mtd, &micron_ooblayout_64_ops);
+		else if (nand_per_page_oobsize(nand) == 128)
+			mtd_set_ooblayout(mtd, &micron_ooblayout_128_ops);
+
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+/*
+ * generic_spi_nand_cmd_fn - to process a command to send to the SPI-NAND
+ * by generic SPI bus
+ * @chip: SPI-NAND device structure
+ * @cmd: command structure
+ * Description:
+ *   Set up the command buffer to send to the SPI controller.
+ *   The command buffer has to initialized to 0.
+ */
+static int generic_spi_nand_cmd_fn(struct spi_nand_chip *chip,
+				struct spi_nand_cmd *cmd)
+{
+	struct spi_nand_cmd_cfg *cmd_cfg = spi_nand_get_cmd_cfg(cmd->cmd);
+	struct spi_message message;
+	struct spi_transfer x[3];
+	struct spi_device *spi = chip->priv;
+	u8 buf[SPINAND_MAX_ADDR_LEN];
+
+	spi_message_init(&message);
+	memset(x, 0, sizeof(x));
+	x[0].len = 1;
+	x[0].tx_nbits = 1;
+	x[0].tx_buf = &cmd->cmd;
+	spi_message_add_tail(&x[0], &message);
+
+	if (cmd_cfg->addr_bytes || cmd_cfg->dummy_bytes) {
+		if (cmd_cfg->addr_bytes > cmd->n_addr) {
+			memcpy(buf, cmd->addr, cmd->n_addr);
+			memset(cmd->addr, 0, cmd->n_addr);
+			memcpy(cmd->addr + cmd_cfg->addr_bytes - cmd->n_addr,
+				buf, cmd->n_addr);
+		}
+		x[1].len = cmd_cfg->addr_bytes + cmd_cfg->dummy_bytes;
+		x[1].tx_nbits = cmd_cfg->addr_bits;
+		x[1].tx_buf = cmd->addr;
+		spi_message_add_tail(&x[1], &message);
+	}
+	if (cmd->n_tx) {
+		x[2].len = cmd->n_tx;
+		x[2].tx_nbits = cmd_cfg->data_bits;
+		x[2].tx_buf = cmd->tx_buf;
+		spi_message_add_tail(&x[2], &message);
+	} else if (cmd->n_rx) {
+		x[2].len = cmd->n_rx;
+		x[2].rx_nbits = cmd_cfg->data_bits;
+		x[2].rx_buf = cmd->rx_buf;
+		spi_message_add_tail(&x[2], &message);
+	}
+	return spi_sync(spi, &message);
+}
+
+static int generic_spi_nand_probe(struct spi_device *spi)
+{
+	struct spi_nand_chip *chip;
+	int mfr;
+	struct mtd_info *mtd;
+	int ret;
+	u32 max_speed_hz = spi->max_speed_hz;
+
+	chip = kzalloc(sizeof(struct spi_nand_chip), GFP_KERNEL);
+	if (!chip) {
+		ret = -ENOMEM;
+		goto err1;
+	}
+	mtd = spi_nand_to_mtd(chip);
+	chip->command_fn = generic_spi_nand_cmd_fn;
+	if (spi->mode & SPI_RX_QUAD)
+		chip->controller_caps |= SPINAND_RD_QUAD | SPINAND_RD_X4;
+	if (spi->mode & SPI_RX_DUAL)
+		chip->controller_caps |= SPINAND_RD_DUAL | SPINAND_RD_X2;
+	if (spi->mode & SPI_TX_QUAD)
+		chip->controller_caps |= SPINAND_WR_QUAD | SPINAND_WR_X4;
+	if (spi->mode & SPI_TX_DUAL)
+		chip->controller_caps |= SPINAND_WR_DUAL | SPINAND_WR_X2;
+	chip->priv = spi;
+	spi_set_drvdata(spi, chip);
+	/*
+	 * read ID command format might be different for different manufactory
+	 * such as, Micron SPI NAND need extra one dummy byte after perform
+	 * read ID command but Giga device don't need.
+	 *
+	 * So, specify manufactory of device in device tree is obligatory
+	 */
+	mfr = spi_get_device_id(spi)->driver_data;
+	ret = spi_nand_set_cmd_cfg_table(mfr);
+	if (ret)
+		goto err2;
+
+	spi->max_speed_hz = min_t(int, 25000000, max_speed_hz);
+	ret = spi_nand_scan_ident(chip);
+	if (ret)
+		goto err2;
+
+	spi_nand_manufacture_init(chip);
+
+	spi->max_speed_hz = max_speed_hz;
+	ret = spi_nand_scan_tail(chip);
+	if (ret)
+		goto err3;
+
+	mtd_set_of_node(mtd, spi->dev.of_node);
+
+	ret = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	if (!ret)
+		return 0;
+
+	spi_nand_scan_tail_release(chip);
+err3:
+	spi_nand_scan_ident_release(chip);
+err2:
+	kfree(chip);
+err1:
+	return ret;
+}
+
+static int generic_spi_nand_remove(struct spi_device *spi)
+{
+	struct spi_nand_chip *chip = spi_get_drvdata(spi);
+
+	spi_nand_release(chip);
+	kfree(chip);
+
+	return 0;
+}
+
+
+static const struct spi_device_id spi_nand_id_table[] = {
+	{ "mt29f", SPINAND_MFR_MICRON },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, spi_nand_id_table);
+
+static struct spi_driver generic_spi_nand_driver = {
+	.driver = {
+		.name	= "generic_spi_nand",
+		.owner	= THIS_MODULE,
+	},
+	.id_table = spi_nand_id_table,
+	.probe	= generic_spi_nand_probe,
+	.remove	= generic_spi_nand_remove,
+};
+module_spi_driver(generic_spi_nand_driver);
+
+
+MODULE_DESCRIPTION("Generic SPI controller to support SPI NAND");
+MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1

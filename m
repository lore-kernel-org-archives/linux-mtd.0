Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eblxi-0005sa-KK
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 11:33:00 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 2/8] mtd: nand: mxc: Add function to control hardware ECC
Date: Wed, 17 Jan 2018 12:32:07 +0100
Message-Id: <20180117113213.15455-3-s.hauer@pengutronix.de>
In-Reply-To: <20180117113213.15455-1-s.hauer@pengutronix.de>
References: <20180117113213.15455-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For proper raw read/write support need to be able to control the
hardware ECC engine. Add a function to enable/disable it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 6741af990dc4..019c58579dbc 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -154,6 +154,7 @@ struct mxc_nand_devtype_data {
 			u_char *read_ecc, u_char *calc_ecc);
 	int (*setup_data_interface)(struct mtd_info *mtd, int csline,
 				    const struct nand_data_interface *conf);
+	void (*enable_hwecc)(struct nand_chip *chip, bool enable);
 
 	/*
 	 * On i.MX21 the CONFIG2:INT bit cannot be read if interrupts are masked
@@ -678,6 +679,42 @@ static uint16_t get_dev_status_v1_v2(struct mxc_nand_host *host)
 	return ret;
 }
 
+static void mxc_nand_enable_hwecc_v1_v2(struct nand_chip *chip, bool enable)
+{
+	struct mxc_nand_host *host = nand_get_controller_data(chip);
+	uint16_t config1;
+
+	if (chip->ecc.mode != NAND_ECC_HW)
+		return;
+
+	config1 = readw(NFC_V1_V2_CONFIG1);
+
+	if (enable)
+		config1 |= NFC_V1_V2_CONFIG1_ECC_EN;
+	else
+		config1 &= ~NFC_V1_V2_CONFIG1_ECC_EN;
+
+	writew(config1, NFC_V1_V2_CONFIG1);
+}
+
+static void mxc_nand_enable_hwecc_v3(struct nand_chip *chip, bool enable)
+{
+	struct mxc_nand_host *host = nand_get_controller_data(chip);
+	uint32_t config2;
+
+	if (chip->ecc.mode != NAND_ECC_HW)
+		return;
+
+	config2 = readl(NFC_V3_CONFIG2);
+
+	if (enable)
+		config2 |= NFC_V3_CONFIG2_ECC_EN;
+	else
+		config2 &= ~NFC_V3_CONFIG2_ECC_EN;
+
+	writel(config2, NFC_V3_CONFIG2);
+}
+
 /* This functions is used by upper layer to checks if device is ready */
 static int mxc_nand_dev_ready(struct mtd_info *mtd)
 {
@@ -1408,6 +1445,7 @@ static const struct mxc_nand_devtype_data imx21_nand_devtype_data = {
 	.ooblayout = &mxc_v1_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v1_v3,
 	.correct_data = mxc_nand_correct_data_v1,
+	.enable_hwecc = mxc_nand_enable_hwecc_v1_v2,
 	.irqpending_quirk = 1,
 	.needs_ip = 0,
 	.regs_offset = 0xe00,
@@ -1431,6 +1469,7 @@ static const struct mxc_nand_devtype_data imx27_nand_devtype_data = {
 	.ooblayout = &mxc_v1_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v1_v3,
 	.correct_data = mxc_nand_correct_data_v1,
+	.enable_hwecc = mxc_nand_enable_hwecc_v1_v2,
 	.irqpending_quirk = 0,
 	.needs_ip = 0,
 	.regs_offset = 0xe00,
@@ -1456,6 +1495,7 @@ static const struct mxc_nand_devtype_data imx25_nand_devtype_data = {
 	.select_chip = mxc_nand_select_chip_v2,
 	.correct_data = mxc_nand_correct_data_v2_v3,
 	.setup_data_interface = mxc_nand_v2_setup_data_interface,
+	.enable_hwecc = mxc_nand_enable_hwecc_v1_v2,
 	.irqpending_quirk = 0,
 	.needs_ip = 0,
 	.regs_offset = 0x1e00,
@@ -1480,6 +1520,7 @@ static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
 	.ooblayout = &mxc_v2_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v1_v3,
 	.correct_data = mxc_nand_correct_data_v2_v3,
+	.enable_hwecc = mxc_nand_enable_hwecc_v3,
 	.irqpending_quirk = 0,
 	.needs_ip = 1,
 	.regs_offset = 0,
@@ -1505,6 +1546,7 @@ static const struct mxc_nand_devtype_data imx53_nand_devtype_data = {
 	.ooblayout = &mxc_v2_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v1_v3,
 	.correct_data = mxc_nand_correct_data_v2_v3,
+	.enable_hwecc = mxc_nand_enable_hwecc_v3,
 	.irqpending_quirk = 0,
 	.needs_ip = 1,
 	.regs_offset = 0,
-- 
2.11.0

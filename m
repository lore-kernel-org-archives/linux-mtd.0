Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eblxi-0005tB-KM
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 11:33:02 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 7/8] mtd: nand: mxc: Drop now unnecessary functions
Date: Wed, 17 Jan 2018 12:32:12 +0100
Message-Id: <20180117113213.15455-8-s.hauer@pengutronix.de>
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

Since we have our own read_page/write_page functions correct_data and
calculate are no longer needed. Remove them.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 2811102b0469..a7c4fdd1988e 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -152,8 +152,6 @@ struct mxc_nand_devtype_data {
 	u32 (*get_ecc_status)(struct mxc_nand_host *);
 	const struct mtd_ooblayout_ops *ooblayout;
 	void (*select_chip)(struct mtd_info *mtd, int chip);
-	int (*correct_data)(struct mtd_info *mtd, u_char *dat,
-			u_char *read_ecc, u_char *calc_ecc);
 	int (*setup_data_interface)(struct mtd_info *mtd, int csline,
 				    const struct nand_data_interface *conf);
 	void (*enable_hwecc)(struct nand_chip *chip, bool enable);
@@ -727,20 +725,6 @@ static int mxc_nand_dev_ready(struct mtd_info *mtd)
 	return 1;
 }
 
-static void mxc_nand_enable_hwecc(struct mtd_info *mtd, int mode)
-{
-	/*
-	 * If HW ECC is enabled, we turn it on during init. There is
-	 * no need to enable again here.
-	 */
-}
-
-static int mxc_nand_correct_data_v1(struct mtd_info *mtd, u_char *dat,
-				 u_char *read_ecc, u_char *calc_ecc)
-{
-	return 0;
-}
-
 static int mxc_nand_read_page_v1(struct nand_chip *chip, void *buf, void *oob,
 				 bool ecc, int page)
 {
@@ -799,12 +783,6 @@ static int mxc_nand_read_page_v1(struct nand_chip *chip, void *buf, void *oob,
 	return bitflips_corrected;
 }
 
-static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
-				 u_char *read_ecc, u_char *calc_ecc)
-{
-	return 0;
-}
-
 static int mxc_nand_read_page_v2_v3(struct nand_chip *chip, void *buf,
 				    void *oob, bool ecc, int page)
 {
@@ -934,12 +912,6 @@ static int mxc_nand_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	return mxc_nand_write_page(chip, host->data_buf, false, page);
 }
 
-static int mxc_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
-				  u_char *ecc_code)
-{
-	return 0;
-}
-
 static u_char mxc_nand_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
@@ -1592,7 +1564,6 @@ static const struct mxc_nand_devtype_data imx21_nand_devtype_data = {
 	.get_ecc_status = get_ecc_status_v1,
 	.ooblayout = &mxc_v1_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v1_v3,
-	.correct_data = mxc_nand_correct_data_v1,
 	.enable_hwecc = mxc_nand_enable_hwecc_v1_v2,
 	.irqpending_quirk = 1,
 	.needs_ip = 0,
@@ -1617,7 +1588,6 @@ static const struct mxc_nand_devtype_data imx27_nand_devtype_data = {
 	.get_ecc_status = get_ecc_status_v1,
 	.ooblayout = &mxc_v1_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v1_v3,
-	.correct_data = mxc_nand_correct_data_v1,
 	.enable_hwecc = mxc_nand_enable_hwecc_v1_v2,
 	.irqpending_quirk = 0,
 	.needs_ip = 0,
@@ -1643,7 +1613,6 @@ static const struct mxc_nand_devtype_data imx25_nand_devtype_data = {
 	.get_ecc_status = get_ecc_status_v2,
 	.ooblayout = &mxc_v2_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v2,
-	.correct_data = mxc_nand_correct_data_v2_v3,
 	.setup_data_interface = mxc_nand_v2_setup_data_interface,
 	.enable_hwecc = mxc_nand_enable_hwecc_v1_v2,
 	.irqpending_quirk = 0,
@@ -1670,7 +1639,6 @@ static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
 	.get_ecc_status = get_ecc_status_v3,
 	.ooblayout = &mxc_v2_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v1_v3,
-	.correct_data = mxc_nand_correct_data_v2_v3,
 	.enable_hwecc = mxc_nand_enable_hwecc_v3,
 	.irqpending_quirk = 0,
 	.needs_ip = 1,
@@ -1697,7 +1665,6 @@ static const struct mxc_nand_devtype_data imx53_nand_devtype_data = {
 	.get_ecc_status = get_ecc_status_v3,
 	.ooblayout = &mxc_v2_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v1_v3,
-	.correct_data = mxc_nand_correct_data_v2_v3,
 	.enable_hwecc = mxc_nand_enable_hwecc_v3,
 	.irqpending_quirk = 0,
 	.needs_ip = 1,
@@ -1951,9 +1918,6 @@ static int mxcnd_probe(struct platform_device *pdev)
 		this->ecc.write_page = mxc_nand_write_page_ecc;
 		this->ecc.write_page_raw = mxc_nand_write_page_raw;
 		this->ecc.write_oob = mxc_nand_write_oob;
-		this->ecc.calculate = mxc_nand_calculate_ecc;
-		this->ecc.hwctl = mxc_nand_enable_hwecc;
-		this->ecc.correct = host->devtype_data->correct_data;
 		break;
 
 	case NAND_ECC_SOFT:
-- 
2.11.0

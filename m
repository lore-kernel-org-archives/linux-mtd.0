Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePlmH-0004EA-4t
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 08:55:34 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 3/3] mtd: nand: mxc: Drop now unnecessary correct_data function
Date: Fri, 15 Dec 2017 09:55:04 +0100
Message-Id: <20171215085504.32296-4-s.hauer@pengutronix.de>
In-Reply-To: <20171215085504.32296-1-s.hauer@pengutronix.de>
References: <20171215085504.32296-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

correct_data is no longer used for v2_v3 controllers, so remove
it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index a54804f14bb1..41838ee79bb5 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -618,12 +618,6 @@ static int mxc_nand_correct_data_v1(struct mtd_info *mtd, u_char *dat,
 	return 0;
 }
 
-static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
-				 u_char *read_ecc, u_char *calc_ecc)
-{
-	return 0;
-}
-
 static int mxc_nand_read_page_hwecc_v2_v3(struct mtd_info *mtd,
 					  struct nand_chip *chip,
 					  uint8_t *buf, int oob_required,
@@ -1480,7 +1474,6 @@ static const struct mxc_nand_devtype_data imx25_nand_devtype_data = {
 	.get_ecc_status = get_ecc_status_v2,
 	.ooblayout = &mxc_v2_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v2,
-	.correct_data = mxc_nand_correct_data_v2_v3,
 	.setup_data_interface = mxc_nand_v2_setup_data_interface,
 	.irqpending_quirk = 0,
 	.needs_ip = 0,
@@ -1507,7 +1500,6 @@ static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
 	.get_ecc_status = get_ecc_status_v3,
 	.ooblayout = &mxc_v2_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v1_v3,
-	.correct_data = mxc_nand_correct_data_v2_v3,
 	.irqpending_quirk = 0,
 	.needs_ip = 1,
 	.regs_offset = 0,
@@ -1534,7 +1526,6 @@ static const struct mxc_nand_devtype_data imx53_nand_devtype_data = {
 	.get_ecc_status = get_ecc_status_v3,
 	.ooblayout = &mxc_v2_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v1_v3,
-	.correct_data = mxc_nand_correct_data_v2_v3,
 	.irqpending_quirk = 0,
 	.needs_ip = 1,
 	.regs_offset = 0,
-- 
2.11.0

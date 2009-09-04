Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MjbWt-0000UP-VP
	for linux-mtd@lists.infradead.org; Fri, 04 Sep 2009 16:21:00 +0000
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] txx9ndfmc: Transfer 512 byte at a time if possible
Date: Sat,  5 Sep 2009 01:20:45 +0900
Message-Id: <1252081245-11895-3-git-send-email-anemo@mba.ocn.ne.jp>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, vimal singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using __nand_correct_data() helper function, this driver can read 512
byte (with 6 byte ECC) at a time.  This results minor performance
improvement.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
 drivers/mtd/nand/txx9ndfmc.c |   52 +++++++++++++++++++++++++++++++++++++----
 1 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 488088e..73af832 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -189,18 +189,43 @@ static int txx9ndfmc_calculate_ecc(struct mtd_info *mtd, const uint8_t *dat,
 				   uint8_t *ecc_code)
 {
 	struct platform_device *dev = mtd_to_platdev(mtd);
+	struct nand_chip *chip = mtd->priv;
+	int eccbytes;
 	u32 mcr = txx9ndfmc_read(dev, TXX9_NDFMCR);
 
 	mcr &= ~TXX9_NDFMCR_ECC_ALL;
 	txx9ndfmc_write(dev, mcr | TXX9_NDFMCR_ECC_OFF, TXX9_NDFMCR);
 	txx9ndfmc_write(dev, mcr | TXX9_NDFMCR_ECC_READ, TXX9_NDFMCR);
-	ecc_code[1] = txx9ndfmc_read(dev, TXX9_NDFDTR);
-	ecc_code[0] = txx9ndfmc_read(dev, TXX9_NDFDTR);
-	ecc_code[2] = txx9ndfmc_read(dev, TXX9_NDFDTR);
+	for (eccbytes = chip->ecc.bytes; eccbytes > 0; eccbytes -= 3) {
+		ecc_code[1] = txx9ndfmc_read(dev, TXX9_NDFDTR);
+		ecc_code[0] = txx9ndfmc_read(dev, TXX9_NDFDTR);
+		ecc_code[2] = txx9ndfmc_read(dev, TXX9_NDFDTR);
+		ecc_code += 3;
+	}
 	txx9ndfmc_write(dev, mcr | TXX9_NDFMCR_ECC_OFF, TXX9_NDFMCR);
 	return 0;
 }
 
+static int txx9ndfmc_correct_data(struct mtd_info *mtd, unsigned char *buf,
+		unsigned char *read_ecc, unsigned char *calc_ecc)
+{
+	struct nand_chip *chip = mtd->priv;
+	int eccsize;
+	int corrected = 0;
+	int stat;
+
+	for (eccsize = chip->ecc.size; eccsize > 0; eccsize -= 256) {
+		stat = __nand_correct_data(buf, read_ecc, calc_ecc, 256);
+		if (stat < 0)
+			return stat;
+		corrected += stat;
+		buf += 256;
+		read_ecc += 3;
+		calc_ecc += 3;
+	}
+	return corrected;
+}
+
 static void txx9ndfmc_enable_hwecc(struct mtd_info *mtd, int mode)
 {
 	struct platform_device *dev = mtd_to_platdev(mtd);
@@ -244,6 +269,22 @@ static void txx9ndfmc_initialize(struct platform_device *dev)
 #define TXX9NDFMC_NS_TO_CYC(gbusclk, ns) \
 	DIV_ROUND_UP((ns) * DIV_ROUND_UP(gbusclk, 1000), 1000000)
 
+static int txx9ndfmc_nand_scan(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd->priv;
+	int ret;
+
+	ret = nand_scan_ident(mtd, 1);
+	if (!ret) {
+		if (mtd->writesize >= 512) {
+			chip->ecc.size = mtd->writesize;
+			chip->ecc.bytes = 3 * (mtd->writesize / 256);
+		}
+		ret = nand_scan_tail(mtd);
+	}
+	return ret;
+}
+
 static int __init txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev->dev.platform_data;
@@ -321,9 +362,10 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		chip->cmd_ctrl = txx9ndfmc_cmd_ctrl;
 		chip->dev_ready = txx9ndfmc_dev_ready;
 		chip->ecc.calculate = txx9ndfmc_calculate_ecc;
-		chip->ecc.correct = nand_correct_data;
+		chip->ecc.correct = txx9ndfmc_correct_data;
 		chip->ecc.hwctl = txx9ndfmc_enable_hwecc;
 		chip->ecc.mode = NAND_ECC_HW;
+		/* txx9ndfmc_nand_scan will overwrite ecc.size and ecc.bytes */
 		chip->ecc.size = 256;
 		chip->ecc.bytes = 3;
 		chip->chip_delay = 100;
@@ -349,7 +391,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		if (plat->wide_mask & (1 << i))
 			chip->options |= NAND_BUSWIDTH_16;
 
-		if (nand_scan(mtd, 1)) {
+		if (txx9ndfmc_nand_scan(mtd)) {
 			kfree(txx9_priv->mtdname);
 			kfree(txx9_priv);
 			continue;
-- 
1.5.6.5

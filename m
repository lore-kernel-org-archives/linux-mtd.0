Received: from [2001:6f8:1178:4:290:27ff:fe1d:cc33]
 (helo=metis.ext.pengutronix.de)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLG3N-0005Fl-7j
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 19:01:01 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] mtd: mxc-nand: Only enable hardware checksumming for
 fully detected flashes
Date: Tue, 10 Feb 2015 19:59:56 +0100
Message-Id: <1423594800-24214-3-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1423594800-24214-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1423594800-24214-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At least on i.MX25 (i.e. NFCv2) preset_v2 is called with mtd->writesize
== 0 that is before the connect flash chip is detected. It then
configures for 8 bit ECC mode which needs 26 bytes of OOB per 512 bytes
main section. For flashes with a smaller OOB area issuing a read page
command makes the controller stuck with this config.

Note that this currently doesn't hurt because the first read page
command is issued only after detection is complete and preset is called
once more.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 27ba07c07966..d9637ae34719 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -928,7 +928,7 @@ static void preset_v1(struct mtd_info *mtd)
 	struct mxc_nand_host *host = nand_chip->priv;
 	uint16_t config1 = 0;
 
-	if (nand_chip->ecc.mode == NAND_ECC_HW)
+	if (nand_chip->ecc.mode == NAND_ECC_HW && mtd->writesize)
 		config1 |= NFC_V1_V2_CONFIG1_ECC_EN;
 
 	if (!host->devtype_data->irqpending_quirk)
@@ -956,9 +956,6 @@ static void preset_v2(struct mtd_info *mtd)
 	struct mxc_nand_host *host = nand_chip->priv;
 	uint16_t config1 = 0;
 
-	if (nand_chip->ecc.mode == NAND_ECC_HW)
-		config1 |= NFC_V1_V2_CONFIG1_ECC_EN;
-
 	config1 |= NFC_V2_CONFIG1_FP_INT;
 
 	if (!host->devtype_data->irqpending_quirk)
@@ -967,6 +964,9 @@ static void preset_v2(struct mtd_info *mtd)
 	if (mtd->writesize) {
 		uint16_t pages_per_block = mtd->erasesize / mtd->writesize;
 
+		if (nand_chip->ecc.mode == NAND_ECC_HW)
+			config1 |= NFC_V1_V2_CONFIG1_ECC_EN;
+
 		host->eccsize = get_eccsize(mtd);
 		if (host->eccsize == 4)
 			config1 |= NFC_V2_CONFIG1_ECC_MODE_4;
@@ -1024,9 +1024,6 @@ static void preset_v3(struct mtd_info *mtd)
 		NFC_V3_CONFIG2_INT_MSK |
 		NFC_V3_CONFIG2_NUM_ADDR_PHASE0;
 
-	if (chip->ecc.mode == NAND_ECC_HW)
-		config2 |= NFC_V3_CONFIG2_ECC_EN;
-
 	addr_phases = fls(chip->pagemask) >> 3;
 
 	if (mtd->writesize == 2048) {
@@ -1041,6 +1038,9 @@ static void preset_v3(struct mtd_info *mtd)
 	}
 
 	if (mtd->writesize) {
+		if (chip->ecc.mode == NAND_ECC_HW)
+			config2 |= NFC_V3_CONFIG2_ECC_EN;
+
 		config2 |= NFC_V3_CONFIG2_PPB(
 				ffs(mtd->erasesize / mtd->writesize) - 6,
 				host->devtype_data->ppb_shift);
-- 
2.1.4

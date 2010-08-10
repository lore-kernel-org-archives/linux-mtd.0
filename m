Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oinj8-000882-PY
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 12:14:43 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/12] mxc_nand: configure pages per block for v2 controller
Date: Tue, 10 Aug 2010 14:14:33 +0200
Message-Id: <1281442473-31428-4-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1281442473-31428-1-git-send-email-s.hauer@pengutronix.de>
References: <1281442473-31428-1-git-send-email-s.hauer@pengutronix.de>
Cc: Baruch Siach <baruch@tkos.co.il>, Sascha Hauer <s.hauer@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, Ivo Clarysse <ivo.clarysse@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch initializes the pages per block field in CONFIG1 for
v2 controllers. It also sets the FP_INT field. This is the last
field not correctly initialized, so we can switch from
read/modify/write the CONFIG1 reg to just write the correct
value.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |   27 +++++++++++++++------------
 1 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 0cc4343..afbcf36 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -69,7 +69,9 @@
 #define NFC_V1_V2_CONFIG1_BIG		(1 << 5)
 #define NFC_V1_V2_CONFIG1_RST		(1 << 6)
 #define NFC_V1_V2_CONFIG1_CE		(1 << 7)
-#define NFC_V1_V2_CONFIG1_ONE_CYCLE	(1 << 8)
+#define NFC_V2_CONFIG1_ONE_CYCLE	(1 << 8)
+#define NFC_V2_CONFIG1_PPB(x)		(((x) & 0x3) << 9)
+#define NFC_V2_CONFIG1_FP_INT		(1 << 11)
 
 #define NFC_V1_V2_CONFIG2_INT		(1 << 15)
 
@@ -779,26 +781,27 @@ static void preset_v1_v2(struct mtd_info *mtd)
 {
 	struct nand_chip *nand_chip = mtd->priv;
 	struct mxc_nand_host *host = nand_chip->priv;
-	uint16_t tmp;
+	uint16_t config1 = 0;
 
-	/* disable spare enable */
-	tmp = readw(NFC_V1_V2_CONFIG1);
-	tmp &= ~NFC_V1_V2_CONFIG1_SP_EN;
-	if (nand_chip->ecc.mode == NAND_ECC_HW) {
-		tmp |= NFC_V1_V2_CONFIG1_ECC_EN;
-	} else {
-		tmp &= ~NFC_V1_V2_CONFIG1_ECC_EN;
-	}
+	if (nand_chip->ecc.mode == NAND_ECC_HW)
+		config1 |= NFC_V1_V2_CONFIG1_ECC_EN;
+
+	if (nfc_is_v21())
+		config1 |= NFC_V2_CONFIG1_FP_INT;
 
 	if (nfc_is_v21() && mtd->writesize) {
+		uint16_t pages_per_block = mtd->erasesize / mtd->writesize;
+
 		host->eccsize = get_eccsize(mtd);
 		if (host->eccsize == 4)
-			tmp |= NFC_V2_CONFIG1_ECC_MODE_4;
+			config1 |= NFC_V2_CONFIG1_ECC_MODE_4;
+
+		config1 |= NFC_V2_CONFIG1_PPB(ffs(pages_per_block) - 6);
 	} else {
 		host->eccsize = 1;
 	}
 
-	writew(tmp, NFC_V1_V2_CONFIG1);
+	writew(config1, NFC_V1_V2_CONFIG1);
 	/* preset operation */
 
 	/* Unlock the internal RAM Buffer */
-- 
1.7.1

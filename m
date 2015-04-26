From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 4/4] mtd: mxc_nand: generate nand_ecclayout for 8 bit ECC
Date: Sun, 26 Apr 2015 11:16:51 +0300
Message-Id: <c70c70dfe01be9356eeb238072fda699f30672fc.1430034929.git.baruch@tkos.co.il>
In-Reply-To: <cover.1430034929.git.baruch@tkos.co.il>
References: <cover.1430034929.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hardware 8 bit ECC requires a different nand_ecclayout. Instead of adding yet
another static struct nand_ecclayout, generate it in code.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/mxc_nand.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index c05f5e8fef17..07493f0d9eb4 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -934,6 +934,22 @@ static int get_eccsize(struct mtd_info *mtd)
 		return 8;
 }
 
+static void ecc_8bit_layout(struct nand_ecclayout *layout)
+{
+	int i, j;
+
+	for (i = 0; i < 8; i++)
+		for (j = 0; j < 18; j++)
+			layout->eccpos[i*18 + j] = i*26 + j + 7;
+
+	layout->oobfree[0].offset = 2;
+	layout->oobfree[0].length = 4;
+	for (i = 1; i < 8; i++) {
+		layout->oobfree[i].offset = i*26;
+		layout->oobfree[i].length = 7;
+	}
+}
+
 static void preset_v1(struct mtd_info *mtd)
 {
 	struct nand_chip *nand_chip = mtd->priv;
@@ -1610,8 +1626,11 @@ static int mxcnd_probe(struct platform_device *pdev)
 
 	if (mtd->writesize == 2048)
 		this->ecc.layout = host->devtype_data->ecclayout_2k;
-	else if (mtd->writesize == 4096)
+	else if (mtd->writesize == 4096) {
 		this->ecc.layout = host->devtype_data->ecclayout_4k;
+		if (get_eccsize(mtd) == 8)
+			ecc_8bit_layout(this->ecc.layout);
+	}
 
 	if (this->ecc.mode == NAND_ECC_HW) {
 		if (is_imx21_nfc(host) || is_imx27_nfc(host))
-- 
2.1.4

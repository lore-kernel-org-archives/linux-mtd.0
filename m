From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 4/4] mtd: mxc_nand: generate nand_ecclayout for 8 bit ECC
Date: Wed, 13 May 2015 11:17:39 +0300
Message-Id: <95e2a17d74da5a0415ab93e060f6efc681216313.1431504091.git.baruch@tkos.co.il>
In-Reply-To: <cover.1431504091.git.baruch@tkos.co.il>
References: <cover.1431504091.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Fabio Estevam <Fabio.Estevam@freescale.com>,
 Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
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

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v3:
   Rename ecc_8bit_layout to ecc_8bit_layout_4k (Uwe Kleine-König)

v2:
   Initialize eccbytes
---
 drivers/mtd/nand/mxc_nand.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 010be8aa41d4..25759563bf11 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -960,6 +960,23 @@ static int get_eccsize(struct mtd_info *mtd)
 		return 8;
 }
 
+static void ecc_8bit_layout_4k(struct nand_ecclayout *layout)
+{
+	int i, j;
+
+	layout->eccbytes = 8*18;
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
@@ -1636,8 +1653,11 @@ static int mxcnd_probe(struct platform_device *pdev)
 
 	if (mtd->writesize == 2048)
 		this->ecc.layout = host->devtype_data->ecclayout_2k;
-	else if (mtd->writesize == 4096)
+	else if (mtd->writesize == 4096) {
 		this->ecc.layout = host->devtype_data->ecclayout_4k;
+		if (get_eccsize(mtd) == 8)
+			ecc_8bit_layout_4k(this->ecc.layout);
+	}
 
 	/*
 	 * Experimentation shows that i.MX NFC can only handle up to 218 oob
-- 
2.1.4

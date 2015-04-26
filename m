From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/4] mtd: mxc_nand: limit the size of used oob
Date: Sun, 26 Apr 2015 11:16:49 +0300
Message-Id: <4bd5da1f7d57aa32c5682297f7aa0c768e8c6e49.1430034929.git.baruch@tkos.co.il>
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

For 4k pages the i.MX NFC hardware uses exactly 218 or 128 bytes for 4bit or
8bit ECC data, respectively. Larger oobsize confuses the logic of copy_spare().
Limit the size of used oob size to avoid that.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/mxc_nand.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 33b22b9c0b30..c650f0950b20 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -819,15 +819,22 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
 {
 	struct nand_chip *this = mtd->priv;
 	struct mxc_nand_host *host = this->priv;
-	u16 i, oob_chunk_size;
+	u16 i, oob_chunk_size, used_oobsize;
 	u16 num_chunks = mtd->writesize / 512;
 
 	u8 *d = host->data_buf + mtd->writesize;
 	u8 __iomem *s = host->spare0;
 	u16 sparebuf_size = host->devtype_data->spare_len;
 
+	/* hardware can only use 218 or 128 oob bytes for ecc */
+	if (mtd->oobsize >= 218)
+		used_oobsize = 218;
+	else if (mtd->oobsize >= 128)
+		used_oobsize = 128;
+	else
+		used_oobsize = mtd->oobsize;
 	/* size of oob chunk for all but possibly the last one */
-	oob_chunk_size = (mtd->oobsize / num_chunks) & ~1;
+	oob_chunk_size = (used_oobsize / num_chunks) & ~1;
 
 	if (bfrom) {
 		for (i = 0; i < num_chunks - 1; i++)
@@ -838,7 +845,7 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
 		/* the last chunk */
 		memcpy32_fromio(d + i * oob_chunk_size,
 				s + i * sparebuf_size,
-				mtd->oobsize - i * oob_chunk_size);
+				used_oobsize - i * oob_chunk_size);
 	} else {
 		for (i = 0; i < num_chunks - 1; i++)
 			memcpy32_toio(&s[i * sparebuf_size],
@@ -848,7 +855,7 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
 		/* the last chunk */
 		memcpy32_toio(&s[oob_chunk_size * sparebuf_size],
 			      &d[i * oob_chunk_size],
-			      mtd->oobsize - i * oob_chunk_size);
+			      used_oobsize - i * oob_chunk_size);
 	}
 }
 
-- 
2.1.4

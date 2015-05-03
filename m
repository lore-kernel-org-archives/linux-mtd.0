From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 1/4] mtd: nand: mxc_nand: cleanup copy_spare function
Date: Sun,  3 May 2015 10:18:51 +0300
Message-Id: <782c879fdfa0125211fb1a3a2fcd143687c541fc.1430636819.git.baruch@tkos.co.il>
In-Reply-To: <cover.1430636819.git.baruch@tkos.co.il>
References: <cover.1430636819.git.baruch@tkos.co.il>
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

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

To give people without the reference manual at hand a chance to
understand how spare area is handled in the i.MX nand controller,
improve commenting, naming of variables and coding style.

No functional change intended.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
[baruch: declare oob_chunk_size; update comments; reword commit log]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/mxc_nand.c | 46 ++++++++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 372e0e38f59b..33b22b9c0b30 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -807,32 +807,48 @@ static void mxc_nand_select_chip_v2(struct mtd_info *mtd, int chip)
 }
 
 /*
- * Function to transfer data to/from spare area.
+ * The controller splits a page into data chunks of 512 bytes + partial oob.
+ * There are writesize / 512 such chunks, the size of the partial oob parts is
+ * oobsize / #chunks rounded down to a multiple of 2. The last oob chunk then
+ * contains additionally the byte lost by rounding (if any).
+ * This function handles the needed shuffling between host->data_buf (which
+ * holds a page in natural order, i.e. writesize bytes data + oobsize bytes
+ * spare) and the NFC buffer.
  */
 static void copy_spare(struct mtd_info *mtd, bool bfrom)
 {
 	struct nand_chip *this = mtd->priv;
 	struct mxc_nand_host *host = this->priv;
-	u16 i, j;
-	u16 n = mtd->writesize >> 9;
+	u16 i, oob_chunk_size;
+	u16 num_chunks = mtd->writesize / 512;
+
 	u8 *d = host->data_buf + mtd->writesize;
 	u8 __iomem *s = host->spare0;
-	u16 t = host->devtype_data->spare_len;
+	u16 sparebuf_size = host->devtype_data->spare_len;
 
-	j = (mtd->oobsize / n >> 1) << 1;
+	/* size of oob chunk for all but possibly the last one */
+	oob_chunk_size = (mtd->oobsize / num_chunks) & ~1;
 
 	if (bfrom) {
-		for (i = 0; i < n - 1; i++)
-			memcpy32_fromio(d + i * j, s + i * t, j);
-
-		/* the last section */
-		memcpy32_fromio(d + i * j, s + i * t, mtd->oobsize - i * j);
+		for (i = 0; i < num_chunks - 1; i++)
+			memcpy32_fromio(d + i * oob_chunk_size,
+					s + i * sparebuf_size,
+					oob_chunk_size);
+
+		/* the last chunk */
+		memcpy32_fromio(d + i * oob_chunk_size,
+				s + i * sparebuf_size,
+				mtd->oobsize - i * oob_chunk_size);
 	} else {
-		for (i = 0; i < n - 1; i++)
-			memcpy32_toio(&s[i * t], &d[i * j], j);
-
-		/* the last section */
-		memcpy32_toio(&s[i * t], &d[i * j], mtd->oobsize - i * j);
+		for (i = 0; i < num_chunks - 1; i++)
+			memcpy32_toio(&s[i * sparebuf_size],
+				      &d[i * oob_chunk_size],
+				      oob_chunk_size);
+
+		/* the last chunk */
+		memcpy32_toio(&s[oob_chunk_size * sparebuf_size],
+			      &d[i * oob_chunk_size],
+			      mtd->oobsize - i * oob_chunk_size);
 	}
 }
 
-- 
2.1.4

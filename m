Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eblxx-0005vI-3d
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 11:33:15 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/8] mtd: nand: mxc: reorder functions to avoid forward
 declarations
Date: Wed, 17 Jan 2018 12:32:06 +0100
Message-Id: <20180117113213.15455-2-s.hauer@pengutronix.de>
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

We'll call copy_spare() and mxc_do_addr_cycle() from another place
during the next patches, so move functions up to avoid forward
declarations.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 206 ++++++++++++++++++++++----------------------
 1 file changed, 103 insertions(+), 103 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index f3be0b2a8869..6741af990dc4 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -252,6 +252,109 @@ static void memcpy16_toio(void __iomem *trg, const void *src, int size)
 		__raw_writew(*s++, t++);
 }
 
+/*
+ * The controller splits a page into data chunks of 512 bytes + partial oob.
+ * There are writesize / 512 such chunks, the size of the partial oob parts is
+ * oobsize / #chunks rounded down to a multiple of 2. The last oob chunk then
+ * contains additionally the byte lost by rounding (if any).
+ * This function handles the needed shuffling between host->data_buf (which
+ * holds a page in natural order, i.e. writesize bytes data + oobsize bytes
+ * spare) and the NFC buffer.
+ */
+static void copy_spare(struct mtd_info *mtd, bool bfrom)
+{
+	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mxc_nand_host *host = nand_get_controller_data(this);
+	u16 i, oob_chunk_size;
+	u16 num_chunks = mtd->writesize / 512;
+
+	u8 *d = host->data_buf + mtd->writesize;
+	u8 __iomem *s = host->spare0;
+	u16 sparebuf_size = host->devtype_data->spare_len;
+
+	/* size of oob chunk for all but possibly the last one */
+	oob_chunk_size = (host->used_oobsize / num_chunks) & ~1;
+
+	if (bfrom) {
+		for (i = 0; i < num_chunks - 1; i++)
+			memcpy16_fromio(d + i * oob_chunk_size,
+					s + i * sparebuf_size,
+					oob_chunk_size);
+
+		/* the last chunk */
+		memcpy16_fromio(d + i * oob_chunk_size,
+				s + i * sparebuf_size,
+				host->used_oobsize - i * oob_chunk_size);
+	} else {
+		for (i = 0; i < num_chunks - 1; i++)
+			memcpy16_toio(&s[i * sparebuf_size],
+				      &d[i * oob_chunk_size],
+				      oob_chunk_size);
+
+		/* the last chunk */
+		memcpy16_toio(&s[i * sparebuf_size],
+			      &d[i * oob_chunk_size],
+			      host->used_oobsize - i * oob_chunk_size);
+	}
+}
+
+/*
+ * MXC NANDFC can only perform full page+spare or spare-only read/write.  When
+ * the upper layers perform a read/write buf operation, the saved column address
+ * is used to index into the full page. So usually this function is called with
+ * column == 0 (unless no column cycle is needed indicated by column == -1)
+ */
+static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
+{
+	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
+
+	/* Write out column address, if necessary */
+	if (column != -1) {
+		host->devtype_data->send_addr(host, column & 0xff,
+					      page_addr == -1);
+		if (mtd->writesize > 512)
+			/* another col addr cycle for 2k page */
+			host->devtype_data->send_addr(host,
+						      (column >> 8) & 0xff,
+						      false);
+	}
+
+	/* Write out page address, if necessary */
+	if (page_addr != -1) {
+		/* paddr_0 - p_addr_7 */
+		host->devtype_data->send_addr(host, (page_addr & 0xff), false);
+
+		if (mtd->writesize > 512) {
+			if (mtd->size >= 0x10000000) {
+				/* paddr_8 - paddr_15 */
+				host->devtype_data->send_addr(host,
+						(page_addr >> 8) & 0xff,
+						false);
+				host->devtype_data->send_addr(host,
+						(page_addr >> 16) & 0xff,
+						true);
+			} else
+				/* paddr_8 - paddr_15 */
+				host->devtype_data->send_addr(host,
+						(page_addr >> 8) & 0xff, true);
+		} else {
+			if (nand_chip->options & NAND_ROW_ADDR_3) {
+				/* paddr_8 - paddr_15 */
+				host->devtype_data->send_addr(host,
+						(page_addr >> 8) & 0xff,
+						false);
+				host->devtype_data->send_addr(host,
+						(page_addr >> 16) & 0xff,
+						true);
+			} else
+				/* paddr_8 - paddr_15 */
+				host->devtype_data->send_addr(host,
+						(page_addr >> 8) & 0xff, true);
+		}
+	}
+}
+
 static int check_int_v3(struct mxc_nand_host *host)
 {
 	uint32_t tmp;
@@ -772,109 +875,6 @@ static void mxc_nand_select_chip_v2(struct mtd_info *mtd, int chip)
 	writew(host->active_cs << 4, NFC_V1_V2_BUF_ADDR);
 }
 
-/*
- * The controller splits a page into data chunks of 512 bytes + partial oob.
- * There are writesize / 512 such chunks, the size of the partial oob parts is
- * oobsize / #chunks rounded down to a multiple of 2. The last oob chunk then
- * contains additionally the byte lost by rounding (if any).
- * This function handles the needed shuffling between host->data_buf (which
- * holds a page in natural order, i.e. writesize bytes data + oobsize bytes
- * spare) and the NFC buffer.
- */
-static void copy_spare(struct mtd_info *mtd, bool bfrom)
-{
-	struct nand_chip *this = mtd_to_nand(mtd);
-	struct mxc_nand_host *host = nand_get_controller_data(this);
-	u16 i, oob_chunk_size;
-	u16 num_chunks = mtd->writesize / 512;
-
-	u8 *d = host->data_buf + mtd->writesize;
-	u8 __iomem *s = host->spare0;
-	u16 sparebuf_size = host->devtype_data->spare_len;
-
-	/* size of oob chunk for all but possibly the last one */
-	oob_chunk_size = (host->used_oobsize / num_chunks) & ~1;
-
-	if (bfrom) {
-		for (i = 0; i < num_chunks - 1; i++)
-			memcpy16_fromio(d + i * oob_chunk_size,
-					s + i * sparebuf_size,
-					oob_chunk_size);
-
-		/* the last chunk */
-		memcpy16_fromio(d + i * oob_chunk_size,
-				s + i * sparebuf_size,
-				host->used_oobsize - i * oob_chunk_size);
-	} else {
-		for (i = 0; i < num_chunks - 1; i++)
-			memcpy16_toio(&s[i * sparebuf_size],
-				      &d[i * oob_chunk_size],
-				      oob_chunk_size);
-
-		/* the last chunk */
-		memcpy16_toio(&s[i * sparebuf_size],
-			      &d[i * oob_chunk_size],
-			      host->used_oobsize - i * oob_chunk_size);
-	}
-}
-
-/*
- * MXC NANDFC can only perform full page+spare or spare-only read/write.  When
- * the upper layers perform a read/write buf operation, the saved column address
- * is used to index into the full page. So usually this function is called with
- * column == 0 (unless no column cycle is needed indicated by column == -1)
- */
-static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
-
-	/* Write out column address, if necessary */
-	if (column != -1) {
-		host->devtype_data->send_addr(host, column & 0xff,
-					      page_addr == -1);
-		if (mtd->writesize > 512)
-			/* another col addr cycle for 2k page */
-			host->devtype_data->send_addr(host,
-						      (column >> 8) & 0xff,
-						      false);
-	}
-
-	/* Write out page address, if necessary */
-	if (page_addr != -1) {
-		/* paddr_0 - p_addr_7 */
-		host->devtype_data->send_addr(host, (page_addr & 0xff), false);
-
-		if (mtd->writesize > 512) {
-			if (mtd->size >= 0x10000000) {
-				/* paddr_8 - paddr_15 */
-				host->devtype_data->send_addr(host,
-						(page_addr >> 8) & 0xff,
-						false);
-				host->devtype_data->send_addr(host,
-						(page_addr >> 16) & 0xff,
-						true);
-			} else
-				/* paddr_8 - paddr_15 */
-				host->devtype_data->send_addr(host,
-						(page_addr >> 8) & 0xff, true);
-		} else {
-			if (nand_chip->options & NAND_ROW_ADDR_3) {
-				/* paddr_8 - paddr_15 */
-				host->devtype_data->send_addr(host,
-						(page_addr >> 8) & 0xff,
-						false);
-				host->devtype_data->send_addr(host,
-						(page_addr >> 16) & 0xff,
-						true);
-			} else
-				/* paddr_8 - paddr_15 */
-				host->devtype_data->send_addr(host,
-						(page_addr >> 8) & 0xff, true);
-		}
-	}
-}
-
 #define MXC_V1_ECCBYTES		5
 
 static int mxc_v1_ooblayout_ecc(struct mtd_info *mtd, int section,
-- 
2.11.0

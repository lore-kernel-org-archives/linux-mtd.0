Received: from mail-wi0-f173.google.com ([209.85.212.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnlW-0003jE-Hf
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:55 +0000
Received: by mail-wi0-f173.google.com with SMTP id bs8so389830wib.12
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:32 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 43/47] mtd: nand: stm_nand_bch: read and write buffers (FLEX)
Date: Thu,  1 May 2014 10:56:50 +0100
Message-Id: <1398938214-17847-44-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

read or write in 4 Byte chunks at a time until there is less than
8 Bytes remaining, at which point split down into reading the
reset a single Byte at a time.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 72 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 046e435..ba6ac8f 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -770,6 +770,75 @@ static void flex_addr(struct nandi_controller *nandi,
 	writel(addr, nandi->base + NANDHAM_FLEX_ADD);
 }
 
+static void flex_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct nandi_controller *nandi = chip->priv;
+	int aligned;
+
+	emiss_nandi_select(STM_NANDI_HAMMING);
+
+	/* Read bytes until buf is 4-byte aligned */
+	while (len && ((unsigned int)buf & 0x3)) {
+		*buf++ = (uint8_t)(readl(nandi->base + NANDHAM_FLEX_DATA)
+				   & 0xff);
+		len--;
+	};
+
+	/* Use 'BEATS_4'/readsl */
+	if (len > 8) {
+		aligned = len & ~0x3;
+		writel(FLEX_DATA_CFG_BEATS_4 | FLEX_DATA_CFG_CSN,
+		       nandi->base + NANDHAM_FLEX_DATAREAD_CONFIG);
+
+		readsl(nandi->base + NANDHAM_FLEX_DATA, buf, aligned >> 2);
+
+		buf += aligned;
+		len -= aligned;
+
+		writel(FLEX_DATA_CFG_BEATS_1 | FLEX_DATA_CFG_CSN,
+		       nandi->base + NANDHAM_FLEX_DATAREAD_CONFIG);
+	}
+
+	/* Mop up remaining bytes */
+	while (len > 0) {
+		*buf++ = (uint8_t)(readl(nandi->base + NANDHAM_FLEX_DATA)
+				   & 0xff);
+		len--;
+	}
+}
+
+static void flex_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct nandi_controller *nandi = chip->priv;
+	int aligned;
+
+	/* Write bytes until buf is 4-byte aligned */
+	while (len && ((unsigned int)buf & 0x3)) {
+		writel(*buf++, nandi->base + NANDHAM_FLEX_DATA);
+		len--;
+	};
+
+	/* USE 'BEATS_4/writesl */
+	if (len > 8) {
+		aligned = len & ~0x3;
+		writel(FLEX_DATA_CFG_BEATS_4 | FLEX_DATA_CFG_CSN,
+		       nandi->base + NANDHAM_FLEX_DATAWRITE_CONFIG);
+		writesl(nandi->base + NANDHAM_FLEX_DATA, buf, aligned >> 2);
+		buf += aligned;
+		len -= aligned;
+		writel(FLEX_DATA_CFG_BEATS_1 | FLEX_DATA_CFG_CSN,
+		       nandi->base + NANDHAM_FLEX_DATAWRITE_CONFIG);
+	}
+
+	/* Mop up remaining bytes */
+	while (len > 0) {
+		writel(*buf++, nandi->base + NANDHAM_FLEX_DATA);
+		len--;
+	}
+}
+
 static int flex_read_raw(struct nandi_controller *nandi,
 			 uint32_t page_addr,
 			 uint32_t col_addr,
@@ -1416,6 +1485,9 @@ static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
 	chip->ecc.layout = &info->ecclayout;
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
+	chip->read_buf = flex_read_buf;
+	chip->write_buf = flex_write_buf;
+
 	chip->bbt_options |= NAND_BBT_USE_FLASH;
 
 	/* mtd_info */
-- 
1.8.3.2

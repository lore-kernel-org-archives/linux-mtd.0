Received: from mail-wi0-f180.google.com ([209.85.212.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMcY-0002Gp-Iv
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:22:07 +0000
Received: by mail-wi0-f180.google.com with SMTP id hr14so344706wib.1
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:21:44 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 45/47] mtd: nand: stm_nand_bch: read and write buffers (FLEX)
Date: Tue, 25 Mar 2014 08:20:02 +0000
Message-Id: <1395735604-26706-46-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
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
index f5b0a00..975326e 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -686,6 +686,75 @@ static void flex_addr(struct nandi_controller *nandi,
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
 /*
  * Hamming-FLEX operations (optimised replacements for nand_base.c versions)
  */
@@ -1743,6 +1812,9 @@ static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
 	chip->priv = nandi;
 	chip->ecc.layout = &info->ecclayout;
 
+	chip->read_buf = flex_read_buf;
+	chip->write_buf = flex_write_buf;
+
 	chip->bbt_options |= NAND_BBT_USE_FLASH;
 
 	/* mtd_info */
-- 
1.8.3.2

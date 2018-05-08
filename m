Received: from mail-eopbgr50124.outbound.protection.outlook.com
 ([40.107.5.124] helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGA2e-0001ql-2a
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 21:21:02 +0000
From: Jane Wan <Jane.Wan@nokia.com>
To: Boris.Brezillon@bootlin.com, miquel.raynal@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 marek.vasut@gmail.com, yamada.masahiro@socionext.com,
 prabhakar.kushwaha@nxp.com, shawnguo@kernel.org, jagdish.gediya@nxp.com,
 shreeya.patel23498@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ties.bos@nokia.com, Jane Wan <Jane.Wan@nokia.com>
Subject: [PATCH v4 2/2] mtd: rawnand: use bit-wise majority to recover the
 contents of ONFI parameter
Date: Tue,  8 May 2018 14:19:54 -0700
Message-Id: <1525814394-30067-2-git-send-email-Jane.Wan@nokia.com>
In-Reply-To: <1525814394-30067-1-git-send-email-Jane.Wan@nokia.com>
References: <1525814394-30067-1-git-send-email-Jane.Wan@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Per ONFI specification (Rev. 4.0), if all parameter pages have invalid
CRC values, the bit-wise majority may be used to recover the contents of
the parameter pages from the parameter page copies present.

Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
---
 drivers/mtd/nand/raw/nand_base.c |   49 ++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 72f3a89..dfc341c 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5086,6 +5086,38 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 	return ret;
 }
 
+#define GET_BIT(bit, val)   (((val) >> (bit)) & 0x01)
+
+/*
+ * Recover NAND parameter page with bit-wise majority
+ */
+static int onfi_recover_param(struct nand_onfi_params *p, int pages)
+{
+	int i, j, k;
+	u8 v, m;
+	u8 *buf;
+
+	buf = (u8 *)p;
+	for (i = 0; i < sizeof(*p); i++) {
+		v = 0;
+		for (j = 0; j < 8; j++) {
+			m = 0;
+			for (k = 0; k < pages; k++)
+				m += GET_BIT(j, buf[k*sizeof(*p) + i]);
+			if (m > pages/2)
+				v |= BIT(j);
+		}
+		((u8 *)p)[i] = v;
+	}
+
+	if (onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 254) ==
+			le16_to_cpu(p->crc)) {
+		return 1;
+	}
+
+	return 0;
+}
+
 /*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
  */
@@ -5102,7 +5134,7 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 		return 0;
 
 	/* ONFI chip: allocate a buffer to hold its parameter page */
-	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	p = kzalloc((sizeof(*p) * 3), GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -5113,21 +5145,28 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 	}
 
 	for (i = 0; i < 3; i++) {
-		ret = nand_read_data_op(chip, p, sizeof(*p), true);
+		ret = nand_read_data_op(chip, &p[i], sizeof(*p), true);
 		if (ret) {
 			ret = 0;
 			goto free_onfi_param_page;
 		}
 
-		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
+		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)&p[i], 254) ==
 				le16_to_cpu(p->crc)) {
+			if (i)
+				memcpy(p, &p[i], sizeof(*p));
 			break;
 		}
 	}
 
 	if (i == 3) {
-		pr_err("Could not find valid ONFI parameter page; aborting\n");
-		goto free_onfi_param_page;
+		pr_err("Could not find valid ONFI parameter page\n");
+		pr_info("Recover ONFI params with bit-wise majority\n");
+		ret = onfi_recover_param(p, 3);
+		if (ret == 0) {
+			pr_err("ONFI parameter recovery failed, aborting\n");
+			goto free_onfi_param_page;
+		}
 	}
 
 	/* Check version */
-- 
1.7.9.5

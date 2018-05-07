Received: from mail-he1eur01on0136.outbound.protection.outlook.com
 ([104.47.0.136] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFj6C-0007qE-Tg
 for linux-mtd@lists.infradead.org; Mon, 07 May 2018 16:34:54 +0000
From: Jane Wan <Jane.Wan@nokia.com>
To: Boris.Brezillon@bootlin.com, miquel.raynal@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 marek.vasut@gmail.com, yamada.masahiro@socionext.com,
 prabhakar.kushwaha@nxp.com, shawnguo@kernel.org, jagdish.gediya@nxp.com,
 shreeya.patel23498@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ties.bos@nokia.com, Jane Wan <Jane.Wan@nokia.com>
Subject: [PATCH v3 2/2] mtd: rawnand: fsl_ifc: use bit-wise majority to
 recover the contents of ONFI parameter
Date: Mon,  7 May 2018 09:34:15 -0700
Message-Id: <1525710855-8159-1-git-send-email-Jane.Wan@nokia.com>
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
 drivers/mtd/nand/raw/nand_base.c |   41 ++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 72f3a89..48f2dec 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5086,15 +5086,18 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 	return ret;
 }
 
+#define GET_BIT(bit, val)   (((val) >> (bit)) & 0x01)
+
 /*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
  */
 static int nand_flash_detect_onfi(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_onfi_params *p;
+	struct nand_onfi_params *p = NULL;
 	char id[4];
-	int i, ret, val;
+	int i, ret, val, pagesize;
+	u8 *buf = NULL;
 
 	/* Try ONFI for unknown chip or LP */
 	ret = nand_readid_op(chip, 0x20, id, sizeof(id));
@@ -5102,8 +5105,9 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 		return 0;
 
 	/* ONFI chip: allocate a buffer to hold its parameter page */
-	p = kzalloc(sizeof(*p), GFP_KERNEL);
-	if (!p)
+	pagesize = sizeof(*p);
+	buf = kzalloc((pagesize * 3), GFP_KERNEL);
+	if (!buf)
 		return -ENOMEM;
 
 	ret = nand_read_param_page_op(chip, 0, NULL, 0);
@@ -5113,7 +5117,8 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 	}
 
 	for (i = 0; i < 3; i++) {
-		ret = nand_read_data_op(chip, p, sizeof(*p), true);
+		p = (struct nand_onfi_params *)&buf[i*pagesize];
+		ret = nand_read_data_op(chip, p, pagesize, true);
 		if (ret) {
 			ret = 0;
 			goto free_onfi_param_page;
@@ -5126,8 +5131,27 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 	}
 
 	if (i == 3) {
-		pr_err("Could not find valid ONFI parameter page; aborting\n");
-		goto free_onfi_param_page;
+		int j, k, l;
+		u8 v, m;
+
+		pr_err("Could not find valid ONFI parameter page\n");
+		pr_info("Recover ONFI params with bit-wise majority\n");
+		for (j = 0; j < pagesize; j++) {
+			v = 0;
+			for (k = 0; k < 8; k++) {
+				m = 0;
+				for (l = 0; l < 3; l++)
+					m += GET_BIT(k, buf[l*pagesize + j]);
+				if (m > 1)
+					v |= BIT(k);
+			}
+			((u8 *)p)[j] = v;
+		}
+		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) !=
+				le16_to_cpu(p->crc)) {
+			pr_err("ONFI parameter recovery failed, aborting\n");
+			goto free_onfi_param_page;
+		}
 	}
 
 	/* Check version */
@@ -5220,7 +5244,8 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 	       sizeof(p->vendor));
 
 free_onfi_param_page:
-	kfree(p);
+	if (buf != NULL)
+		kfree(buf);
 	return ret;
 }
 
-- 
1.7.9.5

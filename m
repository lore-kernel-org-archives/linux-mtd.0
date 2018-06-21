Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVwv7-0003n8-EG
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2018 10:34:35 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v4 3/6] mtd: rawnand: add defines for ONFI version bits
Date: Thu, 21 Jun 2018 22:33:25 +1200
Message-Id: <20180621103328.28206-4-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20180621103328.28206-1-chris.packham@alliedtelesis.co.nz>
References: <20180621103328.28206-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add defines for the ONFI version bits and use them in
nand_flash_detect_onfi().

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v4:
- New

 drivers/mtd/nand/raw/nand_base.c | 10 +++++-----
 include/linux/mtd/rawnand.h      | 11 +++++++++++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 65250308c82d..36048e0cf1f5 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5178,15 +5178,15 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 
 	/* Check version */
 	val = le16_to_cpu(p->revision);
-	if (val & (1 << 5))
+	if (val & ONFI_VERSION_2_3)
 		chip->parameters.onfi.version = 23;
-	else if (val & (1 << 4))
+	else if (val & ONFI_VERSION_2_2)
 		chip->parameters.onfi.version = 22;
-	else if (val & (1 << 3))
+	else if (val & ONFI_VERSION_2_1)
 		chip->parameters.onfi.version = 21;
-	else if (val & (1 << 2))
+	else if (val & ONFI_VERSION_2_0)
 		chip->parameters.onfi.version = 20;
-	else if (val & (1 << 1))
+	else if (val & ONFI_VERSION_1_0)
 		chip->parameters.onfi.version = 10;
 
 	if (!chip->parameters.onfi.version) {
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index ef7e3b4e91ea..015bc3f2fc13 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -230,6 +230,17 @@ enum nand_ecc_algo {
 /* Keep gcc happy */
 struct nand_chip;
 
+/* ONFI version bits */
+#define ONFI_VERSION_1_0		BIT(1)
+#define ONFI_VERSION_2_0		BIT(2)
+#define ONFI_VERSION_2_1		BIT(3)
+#define ONFI_VERSION_2_2		BIT(4)
+#define ONFI_VERSION_2_3		BIT(5)
+#define ONFI_VERSION_3_0		BIT(6)
+#define ONFI_VERSION_3_1		BIT(7)
+#define ONFI_VERSION_3_2		BIT(8)
+#define ONFI_VERSION_4_0		BIT(9)
+
 /* ONFI features */
 #define ONFI_FEATURE_16_BIT_BUS		(1 << 0)
 #define ONFI_FEATURE_EXT_PARAM_PAGE	(1 << 7)
-- 
2.17.1

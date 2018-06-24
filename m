Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXDl9-0003sN-Vk
 for linux-mtd@lists.infradead.org; Sun, 24 Jun 2018 22:45:30 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v6 6/6] mtd: rawnand: micron: detect forced on-die ECC
Date: Mon, 25 Jun 2018 10:44:48 +1200
Message-Id: <20180624224448.21872-7-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20180624224448.21872-1-chris.packham@alliedtelesis.co.nz>
References: <20180624224448.21872-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some Micron NAND chips have on-die ECC forceably enabled. Detect these
based on chip ID as there seems to be no other way of distinguishing
these chips from those that have optional support for on-die ECC.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v4:
- New
Changes in v5:
- fail if on-die ECC is mandatory and the current ecc.mode is not
  NAND_ECC_ON_DIE.
Changes in v6:
- Update commit message, add review from Boris

 drivers/mtd/nand/raw/nand_micron.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index f83053562925..35fa6880a799 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -255,6 +255,14 @@ enum {
 	MICRON_ON_DIE_MANDATORY,
 };
 
+/*
+ * These parts are known to have on-die ECC forceably enabled
+ */
+static u8 micron_on_die_ecc[] = {
+	0xd1, /* MT29F1G08ABAFA */
+	0xa1, /* MT29F1G08ABBFA */
+};
+
 /*
  * Try to detect if the NAND support on-die ECC. To do this, we enable
  * the feature, and read back if it has been enabled as expected. We
@@ -269,6 +277,11 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 {
 	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
 	int ret;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(micron_on_die_ecc); i++)
+		if (chip->id.data[1] == micron_on_die_ecc[i])
+			return MICRON_ON_DIE_MANDATORY;
 
 	if (!chip->parameters.onfi.version)
 		return MICRON_ON_DIE_UNSUPPORTED;
@@ -322,7 +335,8 @@ static int micron_nand_init(struct nand_chip *chip)
 
 	ondie = micron_supports_on_die_ecc(chip);
 
-	if (ondie == MICRON_ON_DIE_MANDATORY) {
+	if (ondie == MICRON_ON_DIE_MANDATORY &&
+	    chip->ecc.mode != NAND_ECC_ON_DIE) {
 		pr_err("On-die ECC forcefully enabled, not supported\n");
 		return -EINVAL;
 	}
-- 
2.18.0

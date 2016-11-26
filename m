Received: from conuserg-11.nifty.com ([210.131.2.78])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhOJ-000263-M9
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:08:01 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 35/39] mtd: nand: denali: calculate ecc.strength and ecc.bytes
 generically
Date: Sun, 27 Nov 2016 03:06:21 +0900
Message-Id: <1480183585-592-36-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Another problem of this driver is hard-coded ecc.strength and
ecc.bytes.  Currently ecc.bytes is defined as follows:

  #define ECC_8BITS	14
  #define ECC_15BITS	26

Such parameters were hard-coded because only the following two cases
are possible on Intel platforms:

 - ecc.size = 512, ecc.strength = 8    --> ecc.bytes = 14
 - ecc.size = 512, ecc.strength = 15   --> ecc.bytes = 26

However, these are actually customizable parameters, for example,
UniPhier platform supports the following:

 - ecc.size = 1024, ecc.strength = 8   --> ecc.bytes = 14
 - ecc.size = 1024, ecc.strength = 16  --> ecc.bytes = 28
 - ecc.size = 1024, ecc.strength = 24  --> ecc.bytes = 42

So, we need somehow a generic way to calculate these parameters.
Fortunately, the Denali User's Guide explains how to calculate the
ecc.bytes.  The formula is:

  ecc.bytes = 2 * CEIL(13 * ecc.strength / 16)  (for ecc.size = 512)
  ecc.bytes = 2 * CEIL(14 * ecc.strength / 16)  (for ecc.size = 1024)

This commit implements two functions denali_calc_ecc_bytes() and
denali_set_max_ecc_strength() to prepare for the next commit,
where I will allow to use SoC-dependent ecc.strength values.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 72 +++++++++++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index c17e92b..f2ed3f8 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1354,13 +1354,44 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	denali_irq_init(denali);
 }
 
-/*
- * Althogh controller spec said SLC ECC is forceb to be 4bit,
- * but denali controller in MRST only support 15bit and 8bit ECC
- * correction
- */
-#define ECC_8BITS	14
-#define ECC_15BITS	26
+/* default of supported ECC strength for Intel platforms. */
+static const int denali_default_ecc_strength[] = {
+	15, 8, 0,
+};
+
+static int denali_calc_ecc_bytes(int ecc_size, int ecc_strength)
+{
+	WARN_ON(ecc_size != 512 && ecc_size != 1024);
+
+	return DIV_ROUND_UP(ecc_strength * (ecc_size == 512 ? 13 : 14), 16) * 2;
+}
+
+static int denali_set_max_ecc_strength(struct denali_nand_info *denali)
+{
+	struct nand_chip *chip = &denali->nand;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int oobsize = mtd->oobsize;
+	int ecc_size = chip->ecc.size;
+	int ecc_steps = mtd->writesize / chip->ecc.size;
+	const int *ecc_strength = denali_default_ecc_strength;
+	int ecc_bytes;
+
+	/* carve out the BBM area */
+	oobsize -= denali->bbtskipbytes;
+
+	for (; *ecc_strength; ecc_strength++) {
+		ecc_bytes = denali_calc_ecc_bytes(ecc_size, *ecc_strength);
+		if (oobsize >= ecc_bytes * ecc_steps) {
+			chip->ecc.strength = *ecc_strength;
+			return 0;
+		}
+	}
+
+	dev_err(denali->dev,
+		"Your NAND chip OOB is too small. No available ECC strength.\n");
+
+	return -EINVAL;
+}
 
 static int denali_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *oobregion)
@@ -1594,27 +1625,14 @@ int denali_init(struct denali_nand_info *denali)
 		chip->ecc.size = denali->caps & DENALI_CAPS_ECC_SIZE_1024 ?
 								1024 : 512;
 
-	/*
-	 * Denali Controller only support 15bit and 8bit ECC in MRST,
-	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
-	 * SLC if possible.
-	 * */
-	if (!nand_is_slc(chip) &&
-			mtd->oobsize >= denali->bbtskipbytes +
-			ECC_15BITS * (mtd->writesize / chip->ecc.size)) {
-		/* if MLC OOB size is large enough, use 15bit ECC*/
-		chip->ecc.strength = 15;
-		chip->ecc.bytes = ECC_15BITS;
-		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
-	} else if (mtd->oobsize <
-		   denali->bbtskipbytes + ECC_8BITS * (mtd->writesize / chip->ecc.size)) {
-		pr_err("Your NAND chip OOB is not large enough to contain 8bit ECC correction codes");
+	ret = denali_set_max_ecc_strength(denali);
+	if (ret)
 		goto failed_req_irq;
-	} else {
-		chip->ecc.strength = 8;
-		chip->ecc.bytes = ECC_8BITS;
-		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
-	}
+
+	chip->ecc.bytes = denali_calc_ecc_bytes(chip->ecc.size,
+						chip->ecc.strength);
+
+	iowrite32(chip->ecc.strength, denali->flash_reg + ECC_CORRECTION);
 
 	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
 
-- 
2.7.4

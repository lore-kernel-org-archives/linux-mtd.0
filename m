Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTs2-0007E4-HH
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 06:47:51 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 13/37] mtd: nand: denali: avoid hard-coding ecc.strength
 and ecc.bytes
Date: Thu, 30 Mar 2017 15:45:59 +0900
Message-Id: <1490856383-31560-14-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
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

The parameters were hard-coded because only the following two cases
are possible on Intel platforms:

 - ecc.size = 512, ecc.strength = 8    --> ecc.bytes = 14
 - ecc.size = 512, ecc.strength = 15   --> ecc.bytes = 26

However, they are actually customizable parameters, for example,
UniPhier platform supports the following:

 - ecc.size = 1024, ecc.strength = 8   --> ecc.bytes = 14
 - ecc.size = 1024, ecc.strength = 16  --> ecc.bytes = 28
 - ecc.size = 1024, ecc.strength = 24  --> ecc.bytes = 42

So, we need to handle these parameters in a more generic manner.
Fortunately, the Denali User's Guide explains how to calculate the
ecc.bytes.  The formula is:

  ecc.bytes = 2 * CEIL(13 * ecc.strength / 16)  (for ecc.size = 512)
  ecc.bytes = 2 * CEIL(14 * ecc.strength / 16)  (for ecc.size = 1024)

This commit allows platforms to specify denali->ecc_strength_avail,
each bit of which represents supported ECC strength.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/denali.c     | 73 +++++++++++++++++++++++++++----------------
 drivers/mtd/nand/denali.h     |  1 +
 drivers/mtd/nand/denali_dt.c  |  3 ++
 drivers/mtd/nand/denali_pci.c |  1 +
 4 files changed, 51 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 78d3b18..ce87b95 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1344,13 +1344,45 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	denali_irq_init(denali);
 }
 
-/*
- * Althogh controller spec said SLC ECC is forceb to be 4bit,
- * but denali controller in MRST only support 15bit and 8bit ECC
- * correction
- */
-#define ECC_8BITS	14
-#define ECC_15BITS	26
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
+	int ecc_strength, ecc_bytes;
+	int max_strength = 0;
+
+	/* carve out the BBM area */
+	oobsize -= denali->bbtskipbytes;
+
+	for_each_set_bit(ecc_strength, &denali->ecc_strength_avail,
+			 sizeof(denali->ecc_strength_avail) * BITS_PER_BYTE) {
+		ecc_bytes = denali_calc_ecc_bytes(ecc_size, ecc_strength);
+		if (ecc_bytes * ecc_steps > oobsize)
+			break;
+
+		max_strength = ecc_strength;
+	}
+
+	if (!max_strength) {
+		dev_err(denali->dev,
+			"Your NAND chip OOB is too small. No available ECC strength.\n");
+		return -EINVAL;
+	}
+
+	chip->ecc.strength = max_strength;
+
+	return 0;
+}
 
 static int denali_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *oobregion)
@@ -1609,27 +1641,14 @@ int denali_init(struct denali_nand_info *denali)
 		goto failed_req_irq;
 	}
 
-	/*
-	 * Denali Controller only support 15bit and 8bit ECC in MRST,
-	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
-	 * SLC if possible.
-	 * */
-	if (!nand_is_slc(chip) &&
-			mtd->oobsize > denali->bbtskipbytes +
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
 
 	iowrite32(chip->ecc.size, denali->flash_reg + CFG_DATA_BLOCK_SIZE);
 	iowrite32(chip->ecc.size, denali->flash_reg + CFG_LAST_DATA_BLOCK_SIZE);
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 7c24d82..00ce04e 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -348,6 +348,7 @@ struct denali_nand_info {
 	int bbtskipbytes;
 	int max_banks;
 	unsigned int revision;
+	unsigned long ecc_strength_avail;
 	unsigned int caps;
 };
 
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 1681a30..c3bc333 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -31,10 +31,12 @@ struct denali_dt {
 
 struct denali_dt_data {
 	unsigned int revision;
+	unsigned long ecc_strength_avail;
 	unsigned int caps;
 };
 
 static const struct denali_dt_data denali_socfpga_data = {
+	.ecc_strength_avail = BIT(15) | BIT(8),
 	.caps = DENALI_CAP_HW_ECC_FIXUP |
 		DENALI_CAP_ECC_SIZE_512,
 };
@@ -64,6 +66,7 @@ static int denali_dt_probe(struct platform_device *pdev)
 	data = of_device_get_match_data(&pdev->dev);
 	if (data) {
 		denali->revision = data->revision;
+		denali->ecc_strength_avail = data->ecc_strength_avail;
 		denali->caps = data->caps;
 	}
 
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 5202a11..a1ee9f8 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -85,6 +85,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto failed_remap_reg;
 	}
 
+	denali->ecc_strength_avail = BIT(15) | BIT(8);
 	denali->caps |= DENALI_CAP_ECC_SIZE_512;
 
 	ret = denali_init(denali);
-- 
2.7.4

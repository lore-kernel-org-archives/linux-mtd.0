Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkdSZ-0007T4-Kx
 for linux-mtd@lists.infradead.org; Wed, 14 May 2014 17:59:20 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 3/4] mtd: nand: pxa3xx: Use ECC strength and step size
 devicetree binding
Date: Wed, 14 May 2014 14:58:08 -0300
Message-Id: <1400090289-24581-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1400090289-24581-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1400090289-24581-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Simon Guinot <simon.guinot@sequanux.org>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds support for the user to specify the ECC strength
and step size through the devicetree. We keep the previous behavior,
when there is no DT parameter provided.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c                | 17 +++++++++++++++--
 include/linux/platform_data/mtd-nand-pxa3xx.h |  3 +++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 3b66a64..2a9add0 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1519,8 +1519,13 @@ KEEP_CONFIG:
 		}
 	}
 
-	ecc_strength = chip->ecc_strength_ds;
-	ecc_step = chip->ecc_step_ds;
+	if (pdata->ecc_strength && pdata->ecc_step_size) {
+		ecc_strength = pdata->ecc_strength;
+		ecc_step = pdata->ecc_step_size;
+	} else {
+		ecc_strength = chip->ecc_strength_ds;
+		ecc_step = chip->ecc_step_ds;
+	}
 
 	/* Set default ECC strength requirements on non-ONFI devices */
 	if (ecc_strength < 1 && ecc_step < 1) {
@@ -1729,6 +1734,14 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 	of_property_read_u32(np, "num-cs", &pdata->num_cs);
 	pdata->flash_bbt = of_get_nand_on_flash_bbt(np);
 
+	pdata->ecc_strength = of_get_nand_ecc_strength(np);
+	if (pdata->ecc_strength < 0)
+		pdata->ecc_strength = 0;
+
+	pdata->ecc_step_size = of_get_nand_ecc_step_size(np);
+	if (pdata->ecc_step_size < 0)
+		pdata->ecc_step_size = 0;
+
 	pdev->dev.platform_data = pdata;
 
 	return 0;
diff --git a/include/linux/platform_data/mtd-nand-pxa3xx.h b/include/linux/platform_data/mtd-nand-pxa3xx.h
index a941471..ac4ea2e 100644
--- a/include/linux/platform_data/mtd-nand-pxa3xx.h
+++ b/include/linux/platform_data/mtd-nand-pxa3xx.h
@@ -58,6 +58,9 @@ struct pxa3xx_nand_platform_data {
 	/* use an flash-based bad block table */
 	bool	flash_bbt;
 
+	/* requested ECC strength and ECC step size */
+	int ecc_strength, ecc_step_size;
+
 	const struct mtd_partition		*parts[NUM_CHIP_SELECT];
 	unsigned int				nr_parts[NUM_CHIP_SELECT];
 
-- 
1.9.1

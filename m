Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSA7w-0004Mn-HV
 for linux-mtd@lists.infradead.org; Thu, 21 Dec 2017 23:20:13 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: ezequiel.garcia@free-electrons.com, boris.brezillon@free-electrons.com,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 miquel.raynal@free-electrons.com, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCHv4 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370
 variants
Date: Fri, 22 Dec 2017 12:19:04 +1300
Message-Id: <20171221231904.21140-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20171221231904.21140-1-chris.packham@alliedtelesis.co.nz>
References: <20171221231904.21140-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>

The Armada-370 based SoCs support arbitration between the NAND Flash
interface and NOR (i.e. devbus) on the same chip select. However there
are two guidelines that must be followed to avoid data corruption in
this scenario.

First GL-6843509 which states that only "Don't Care CS" NAND devices are
supported. Secondly GL-5830741 which says that when the arbitration
between NOR and NAND flash is enabled set the FORCE_CSX bit to 1. This
prevents the chip select from being active when the data flash interface
is relinquished to the other slave.

The NDCR_ND_MODE conflicts with the new NDCR_FORCE_CSX but is unused so
remove it along with NDCR_NAND_MODE.

Signed-off-by: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
[cp: only apply when arbiter is enabled, reword commit message]
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v4:
- only act when the nand arbiter is enabled
- update commit message with information from Marvell

Changes in v3:
- "mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370 variants."
  Modified commit message to mention that this change does not apply
  for pxa3xx variants.
  Fixed the missing space in comments.
  Removed unused macros "NDCR_ND_MODE" and "NDCR_NAND_MODE".

Changes in v2:
- Deleted: "dt-bindings: mtd: pxa3xx: Add "marvell,nand-force-csx" compatible string"
  Not necessary to create a new compatible string.
- "mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370 variants."
  Modified commit message.
  This commit sets the FORCE_CSX bit for all ARMADA370 variants.

 drivers/mtd/nand/pxa3xx_nand.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 90b9a9ccbe60..1b2ae98311d2 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -73,8 +73,7 @@
 #define NDCR_DWIDTH_M		(0x1 << 26)
 #define NDCR_PAGE_SZ		(0x1 << 24)
 #define NDCR_NCSX		(0x1 << 23)
-#define NDCR_ND_MODE		(0x3 << 21)
-#define NDCR_NAND_MODE   	(0x0)
+#define NDCR_FORCE_CSX		(0x1 << 21)
 #define NDCR_CLR_PG_CNT		(0x1 << 20)
 #define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)
 #define NFCV2_NDCR_STOP_ON_UNCOR	(0x1 << 19)
@@ -1477,6 +1476,10 @@ static int pxa3xx_nand_config_ident(struct pxa3xx_nand_info *info)
 	info->chunk_size = PAGE_CHUNK_SIZE;
 	info->reg_ndcr = 0x0; /* enable all interrupts */
 	info->reg_ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
+	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#: GL-5830741 */
+	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370 &&
+	    pdata->enable_arbiter)
+		info->reg_ndcr |= NDCR_FORCE_CSX;
 	info->reg_ndcr |= NDCR_RD_ID_CNT(READ_ID_BYTES);
 	info->reg_ndcr |= NDCR_SPARE_EN;
 
@@ -1511,6 +1514,10 @@ static void pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 	info->reg_ndcr = ndcr &
 		~(NDCR_INT_MASK | NDCR_ND_ARB_EN | NFCV1_NDCR_ARB_CNTL);
 	info->reg_ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
+	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#: GL-5830741 */
+	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370 &&
+	    pdata->enable_arbiter)
+		info->reg_ndcr |= NDCR_FORCE_CSX;
 	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
 	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
 }
-- 
2.15.1

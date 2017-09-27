Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dx0db-00037Z-JX
 for linux-mtd@lists.infradead.org; Wed, 27 Sep 2017 00:55:46 +0000
From: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 ezequiel.garcia@free-electrons.com, miquel.raynal@free-electrons.com,
 devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chris.packham@alliedtelesis.co.nz,
 Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
Subject: [PATCH v2 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370
 variants.
Date: Wed, 27 Sep 2017 13:55:16 +1300
Message-Id: <20170927005516.28374-2-kalyan.kinthada@alliedtelesis.co.nz>
In-Reply-To: <20170927005516.28374-1-kalyan.kinthada@alliedtelesis.co.nz>
References: <20170927005516.28374-1-kalyan.kinthada@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the arbitration between NOR and NAND flash is enabled
the <FORCE_CSX> field bit[21] in the Data Flash Control Register
needs to be set to 1 according to guidleine GL-5830741.

This commit sets the FORCE_CSX bit to 1 for all
ARMADA370 variants as the arbitration is always enabled by default.

Signed-off-by: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
---
 drivers/mtd/nand/pxa3xx_nand.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 85cff68643e0..b2753eea567c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -68,6 +68,7 @@
 #define NDCR_PAGE_SZ		(0x1 << 24)
 #define NDCR_NCSX		(0x1 << 23)
 #define NDCR_ND_MODE		(0x3 << 21)
+#define NDCR_FORCE_CSX		(0x1 << 21)
 #define NDCR_NAND_MODE   	(0x0)
 #define NDCR_CLR_PG_CNT		(0x1 << 20)
 #define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)
@@ -1464,6 +1465,9 @@ static int pxa3xx_nand_config_ident(struct pxa3xx_nand_info *info)
 	info->chunk_size = PAGE_CHUNK_SIZE;
 	info->reg_ndcr = 0x0; /* enable all interrupts */
 	info->reg_ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
+	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#: GL-5830741*/
+	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
+		info->reg_ndcr |= NDCR_FORCE_CSX;
 	info->reg_ndcr |= NDCR_RD_ID_CNT(READ_ID_BYTES);
 	info->reg_ndcr |= NDCR_SPARE_EN;
 
@@ -1498,6 +1502,9 @@ static void pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 	info->reg_ndcr = ndcr &
 		~(NDCR_INT_MASK | NDCR_ND_ARB_EN | NFCV1_NDCR_ARB_CNTL);
 	info->reg_ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
+	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#: GL-5830741*/
+	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
+		info->reg_ndcr |= NDCR_FORCE_CSX;
 	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
 	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
 }
-- 
2.14.1

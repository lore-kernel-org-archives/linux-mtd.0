Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFjzd-0001M9-FP
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 12:41:46 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v8 1/6] mtd: nand: omap: add field to indicate current
 ecc-scheme in 'struct omap_nand_info'
Date: Tue, 18 Feb 2014 18:10:36 +0530
Message-ID: <1392727242-3556-2-git-send-email-pekon@ti.com>
In-Reply-To: <1392727242-3556-1-git-send-email-pekon@ti.com>
References: <1392727242-3556-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Felipe Balbi <balbi@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Information of currently selected ECC scheme 'enum omap_ecc ecc_opt' should
available outside platform-data, so that single nand_chip->ecc callback can
support multiple ecc-scheme configurations.

Tested-by: Stefan Roese <sr@denx.de>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index bf642ce..403afa7 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -160,6 +160,7 @@ struct omap_nand_info {
 	int				gpmc_cs;
 	unsigned long			phys_base;
 	unsigned long			mem_size;
+	enum omap_ecc			ecc_opt;
 	struct completion		comp;
 	struct dma_chan			*dma;
 	int				gpmc_irq_fifo;
@@ -1657,6 +1658,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	info->gpmc_cs		= pdata->cs;
 	info->reg		= pdata->reg;
 	info->of_node		= pdata->of_node;
+	info->ecc_opt		= pdata->ecc_opt;
 	mtd			= &info->mtd;
 	mtd->priv		= &info->nand;
 	mtd->name		= dev_name(&pdev->dev);
@@ -1812,7 +1814,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	/* populate MTD interface based on ECC scheme */
 	nand_chip->ecc.layout	= &omap_oobinfo;
 	ecclayout		= &omap_oobinfo;
-	switch (pdata->ecc_opt) {
+	switch (info->ecc_opt) {
 	case OMAP_ECC_HAM1_CODE_HW:
 		pr_info("nand: using OMAP_ECC_HAM1_CODE_HW\n");
 		nand_chip->ecc.mode             = NAND_ECC_HW;
-- 
1.8.5.1.163.gd7aced9

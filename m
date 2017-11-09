Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCiwY-0003zN-3D
 for linux-mtd@lists.infradead.org; Thu, 09 Nov 2017 09:16:22 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990451AbdKIJQNiZIBw (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Thu, 9 Nov 2017 10:16:13 +0100
Date: Thu, 9 Nov 2017 10:16:12 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Cc: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH v3 6/7] mtd: onenand: omap2: Do not make delay for GPIO OMAP3
 specific
Message-ID: <20171109091612.qfkfjvu2ajwymcjr@lenoch>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171109091155.6a6azfvjarwvlfh2@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Second commit in driver history (782b7a367d81: "[MTD] [OneNAND] OMAP3:
add delay for GPIO") added quirk for waiting until GPIO line settle.
As DMA was disabled for OMAP2 boards, chances are this problem was
not OMAP3 specific and as it is just one register read, previous
test for SoC type is approximately as expensive as read itself.
Make delay unconditional, which allows removing SoC specific code
alltogether.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Changes:
 -v3: new patch

 drivers/mtd/onenand/omap2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 5760e40be008..13da0b8c418b 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -58,7 +58,6 @@ struct omap2_onenand {
 	int dma_channel;
 	int freq;
 	int (*setup)(void __iomem *base, int *freq_ptr);
-	u8 flags;
 };
 
 static void omap2_onenand_dma_cb(int lch, u16 ch_status, void *data)
@@ -151,9 +150,8 @@ static int omap2_onenand_wait(struct mtd_info *mtd, int state)
 		if (!(syscfg & ONENAND_SYS_CFG1_IOBE)) {
 			syscfg |= ONENAND_SYS_CFG1_IOBE;
 			write_reg(c, syscfg, ONENAND_REG_SYS_CFG1);
-			if (c->flags & ONENAND_IN_OMAP34XX)
-				/* Add a delay to let GPIO settle */
-				syscfg = read_reg(c, ONENAND_REG_SYS_CFG1);
+			/* Add a delay to let GPIO settle */
+			syscfg = read_reg(c, ONENAND_REG_SYS_CFG1);
 		}
 
 		reinit_completion(&c->irq_done);
@@ -461,7 +459,6 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 
 	init_completion(&c->irq_done);
 	init_completion(&c->dma_done);
-	c->flags = pdata->flags;
 	c->gpmc_cs = pdata->cs;
 	c->gpio_irq = pdata->gpio_irq;
 	c->dma_channel = pdata->dma_channel;
-- 
2.11.0

Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eDdGm-0004uQ-27
 for linux-mtd@lists.infradead.org; Sat, 11 Nov 2017 21:24:55 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990829AbdKKVYvYT6Iy (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Sat, 11 Nov 2017 22:24:51 +0100
Date: Sat, 11 Nov 2017 22:24:42 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Cc: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH v4 12/16] mtd: onenand: omap2: Enable DMA by default
Message-ID: <20171111212442.ucbatglvqeoiqb72@lenoch>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171111211206.465pgorrjp3eyix6@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DMA and R/B pin are independent on each other. Use DMA by default.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Changes:
 -v4: new patch

 drivers/mtd/onenand/omap2.c | 41 +++++++++++++++++------------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index e4857a41760d..62e4ede918c4 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -152,17 +152,13 @@ static int omap2_onenand_wait(struct mtd_info *mtd, int state)
 		}
 
 		reinit_completion(&c->irq_done);
-		if (c->gpio_irq) {
-			result = gpio_get_value(c->gpio_irq);
-			if (result == -1) {
-				ctrl = read_reg(c, ONENAND_REG_CTRL_STATUS);
-				intr = read_reg(c, ONENAND_REG_INTERRUPT);
-				wait_err("gpio error", state, ctrl, intr);
-				return -EIO;
-			}
-		} else
-			result = 0;
-		if (result == 0) {
+		result = gpio_get_value(c->gpio_irq);
+		if (result < 0) {
+			ctrl = read_reg(c, ONENAND_REG_CTRL_STATUS);
+			intr = read_reg(c, ONENAND_REG_INTERRUPT);
+			wait_err("gpio error", state, ctrl, intr);
+			return -EIO;
+		} else if (result == 0) {
 			int retry_cnt = 0;
 retry:
 			if (!wait_for_completion_io_timeout(&c->irq_done,
@@ -513,13 +509,15 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,  "Failed to request GPIO%d for "
 				"OneNAND\n", c->gpio_irq);
 			goto err_iounmap;
-	}
-	gpio_direction_input(c->gpio_irq);
+		}
+		gpio_direction_input(c->gpio_irq);
+
+		if ((r = request_irq(gpio_to_irq(c->gpio_irq),
+				     omap2_onenand_interrupt, IRQF_TRIGGER_RISING,
+				     pdev->dev.driver->name, c)) < 0)
+			goto err_release_gpio;
 
-	if ((r = request_irq(gpio_to_irq(c->gpio_irq),
-			     omap2_onenand_interrupt, IRQF_TRIGGER_RISING,
-			     pdev->dev.driver->name, c)) < 0)
-		goto err_release_gpio;
+		this->wait = omap2_onenand_wait;
 	}
 
 	if (pdata->dma_channel >= 0) {
@@ -529,15 +527,11 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 		dma_cap_set(DMA_MEMCPY, mask);
 
 		c->dma_chan = dma_request_channel(mask, NULL, NULL);
-		if (!c->dma_chan)
-			dev_info(&pdev->dev,
-				 "failed to allocate DMA for OneNAND, "
-				 "using PIO instead\n");
 	}
 
 	dev_info(&pdev->dev, "initializing on CS%d, phys base 0x%08lx, virtual "
-		 "base %p, freq %d MHz\n", c->gpmc_cs, c->phys_base,
-		 c->onenand.base, c->freq);
+		 "base %p, freq %d MHz, %s mode\n", c->gpmc_cs, c->phys_base,
+		 c->onenand.base, c->freq, c->dma_chan ? "DMA" : "PIO");
 
 	c->pdev = pdev;
 	c->mtd.priv = &c->onenand;
@@ -547,7 +541,6 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 
 	this = &c->onenand;
 	if (c->dma_chan) {
-		this->wait = omap2_onenand_wait;
 		this->read_bufferram = omap2_onenand_read_bufferram;
 		this->write_bufferram = omap2_onenand_write_bufferram;
 	}
-- 
2.11.0

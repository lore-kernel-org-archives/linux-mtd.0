From: Vladimir Zapolskiy <vz@mleia.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mtd: nand: lpc32xx: fix invalid error handling of a requested
 irq
Date: Mon,  5 Dec 2016 03:47:10 +0200
Message-Id: <20161205014710.2015-1-vz@mleia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Semantics of NR_IRQS is different on machines with SPARSE_IRQ option
disabled or enabled, in the latter case IRQs are allocated starting
at least from the value specified by NR_IRQS and going upwards, so
the check of (irq >= NR_IRQ) to decide about an error code returned by
platform_get_irq() is completely invalid, don't attempt to overrule
irq subsystem in the driver.

The change fixes LPC32xx NAND MLC driver initialization on boot.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/mtd/nand/lpc32xx_mlc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index 8523881..bc6e49a 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -776,7 +776,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	init_completion(&host->comp_controller);
 
 	host->irq = platform_get_irq(pdev, 0);
-	if ((host->irq < 0) || (host->irq >= NR_IRQS)) {
+	if (host->irq < 0) {
 		dev_err(&pdev->dev, "failed to get platform irq\n");
 		res = -EINVAL;
 		goto err_exit3;
-- 
2.10.2

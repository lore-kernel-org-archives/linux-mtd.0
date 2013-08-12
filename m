Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8vjA-0007zK-Pi
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 17:16:23 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 13/14] mtd: nand: pxa3xx: Allow devices with no dma
 resources
Date: Mon, 12 Aug 2013 14:14:58 -0300
Message-Id: <1376327699-7973-14-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When use_dma=0 there's no point in requesting resources for dma,
since they won't be used anyway. Therefore we remove that requirement,
therefore allowing devices without dma to pass the driver probe.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Tested-by: Daniel Mack <zonque@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 51 +++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 2b3253d..7a365dd 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1141,30 +1141,35 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * This is a dirty hack to make this driver work from devicetree
-	 * bindings. It can be removed once we have a prober DMA controller
-	 * framework for DT.
-	 */
-	if (pdev->dev.of_node && of_machine_is_compatible("marvell,pxa3xx")) {
-		info->drcmr_dat = 97;
-		info->drcmr_cmd = 99;
-	} else {
-		r = platform_get_resource(pdev, IORESOURCE_DMA, 0);
-		if (r == NULL) {
-			dev_err(&pdev->dev, "no resource defined for data DMA\n");
-			ret = -ENXIO;
-			goto fail_disable_clk;
-		}
-		info->drcmr_dat = r->start;
-
-		r = platform_get_resource(pdev, IORESOURCE_DMA, 1);
-		if (r == NULL) {
-			dev_err(&pdev->dev, "no resource defined for command DMA\n");
-			ret = -ENXIO;
-			goto fail_disable_clk;
+	if (use_dma) {
+		/*
+		 * This is a dirty hack to make this driver work from
+		 * devicetree bindings. It can be removed once we have
+		 * a prober DMA controller framework for DT.
+		 */
+		if (pdev->dev.of_node &&
+		    of_machine_is_compatible("marvell,pxa3xx")) {
+			info->drcmr_dat = 97;
+			info->drcmr_cmd = 99;
+		} else {
+			r = platform_get_resource(pdev, IORESOURCE_DMA, 0);
+			if (r == NULL) {
+				dev_err(&pdev->dev,
+					"no resource defined for data DMA\n");
+				ret = -ENXIO;
+				goto fail_disable_clk;
+			}
+			info->drcmr_dat = r->start;
+
+			r = platform_get_resource(pdev, IORESOURCE_DMA, 1);
+			if (r == NULL) {
+				dev_err(&pdev->dev,
+					"no resource defined for cmd DMA\n");
+				ret = -ENXIO;
+				goto fail_disable_clk;
+			}
+			info->drcmr_cmd = r->start;
 		}
-		info->drcmr_cmd = r->start;
 	}
 
 	irq = platform_get_irq(pdev, 0);
-- 
1.8.1.5

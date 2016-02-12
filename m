Received: from smtp12.smtpout.orange.fr ([80.12.242.134]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUMDW-00007D-SU
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 22:29:35 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] mtd: nand: pxa3xx_nand: fix dmaengine initialization
Date: Fri, 12 Feb 2016 23:29:04 +0100
Message-Id: <1455316144-14464-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the driver is initialized in a pure device-tree platform, the
driver's probe fails allocating the dma channel :
[  525.624435] pxa3xx-nand 43100000.nand: no resource defined for data DMA
[  525.632088] pxa3xx-nand 43100000.nand: alloc nand resource failed

The reason is that the DMA IO resource is not acquired through platform
resources but by OF bindings.

Fix this by ensuring that DMA IO resources are only queried in the non
device-tree case.

Fixes: 8f5ba31aa565 ("mtd: nand: pxa3xx-nand: switch to dmaengine")
Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index a168cbcc1086..afd487d4b67f 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1750,7 +1750,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	if (use_dma) {
+	if (!np && use_dma) {
 		r = platform_get_resource(pdev, IORESOURCE_DMA, 0);
 		if (r == NULL) {
 			dev_err(&pdev->dev,
-- 
2.1.4

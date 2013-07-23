Received: from sauhun.de ([89.238.76.85] helo=pokefinder.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1gvo-0002ln-2u
 for linux-mtd@lists.infradead.org; Tue, 23 Jul 2013 18:03:30 +0000
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 11/27] drivers/mtd/nand: don't check resource with
 devm_ioremap_resource
Date: Tue, 23 Jul 2013 20:01:44 +0200
Message-Id: <1374602524-3398-12-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>
References: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Wolfram Sang <wsa@the-dreams.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

devm_ioremap_resource does sanity checks on the given resource. No need to
duplicate this in the driver.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
Please apply via the subsystem-tree.

 drivers/mtd/nand/mxc_nand.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 07e5784..d1feb97 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1446,8 +1446,6 @@ static int mxcnd_probe(struct platform_device *pdev)
 
 	if (host->devtype_data->needs_ip) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (!res)
-			return -ENODEV;
 		host->regs_ip = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(host->regs_ip))
 			return PTR_ERR(host->regs_ip);
@@ -1457,9 +1455,6 @@ static int mxcnd_probe(struct platform_device *pdev)
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	}
 
-	if (!res)
-		return -ENODEV;
-
 	host->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->base))
 		return PTR_ERR(host->base);
-- 
1.7.10.4

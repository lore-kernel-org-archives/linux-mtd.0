Received: from sauhun.de ([89.238.76.85] helo=pokefinder.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ucw9V-0000Yi-MV
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 11:15:18 +0000
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/33] drivers/mtd/nand: don't check resource with
 devm_ioremap_resource
Date: Thu, 16 May 2013 13:15:40 +0200
Message-Id: <1368702961-4325-13-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1368702961-4325-1-git-send-email-wsa@the-dreams.de>
References: <1368702961-4325-1-git-send-email-wsa@the-dreams.de>
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
 drivers/mtd/nand/lpc32xx_mlc.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index a94facb..fd1df5e 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -672,11 +672,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	}
 
 	rc = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (rc == NULL) {
-		dev_err(&pdev->dev, "No memory resource found for device!\r\n");
-		return -ENXIO;
-	}
-
 	host->io_base = devm_ioremap_resource(&pdev->dev, rc);
 	if (IS_ERR(host->io_base))
 		return PTR_ERR(host->io_base);
-- 
1.7.10.4

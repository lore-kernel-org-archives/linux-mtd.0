Received: from mail-ob0-f194.google.com ([209.85.214.194])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aeASA-00058s-FK
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 23:57:15 +0000
Received: by mail-ob0-f194.google.com with SMTP id hc1so7595999obb.0
 for <linux-mtd@lists.infradead.org>; Thu, 10 Mar 2016 15:56:54 -0800 (PST)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: nsekhar@ti.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 rogerq@ti.com, tony@atomide.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v4 4/7] mtd: nand: omap2: Support parsing dma channel
 information from DT
Date: Thu, 10 Mar 2016 17:56:40 -0600
Message-Id: <1457654203-20856-5-git-send-email-fcooper@ti.com>
In-Reply-To: <1457654203-20856-1-git-send-email-fcooper@ti.com>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Switch from dma_request_channel to allow passing dma channel
information from DT rather than hardcoding a value.

Also provide a handle to the GPMC's dev so it can be used to parse the DMA
channel information within the GPMC's DT node.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 4 changes:
Pass parent instead of new variable from the platform data

 drivers/mtd/nand/omap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index c553f78..95bc636 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1731,7 +1731,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 		dma_cap_zero(mask);
 		dma_cap_set(DMA_SLAVE, mask);
 		sig = OMAP24XX_DMA_GPMC;
-		info->dma = dma_request_channel(mask, omap_dma_filter_fn, &sig);
+		info->dma = dma_request_slave_channel_compat(mask,
+			omap_dma_filter_fn, &sig, pdev->dev.parent, "rxtx");
+
 		if (!info->dma) {
 			dev_err(&pdev->dev, "DMA engine request failed\n");
 			err = -ENXIO;
-- 
2.7.0

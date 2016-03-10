Received: from mail-oi0-f65.google.com ([209.85.218.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adrtW-0001cp-ML
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 04:08:16 +0000
Received: by mail-oi0-f65.google.com with SMTP id r187so4051429oih.2
 for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2016 20:07:55 -0800 (PST)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: nsekhar@ti.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 rogerq@ti.com, tony@atomide.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v3 3/6] mtd: nand: omap2: Support parsing dma channel
 information from DT
Date: Wed,  9 Mar 2016 22:07:38 -0600
Message-Id: <1457582861-20619-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1457582861-20619-1-git-send-email-fcooper@ti.com>
References: <1457582861-20619-1-git-send-email-fcooper@ti.com>
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
Version 3 changes:
Instead of passing parent dev use the new property

 drivers/mtd/nand/omap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index c553f78..1e5c803 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1731,7 +1731,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 		dma_cap_zero(mask);
 		dma_cap_set(DMA_SLAVE, mask);
 		sig = OMAP24XX_DMA_GPMC;
-		info->dma = dma_request_channel(mask, omap_dma_filter_fn, &sig);
+		info->dma = dma_request_slave_channel_compat(mask,
+			omap_dma_filter_fn, &sig, pdata->gpmc_dev, "rxtx");
+
 		if (!info->dma) {
 			dev_err(&pdev->dev, "DMA engine request failed\n");
 			err = -ENXIO;
-- 
2.7.0

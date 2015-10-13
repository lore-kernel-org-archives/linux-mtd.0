Received: from mail-ob0-f179.google.com ([209.85.214.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZloZ7-000690-23
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 01:39:45 +0000
Received: by obbda8 with SMTP id da8so2594448obb.1
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 18:39:23 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: linux-kernel@vger.kernel.org, rogerq@ti.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org, nsekhar@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, tony@atomide.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 1/5] mtd: nand: omap2: Support parsing dma channel information
 from DT
Date: Mon, 12 Oct 2015 20:38:54 -0500
Message-Id: <1444700338-27582-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1444700338-27582-1-git-send-email-fcooper@ti.com>
References: <1444700338-27582-1-git-send-email-fcooper@ti.com>
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

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 drivers/mtd/nand/omap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index d0f2620..957c32f 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1866,7 +1866,9 @@ static int omap_nand_probe(struct platform_device *pdev)
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
2.6.1

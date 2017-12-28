Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUcad-0005fs-LD
 for linux-mtd@lists.infradead.org; Thu, 28 Dec 2017 18:07:37 +0000
Received: by mail-qt0-x241.google.com with SMTP id i40so51933937qti.8
 for <linux-mtd@lists.infradead.org>; Thu, 28 Dec 2017 10:07:23 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] mtd: nand: gpmi: Release DMA channels on failure
Date: Thu, 28 Dec 2017 16:07:00 -0200
Message-Id: <1514484420-19344-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@nxp.com>

release_dma_channels() should be called in the case of error in
gpmi_init() or bch_set_geometry(), because acquire_dma_channels() has
been called previously.

Handle the error cases correctly.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 2ef8979..acfa5f5 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -2137,20 +2137,25 @@ static int gpmi_pm_resume(struct device *dev)
 	ret = gpmi_init(this);
 	if (ret) {
 		dev_err(this->dev, "Error setting GPMI : %d\n", ret);
-		return ret;
+		goto release_dma_channels;
 	}
 
 	/* re-init the BCH registers */
 	ret = bch_set_geometry(this);
 	if (ret) {
 		dev_err(this->dev, "Error setting BCH : %d\n", ret);
-		return ret;
+		goto release_dma_channels;
 	}
 
 	/* re-init others */
 	gpmi_extra_init(this);
 
 	return 0;
+
+release_dma_channels:
+	release_dma_channels(this);
+	return ret;
+
 }
 #endif /* CONFIG_PM_SLEEP */
 
-- 
2.7.4

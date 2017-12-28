Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUcl6-0001TH-NJ
 for linux-mtd@lists.infradead.org; Thu, 28 Dec 2017 18:18:28 +0000
Received: by mail-qk0-x242.google.com with SMTP id d202so26025857qkc.9
 for <linux-mtd@lists.infradead.org>; Thu, 28 Dec 2017 10:18:12 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2] mtd: nand: gpmi: Release DMA channels on failure
Date: Thu, 28 Dec 2017 16:17:58 -0200
Message-Id: <1514485078-19762-1-git-send-email-festevam@gmail.com>
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
Changes since v1:
- Remove extra blank line

 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 2ef8979..db0d924 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -2137,20 +2137,24 @@ static int gpmi_pm_resume(struct device *dev)
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
 }
 #endif /* CONFIG_PM_SLEEP */
 
-- 
2.7.4

Received: from cpsmtpb-ews06.kpnxchange.com ([213.75.39.9])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V78Ij-0001LU-HV
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 18:17:38 +0000
Message-ID: <1375899409.7303.61.camel@x61.thuisdomein>
Subject: [PATCH] mtd: onenand: omap: remove two unused functions
From: Paul Bolle <pebolle@tiscali.nl>
To: Kyungmin Park <kyungmin.park@samsung.com>, David Woodhouse
 <dwmw2@infradead.org>
Date: Wed, 07 Aug 2013 20:16:49 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nothing calls omap2_onenand_rephase(). And __adjust_timing() is only
called by omap2_onenand_rephase(). Remove these two unused functions.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Completely untested.

 drivers/mtd/onenand/omap2.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index d98b198..1d43fdc 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -573,28 +573,6 @@ static int omap2_onenand_write_bufferram(struct mtd_info *mtd, int area,
 
 static struct platform_driver omap2_onenand_driver;
 
-static int __adjust_timing(struct device *dev, void *data)
-{
-	int ret = 0;
-	struct omap2_onenand *c;
-
-	c = dev_get_drvdata(dev);
-
-	BUG_ON(c->setup == NULL);
-
-	/* DMA is not in use so this is all that is needed */
-	/* Revisit for OMAP3! */
-	ret = c->setup(c->onenand.base, &c->freq);
-
-	return ret;
-}
-
-int omap2_onenand_rephase(void)
-{
-	return driver_for_each_device(&omap2_onenand_driver.driver, NULL,
-				      NULL, __adjust_timing);
-}
-
 static void omap2_onenand_shutdown(struct platform_device *pdev)
 {
 	struct omap2_onenand *c = dev_get_drvdata(&pdev->dev);
-- 
1.8.1.4

Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZGuF-0006Dk-Lr
 for linux-mtd@lists.infradead.org; Mon, 15 Aug 2016 12:22:30 +0000
Received: by mail-wm0-x242.google.com with SMTP id i138so10794131wmf.3
 for <linux-mtd@lists.infradead.org>; Mon, 15 Aug 2016 05:21:55 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 David Woodhouse <dwmw2@infradead.org>,
 Frans Klaver <fransklaver@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: bcm47xxsflash: use uncached MMIO access for BCM53573
Date: Mon, 15 Aug 2016 14:21:28 +0200
Message-Id: <1471263690-32512-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

BCM53573 is a new series of Broadcom's SoCs. It's based on ARM and uses
this old ChipCommon-based flash access. Early tests resulted in flash
corruptions that were tracked down to using cached MMIO for flash read
access. Switch to ioremap_nocache conditionally to support BCM53573 and
don't break performance on old MIPS devices.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/devices/bcm47xxsflash.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 1c65c15..514be04 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -296,16 +296,30 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 		dev_err(dev, "can't request region for resource %pR\n", res);
 		return -EBUSY;
 	}
-	b47s->window = ioremap_cache(res->start, resource_size(res));
-	if (!b47s->window) {
-		dev_err(dev, "ioremap failed for resource %pR\n", res);
-		return -ENOMEM;
-	}
 
 	b47s->bcma_cc = container_of(sflash, struct bcma_drv_cc, sflash);
 	b47s->cc_read = bcm47xxsflash_bcma_cc_read;
 	b47s->cc_write = bcm47xxsflash_bcma_cc_write;
 
+	/*
+	 * On old MIPS devices cache was magically invalidated when needed,
+	 * allowing us to use cached access and gain some performance. Trying
+	 * the same on ARM based BCM53573 results in flash corruptions, we need
+	 * to use uncached access for it.
+	 *
+	 * It may be arch specific, but right now there is only 1 ARM SoC using
+	 * this driver, so let's follow Broadcom's reference code and check
+	 * ChipCommon revision.
+	 */
+	if (b47s->bcma_cc->core->id.rev == 54)
+		b47s->window = ioremap_nocache(res->start, resource_size(res));
+	else
+		b47s->window = ioremap_cache(res->start, resource_size(res));
+	if (!b47s->window) {
+		dev_err(dev, "ioremap failed for resource %pR\n", res);
+		return -ENOMEM;
+	}
+
 	switch (b47s->bcma_cc->capabilities & BCMA_CC_CAP_FLASHT) {
 	case BCMA_CC_FLASHT_STSER:
 		b47s->type = BCM47XXSFLASH_TYPE_ST;
-- 
1.8.4.5

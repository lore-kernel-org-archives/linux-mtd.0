Received: from mail.asoft.ru ([83.222.19.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lb9j4-0007Kk-KX
	for linux-mtd@lists.infradead.org; Sun, 22 Feb 2009 08:30:18 +0000
Received: from localhost ([95.72.103.218]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n1M8UBWX031950
	for <linux-mtd@lists.infradead.org>; Sun, 22 Feb 2009 11:30:11 +0300
Date: Sun, 22 Feb 2009 11:30:11 +0300
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] MAPS: fix build warning in sa1100-flash
Message-ID: <20090222083011.GA10959@rainbow>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix warning in sa1100-flash introduced by commit
69423d99fc182a81f3c5db3eb5c140acc6fc64be.

drivers/mtd/maps/sa1100-flash.c: In function 'sa1100_probe_subdev':
drivers/mtd/maps/sa1100-flash.c:214: warning: format '%d' expects type 'int',
 but argument 3 has type 'uint64_t'

Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
---
 drivers/mtd/maps/sa1100-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

Just for reference - some example buildlogs where warning can be seen:
http://armlinux.simtec.co.uk/kautobuild/2.6.29-rc5-git4/badge4_defconfig/zimage.log
http://armlinux.simtec.co.uk/kautobuild/2.6.29-rc5-git4/h3600_defconfig/zimage.log
http://kisskb.ellerman.id.au/kisskb/buildresult/75884/

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 6f6a0f6..6b51abc 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -210,7 +210,7 @@ static int sa1100_probe_subdev(struct sa_subdev_info *subdev, struct resource *r
 	subdev->mtd->owner = THIS_MODULE;
 
 	printk(KERN_INFO "SA1100 flash: CFI device at 0x%08lx, %dMiB, "
-		"%d-bit\n", phys, subdev->mtd->size >> 20,
+		"%d-bit\n", phys, (int)(subdev->mtd->size >> 20),
 		subdev->map.bankwidth * 8);
 
 	return 0;
-- 
1.6.1.3


-- 
Best regards,
Dmitry "MAD" Artamonow

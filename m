Received: from ey-out-1920.google.com ([74.125.78.146])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nq4si-0003VK-9v
	for linux-mtd@lists.infradead.org; Fri, 12 Mar 2010 13:26:28 +0000
Received: by ey-out-1920.google.com with SMTP id 3so94847eyh.26
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Mar 2010 05:26:22 -0800 (PST)
From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] physmap: remove physmap_flash_shutdown() method.
Date: Fri, 12 Mar 2010 16:26:06 +0300
Message-Id: <1268400366-14802-1-git-send-email-vzapolskiy@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Lennert Buytenhek <buytenh@wantstofly.org>,
	Vladimir Zapolskiy <vzapolskiy@gmail.com>,
	Mike Frysinger <vapier.adi@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

physmap driver operates with cfi, jedec, qinfo and map_rom compliant
chips. None of interface drivers for all these chips uses actual
suspend and resume chip operations, but correspondent two methods only
change flash chip state in drivers' internal state machines, and for
Intel chips save/restore block locks is done.

To operate with boards with Intel flash chips where RP# pin is not
asserted on reset there is an already implemented mechanism of reboot
notifiers, and on reboot the flash moves into defined "read array"
state.

If CONFIG_PM kernel option is enabled, then physmap_flash_shutdown()
method is called after reboot notifier work, and save/restore block
locks operations disturb the chip from default "read array" state,
thus if the flash is a bootable one, board cann't be booted from it
after reset.

Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>
Cc: Lennert Buytenhek <buytenh@wantstofly.org>
---
 drivers/mtd/maps/physmap.c |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index d9603f7..dea81d7 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -193,25 +193,9 @@ err_out:
 	return err;
 }
 
-#ifdef CONFIG_PM
-static void physmap_flash_shutdown(struct platform_device *dev)
-{
-	struct physmap_flash_info *info = platform_get_drvdata(dev);
-	int i;
-
-	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		if (info->mtd[i]->suspend && info->mtd[i]->resume)
-			if (info->mtd[i]->suspend(info->mtd[i]) == 0)
-				info->mtd[i]->resume(info->mtd[i]);
-}
-#else
-#define physmap_flash_shutdown NULL
-#endif
-
 static struct platform_driver physmap_flash_driver = {
 	.probe		= physmap_flash_probe,
 	.remove		= physmap_flash_remove,
-	.shutdown	= physmap_flash_shutdown,
 	.driver		= {
 		.name	= "physmap-flash",
 		.owner	= THIS_MODULE,
-- 
1.6.6

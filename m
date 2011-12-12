Received: from mail-out.m-online.net ([2001:a60:0:32:0:1:25:1])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RaFRe-0007ZT-T1
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 23:38:08 +0000
From: Ilya Yanok <yanok@emcraft.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] plat_ram: call mtd_device_register only if partition data
 exists
Date: Tue, 13 Dec 2011 00:37:56 +0100
Message-Id: <1323733076-6301-1-git-send-email-yanok@emcraft.com>
Cc: Ilya Yanok <yanok@emcraft.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_device_parse_register() registers the device as a whole if no
partition data is passed so there is no reason to call
mtd_device_register() after that.

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 drivers/mtd/maps/plat-ram.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 94f5534..45876d0 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -227,10 +227,14 @@ static int platram_probe(struct platform_device *pdev)
 	if (!err)
 		dev_info(&pdev->dev, "registered mtd device\n");
 
-	/* add the whole device. */
-	err = mtd_device_register(info->mtd, NULL, 0);
-	if (err)
-		dev_err(&pdev->dev, "failed to register the entire device\n");
+	if (pdata->nr_partitions) {
+		/* add the whole device. */
+		err = mtd_device_register(info->mtd, NULL, 0);
+		if (err) {
+			dev_err(&pdev->dev,
+				"failed to register the entire device\n");
+		}
+	}
 
 	return err;
 
-- 
1.7.6.4

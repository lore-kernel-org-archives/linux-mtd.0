Received: from mail-wi0-f172.google.com ([209.85.212.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv3yN-0003rM-D9
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 12:51:31 +0000
Received: by mail-wi0-f172.google.com with SMTP id n3so22060117wiv.17
 for <linux-mtd@lists.infradead.org>; Sun, 30 Nov 2014 04:51:07 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: physmap_of: fix potential NULL dereference
Date: Sun, 30 Nov 2014 13:51:03 +0100
Message-Id: <1417351863-3812-1-git-send-email-ard.biesheuvel@linaro.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On device remove, when testing the cmtd field of an of_flash
struct to decide whether it is a concatenated device or not,
we get a false positive on cmtd == NULL, and dereference it
subsequently. This may occur if of_flash_remove() is called
from the cleanup path of of_flash_probe().

Instead, test for NULL first, and only then perform the test
for a concatenated device.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/mtd/maps/physmap_of.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index c1d21cb501ca..e48930424091 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -47,14 +47,12 @@ static int of_flash_remove(struct platform_device *dev)
 		return 0;
 	dev_set_drvdata(&dev->dev, NULL);
 
-	if (info->cmtd != info->list[0].mtd) {
+	if (info->cmtd) {
 		mtd_device_unregister(info->cmtd);
-		mtd_concat_destroy(info->cmtd);
+		if (info->cmtd != info->list[0].mtd)
+			mtd_concat_destroy(info->cmtd);
 	}
 
-	if (info->cmtd)
-		mtd_device_unregister(info->cmtd);
-
 	for (i = 0; i < info->list_size; i++) {
 		if (info->list[i].mtd)
 			map_destroy(info->list[i].mtd);
-- 
1.8.3.2

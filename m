Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WamIt-0002aD-MW
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 13:24:36 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBI: block: Set disk_capacity out of the mutex
Date: Thu, 17 Apr 2014 10:23:42 -0300
Message-Id: <1397741023-2122-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1397741023-2122-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1397741023-2122-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There's no need to set the disk capacity with the mutex held, so this
commit takes the variable setting out of the mutex. This simplifies
the disk capacity fix for very large volumes in a follow up commit.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/block.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 8d659e6..ad2cf78 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -378,7 +378,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 {
 	struct ubiblock *dev;
 	struct gendisk *gd;
-	int disk_capacity;
+	int disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
 	int ret;
 
 	/* Check that the volume isn't already handled */
@@ -412,7 +412,6 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	gd->first_minor = dev->ubi_num * UBI_MAX_VOLUMES + dev->vol_id;
 	gd->private_data = dev;
 	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
-	disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
 	set_capacity(gd, disk_capacity);
 	dev->gd = gd;
 
@@ -499,7 +498,7 @@ int ubiblock_remove(struct ubi_volume_info *vi)
 static void ubiblock_resize(struct ubi_volume_info *vi)
 {
 	struct ubiblock *dev;
-	int disk_capacity;
+	int disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
 
 	/*
 	 * Need to lock the device list until we stop using the device,
@@ -514,7 +513,6 @@ static void ubiblock_resize(struct ubi_volume_info *vi)
 	}
 
 	mutex_lock(&dev->dev_mutex);
-	disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
 	set_capacity(dev->gd, disk_capacity);
 	ubi_msg("%s resized to %d LEBs", dev->gd->disk_name, vi->size);
 	mutex_unlock(&dev->dev_mutex);
-- 
1.9.1

Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WamRe-00023D-OC
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 13:33:39 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBI: block: Avoid disk size integer overflow
Date: Thu, 17 Apr 2014 10:23:43 -0300
Message-Id: <1397741023-2122-3-git-send-email-ezequiel.garcia@free-electrons.com>
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

From: Richard Weinberger <richard@nod.at>

This patch fixes the issue that on very large UBI volumes
UBI block does not work correctly.

Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/block.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index ad2cf78..4cff2f1 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -378,9 +378,11 @@ int ubiblock_create(struct ubi_volume_info *vi)
 {
 	struct ubiblock *dev;
 	struct gendisk *gd;
-	int disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
+	u64 disk_capacity = ((u64)vi->size * vi->usable_leb_size) >> 9;
 	int ret;
 
+	if ((sector_t)disk_capacity != disk_capacity)
+		return -EFBIG;
 	/* Check that the volume isn't already handled */
 	mutex_lock(&devices_mutex);
 	if (find_dev_nolock(vi->ubi_num, vi->vol_id)) {
@@ -498,8 +500,10 @@ int ubiblock_remove(struct ubi_volume_info *vi)
 static void ubiblock_resize(struct ubi_volume_info *vi)
 {
 	struct ubiblock *dev;
-	int disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
+	u64 disk_capacity = ((u64)vi->size * vi->usable_leb_size) >> 9;
 
+	if ((sector_t)disk_capacity != disk_capacity)
+		return -EFBIG;
 	/*
 	 * Need to lock the device list until we stop using the device,
 	 * otherwise the device struct might get released in
-- 
1.9.1

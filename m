Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhFtB-0002dP-7s
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 10:12:50 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2 1/3] UBI: block: Make ubiblock_resize return something
Date: Mon,  5 May 2014 07:11:52 -0300
Message-Id: <1399284714-6283-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1399284714-6283-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1399284714-6283-1-git-send-email-ezequiel.garcia@free-electrons.com>
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

Currently, ubiblock_resize() can fail if the device is not found
in the list. This commit changes the return type, so the function can
return something meaningful on error paths.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/block.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 8d659e6..a8e4b77 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -496,7 +496,7 @@ int ubiblock_remove(struct ubi_volume_info *vi)
 	return 0;
 }
 
-static void ubiblock_resize(struct ubi_volume_info *vi)
+static int ubiblock_resize(struct ubi_volume_info *vi)
 {
 	struct ubiblock *dev;
 	int disk_capacity;
@@ -510,7 +510,7 @@ static void ubiblock_resize(struct ubi_volume_info *vi)
 	dev = find_dev_nolock(vi->ubi_num, vi->vol_id);
 	if (!dev) {
 		mutex_unlock(&devices_mutex);
-		return;
+		return -ENODEV;
 	}
 
 	mutex_lock(&dev->dev_mutex);
@@ -519,6 +519,7 @@ static void ubiblock_resize(struct ubi_volume_info *vi)
 	ubi_msg("%s resized to %d LEBs", dev->gd->disk_name, vi->size);
 	mutex_unlock(&dev->dev_mutex);
 	mutex_unlock(&devices_mutex);
+	return 0;
 }
 
 static int ubiblock_notify(struct notifier_block *nb,
-- 
1.9.1

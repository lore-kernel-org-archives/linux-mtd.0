Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNTxl-0006K8-Cs
 for linux-mtd@lists.infradead.org; Fri, 29 Aug 2014 21:44:05 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/3] UBI: block: Add support for the UBI_VOLUME_UPDATED
 notification
Date: Fri, 29 Aug 2014 18:42:29 -0300
Message-Id: <1409348550-27768-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Static volumes can change its 'used_bytes' when they get updated,
and so the block interface must listen to the UBI_VOLUME_UPDATED
notification to resize the block device accordingly.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/block.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index a29d41c..4fafd49 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -522,8 +522,12 @@ static int ubiblock_resize(struct ubi_volume_info *vi)
 	}
 
 	mutex_lock(&dev->dev_mutex);
-	set_capacity(dev->gd, disk_capacity);
-	ubi_msg("%s resized to %lld bytes", dev->gd->disk_name, vi->used_bytes);
+
+	if (get_capacity(dev->gd) != disk_capacity) {
+		set_capacity(dev->gd, disk_capacity);
+		ubi_msg("%s resized to %lld bytes", dev->gd->disk_name,
+			vi->used_bytes);
+	}
 	mutex_unlock(&dev->dev_mutex);
 	mutex_unlock(&devices_mutex);
 	return 0;
@@ -547,6 +551,14 @@ static int ubiblock_notify(struct notifier_block *nb,
 	case UBI_VOLUME_RESIZED:
 		ubiblock_resize(&nt->vi);
 		break;
+	case UBI_VOLUME_UPDATED:
+		/*
+		 * If the volume is static, a content update might mean the
+		 * size (i.e. used_bytes) was also changed.
+		 */
+		if (nt->vi.vol_type == UBI_STATIC_VOLUME)
+			ubiblock_resize(&nt->vi);
+		break;
 	default:
 		break;
 	}
-- 
2.0.1

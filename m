Received: from [202.230.225.126] (helo=topsms.toshiba-tops.co.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LfP5u-0001C6-48
	for linux-mtd@lists.infradead.org; Fri, 06 Mar 2009 01:43:24 +0000
Date: Fri, 06 Mar 2009 10:43:18 +0900 (JST)
Message-Id: <20090306.104318.233533541.nemoto@toshiba-tops.co.jp>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: physmap: Fix NULL pointer dereference in error path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, philipp.zabel@gmail.com,
	matthias@kaehlcke.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit e480814f138cd5d78a8efe397756ba6b6518fdb6 ("[MTD] [MAPS]
physmap: fix wrong free and del_mtd_{partition,device}") introduces a
NULL pointer dereference in physmap_flash_remove when called from the
error path in physmap_flash_probe (if map_probe failed).

Call del_mtd_{partition,device} only if info->cmtd was not NULL.

Reported-by: pHilipp Zabel <philipp.zabel@gmail.com>
Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
 drivers/mtd/maps/physmap.c |   19 +++++++++++--------
 1 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 4b122e7..2297182 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -46,16 +46,19 @@ static int physmap_flash_remove(struct platform_device *dev)
 
 	physmap_data = dev->dev.platform_data;
 
+	if (info->cmtd) {
 #ifdef CONFIG_MTD_PARTITIONS
-	if (info->nr_parts) {
-		del_mtd_partitions(info->cmtd);
-		kfree(info->parts);
-	} else if (physmap_data->nr_parts)
-		del_mtd_partitions(info->cmtd);
-	else
-		del_mtd_device(info->cmtd);
+		if (info->nr_parts || physmap_data->nr_parts)
+			del_mtd_partitions(info->cmtd);
+		else
+			del_mtd_device(info->cmtd);
 #else
-	del_mtd_device(info->cmtd);
+		del_mtd_device(info->cmtd);
+#endif
+	}
+#ifdef CONFIG_MTD_PARTITIONS
+	if (info->nr_parts)
+		kfree(info->parts);
 #endif
 
 #ifdef CONFIG_MTD_CONCAT
-- 
1.5.6.5

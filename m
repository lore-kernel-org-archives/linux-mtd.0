Received: from mail-ye0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXE1y-0006uQ-Qv
 for linux-mtd@lists.infradead.org; Sat, 10 Nov 2012 16:35:39 +0000
Received: by mail-ye0-f177.google.com with SMTP id r1so929397yen.36
 for <linux-mtd@lists.infradead.org>; Sat, 10 Nov 2012 08:35:37 -0800 (PST)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: sm_ftl: Remove unused kthread stuff
Date: Sat, 10 Nov 2012 13:35:22 -0300
Message-Id: <1352565322-8731-1-git-send-email-elezegarcia@gmail.com>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver uses workqueues, not kthreads.
Remove kthread header and thread related comment.

Cc: Maxim Levitsky <maximlevitsky@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
The removed comment seems deprecated, but I can't be entirely sure;
so -of course- feel free to keep that.

 drivers/mtd/sm_ftl.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 8dd6ba5..1ce1128 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/random.h>
 #include <linux/hdreg.h>
-#include <linux/kthread.h>
 #include <linux/freezer.h>
 #include <linux/sysfs.h>
 #include <linux/bitops.h>
@@ -1066,7 +1065,6 @@ static int sm_write(struct mtd_blktrans_dev *dev,
 	BUG_ON(ftl->readonly);
 	sm_break_offset(ftl, sec_no << 9, &zone_num, &block, &boffset);
 
-	/* No need in flush thread running now */
 	del_timer(&ftl->timer);
 	mutex_lock(&ftl->mutex);
 
-- 
1.7.8.6

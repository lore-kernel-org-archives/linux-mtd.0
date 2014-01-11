Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W28R2-0003Zp-S5
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2014 23:57:51 +0000
Received: by mail-pa0-f53.google.com with SMTP id hz1so6211070pad.40
 for <linux-mtd@lists.infradead.org>; Sat, 11 Jan 2014 15:57:27 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: mtdram: add missing 'const'
Date: Sat, 11 Jan 2014 15:57:07 -0800
Message-Id: <1389484627-7628-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtdram_init_device() wasn't updated along with mtd_partition.name.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/mtd/devices/mtdram.c | 2 +-
 include/linux/mtd/mtdram.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index ec59d65897fb..8e285089229c 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -92,7 +92,7 @@ static void __exit cleanup_mtdram(void)
 }
 
 int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
-		unsigned long size, char *name)
+		unsigned long size, const char *name)
 {
 	memset(mtd, 0, sizeof(*mtd));
 
diff --git a/include/linux/mtd/mtdram.h b/include/linux/mtd/mtdram.h
index 68891313875d..628a6a21ddf0 100644
--- a/include/linux/mtd/mtdram.h
+++ b/include/linux/mtd/mtdram.h
@@ -3,6 +3,6 @@
 
 #include <linux/mtd/mtd.h>
 int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
-			unsigned long size, char *name);
+			unsigned long size, const char *name);
 
 #endif /* __MTD_MTDRAM_H__ */
-- 
1.8.3.2

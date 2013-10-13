Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VVSrW-0007Fr-KR
 for linux-mtd@lists.infradead.org; Sun, 13 Oct 2013 21:06:07 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: Move major number definitions to major.h
Date: Sun, 13 Oct 2013 18:05:23 -0300
Message-Id: <1381698323-18932-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch moves the char and block major number definitions
to major.h to be with the rest of the major numbers.
While doing this, include major.h in the files that need it.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/devices/block2mtd.c | 1 +
 drivers/mtd/mtdblock.c          | 1 +
 drivers/mtd/mtdblock_ro.c       | 1 +
 drivers/mtd/mtdchar.c           | 1 +
 drivers/mtd/mtdcore.c           | 1 +
 drivers/mtd/mtdsuper.c          | 1 +
 drivers/mtd/ubi/build.c         | 1 +
 include/linux/mtd/mtd.h         | 3 ---
 include/uapi/linux/major.h      | 2 ++
 9 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 5cb4c04..d9fd87a 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -20,6 +20,7 @@
 #include <linux/mutex.h>
 #include <linux/mount.h>
 #include <linux/slab.h>
+#include <linux/major.h>
 
 /* Info for the block device */
 struct block2mtd_dev {
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 53884cc..485ea75 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -32,6 +32,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/blktrans.h>
 #include <linux/mutex.h>
+#include <linux/major.h>
 
 
 struct mtdblk_dev {
diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index 70d27b4..fb5dc89 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -24,6 +24,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/blktrans.h>
 #include <linux/module.h>
+#include <linux/major.h>
 
 static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 684bfa3..9aa0c5e 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -32,6 +32,7 @@
 #include <linux/mount.h>
 #include <linux/blkpg.h>
 #include <linux/magic.h>
+#include <linux/major.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/map.h>
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 92311a5..7189089 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -37,6 +37,7 @@
 #include <linux/backing-dev.h>
 #include <linux/gfp.h>
 #include <linux/slab.h>
+#include <linux/major.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index 334da5f..20c02a3 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -17,6 +17,7 @@
 #include <linux/export.h>
 #include <linux/ctype.h>
 #include <linux/slab.h>
+#include <linux/major.h>
 
 /*
  * compare superblocks to see if they're equivalent
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 315dcc6..e05dc62 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -41,6 +41,7 @@
 #include <linux/kthread.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/major.h>
 #include "ubi.h"
 
 /* Maximum length of the 'mtd=' parameter */
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 88409b8..8cc0e2f 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -29,9 +29,6 @@
 
 #include <asm/div64.h>
 
-#define MTD_CHAR_MAJOR 90
-#define MTD_BLOCK_MAJOR 31
-
 #define MTD_ERASE_PENDING	0x01
 #define MTD_ERASING		0x02
 #define MTD_ERASE_SUSPEND	0x04
diff --git a/include/uapi/linux/major.h b/include/uapi/linux/major.h
index 6a8ca98..620252e 100644
--- a/include/uapi/linux/major.h
+++ b/include/uapi/linux/major.h
@@ -54,6 +54,7 @@
 #define ACSI_MAJOR		28
 #define AZTECH_CDROM_MAJOR	29
 #define FB_MAJOR		29   /* /dev/fb* framebuffers */
+#define MTD_BLOCK_MAJOR		31
 #define CM206_CDROM_MAJOR	32
 #define IDE2_MAJOR		33
 #define IDE3_MAJOR		34
@@ -105,6 +106,7 @@
 #define IDE6_MAJOR		88
 #define IDE7_MAJOR		89
 #define IDE8_MAJOR		90
+#define MTD_CHAR_MAJOR		90
 #define IDE9_MAJOR		91
 
 #define DASD_MAJOR		94
-- 
1.8.1.5

Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgMTw-0001sQ-8j
 for linux-mtd@lists.infradead.org; Wed, 22 Feb 2017 02:16:42 +0000
Received: by mail-pg0-x242.google.com with SMTP id 5so21112078pgj.0
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2017 18:16:18 -0800 (PST)
From: Lepton Wu <ytht.net@gmail.com>
To: dwmw2@infradead.org
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lepton Wu <ytht.net@gmail.com>
Subject: [PATCH v2] mtd: Fix mtdblock for >4GB MTD devices
Date: Tue, 21 Feb 2017 18:15:58 -0800
Message-Id: <20170222021558.710-1-ytht.net@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change to use loff_t instead of unsigned long in some functions
to make sure mtdblock can handle offset bigger than 4G in 32 bits mode.

Signed-off-by: Lepton Wu <ytht.net@gmail.com>
---
 Changes in v2:
  - Make the commit message more clearer and fix some format issues.

 drivers/mtd/mtdblock.c    | 35 ++++++++++++++++++-----------------
 drivers/mtd/mtdblock_ro.c |  4 ++--
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index bb4c14f83c75..373c0edca803 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -61,8 +61,8 @@ static void erase_callback(struct erase_info *done)
 	wake_up(wait_q);
 }
 
-static int erase_write (struct mtd_info *mtd, unsigned long pos,
-			int len, const char *buf)
+static int erase_write(struct mtd_info *mtd, loff_t pos, int len,
+		       const char *buf)
 {
 	struct erase_info erase;
 	DECLARE_WAITQUEUE(wait, current);
@@ -88,8 +88,7 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
 	if (ret) {
 		set_current_state(TASK_RUNNING);
 		remove_wait_queue(&wait_q, &wait);
-		printk (KERN_WARNING "mtdblock: erase of region [0x%lx, 0x%x] "
-				     "on \"%s\" failed\n",
+		pr_warn("mtdblock: erase of region [0x%llx, 0x%x] on \"%s\" failed\n",
 			pos, len, mtd->name);
 		return ret;
 	}
@@ -139,23 +138,24 @@ static int write_cached_data (struct mtdblk_dev *mtdblk)
 }
 
 
-static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
-			    int len, const char *buf)
+static int do_cached_write(struct mtdblk_dev *mtdblk, loff_t pos,
+			   int len, const char *buf)
 {
 	struct mtd_info *mtd = mtdblk->mbd.mtd;
 	unsigned int sect_size = mtdblk->cache_size;
 	size_t retlen;
 	int ret;
 
-	pr_debug("mtdblock: write on \"%s\" at 0x%lx, size 0x%x\n",
+	pr_debug("mtdblock: write on \"%s\" at 0x%llx, size 0x%x\n",
 		mtd->name, pos, len);
 
 	if (!sect_size)
 		return mtd_write(mtd, pos, len, &retlen, buf);
 
 	while (len > 0) {
-		unsigned long sect_start = (pos/sect_size)*sect_size;
-		unsigned int offset = pos - sect_start;
+		unsigned int offset;
+		loff_t sect_start =
+			div_u64_rem(pos, sect_size, &offset) * sect_size;
 		unsigned int size = sect_size - offset;
 		if( size > len )
 			size = len;
@@ -209,23 +209,24 @@ static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
 }
 
 
-static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
-			   int len, char *buf)
+static int do_cached_read(struct mtdblk_dev *mtdblk, loff_t pos,
+			  int len, char *buf)
 {
 	struct mtd_info *mtd = mtdblk->mbd.mtd;
 	unsigned int sect_size = mtdblk->cache_size;
 	size_t retlen;
 	int ret;
 
-	pr_debug("mtdblock: read on \"%s\" at 0x%lx, size 0x%x\n",
-			mtd->name, pos, len);
+	pr_debug("mtdblock: read on \"%s\" at 0x%llx, size 0x%x\n",
+		 mtd->name, pos, len);
 
 	if (!sect_size)
 		return mtd_read(mtd, pos, len, &retlen, buf);
 
 	while (len > 0) {
-		unsigned long sect_start = (pos/sect_size)*sect_size;
-		unsigned int offset = pos - sect_start;
+		unsigned int offset;
+		loff_t sect_start =
+			div_u64_rem(pos, sect_size, &offset) * sect_size;
 		unsigned int size = sect_size - offset;
 		if (size > len)
 			size = len;
@@ -259,7 +260,7 @@ static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
 	struct mtdblk_dev *mtdblk = container_of(dev, struct mtdblk_dev, mbd);
-	return do_cached_read(mtdblk, block<<9, 512, buf);
+	return do_cached_read(mtdblk, (loff_t)block << 9, 512, buf);
 }
 
 static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
@@ -275,7 +276,7 @@ static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 		 * return -EAGAIN sometimes, but why bother?
 		 */
 	}
-	return do_cached_write(mtdblk, block<<9, 512, buf);
+	return do_cached_write(mtdblk, (loff_t)block << 9, 512, buf);
 }
 
 static int mtdblock_open(struct mtd_blktrans_dev *mbd)
diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index fb5dc89369de..92829e3fb3b7 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -31,7 +31,7 @@ static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 {
 	size_t retlen;
 
-	if (mtd_read(dev->mtd, (block * 512), 512, &retlen, buf))
+	if (mtd_read(dev->mtd, (loff_t)block << 9, 512, &retlen, buf))
 		return 1;
 	return 0;
 }
@@ -41,7 +41,7 @@ static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 {
 	size_t retlen;
 
-	if (mtd_write(dev->mtd, (block * 512), 512, &retlen, buf))
+	if (mtd_write(dev->mtd, (loff_t)block << 9, 512, &retlen, buf))
 		return 1;
 	return 0;
 }
-- 
2.11.0.483.g087da7b7c-goog

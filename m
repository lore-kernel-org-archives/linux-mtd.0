Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvznM-000390-Oa
 for linux-mtd@lists.infradead.org; Wed, 03 Dec 2014 02:36:01 +0000
Message-ID: <547E7365.8090603@cn.fujitsu.com>
Date: Wed, 3 Dec 2014 10:20:21 +0800
From: Gu Zheng <guz.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: [RESEND PATCH 3/3] mtd/mtdblock: introduce helper macro
 blktrans_dev_to_mtdblk
 to wrap the conversion (mtd_blktrans_dev to mtdblk_dev)
References: <1417052709-22026-1-git-send-email-guz.fnst@cn.fujitsu.com>
In-Reply-To: <1417052709-22026-1-git-send-email-guz.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Gu Zheng <guz.fnst@cn.fujitsu.com>, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Introduce helper macro blktrans_dev_to_mtdblk to wrap the conversion
(mtd_blktrans_dev to mtdblk_dev), just cleanup.

Signed-off-by: Gu Zheng <guz.fnst@cn.fujitsu.com>
---
 drivers/mtd/mtdblock.c |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index acc00f1..3af3d1c 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -50,6 +50,8 @@ struct mtdblk_dev {
 	enum CACHE_STATES cache_state;
 };
 
+#define blktrans_dev_to_mtdblk(dev) container_of(dev, struct mtdblk_dev, mbd)
+
 /*
  * Cache stuff...
  *
@@ -263,14 +265,16 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
-	struct mtdblk_dev *mtdblk = container_of(dev, struct mtdblk_dev, mbd);
+	struct mtdblk_dev *mtdblk = blktrans_dev_to_mtdblk(dev);
+
 	return do_cached_read(mtdblk, block<<9, 512, buf);
 }
 
 static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
-	struct mtdblk_dev *mtdblk = container_of(dev, struct mtdblk_dev, mbd);
+	struct mtdblk_dev *mtdblk = blktrans_dev_to_mtdblk(dev);
+
 	if (unlikely(!mtdblk->cache_data && mtdblk->cache_size)) {
 		mtdblk->cache_data = vmalloc(mtdblk->mbd.mtd->erasesize);
 		if (!mtdblk->cache_data)
@@ -285,7 +289,7 @@ static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 
 static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 {
-	struct mtdblk_dev *mtdblk = container_of(mbd, struct mtdblk_dev, mbd);
+	struct mtdblk_dev *mtdblk = blktrans_dev_to_mtdblk(mbd);
 
 	pr_debug("mtdblock_open\n");
 
@@ -310,7 +314,7 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 
 static void mtdblock_release(struct mtd_blktrans_dev *mbd)
 {
-	struct mtdblk_dev *mtdblk = container_of(mbd, struct mtdblk_dev, mbd);
+	struct mtdblk_dev *mtdblk = blktrans_dev_to_mtdblk(mbd);
 
 	pr_debug("mtdblock_release\n");
 
@@ -333,7 +337,7 @@ static void mtdblock_release(struct mtd_blktrans_dev *mbd)
 
 static int mtdblock_flush(struct mtd_blktrans_dev *dev)
 {
-	struct mtdblk_dev *mtdblk = container_of(dev, struct mtdblk_dev, mbd);
+	struct mtdblk_dev *mtdblk = blktrans_dev_to_mtdblk(dev);
 
 	mutex_lock(&mtdblk->cache_mutex);
 	write_cached_data(mtdblk);
-- 
1.7.7

.

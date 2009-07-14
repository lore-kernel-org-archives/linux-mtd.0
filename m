Received: from mailbox-us-s-12.mailhostingserver.com ([75.125.101.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQoEv-0006tr-EO
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 20:04:44 +0000
Date: Tue, 14 Jul 2009 22:04:29 +0200
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: dwmw2@infradead.org
Subject: [PATCH] mtdblock: introduce mtdblks_lock
Message-ID: <20090714200429.GD18774@darwin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtdblks array and its content are prone to race conditions. Introduce
the mutex mtdblks_lock in order to solve this.

Signed-off-by: Matthias Kaehlcke <matthias@kaehlcke.net>
---
 drivers/mtd/mtdblock.c |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 208c6fa..ca0c6b8 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -29,6 +29,8 @@ static struct mtdblk_dev {
 	enum { STATE_EMPTY, STATE_CLEAN, STATE_DIRTY } cache_state;
 } *mtdblks[MAX_MTD_DEVICES];
 
+static struct mutex mtdblks_lock;
+
 /*
  * Cache stuff...
  *
@@ -270,6 +272,8 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 
 	DEBUG(MTD_DEBUG_LEVEL1,"mtdblock_open\n");
 
+	mutex_lock(&mtdblks_lock);
+
 	if (mtdblks[dev]) {
 		mtdblks[dev]->count++;
 		return 0;
@@ -277,8 +281,10 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 
 	/* OK, it's not open. Create cache info for it */
 	mtdblk = kzalloc(sizeof(struct mtdblk_dev), GFP_KERNEL);
-	if (!mtdblk)
+	if (!mtdblk) {
+		mutex_unlock(&mtdblks_lock);
 		return -ENOMEM;
+	}
 
 	mtdblk->count = 1;
 	mtdblk->mtd = mtd;
@@ -292,6 +298,8 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 
 	mtdblks[dev] = mtdblk;
 
+	mutex_unlock(&mtdblks_lock);
+
 	DEBUG(MTD_DEBUG_LEVEL1, "ok\n");
 
 	return 0;
@@ -304,6 +312,8 @@ static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 
    	DEBUG(MTD_DEBUG_LEVEL1, "mtdblock_release\n");
 
+	mutex_lock(&mtdblks_lock);
+
 	mutex_lock(&mtdblk->cache_mutex);
 	write_cached_data(mtdblk);
 	mutex_unlock(&mtdblk->cache_mutex);
@@ -316,6 +326,9 @@ static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 		vfree(mtdblk->cache_data);
 		kfree(mtdblk);
 	}
+
+	mutex_unlock(&mtdblks_lock);
+
 	DEBUG(MTD_DEBUG_LEVEL1, "ok\n");
 
 	return 0;
@@ -376,6 +389,8 @@ static struct mtd_blktrans_ops mtdblock_tr = {
 
 static int __init init_mtdblock(void)
 {
+	mutex_init(&mtdblks_lock);
+
 	return register_mtd_blktrans(&mtdblock_tr);
 }
 
-- 
1.6.3.1

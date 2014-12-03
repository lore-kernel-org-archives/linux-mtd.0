Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvznL-000390-De
 for linux-mtd@lists.infradead.org; Wed, 03 Dec 2014 02:35:59 +0000
Message-ID: <547E7348.5020204@cn.fujitsu.com>
Date: Wed, 3 Dec 2014 10:19:52 +0800
From: Gu Zheng <guz.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: [RESEND PATCH 1/3] mtd:mtdblock: remove the needless mtdblks_lock
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

The global lock mtdblks_lock was used to protect the original mtdblks
array to avoid race conditions. As the mtdblks array was already gone,
but the mtdblks_lock is left, and it causes latency when open/release dev.
So we need to remove it here.

Signed-off-by: Gu Zheng <guz.fnst@cn.fujitsu.com>
---
 drivers/mtd/mtdblock.c |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 485ea75..bb4c14f 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -45,8 +45,6 @@ struct mtdblk_dev {
 	enum { STATE_EMPTY, STATE_CLEAN, STATE_DIRTY } cache_state;
 };
 
-static DEFINE_MUTEX(mtdblks_lock);
-
 /*
  * Cache stuff...
  *
@@ -286,10 +284,8 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 
 	pr_debug("mtdblock_open\n");
 
-	mutex_lock(&mtdblks_lock);
 	if (mtdblk->count) {
 		mtdblk->count++;
-		mutex_unlock(&mtdblks_lock);
 		return 0;
 	}
 
@@ -302,8 +298,6 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 		mtdblk->cache_data = NULL;
 	}
 
-	mutex_unlock(&mtdblks_lock);
-
 	pr_debug("ok\n");
 
 	return 0;
@@ -315,8 +309,6 @@ static void mtdblock_release(struct mtd_blktrans_dev *mbd)
 
 	pr_debug("mtdblock_release\n");
 
-	mutex_lock(&mtdblks_lock);
-
 	mutex_lock(&mtdblk->cache_mutex);
 	write_cached_data(mtdblk);
 	mutex_unlock(&mtdblk->cache_mutex);
@@ -331,8 +323,6 @@ static void mtdblock_release(struct mtd_blktrans_dev *mbd)
 		vfree(mtdblk->cache_data);
 	}
 
-	mutex_unlock(&mtdblks_lock);
-
 	pr_debug("ok\n");
 }
 
-- 
1.7.7

.

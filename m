Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LA12i-0003cV-3P
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 11:46:20 +0000
Message-ID: <428822562.16153@cqu.edu.cn>
Subject: [PATCH 3/4] UBI WL-Subsys: Improvement in prot tree
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 09 Dec 2008 19:45:24 +0800
Message-Id: <1228823124.2753.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 2d53575283697fb1db53da47227217c8b8d4858f Mon Sep 17 00:00:00 2001
From: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
Date: Tue, 9 Dec 2008 19:17:52 +0800
Subject: [PATCH] unnecessary variable deleted

Signed-off-by: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
---
 drivers/mtd/ubi/ubi.h |    2 --
 drivers/mtd/ubi/wl.c  |    1 -
 2 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 7072aa5..bfae2da 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -341,7 +341,6 @@ struct ubi_wl_entry;
  * @wl_scheduled: non-zero if the wear-leveling was scheduled
  * @lookuptbl: a table to quickly find a &struct ubi_wl_entry object for any
  *             physical eraseblock
- * @abs_ec: absolute erase counter
  * @move_from: physical eraseblock from where the data is being moved
  * @move_to: physical eraseblock where the data is being moved to
  * @move_to_put: if the "to" PEB was put
@@ -423,7 +422,6 @@ struct ubi_device {
 	struct rw_semaphore work_sem;
 	int wl_scheduled;
 	struct ubi_wl_entry **lookuptbl;
-	unsigned long long abs_ec;
 	struct ubi_wl_entry *move_from;
 	struct ubi_wl_entry *move_to;
 	int move_to_put;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index c92bd86..0b1e8c7 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1015,7 +1015,6 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 		kfree(wl_wrk);
 
 		spin_lock(&ubi->wl_lock);
-		ubi->abs_ec += 1;
 		wl_tree_add(e, &ubi->free);
 		spin_unlock(&ubi->wl_lock);
 
-- 
1.5.3.2


-- 
Yours sincerely
xiaochuan-xu(cqu.edu.cn)

Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCPzM-0003MY-2R
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 02:48:48 +0000
Message-ID: <429395560.30413@cqu.edu.cn>
Subject: Re: [PATCH 4/4] UBI WL-Subsys: Improvement in prot tree
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: dedekind@infradead.org
In-Reply-To: <1229356809.4911.57.camel@sauron>
References: <1228823163.2753.18.camel@localhost.localdomain>
	<1228827803.13686.189.camel@sauron>
	<1228884752.3225.80.camel@localhost.localdomain>
	<1228898668.13686.223.camel@sauron>
	<1228913251.3655.10.camel@localhost.localdomain>
	<1228931859.13686.350.camel@sauron>
	<1228981865.2702.9.camel@localhost.localdomain>
	<1229022841.13686.384.camel@sauron>
	<1229332169.5306.1.camel@localhost.localdomain>
	<1229332781.13686.447.camel@sauron>
	<1229343610.2687.52.camel@localhost.localdomain>
	<1229343746.4911.2.camel@sauron>
	<1229347894.2687.56.camel@localhost.localdomain>
	<1229356809.4911.57.camel@sauron>
Content-Type: text/plain
Date: Tue, 16 Dec 2008 10:48:11 +0800
Message-Id: <1229395691.2691.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From e43d4e5cbaf1adb3af680a6dec53c142c68014ed Mon Sep 17 00:00:00 2001
From: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
Date: Tue, 16 Dec 2008 10:44:07 +0800
Subject: [PATCH] delete idle varialbe abs_ec

@wl->abs_ec is useless any more in the Simplify Protection
PEB Queue implementation.

Signed-off-by: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
---
 drivers/mtd/ubi/ubi.h |    2 --
 drivers/mtd/ubi/wl.c  |    1 -
 2 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index a4b921b..4a8ec48 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -328,7 +328,6 @@ struct ubi_wl_entry;
  * @wl_scheduled: non-zero if the wear-leveling was scheduled
  * @lookuptbl: a table to quickly find a &struct ubi_wl_entry object for any
  *             physical eraseblock
- * @abs_ec: absolute erase counter
  * @move_from: physical eraseblock from where the data is being moved
  * @move_to: physical eraseblock where the data is being moved to
  * @move_to_put: if the "to" PEB was put
@@ -410,7 +409,6 @@ struct ubi_device {
 	struct rw_semaphore work_sem;
 	int wl_scheduled;
 	struct ubi_wl_entry **lookuptbl;
-	unsigned long long abs_ec;
 	struct ubi_wl_entry *move_from;
 	struct ubi_wl_entry *move_to;
 	int move_to_put;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 4fe3f25..0b5a595 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -982,7 +982,6 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 		kfree(wl_wrk);
 
 		spin_lock(&ubi->wl_lock);
-		ubi->abs_ec += 1;
 		wl_tree_add(e, &ubi->free);
 		spin_unlock(&ubi->wl_lock);
 
-- 
1.5.3.2



On Mon, 2008-12-15 at 18:00 +0200, Artem Bityutskiy wrote:
> Amended and pushed to ubi-2.6.git tree. Please, check.
-- 
Yours sincerely
xiaochuan-xu(cqu.edu.cn)

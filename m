Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCPl7-0001cf-4l
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 02:34:05 +0000
Message-ID: <429394196.23259@cqu.edu.cn>
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
Date: Tue, 16 Dec 2008 10:33:08 +0800
Message-Id: <1229394788.2691.14.camel@localhost.localdomain>
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


On Mon, 2008-12-15 at 18:00 +0200, Artem Bityutskiy wrote:
> Amended and pushed to ubi-2.6.git tree.
Thanks!

These two sentences should switch in the 'ubi_wl_get_peb()' function:

-	prot_queue_add(ubi, e);
 	dbg_wl("PEB %d EC %d", e->pnum, e->ec);
+	prot_queue_add(ubi, e);

"get" message should print before "add to prot-queue",
which is more descriptive IMO.


>From 83811c383bf70039aae53e1bbc7311899ea4abcd Mon Sep 17 00:00:00 2001
From: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
Date: Tue, 16 Dec 2008 10:10:20 +0800
Subject: [PATCH] several comments amendment

Signed-off-by: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
---
 drivers/mtd/ubi/wl.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index d50060f..4fe3f25 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -56,7 +56,7 @@
  * As it was said, for the UBI sub-system all physical eraseblocks are either
  * "free" or "used". Free eraseblock are kept in the @wl->free RB-tree, while
  * used eraseblocks are kept in @wl->used or @wl->scrub RB-trees, or in
- * (temporarily) in the @wl->pq queue.
+ * (temporarily) the @wl->pq queue.
  *
  * When the WL sub-system returns a physical eraseblock, the physical
  * eraseblock is protected from being moved for some "time". For this reason,
@@ -143,7 +143,6 @@
  * struct ubi_work - UBI work description data structure.
  * @list: a link in the list of pending works
  * @func: worker function
- * @priv: private data of the worker function
  * @e: physical eraseblock to erase
  * @torture: if the physical eraseblock has to be tortured
  *
@@ -455,8 +454,8 @@ retry:
 	 * be protected from being moved for some time.
 	 */
 	rb_erase(&e->u.rb, &ubi->free);
-	prot_queue_add(ubi, e);
 	dbg_wl("PEB %d EC %d", e->pnum, e->ec);
+	prot_queue_add(ubi, e);
 	spin_unlock(&ubi->wl_lock);
 	return e->pnum;
 }
@@ -1223,7 +1222,7 @@ int ubi_wl_flush(struct ubi_device *ubi)
 	int err;
 
 	/*
-	 * Erase while the pending works queue is not empty, but not more then
+	 * Erase while the pending works queue is not empty, but not more than
 	 * the number of currently pending works.
 	 */
 	dbg_wl("flush (%d pending works)", ubi->works_count);
-- 
1.5.3.2



-- 
Yours sincerely
xiaochuan-xu(cqu.edu.cn)

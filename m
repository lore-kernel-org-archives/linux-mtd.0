Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a235Y-00064w-1c
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2015 20:24:22 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/3] mtd: ubi: fixup error correction in do_sync_erase()
Date: Thu, 26 Nov 2015 21:23:48 +0100
Message-Id: <1448569430-885-1-git-send-email-bigeasy@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since fastmap we gained do_sync_erase(). This function can return an error
and its error handling isn't obvious. First the memory allocation for
struct ubi_work can fail and as such struct ubi_wl_entry is leaked.
However if the memory allocation succeeds then the tail function takes
care of the struct ubi_wl_entry. A free here could result in a double
free.
To make the error handling simpler, I split the tail function into one
piece which does the work and another which frees the struct ubi_work
which is passed as argument. As result do_sync_erase() can keep the
struct on stack and we get rid of one error source.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/ubi/wl.c | 52 ++++++++++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index eb4489f9082f..f73233fa737c 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -603,6 +603,7 @@ static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	return 0;
 }
 
+static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk);
 /**
  * do_sync_erase - run the erase worker synchronously.
  * @ubi: UBI device description object
@@ -615,20 +616,16 @@ static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 static int do_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 			 int vol_id, int lnum, int torture)
 {
-	struct ubi_work *wl_wrk;
+	struct ubi_work wl_wrk;
 
 	dbg_wl("sync erase of PEB %i", e->pnum);
 
-	wl_wrk = kmalloc(sizeof(struct ubi_work), GFP_NOFS);
-	if (!wl_wrk)
-		return -ENOMEM;
+	wl_wrk.e = e;
+	wl_wrk.vol_id = vol_id;
+	wl_wrk.lnum = lnum;
+	wl_wrk.torture = torture;
 
-	wl_wrk->e = e;
-	wl_wrk->vol_id = vol_id;
-	wl_wrk->lnum = lnum;
-	wl_wrk->torture = torture;
-
-	return erase_worker(ubi, wl_wrk, 0);
+	return __erase_worker(ubi, &wl_wrk);
 }
 
 /**
@@ -1014,7 +1011,7 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 }
 
 /**
- * erase_worker - physical eraseblock erase worker function.
+ * __erase_worker - physical eraseblock erase worker function.
  * @ubi: UBI device description object
  * @wl_wrk: the work object
  * @shutdown: non-zero if the worker has to free memory and exit
@@ -1025,8 +1022,7 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
  * needed. Returns zero in case of success and a negative error code in case of
  * failure.
  */
-static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
-			int shutdown)
+static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 {
 	struct ubi_wl_entry *e = wl_wrk->e;
 	int pnum = e->pnum;
@@ -1034,21 +1030,11 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 	int lnum = wl_wrk->lnum;
 	int err, available_consumed = 0;
 
-	if (shutdown) {
-		dbg_wl("cancel erasure of PEB %d EC %d", pnum, e->ec);
-		kfree(wl_wrk);
-		wl_entry_destroy(ubi, e);
-		return 0;
-	}
-
 	dbg_wl("erase PEB %d EC %d LEB %d:%d",
 	       pnum, e->ec, wl_wrk->vol_id, wl_wrk->lnum);
 
 	err = sync_erase(ubi, e, wl_wrk->torture);
 	if (!err) {
-		/* Fine, we've erased it successfully */
-		kfree(wl_wrk);
-
 		spin_lock(&ubi->wl_lock);
 		wl_tree_add(e, &ubi->free);
 		ubi->free_count++;
@@ -1066,7 +1052,6 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 	}
 
 	ubi_err(ubi, "failed to erase PEB %d, error %d", pnum, err);
-	kfree(wl_wrk);
 
 	if (err == -EINTR || err == -ENOMEM || err == -EAGAIN ||
 	    err == -EBUSY) {
@@ -1150,6 +1135,25 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 	return err;
 }
 
+static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
+			  int shutdown)
+{
+	int ret;
+
+	if (shutdown) {
+		struct ubi_wl_entry *e = wl_wrk->e;
+
+		dbg_wl("cancel erasure of PEB %d EC %d", e->pnum, e->ec);
+		kfree(wl_wrk);
+		wl_entry_destroy(ubi, e);
+		return 0;
+	}
+
+	ret = __erase_worker(ubi, wl_wrk);
+	kfree(wl_wrk);
+	return ret;
+}
+
 /**
  * ubi_wl_put_peb - return a PEB to the wear-leveling sub-system.
  * @ubi: UBI device description object
-- 
2.6.2

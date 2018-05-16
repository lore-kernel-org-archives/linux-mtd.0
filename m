Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJ2ri-0007VT-T4
 for linux-mtd@lists.infradead.org; Wed, 16 May 2018 20:17:41 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org, Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Martin Townsend <mtownsend1973@gmail.com>
Subject: [PATCH] ubi: fastmap: Cancel work upon detach
Date: Wed, 16 May 2018 22:17:03 +0200
Message-Id: <20180516201703.2586-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben Hutchings pointed out that 29b7a6fa1ec0 ("ubi: fastmap: Don't flush
fastmap work on detach") does not really fix the problem, it just
reduces the risk to hit the race window where fastmap work races against
free()'ing ubi->volumes[].

The correct approach is making sure that no more fastmap work is in
progress before we free ubi data structures.
So we cancel fastmap work right after the ubi background thread is
stopped.
By setting ubi->thread_enabled to zero we make sure that no further work
tries to wake the thread.

Fixes: 29b7a6fa1ec0 ("ubi: fastmap: Don't flush fastmap work on detach")
Fixes: 74cdaf24004a ("UBI: Fastmap: Fix memory leaks while closing the WL sub-system")
Cc: stable@vger.kernel.org
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>
Cc: Martin Townsend <mtownsend1973@gmail.com>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c | 3 +++
 drivers/mtd/ubi/wl.c    | 4 +---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 6326a02e4568..0cf3356424cd 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1100,6 +1100,9 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	if (ubi->bgt_thread)
 		kthread_stop(ubi->bgt_thread);
 
+#ifdef CONFIG_MTD_UBI_FASTMAP
+	cancel_work_sync(&ubi->fm_work);
+#endif
 	ubi_debugfs_exit_dev(ubi);
 	uif_close(ubi);
 
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 3cc302924899..6bbb968fe9da 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1505,6 +1505,7 @@ int ubi_thread(void *u)
 	}
 
 	dbg_wl("background thread \"%s\" is killed", ubi->bgt_name);
+	ubi->thread_enabled = 0;
 	return 0;
 }
 
@@ -1514,9 +1515,6 @@ int ubi_thread(void *u)
  */
 static void shutdown_work(struct ubi_device *ubi)
 {
-#ifdef CONFIG_MTD_UBI_FASTMAP
-	flush_work(&ubi->fm_work);
-#endif
 	while (!list_empty(&ubi->works)) {
 		struct ubi_work *wrk;
 
-- 
2.13.6

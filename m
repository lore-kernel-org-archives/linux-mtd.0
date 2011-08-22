Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QvU3F-0005e6-OJ
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 12:56:27 +0000
From: David Wagner <david.wagner@free-electrons.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCHv2] ubi: rename the background task pointer from bgt_thread to
	bg_task
Date: Mon, 22 Aug 2011 14:59:42 +0200
Message-Id: <1314017982-20683-1-git-send-email-david.wagner@free-electrons.com>
Cc: "david.wagner@free-electrons.com" <david.wagner@free-electrons.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: david.wagner@free-electrons.com <david.wagner@free-electrons.com>

This was suggested by Artem Bityutskiy based on the following quote:
  hch: a convention I tend to use and I've seen in various places
  is to always use _task for the storage of the task_struct pointer,
  and thread everywhere else.  This especially helps with having
  foo_thread for the actual thread and foo_task for a global
  variable keeping the task_struct pointer

Signed-off-by: David Wagner <david.wagner@free-electrons.com>
---

	Hi Artem,

This second version is rebased on ubi-2.6/master and also contains a
s/thread/task/ on bg_task's documentation

Regards,
	David.

 drivers/mtd/ubi/build.c |   12 ++++++------
 drivers/mtd/ubi/ubi.h   |    4 ++--
 drivers/mtd/ubi/wl.c    |    2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 6c3fb5a..1666ad5 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -977,9 +977,9 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	if (err)
 		goto out_uif;
 
-	ubi->bgt_thread = kthread_create(ubi_thread, ubi, ubi->bgt_name);
-	if (IS_ERR(ubi->bgt_thread)) {
-		err = PTR_ERR(ubi->bgt_thread);
+	ubi->bg_task = kthread_create(ubi_thread, ubi, ubi->bgt_name);
+	if (IS_ERR(ubi->bg_task)) {
+		err = PTR_ERR(ubi->bg_task);
 		ubi_err("cannot spawn \"%s\", error %d", ubi->bgt_name,
 			err);
 		goto out_debugfs;
@@ -1009,7 +1009,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	 */
 	spin_lock(&ubi->wl_lock);
 	ubi->thread_enabled = 1;
-	wake_up_process(ubi->bgt_thread);
+	wake_up_process(ubi->bg_task);
 	spin_unlock(&ubi->wl_lock);
 
 	ubi_devices[ubi_num] = ubi;
@@ -1085,8 +1085,8 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	 * Before freeing anything, we have to stop the background thread to
 	 * prevent it from doing anything on this device while we are freeing.
 	 */
-	if (ubi->bgt_thread)
-		kthread_stop(ubi->bgt_thread);
+	if (ubi->bg_task)
+		kthread_stop(ubi->bg_task);
 
 	/*
 	 * Get a reference to the device in order to prevent 'dev_release()'
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index dc64c76..6e4dc9c 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -352,7 +352,7 @@ struct ubi_wl_entry;
  * @move_to_put: if the "to" PEB was put
  * @works: list of pending works
  * @works_count: count of pending works
- * @bgt_thread: background thread description object
+ * @bg_task: background task description object
  * @thread_enabled: if the background thread is enabled
  * @bgt_name: background thread name
  *
@@ -441,7 +441,7 @@ struct ubi_device {
 	int move_to_put;
 	struct list_head works;
 	int works_count;
-	struct task_struct *bgt_thread;
+	struct task_struct *bg_task;
 	int thread_enabled;
 	char bgt_name[sizeof(UBI_BGT_NAME_PATTERN)+2];
 
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 42c684c..2c1a28e 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -617,7 +617,7 @@ static void schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
 	ubi_assert(ubi->works_count >= 0);
 	ubi->works_count += 1;
 	if (ubi->thread_enabled && !ubi_dbg_is_bgt_disabled(ubi))
-		wake_up_process(ubi->bgt_thread);
+		wake_up_process(ubi->bg_task);
 	spin_unlock(&ubi->wl_lock);
 }
 
-- 
1.7.0.4

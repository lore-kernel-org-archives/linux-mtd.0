Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q46xD-00011j-U0
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 07:33:38 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2S7XW3d001371
	for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2011 10:33:32 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] UBI: fix minor stylistic issues
Date: Mon, 28 Mar 2011 10:36:11 +0300
Message-Id: <1301297771-14624-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1301297771-14624-1-git-send-email-dedekind1@gmail.com>
References: <1301297771-14624-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Fix checkpatch.pl errors and warnings:

* space before tab
* line over 80 characters
* include linux/ioctl.h instead of asm/ioctl.h

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/cdev.c  |    4 ++--
 drivers/mtd/ubi/debug.c |   18 +++++++++---------
 drivers/mtd/ubi/io.c    |    4 ++--
 drivers/mtd/ubi/scan.c  |    2 +-
 drivers/mtd/ubi/ubi.h   |    4 ++--
 drivers/mtd/ubi/wl.c    |    3 ++-
 include/linux/mtd/ubi.h |    4 ++--
 include/mtd/ubi-user.h  |    6 +++---
 8 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 4119cb8..191f3bb 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -115,7 +115,7 @@ static int vol_cdev_open(struct inode *inode, struct file *file)
 		mode = UBI_READONLY;
 
 	dbg_gen("open device %d, volume %d, mode %d",
-	        ubi_num, vol_id, mode);
+		ubi_num, vol_id, mode);
 
 	desc = ubi_open_volume(ubi_num, vol_id, mode);
 	if (IS_ERR(desc))
@@ -158,7 +158,7 @@ static loff_t vol_cdev_llseek(struct file *file, loff_t offset, int origin)
 	loff_t new_offset;
 
 	if (vol->updating) {
-		 /* Update is in progress, seeking is prohibited */
+		/* Update is in progress, seeking is prohibited */
 		dbg_err("updating");
 		return -EBUSY;
 	}
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index d4d07e5..0cd5bea 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -75,15 +75,15 @@ void ubi_dbg_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr)
 {
 	printk(KERN_DEBUG "Volume identifier header dump:\n");
 	printk(KERN_DEBUG "\tmagic     %08x\n", be32_to_cpu(vid_hdr->magic));
-	printk(KERN_DEBUG "\tversion   %d\n",   (int)vid_hdr->version);
-	printk(KERN_DEBUG "\tvol_type  %d\n",   (int)vid_hdr->vol_type);
-	printk(KERN_DEBUG "\tcopy_flag %d\n",   (int)vid_hdr->copy_flag);
-	printk(KERN_DEBUG "\tcompat    %d\n",   (int)vid_hdr->compat);
-	printk(KERN_DEBUG "\tvol_id    %d\n",   be32_to_cpu(vid_hdr->vol_id));
-	printk(KERN_DEBUG "\tlnum      %d\n",   be32_to_cpu(vid_hdr->lnum));
-	printk(KERN_DEBUG "\tdata_size %d\n",   be32_to_cpu(vid_hdr->data_size));
-	printk(KERN_DEBUG "\tused_ebs  %d\n",   be32_to_cpu(vid_hdr->used_ebs));
-	printk(KERN_DEBUG "\tdata_pad  %d\n",   be32_to_cpu(vid_hdr->data_pad));
+	printk(KERN_DEBUG "\tversion   %d\n",  (int)vid_hdr->version);
+	printk(KERN_DEBUG "\tvol_type  %d\n",  (int)vid_hdr->vol_type);
+	printk(KERN_DEBUG "\tcopy_flag %d\n",  (int)vid_hdr->copy_flag);
+	printk(KERN_DEBUG "\tcompat    %d\n",  (int)vid_hdr->compat);
+	printk(KERN_DEBUG "\tvol_id    %d\n",  be32_to_cpu(vid_hdr->vol_id));
+	printk(KERN_DEBUG "\tlnum      %d\n",  be32_to_cpu(vid_hdr->lnum));
+	printk(KERN_DEBUG "\tdata_size %d\n",  be32_to_cpu(vid_hdr->data_size));
+	printk(KERN_DEBUG "\tused_ebs  %d\n",  be32_to_cpu(vid_hdr->used_ebs));
+	printk(KERN_DEBUG "\tdata_pad  %d\n",  be32_to_cpu(vid_hdr->data_pad));
 	printk(KERN_DEBUG "\tsqnum     %llu\n",
 		(unsigned long long)be64_to_cpu(vid_hdr->sqnum));
 	printk(KERN_DEBUG "\thdr_crc   %08x\n", be32_to_cpu(vid_hdr->hdr_crc));
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index e347cc4..d58ceb1 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -189,8 +189,8 @@ retry:
 		}
 
 		if (retries++ < UBI_IO_RETRIES) {
-			dbg_io("error %d%s while reading %d bytes from PEB %d:%d,"
-			       " read only %zd bytes, retry",
+			dbg_io("error %d%s while reading %d bytes from PEB "
+			       "%d:%d, read only %zd bytes, retry",
 			       err, errstr, len, pnum, offset, read);
 			yield();
 			goto retry;
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 11eb8ef..5695eb0 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -1103,7 +1103,7 @@ static int check_what_we_have(struct ubi_device *ubi, struct ubi_scan_info *si)
 		 * otherwise, only print a warning.
 		 */
 		if (si->corr_peb_count >= max_corr) {
-			ubi_err("too many corrupted PEBs, refusing this device");
+			ubi_err("too many corrupted PEBs, refusing");
 			return -EINVAL;
 		}
 	}
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index f1be8b7..c6c2229 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -341,8 +341,8 @@ struct ubi_wl_entry;
  *      protected from the wear-leveling worker)
  * @pq_head: protection queue head
  * @wl_lock: protects the @used, @free, @pq, @pq_head, @lookuptbl, @move_from,
- * 	     @move_to, @move_to_put @erase_pending, @wl_scheduled, @works,
- * 	     @erroneous, and @erroneous_peb_count fields
+ *	     @move_to, @move_to_put @erase_pending, @wl_scheduled, @works,
+ *	     @erroneous, and @erroneous_peb_count fields
  * @move_mutex: serializes eraseblock moves
  * @work_sem: synchronizes the WL worker with use tasks
  * @wl_scheduled: non-zero if the wear-leveling was scheduled
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index b4cf57d..ff2c495 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1570,7 +1570,8 @@ void ubi_wl_close(struct ubi_device *ubi)
  * @ec: the erase counter to check
  *
  * This function returns zero if the erase counter of physical eraseblock @pnum
- * is equivalent to @ec, and a negative error code if not or if an error occurred.
+ * is equivalent to @ec, and a negative error code if not or if an error
+ * occurred.
  */
 static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec)
 {
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 84854ed..15da0e9 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -21,7 +21,7 @@
 #ifndef __LINUX_UBI_H__
 #define __LINUX_UBI_H__
 
-#include <asm/ioctl.h>
+#include <linux/ioctl.h>
 #include <linux/types.h>
 #include <mtd/ubi-user.h>
 
@@ -87,7 +87,7 @@ enum {
  * physical eraseblock size and on how much bytes UBI headers consume. But
  * because of the volume alignment (@alignment), the usable size of logical
  * eraseblocks if a volume may be less. The following equation is true:
- * 	@usable_leb_size = LEB size - (LEB size mod @alignment),
+ *	@usable_leb_size = LEB size - (LEB size mod @alignment),
  * where LEB size is the logical eraseblock size defined by the UBI device.
  *
  * The alignment is multiple to the minimal flash input/output unit size or %1
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index a390342..3c41097 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -406,9 +406,9 @@ struct ubi_map_req {
  * @value: value to set
  */
 struct ubi_set_vol_prop_req {
-       __u8  property;
-       __u8  padding[7];
-       __u64 value;
+	__u8  property;
+	__u8  padding[7];
+	__u64 value;
 }  __packed;
 
 #endif /* __UBI_USER_H__ */
-- 
1.7.2.3

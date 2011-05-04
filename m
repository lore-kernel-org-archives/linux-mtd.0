Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHkIZ-0007zU-UL
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 22:12:00 +0000
Received: by qyl38 with SMTP id 38so1412991qyl.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2011 15:11:57 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 4 May 2011 18:11:57 -0400
Message-ID: <BANLkTi=3XbZqV2NXWFpgtC=7CR_iVGtLYw@mail.gmail.com>
Subject: [PATCH v2 1/3] ubifs: add a superblock flag for free space fix-up
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The space_fixup flag can be set in the superblock of a new filesystem by
mkfs.ubifs to indicate that any eraseblocks with free space remaining should be
fixed-up the first time it's mounted (after which the flag is un-set).

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 fs/ubifs/debug.c       |    2 ++
 fs/ubifs/sb.c          |    1 +
 fs/ubifs/ubifs-media.h |    2 ++
 fs/ubifs/ubifs.h       |    2 ++
 4 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index f7515bd..3dce5f3 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -316,6 +316,8 @@ void dbg_dump_node(const struct ubifs_info *c,
const void *node)
 		printk(KERN_DEBUG "\tflags          %#x\n", sup_flags);
 		printk(KERN_DEBUG "\t  big_lpt      %u\n",
 		       !!(sup_flags & UBIFS_FLG_BIGLPT));
+		printk(KERN_DEBUG "\t  space_fixup  %u\n",
+		       !!(sup_flags & UBIFS_FLG_SPACE_FIXUP));
 		printk(KERN_DEBUG "\tmin_io_size    %u\n",
 		       le32_to_cpu(sup->min_io_size));
 		printk(KERN_DEBUG "\tleb_size       %u\n",
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index bf31b47..291f051 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -616,6 +616,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	c->vfs_sb->s_time_gran = le32_to_cpu(sup->time_gran);
 	memcpy(&c->uuid, &sup->uuid, 16);
 	c->big_lpt = !!(sup_flags & UBIFS_FLG_BIGLPT);
+	c->space_fixup = !!(sup_flags & UBIFS_FLG_SPACE_FIXUP);

 	/* Automatically increase file system size to the maximum size */
 	c->old_leb_cnt = c->leb_cnt;
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index b922f03..e24380c 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -408,9 +408,11 @@ enum {
  * Superblock flags.
  *
  * UBIFS_FLG_BIGLPT: if "big" LPT model is used if set
+ * UBIFS_FLG_SPACE_FIXUP: first-mount "fixup" of free space within LEBs needed
  */
 enum {
 	UBIFS_FLG_BIGLPT = 0x02,
+	UBIFS_FLG_SPACE_FIXUP = 0x04,
 };

 /**
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 26a7ebe..6f0bfa9 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1014,6 +1014,7 @@ struct ubifs_debug_info;
  * @cmt_wq: wait queue to sleep on if the log is full and a commit is running
  *
  * @big_lpt: flag that LPT is too big to write whole during commit
+ * @space_fixup: flag indicating that free space in LEBs needs to be cleaned up
  * @no_chk_data_crc: do not check CRCs when reading data nodes (except during
  *                   recovery)
  * @bulk_read: enable bulk-reads
@@ -1254,6 +1255,7 @@ struct ubifs_info {
 	wait_queue_head_t cmt_wq;

 	unsigned int big_lpt:1;
+	unsigned int space_fixup:1;
 	unsigned int no_chk_data_crc:1;
 	unsigned int bulk_read:1;
 	unsigned int default_compr:2;
-- 
1.6.3.3


-- 
Matthew L. Creech

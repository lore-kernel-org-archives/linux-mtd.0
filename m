Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHOUe-000493-EE
	for linux-mtd@lists.infradead.org; Tue, 03 May 2011 22:55:01 +0000
Received: by mail-vx0-f177.google.com with SMTP id 2so681073vxd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 May 2011 15:55:00 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 3 May 2011 18:55:00 -0400
Message-ID: <BANLkTi=YnoTophc97QCbujJANpgHXaFpkw@mail.gmail.com>
Subject: [PATCH 1/3] ubifs: add a superblock flag for "LEB fixup"
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

The leb_fixup flag can be set in the superblock of a new filesystem by
mkfs.ubifs to indicate that the filesystem's underlying eraseblocks should be
fixed-up the first time it's mounted (after which the flag is un-set).

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 fs/ubifs/debug.c       |    2 ++
 fs/ubifs/sb.c          |    2 ++
 fs/ubifs/ubifs-media.h |    2 ++
 fs/ubifs/ubifs.h       |    2 ++
 4 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index f7515bd..fc2c48b 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -316,6 +316,8 @@ void dbg_dump_node(const struct ubifs_info *c,
const void *node)
 		printk(KERN_DEBUG "\tflags          %#x\n", sup_flags);
 		printk(KERN_DEBUG "\t  big_lpt      %u\n",
 		       !!(sup_flags & UBIFS_FLG_BIGLPT));
+		printk(KERN_DEBUG "\t  leb_fixup    %u\n",
+		       !!(sup_flags & UBIFS_FLG_LEB_FIXUP));
 		printk(KERN_DEBUG "\tmin_io_size    %u\n",
 		       le32_to_cpu(sup->min_io_size));
 		printk(KERN_DEBUG "\tleb_size       %u\n",
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index bf31b47..e3777d0 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -165,6 +165,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	tmp64 = (long long)max_buds * c->leb_size;
 	if (big_lpt)
 		sup_flags |= UBIFS_FLG_BIGLPT;
+	/* LEB fixup is not needed for a default filesystem */

 	sup->ch.node_type  = UBIFS_SB_NODE;
 	sup->key_hash      = UBIFS_KEY_HASH_R5;
@@ -616,6 +617,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	c->vfs_sb->s_time_gran = le32_to_cpu(sup->time_gran);
 	memcpy(&c->uuid, &sup->uuid, 16);
 	c->big_lpt = !!(sup_flags & UBIFS_FLG_BIGLPT);
+	c->leb_fixup = !!(sup_flags & UBIFS_FLG_LEB_FIXUP);

 	/* Automatically increase file system size to the maximum size */
 	c->old_leb_cnt = c->leb_cnt;
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index b922f03..dfffa5a 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -408,9 +408,11 @@ enum {
  * Superblock flags.
  *
  * UBIFS_FLG_BIGLPT: if "big" LPT model is used if set
+ * UBIFS_FLG_LEB_FIXUP: first-mount "fixup" of empty pages in LEBs needed
  */
 enum {
 	UBIFS_FLG_BIGLPT = 0x02,
+	UBIFS_FLG_LEB_FIXUP = 0x04,
 };

 /**
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 26a7ebe..03e08ea 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1014,6 +1014,7 @@ struct ubifs_debug_info;
  * @cmt_wq: wait queue to sleep on if the log is full and a commit is running
  *
  * @big_lpt: flag that LPT is too big to write whole during commit
+ * @leb_fixup: flag indicating that empty space in LEBs needs to be cleaned up
  * @no_chk_data_crc: do not check CRCs when reading data nodes (except during
  *                   recovery)
  * @bulk_read: enable bulk-reads
@@ -1254,6 +1255,7 @@ struct ubifs_info {
 	wait_queue_head_t cmt_wq;

 	unsigned int big_lpt:1;
+	unsigned int leb_fixup:1;
 	unsigned int no_chk_data_crc:1;
 	unsigned int bulk_read:1;
 	unsigned int default_compr:2;
-- 
1.6.3.3


-- 
Matthew L. Creech

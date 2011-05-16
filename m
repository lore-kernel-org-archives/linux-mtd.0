Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQl-0003dJ-Hd
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:42 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTDX011101
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 18/20] UBIFS: add a superblock flag for free space fix-up
Date: Mon, 16 May 2011 10:44:37 +0300
Message-Id: <1305531879-19311-19-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
References: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matthew L. Creech <mlcreech@gmail.com>

The 'space_fixup' flag can be set in the superblock of a new filesystem by
mkfs.ubifs to indicate that any eraseblocks with free space remaining should be
fixed-up the first time it's mounted (after which the flag is un-set). This
means that the UBIFS image has been flashed by a "dumb" flasher and the free
space has been actually programmed (writing all 0xFFs), so this free space
cannot be used. UBIFS fixes the free space up by re-writing the contents of all
LEBs with free space using the atomic LEB change UBI operation.

Artem: improved commit message, add some more commentaries to the code.

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c       |    2 ++
 fs/ubifs/sb.c          |    1 +
 fs/ubifs/ubifs-media.h |    2 ++
 fs/ubifs/ubifs.h       |    2 ++
 4 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index b5ba2ea..f46d77e 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -316,6 +316,8 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 		printk(KERN_DEBUG "\tflags          %#x\n", sup_flags);
 		printk(KERN_DEBUG "\t  big_lpt      %u\n",
 		       !!(sup_flags & UBIFS_FLG_BIGLPT));
+		printk(KERN_DEBUG "\t  space_fixup  %u\n",
+		       !!(sup_flags & UBIFS_FLG_SPACE_FIXUP));
 		printk(KERN_DEBUG "\tmin_io_size    %u\n",
 		       le32_to_cpu(sup->min_io_size));
 		printk(KERN_DEBUG "\tleb_size       %u\n",
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index cad60b5..93d6928 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -617,6 +617,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
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
index a2f9d4e..8e27553 100644
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
@@ -1253,6 +1254,7 @@ struct ubifs_info {
 	wait_queue_head_t cmt_wq;
 
 	unsigned int big_lpt:1;
+	unsigned int space_fixup:1;
 	unsigned int no_chk_data_crc:1;
 	unsigned int bulk_read:1;
 	unsigned int default_compr:2;
-- 
1.7.2.3

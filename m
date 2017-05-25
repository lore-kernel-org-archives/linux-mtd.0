Received: from lgeamrelo11.lge.com ([156.147.23.51])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dE2DL-0004jz-Sq
 for linux-mtd@lists.infradead.org; Thu, 25 May 2017 23:30:46 +0000
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
CC: Artem Bityutskiy <dedekind1@gmail.com>, <adrian.hunter@intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <kernel-team@lge.com>
Subject: [PATCH] ubifs: Add freeze support
Date: Fri, 26 May 2017 08:30:04 +0900
Message-ID: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hyunchul Lee <cheol.lee@lge.com>

for un/freeze support, implement freeze_super and un/freeze_fs
of super_operations.
ubifs_freeze_super just calls freeze_super. because freeze_super always
succeeds if file system is read-only,  UBIFS errors should be checked.
if there are errors, UBIFS is switched to read-only mode.
ubifs_freeze_fs runs commit if TNC/LPT isn't clean. though all writes
are blocked and sync_fs is called before, if commit alreay was started
before writes are blocked, TNC/LPT might have dirty COW nodes.

Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
---
 fs/ubifs/commit.c |  6 +++---
 fs/ubifs/super.c  | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h  |  1 +
 3 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 63f5661..ab347ff 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -49,7 +49,7 @@
 #include "ubifs.h"
 
 /*
- * nothing_to_commit - check if there is nothing to commit.
+ * ubifs_nothing_to_commit - check if there is nothing to commit.
  * @c: UBIFS file-system description object
  *
  * This is a helper function which checks if there is anything to commit. It is
@@ -65,7 +65,7 @@
  *
  * This function returns %1 if there is nothing to commit and %0 otherwise.
  */
-static int nothing_to_commit(struct ubifs_info *c)
+int ubifs_nothing_to_commit(struct ubifs_info *c)
 {
 	/*
 	 * During mounting or remounting from R/O mode to R/W mode we may
@@ -120,7 +120,7 @@ static int do_commit(struct ubifs_info *c)
 		goto out_up;
 	}
 
-	if (nothing_to_commit(c)) {
+	if (ubifs_nothing_to_commit(c)) {
 		up_write(&c->commit_sem);
 		err = 0;
 		goto out_cancel;
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b73811b..16fc22c 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -356,6 +356,7 @@ static void ubifs_evict_inode(struct inode *inode)
 	if (inode->i_nlink)
 		goto done;
 
+	sb_start_intwrite(inode->i_sb);
 	if (is_bad_inode(inode))
 		goto out;
 
@@ -377,6 +378,7 @@ static void ubifs_evict_inode(struct inode *inode)
 		c->bi.nospace = c->bi.nospace_rp = 0;
 		smp_wmb();
 	}
+	sb_end_intwrite(inode->i_sb);
 done:
 	clear_inode(inode);
 #ifdef CONFIG_UBIFS_FS_ENCRYPTION
@@ -486,6 +488,64 @@ static int ubifs_sync_fs(struct super_block *sb, int wait)
 	return ubi_sync(c->vi.ubi_num);
 }
 
+static int ubifs_freeze_super(struct super_block *sb)
+{
+	struct ubifs_info *c = sb->s_fs_info;
+	int err;
+
+	dbg_gen("starting");
+	/* freeze_super always succeeds if file system is in read-only.
+	 * however if there are errors, UBIFS is switched to read-only mode.
+	 * so @ro_error should be checked.
+	 */
+	err = freeze_super(sb);
+	if (!err && c->ro_error) {
+		thaw_super(sb);
+		return -EIO;
+	}
+	return err;
+}
+
+static int ubifs_freeze(struct super_block *sb)
+{
+	struct ubifs_info *c = sb->s_fs_info;
+	int ret;
+
+	if (c->ro_error)
+		return -EIO;
+
+	if (c->ro_mount)
+		return 0;
+
+	down_write(&c->commit_sem);
+	ret = ubifs_nothing_to_commit(c);
+	up_write(&c->commit_sem);
+
+	/* writes were blocked and ubifs_sync_fs was called before.
+	 * but TNC/LPT isn't guarranteed to be clean. because if commit was
+	 * already started before writes were blocked, TNC/LPT might have
+	 * COW nodes. so we try to commit again in this case.
+	 */
+	if (!ret) {
+		ret = ubifs_run_commit(c);
+		if (ret)
+			return ret;
+
+		down_write(&c->commit_sem);
+		ret = ubifs_nothing_to_commit(c);
+		up_write(&c->commit_sem);
+		if (!ret)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ubifs_unfreeze(struct super_block *sb)
+{
+	return 0;
+}
+
 /**
  * init_constants_early - initialize UBIFS constants.
  * @c: UBIFS file-system description object
@@ -1889,6 +1949,9 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 	.remount_fs    = ubifs_remount_fs,
 	.show_options  = ubifs_show_options,
 	.sync_fs       = ubifs_sync_fs,
+	.freeze_super  = ubifs_freeze_super,
+	.freeze_fs     = ubifs_freeze,
+	.unfreeze_fs   = ubifs_unfreeze,
 };
 
 /**
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index abdd116..545796e 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1645,6 +1645,7 @@ unsigned long ubifs_shrink_count(struct shrinker *shrink,
 void ubifs_recovery_commit(struct ubifs_info *c);
 int ubifs_gc_should_commit(struct ubifs_info *c);
 void ubifs_wait_for_commit(struct ubifs_info *c);
+int ubifs_nothing_to_commit(struct ubifs_info *c);
 
 /* master.c */
 int ubifs_read_master(struct ubifs_info *c);
-- 
1.9.1

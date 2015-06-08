Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1sU0-0000Tj-G0
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2015 08:32:37 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <adrian.hunter@intel.com>, <richard@nod.at>, <dedekind1@gmail.com>
Subject: [PATCH] ubifs: Introduce a mount option of force_atime.
Date: Mon, 8 Jun 2015 16:27:18 +0800
Message-ID: <1433752038-17276-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, ubifs does not support access time anyway. I understand
that there is a overhead to update inode in each access from user.

But for the following two reasons, I think we can make it optional
to user.

(1). More and more flash storage in server are trying to use ubifs,
it is not only for a device such as mobile phone any more, we want
to use it in more and more generic way. Then we need to compete
with some other main filesystems. From this point, access time is
necessary to us, at least as a choice to user currently.

(2). The default mount option about atime is relatime currently,
it's much relaxy compared with strictatime. Then we don't update
the inode in any accessing. So the overhead is not too much.
It's really acceptable.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/file.c  |  4 ++++
 fs/ubifs/super.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++---
 fs/ubifs/ubifs.h |  5 +++++
 3 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 35efc10..e683890 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1541,11 +1541,15 @@ static const struct vm_operations_struct ubifs_file_vm_ops = {
 static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	int err;
+	struct inode *inode = file->f_mapping->host;
+	struct ubifs_info *c = inode->i_sb->s_fs_info;
 
 	err = generic_file_mmap(file, vma);
 	if (err)
 		return err;
 	vma->vm_ops = &ubifs_file_vm_ops;
+	if (c->force_atime)
+		file_accessed(file);
 	return 0;
 }
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 75e6f04..8c2773b 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -128,7 +128,9 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 	if (err)
 		goto out_ino;
 
-	inode->i_flags |= (S_NOCMTIME | S_NOATIME);
+	inode->i_flags |= S_NOCMTIME;
+	if (!c->force_atime)
+		inode->i_flags |= S_NOATIME;
 	set_nlink(inode, le32_to_cpu(ino->nlink));
 	i_uid_write(inode, le32_to_cpu(ino->uid));
 	i_gid_write(inode, le32_to_cpu(ino->gid));
@@ -378,15 +380,47 @@ done:
 	clear_inode(inode);
 }
 
+/*
+ * There is only one possible caller of ubifs_dirty_inode without holding
+ * ui->ui_mutex, file_accessed. We are going to support atime if user
+ * set the mount option of force_atime. In that case, ubifs_dirty_inode
+ * need to lock ui->ui_mutex by itself and do a budget by itself.
+ */
 static void ubifs_dirty_inode(struct inode *inode, int flags)
 {
 	struct ubifs_inode *ui = ubifs_inode(inode);
+	int locked = mutex_is_locked(&ui->ui_mutex);
+	struct ubifs_info *c = inode->i_sb->s_fs_info;
+	int ret = 0;
+
+	if (!locked)
+		mutex_lock(&ui->ui_mutex);
 
-	ubifs_assert(mutex_is_locked(&ui->ui_mutex));
 	if (!ui->dirty) {
+		if (!locked) {
+			/*
+			 * It's a little tricky here, there is only one
+			 * possible user of ubifs_dirty_inode did not do
+			 * a budget for this inode. At the same time, this
+			 * user is not holding the ui->ui_mutex. Then if
+			 * we found ui->ui_mutex is not locked, we can say:
+			 * we need to do a budget in ubifs_dirty_inode here.
+			 */
+			struct ubifs_budget_req req = { .dirtied_ino = 1,
+					.dirtied_ino_d = ALIGN(ui->data_len, 8) };
+
+			ret = ubifs_budget_space(c, &req);
+			if (ret)
+				goto out;
+		}
 		ui->dirty = 1;
 		dbg_gen("inode %lu",  inode->i_ino);
 	}
+
+out:
+	if (!locked)
+		mutex_unlock(&ui->ui_mutex);
+	return;
 }
 
 static int ubifs_statfs(struct dentry *dentry, struct kstatfs *buf)
@@ -440,6 +474,9 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
 			   ubifs_compr_name(c->mount_opts.compr_type));
 	}
 
+	if (c->mount_opts.force_atime == 1)
+		seq_printf(s, ",force_atime");
+
 	return 0;
 }
 
@@ -915,6 +952,7 @@ static int check_volume_empty(struct ubifs_info *c)
  * Opt_chk_data_crc: check CRCs when reading data nodes
  * Opt_no_chk_data_crc: do not check CRCs when reading data nodes
  * Opt_override_compr: override default compressor
+ * Opt_force_atime: enforce inode to support atime
  * Opt_err: just end of array marker
  */
 enum {
@@ -925,6 +963,7 @@ enum {
 	Opt_chk_data_crc,
 	Opt_no_chk_data_crc,
 	Opt_override_compr,
+	Opt_force_atime,
 	Opt_err,
 };
 
@@ -936,6 +975,7 @@ static const match_table_t tokens = {
 	{Opt_chk_data_crc, "chk_data_crc"},
 	{Opt_no_chk_data_crc, "no_chk_data_crc"},
 	{Opt_override_compr, "compr=%s"},
+	{Opt_force_atime, "force_atime"},
 	{Opt_err, NULL},
 };
 
@@ -1036,6 +1076,10 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			c->default_compr = c->mount_opts.compr_type;
 			break;
 		}
+		case Opt_force_atime:
+			c->mount_opts.force_atime = 1;
+			c->force_atime = 1;
+			break;
 		default:
 		{
 			unsigned long flag;
@@ -2138,7 +2182,9 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 		if (err)
 			goto out_deact;
 		/* We do not support atime */
-		sb->s_flags |= MS_ACTIVE | MS_NOATIME;
+		sb->s_flags |= MS_ACTIVE;
+		if (!c->force_atime)
+			sb->s_flags |= MS_NOATIME;
 	}
 
 	/* 'fill_super()' opens ubi again so we must close it here */
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index de75902..fbc46a2 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -942,6 +942,8 @@ struct ubifs_orphan {
  *                  specified in @compr_type)
  * @compr_type: compressor type to override the superblock compressor with
  *              (%UBIFS_COMPR_NONE, etc)
+ * @force_atime: ubifs does not support atime by default, but if you set
+ * 		 force_atime in mount opts, we update the atime accessing.
  */
 struct ubifs_mount_opts {
 	unsigned int unmount_mode:2;
@@ -949,6 +951,7 @@ struct ubifs_mount_opts {
 	unsigned int chk_data_crc:2;
 	unsigned int override_compr:1;
 	unsigned int compr_type:2;
+	unsigned int force_atime:1;
 };
 
 /**
@@ -1034,6 +1037,7 @@ struct ubifs_debug_info;
  * @bulk_read: enable bulk-reads
  * @default_compr: default compression algorithm (%UBIFS_COMPR_LZO, etc)
  * @rw_incompat: the media is not R/W compatible
+ * @force_atime: support atime if it is set
  *
  * @tnc_mutex: protects the Tree Node Cache (TNC), @zroot, @cnext, @enext, and
  *             @calc_idx_sz
@@ -1275,6 +1279,7 @@ struct ubifs_info {
 	unsigned int bulk_read:1;
 	unsigned int default_compr:2;
 	unsigned int rw_incompat:1;
+	unsigned int force_atime:1;
 
 	struct mutex tnc_mutex;
 	struct ubifs_zbranch zroot;
-- 
1.8.4.2

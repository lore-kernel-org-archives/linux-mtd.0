Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgd1o-0003lp-ID
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 18:19:57 +0000
Message-ID: <560984B4.7090105@codeaurora.org>
Date: Mon, 28 Sep 2015 11:19:32 -0700
From: Nikhilesh Reddy <reddyn@codeaurora.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Add new mount option to force fdatasync before rename
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The rename operation in UBIFS is synchronous (or nearly synchronous)
while the write operation is not. This can result in zero length files when
renaming of files followed by an abrupt power down or a crash.

For example:
1) Say a file a.txt exists with size 1KB.
2) Create a file b.tmp (open)
3) Update the data in b.tmp with new values (write and close)
4) rename b.tmp to a.txt
5) Abrupt power down or crash

This above scenario can result in a.txt becoming a file of zero length and
giving the impression of a.txt being truncated.
This scenario can ofcourse be prevented by calling fsync or fdatasync
before the rename operation.

There are many applications and libraries that do not call fsync or
fdatasync since they were tested on EXT4 which has a hack to handle
the above case.

Add a new mount option of sync_before_rename which would implicitly
sync the data before renaming the file to help address cases where the
rename cases need to be handled implicitly and prevent the zero length
files as a result of a rename.

Change-Id: I4e8771d40307543b532df7f46bd87864f0d3d294
Signed-off-by: Nikhilesh Reddy <reddyn@codeaurora.org>
---
  fs/ubifs/dir.c   | 29 +++++++++++++++++++++++++++++
  fs/ubifs/super.c | 17 +++++++++++++++++
  fs/ubifs/ubifs.h |  5 +++++
  3 files changed, 51 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5083036..7943291 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -968,6 +968,24 @@ static void unlock_3_inodes(struct inode *inode1, 
struct inode *inode2,
  	mutex_unlock(&ubifs_inode(inode1)->ui_mutex);
  }

+static int force_sync_inode_data(struct ubifs_info *c, struct inode *inode)
+{
+	int err;
+
+	ubifs_assert(mutex_is_locked(&inode->i_mutex));
+
+	err = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
+	if (err) {
+		ubifs_err(c, "filemap_write_and_wait_range failed with %d",
+				err);
+		return err;
+	}
+	err = ubifs_sync_wbufs_by_inode(c, inode);
+	if (err)
+		ubifs_err(c, "ubifs_sync_wbufs_by_inode failed with %d", err);
+	return err;
+}
+
  static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
  			struct inode *new_dir, struct dentry *new_dentry)
  {
@@ -1020,6 +1038,16 @@ static int ubifs_rename(struct inode *old_dir, 
struct dentry *old_dentry,
  		return err;
  	}

+	/* Before renaming, make sure old_inode is synced to disc if the
+	 * mount option is selected. */
+	if (c->sync_before_rename) {
+		err = force_sync_inode_data(c, old_inode);
+		if (err) {
+			ubifs_err(c, "old_inode data sync failed for rename");
+			goto out;
+		}
+	}
+
  	lock_3_inodes(old_dir, new_dir, new_inode);

  	/*
@@ -1129,6 +1157,7 @@ out_cancel:
  		}
  	}
  	unlock_3_inodes(old_dir, new_dir, new_inode);
+out:
  	ubifs_release_budget(c, &ino_req);
  	ubifs_release_budget(c, &req);
  	return err;
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 4fa829f..f185894 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -443,6 +443,11 @@ static int ubifs_show_options(struct seq_file *s, 
struct dentry *root)
  			   ubifs_compr_name(c->mount_opts.compr_type));
  	}

+	if (c->mount_opts.sync_before_rename == 2)
+		seq_puts(s, ",sync_before_rename");
+	else if (c->mount_opts.sync_before_rename == 1)
+		seq_puts(s, ",no_sync_before_rename");
+
  	return 0;
  }

@@ -928,6 +933,8 @@ enum {
  	Opt_chk_data_crc,
  	Opt_no_chk_data_crc,
  	Opt_override_compr,
+	Opt_sync_before_rename,
+	Opt_no_sync_before_rename,
  	Opt_err,
  };

@@ -939,6 +946,8 @@ static const match_table_t tokens = {
  	{Opt_chk_data_crc, "chk_data_crc"},
  	{Opt_no_chk_data_crc, "no_chk_data_crc"},
  	{Opt_override_compr, "compr=%s"},
+	{Opt_sync_before_rename, "sync_before_rename"},
+	{Opt_no_sync_before_rename, "no_sync_before_rename"},
  	{Opt_err, NULL},
  };

@@ -1039,6 +1048,14 @@ static int ubifs_parse_options(struct ubifs_info 
*c, char *options,
  			c->default_compr = c->mount_opts.compr_type;
  			break;
  		}
+		case Opt_sync_before_rename:
+			c->mount_opts.sync_before_rename = 2;
+			c->sync_before_rename = 1;
+			break;
+		case Opt_no_sync_before_rename:
+			c->mount_opts.sync_before_rename = 1;
+			c->sync_before_rename = 0;
+			break;
  		default:
  		{
  			unsigned long flag;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index de75902..c2adf9c 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -942,6 +942,8 @@ struct ubifs_orphan {
   *                  specified in @compr_type)
   * @compr_type: compressor type to override the superblock compressor with
   *              (%UBIFS_COMPR_NONE, etc)
+ * @sync_before_rename: Sync the data associated with the old inode before
+			the rename.(%0 default, %1 disable, %2 enabled)
   */
  struct ubifs_mount_opts {
  	unsigned int unmount_mode:2;
@@ -949,6 +951,7 @@ struct ubifs_mount_opts {
  	unsigned int chk_data_crc:2;
  	unsigned int override_compr:1;
  	unsigned int compr_type:2;
+	unsigned int sync_before_rename:2;
  };

  /**
@@ -1034,6 +1037,7 @@ struct ubifs_debug_info;
   * @bulk_read: enable bulk-reads
   * @default_compr: default compression algorithm (%UBIFS_COMPR_LZO, etc)
   * @rw_incompat: the media is not R/W compatible
+ * @sync_before_rename: Perform an fdatasync on the old inode before 
rename.
   *
   * @tnc_mutex: protects the Tree Node Cache (TNC), @zroot, @cnext, 
@enext, and
   *             @calc_idx_sz
@@ -1275,6 +1279,7 @@ struct ubifs_info {
  	unsigned int bulk_read:1;
  	unsigned int default_compr:2;
  	unsigned int rw_incompat:1;
+	unsigned int sync_before_rename:1;

  	struct mutex tnc_mutex;
  	struct ubifs_zbranch zroot;
-- 
1.8.2.1

-- 
Thanks
Nikhilesh Reddy

Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.

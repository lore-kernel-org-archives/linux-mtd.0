Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZGr-0004XZ-C7
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:50:11 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 25/26] ubifs: Implement UBIFS_FLG_ENCRYPTION
Date: Fri, 21 Oct 2016 14:48:40 +0200
Message-Id: <1477054121-10198-26-git-send-email-richard@nod.at>
In-Reply-To: <1477054121-10198-1-git-send-email-richard@nod.at>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This feature flag indicates that the filesystem contains encrypted
files.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/ioctl.c       |  5 +++++
 fs/ubifs/sb.c          | 40 ++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs-media.h |  2 ++
 fs/ubifs/ubifs.h       |  3 +++
 4 files changed, 50 insertions(+)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 6bb5b35050de..3d10f5525274 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -183,6 +183,7 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	}
 	case FS_IOC_SET_ENCRYPTION_POLICY: {
 #ifdef CONFIG_UBIFS_FS_ENCRYPTION
+		struct ubifs_info *c = inode->i_sb->s_fs_info;
 		struct fscrypt_policy policy;
 
 		if (copy_from_user(&policy,
@@ -190,6 +191,10 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 				   sizeof(policy)))
 			return -EFAULT;
 
+		err = ubifs_enable_encryption(c);
+		if (err)
+			return err;
+
 		err = fscrypt_process_policy(file, &policy);
 
 		return err;
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 4a2b4c361587..54cef70ea16f 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -622,6 +622,16 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	c->big_lpt = !!(sup_flags & UBIFS_FLG_BIGLPT);
 	c->space_fixup = !!(sup_flags & UBIFS_FLG_SPACE_FIXUP);
 	c->double_hash = !!(sup_flags & UBIFS_FLG_DOUBLE_HASH);
+	c->encrypted = !!(sup_flags & UBIFS_FLG_ENCRYPTION);
+
+#ifndef CONFIG_UBIFS_FS_ENCRYPTION
+	if (c->encrypted) {
+		ubifs_err(c, "file system contains encrypted files but UBIFS"
+			     " was built without crypto support.");
+		err = -EINVAL;
+		goto out;
+	}
+#endif
 
 	/* Automatically increase file system size to the maximum size */
 	c->old_leb_cnt = c->leb_cnt;
@@ -809,3 +819,33 @@ int ubifs_fixup_free_space(struct ubifs_info *c)
 	ubifs_msg(c, "free space fixup complete");
 	return err;
 }
+
+int ubifs_enable_encryption(struct ubifs_info *c)
+{
+	int err;
+	struct ubifs_sb_node *sup;
+
+	if (c->encrypted)
+		return 0;
+
+	if (c->ro_mount || c->ro_media)
+		return -EROFS;
+
+	if (c->fmt_version < 5) {
+		ubifs_err(c, "on-flash format version 5 is needed for encryption");
+		return -EINVAL;
+	}
+
+	sup = ubifs_read_sb_node(c);
+	if (IS_ERR(sup))
+		return PTR_ERR(sup);
+
+	sup->flags |= cpu_to_le32(UBIFS_FLG_ENCRYPTION);
+
+	err = ubifs_write_sb_node(c, sup);
+	if (!err)
+		c->encrypted = 1;
+	kfree(sup);
+
+	return err;
+}
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index 0cbdc6b70a00..bdc7935a5e41 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -420,11 +420,13 @@ enum {
  * UBIFS_FLG_SPACE_FIXUP: first-mount "fixup" of free space within LEBs needed
  * UBIFS_FLG_DOUBLE_HASH: store a 32bit cookie in directory entry nodes to
  *			  support 64bit cookies for lookups by hash
+ * UBIFS_FLG_ENCRYPTION: this filesystem contains encrypted files
  */
 enum {
 	UBIFS_FLG_BIGLPT = 0x02,
 	UBIFS_FLG_SPACE_FIXUP = 0x04,
 	UBIFS_FLG_DOUBLE_HASH = 0x08,
+	UBIFS_FLG_ENCRYPTION = 0x10,
 };
 
 /**
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 59d55887b3d8..85e2929aa6db 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1015,6 +1015,7 @@ struct ubifs_debug_info;
  * @big_lpt: flag that LPT is too big to write whole during commit
  * @space_fixup: flag indicating that free space in LEBs needs to be cleaned up
  * @double_hash: flag indicating that we can do lookups by hash
+ * @encrypted: flag indicating that this file system contains encrypted files
  * @no_chk_data_crc: do not check CRCs when reading data nodes (except during
  *                   recovery)
  * @bulk_read: enable bulk-reads
@@ -1258,6 +1259,7 @@ struct ubifs_info {
 	unsigned int big_lpt:1;
 	unsigned int space_fixup:1;
 	unsigned int double_hash:1;
+	unsigned int encrypted:1;
 	unsigned int no_chk_data_crc:1;
 	unsigned int bulk_read:1;
 	unsigned int default_compr:2;
@@ -1651,6 +1653,7 @@ int ubifs_read_superblock(struct ubifs_info *c);
 struct ubifs_sb_node *ubifs_read_sb_node(struct ubifs_info *c);
 int ubifs_write_sb_node(struct ubifs_info *c, struct ubifs_sb_node *sup);
 int ubifs_fixup_free_space(struct ubifs_info *c);
+int ubifs_enable_encryption(struct ubifs_info *c);
 
 /* replay.c */
 int ubifs_validate_entry(struct ubifs_info *c,
-- 
2.7.3

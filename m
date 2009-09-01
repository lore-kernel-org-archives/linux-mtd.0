Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MiS4P-0006Hg-RU
	for linux-mtd@lists.infradead.org; Tue, 01 Sep 2009 12:02:46 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx06.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n81C2Emh011752
	for <linux-mtd@lists.infradead.org>; Tue, 1 Sep 2009 15:02:25 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <Adrian.Hunter@nokia.com>
Subject: [PATCH] UBIFS: add inode size debugging check
Date: Tue,  1 Sep 2009 15:01:33 +0300
Message-Id: <1251806493-2476-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch adds one more check to UBIFS - a check that makes
sure that there are no data nodes beyond inode size.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.h |    3 ++
 fs/ubifs/key.h   |   13 ++++++++++
 fs/ubifs/super.c |    2 +
 fs/ubifs/tnc.c   |   70 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 87 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index c1cd73b..fe2c927 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -321,6 +321,8 @@ void dbg_check_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat,
 int dbg_check_lprops(struct ubifs_info *c);
 int dbg_check_lpt_nodes(struct ubifs_info *c, struct ubifs_cnode *cnode,
 			int row, int col);
+int dbg_check_inode_size(struct ubifs_info *c, const struct inode *inode,
+			 loff_t size);
 
 /* Force the use of in-the-gaps method for testing */
 
@@ -460,6 +462,7 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 #define dbg_check_heap(c, heap, cat, add_pos)      ({})
 #define dbg_check_lprops(c)                        0
 #define dbg_check_lpt_nodes(c, cnode, row, col)    0
+#define dbg_check_inode_size(c, inode, size)       0
 #define dbg_force_in_the_gaps_enabled              0
 #define dbg_force_in_the_gaps()                    0
 #define dbg_failure_mode                           0
diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
index 919af84..0f530c6 100644
--- a/fs/ubifs/key.h
+++ b/fs/ubifs/key.h
@@ -278,6 +278,18 @@ static inline void data_key_init(const struct ubifs_info *c,
 }
 
 /**
+ * highest_data_key - get the highest possible data key for an inode.
+ * @c: UBIFS file-system description object
+ * @key: key to initialize
+ * @inum: inode number
+ */
+static inline void highest_data_key(const struct ubifs_info *c,
+				   union ubifs_key *key, ino_t inum)
+{
+	data_key_init(c, key, inum, UBIFS_S_KEY_BLOCK_MASK);
+}
+
+/**
  * trun_key_init - initialize truncation node key.
  * @c: UBIFS file-system description object
  * @key: key to initialize
@@ -518,4 +530,5 @@ static inline unsigned long long key_max_inode_size(const struct ubifs_info *c)
 		return 0;
 	}
 }
+
 #endif /* !__UBIFS_KEY_H__ */
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b541bd7..7e2b3d4 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -317,6 +317,8 @@ static int ubifs_write_inode(struct inode *inode, int wait)
 		if (err)
 			ubifs_err("can't write inode %lu, error %d",
 				  inode->i_ino, err);
+		else
+			err = dbg_check_inode_size(c, inode, ui->ui_size);
 	}
 
 	ui->dirty = 0;
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index f249f7b..a6b6450 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -1433,7 +1433,7 @@ static int maybe_leb_gced(struct ubifs_info *c, int lnum, int gc_seq1)
  * @lnum: LEB number is returned here
  * @offs: offset is returned here
  *
- * This function look up and reads node with key @key. The caller has to make
+ * This function looks up and reads node with key @key. The caller has to make
  * sure the @node buffer is large enough to fit the node. Returns zero in case
  * of success, %-ENOENT if the node was not found, and a negative error code in
  * case of failure. The node location can be returned in @lnum and @offs.
@@ -3268,3 +3268,71 @@ out_unlock:
 	mutex_unlock(&c->tnc_mutex);
 	return err;
 }
+
+#ifdef CONFIG_UBIFS_FS_DEBUG
+
+/**
+ * dbg_check_inode_size - check if inode size is correct.
+ * @c: UBIFS file-system description object
+ * @inum: inode number
+ * @size: inode size
+ *
+ * This function makes sure that the inode size (@size) is correct and it does
+ * not have any pages beyond @size. Returns zero if the inode is OK, %-EINVAL
+ * if it has a data page beyond @size, and other negative error code in case of
+ * other errors.
+ */
+int dbg_check_inode_size(struct ubifs_info *c, const struct inode *inode,
+			 loff_t size)
+{
+	int err, n;
+	union ubifs_key from_key, to_key, *key;
+	struct ubifs_znode *znode;
+	unsigned int block;
+
+	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+		return 0;
+
+	block = (size + UBIFS_BLOCK_SIZE - 1) >> UBIFS_BLOCK_SHIFT;
+	data_key_init(c, &from_key, inode->i_ino, block);
+	highest_data_key(c, &to_key, inode->i_ino);
+
+	mutex_lock(&c->tnc_mutex);
+	err = ubifs_lookup_level0(c, &from_key, &znode, &n);
+	if (err < 0)
+		goto out_unlock;
+
+	if (err) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
+	while (1) {
+		err = tnc_next(c, &znode, &n);
+		if (err == -ENOENT) {
+			err = 0;
+			goto out_unlock;
+		}
+
+		if (err < 0)
+			goto out_unlock;
+
+		key = &znode->zbranch[n].key;
+		if (key_in_range(c, key, &from_key, &to_key))
+			break;
+	}
+
+	block = key_block(c, key);
+	ubifs_err("inode %lu has size %lld, but there are data at offset %lld "
+		  "(data key %s)", (unsigned long)inode->i_ino, size,
+		  ((loff_t)block) << UBIFS_BLOCK_SHIFT, DBGKEY(key));
+	dbg_dump_inode(c, inode);
+	dbg_dump_stack();
+	err = -EINVAL;
+
+out_unlock:
+	mutex_unlock(&c->tnc_mutex);
+	return err;
+}
+
+#endif /* CONFIG_UBIFS_FS_DEBUG */
-- 
1.6.2.5

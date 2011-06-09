Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6u-0002S4-HH
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:13 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wE4028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/30] UBIFS: improve inode dumping function
Date: Thu,  9 Jun 2011 12:04:44 +0300
Message-Id: <1307610310-28691-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Teach 'dbg_dump_inode()' dump directory entries for directory inodes.
This requires few additional changes:
1. The 'c' argument of 'dbg_dump_inode()' cannot be const any more.
2. Users of 'dbg_dump_inode()' should not have 'tnc_mutex' locked.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   56 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 fs/ubifs/debug.h |    6 ++--
 fs/ubifs/tnc.c   |    3 +-
 3 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index c9609a6..4a2170d 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -91,6 +91,28 @@ static const char *get_key_type(int type)
 	}
 }
 
+static const char *get_dent_type(int type)
+{
+	switch (type) {
+	case UBIFS_ITYPE_REG:
+		return "file";
+	case UBIFS_ITYPE_DIR:
+		return "dir";
+	case UBIFS_ITYPE_LNK:
+		return "symlink";
+	case UBIFS_ITYPE_BLK:
+		return "blkdev";
+	case UBIFS_ITYPE_CHR:
+		return "char dev";
+	case UBIFS_ITYPE_FIFO:
+		return "fifo";
+	case UBIFS_ITYPE_SOCK:
+		return "socket";
+	default:
+		return "unknown/invalid type";
+	}
+}
+
 static void sprintf_key(const struct ubifs_info *c, const union ubifs_key *key,
 			char *buffer)
 {
@@ -234,9 +256,13 @@ static void dump_ch(const struct ubifs_ch *ch)
 	printk(KERN_DEBUG "\tlen            %u\n", le32_to_cpu(ch->len));
 }
 
-void dbg_dump_inode(const struct ubifs_info *c, const struct inode *inode)
+void dbg_dump_inode(struct ubifs_info *c, const struct inode *inode)
 {
 	const struct ubifs_inode *ui = ubifs_inode(inode);
+	struct qstr nm = { .name = NULL };
+	union ubifs_key key;
+	struct ubifs_dent_node *dent, *pdent = NULL;
+	int count = 2;
 
 	printk(KERN_DEBUG "Dump in-memory inode:");
 	printk(KERN_DEBUG "\tinode          %lu\n", inode->i_ino);
@@ -270,6 +296,32 @@ void dbg_dump_inode(const struct ubifs_info *c, const struct inode *inode)
 	printk(KERN_DEBUG "\tlast_page_read %lu\n", ui->last_page_read);
 	printk(KERN_DEBUG "\tread_in_a_row  %lu\n", ui->read_in_a_row);
 	printk(KERN_DEBUG "\tdata_len       %d\n", ui->data_len);
+
+	if (!S_ISDIR(inode->i_mode))
+		return;
+
+	printk(KERN_DEBUG "List of directory entries:\n");
+	ubifs_assert(!mutex_is_locked(&c->tnc_mutex));
+
+	lowest_dent_key(c, &key, inode->i_ino);
+	while (1) {
+		dent = ubifs_tnc_next_ent(c, &key, &nm);
+		if (IS_ERR(dent)) {
+			if (PTR_ERR(dent) != -ENOENT)
+				printk(KERN_DEBUG "error %ld\n", PTR_ERR(dent));
+			break;
+		}
+
+		printk(KERN_DEBUG "\t%d: %s (%s)\n",
+		       count++, dent->name, get_dent_type(dent->type));
+
+		nm.name = dent->name;
+		nm.len = le16_to_cpu(dent->nlen);
+		kfree(pdent);
+		pdent = dent;
+		key_read(c, &dent->key, &key);
+	}
+	kfree(pdent);
 }
 
 void dbg_dump_node(const struct ubifs_info *c, const void *node)
@@ -1167,12 +1219,14 @@ int dbg_check_dir_size(struct ubifs_info *c, const struct inode *dir)
 			  "but calculated size is %llu", dir->i_ino,
 			  (unsigned long long)i_size_read(dir),
 			  (unsigned long long)size);
+		dbg_dump_inode(c, dir);
 		dump_stack();
 		return -EINVAL;
 	}
 	if (dir->i_nlink != nlink) {
 		ubifs_err("directory inode %lu has nlink %u, but calculated "
 			  "nlink is %u", dir->i_ino, dir->i_nlink, nlink);
+		dbg_dump_inode(c, dir);
 		dump_stack();
 		return -EINVAL;
 	}
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index b59c43a..c6ad9ea 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -214,7 +214,7 @@ const char *dbg_cstate(int cmt_state);
 const char *dbg_jhead(int jhead);
 const char *dbg_get_key_dump(const struct ubifs_info *c,
 			     const union ubifs_key *key);
-void dbg_dump_inode(const struct ubifs_info *c, const struct inode *inode);
+void dbg_dump_inode(struct ubifs_info *c, const struct inode *inode);
 void dbg_dump_node(const struct ubifs_info *c, const void *node);
 void dbg_dump_lpt_node(const struct ubifs_info *c, void *node, int lnum,
 		       int offs);
@@ -364,7 +364,7 @@ static inline const char *dbg_jhead(int jhead)                    { return ""; }
 static inline const char *
 dbg_get_key_dump(const struct ubifs_info *c,
 		 const union ubifs_key *key)                      { return ""; }
-static inline void dbg_dump_inode(const struct ubifs_info *c,
+static inline void dbg_dump_inode(struct ubifs_info *c,
 				  const struct inode *inode)      { return; }
 static inline void dbg_dump_node(const struct ubifs_info *c,
 				 const void *node)                { return; }
@@ -418,7 +418,7 @@ static inline int dbg_chk_lpt_sz(struct ubifs_info *c,
 				 int action, int len)             { return 0; }
 static inline int dbg_check_synced_i_size(struct inode *inode)    { return 0; }
 static inline int dbg_check_dir_size(struct ubifs_info *c,
-				     const struct inode *dir)     { return 0; }
+				const struct inode *dir)          { return 0; }
 static inline int dbg_check_tnc(struct ubifs_info *c, int extra)  { return 0; }
 static inline int dbg_check_idx_size(struct ubifs_info *c,
 				     long long idx_size)          { return 0; }
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 91b4213..48b6ee6 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -3337,9 +3337,10 @@ out_dump:
 	ubifs_err("inode %lu has size %lld, but there are data at offset %lld "
 		  "(data key %s)", (unsigned long)inode->i_ino, size,
 		  ((loff_t)block) << UBIFS_BLOCK_SHIFT, DBGKEY(key));
+	mutex_unlock(&c->tnc_mutex);
 	dbg_dump_inode(c, inode);
 	dbg_dump_stack();
-	err = -EINVAL;
+	return -EINVAL;
 
 out_unlock:
 	mutex_unlock(&c->tnc_mutex);
-- 
1.7.2.3

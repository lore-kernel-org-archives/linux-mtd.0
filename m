Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6v-0002SW-LM
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:16 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wED028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:04 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/30] UBIFS: amend debugging inode size check function
	prototype
Date: Thu,  9 Jun 2011 12:04:53 +0300
Message-Id: <1307610310-28691-14-git-send-email-dedekind1@gmail.com>
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

Add 'const struct ubifs_info *c' parameter to 'dbg_check_synced_i_size()'
function because we'll need it in the next patch when we switch to debugfs.
So this patch is just a preparation.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |    3 ++-
 fs/ubifs/debug.h |    6 ++++--
 fs/ubifs/dir.c   |    4 ++--
 fs/ubifs/file.c  |    2 +-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 26d4c61..7adf9fe 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -1132,6 +1132,7 @@ out:
 
 /**
  * dbg_check_synced_i_size - check synchronized inode size.
+ * @c: UBIFS file-system description object
  * @inode: inode to check
  *
  * If inode is clean, synchronized inode size has to be equivalent to current
@@ -1139,7 +1140,7 @@ out:
  * has to be locked). Returns %0 if synchronized inode size if correct, and
  * %-EINVAL if not.
  */
-int dbg_check_synced_i_size(struct inode *inode)
+int dbg_check_synced_i_size(const struct ubifs_info *c, struct inode *inode)
 {
 	int err = 0;
 	struct ubifs_inode *ui = ubifs_inode(inode);
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index a51c20b..90805bd 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -247,7 +247,7 @@ int dbg_check_cats(struct ubifs_info *c);
 int dbg_check_ltab(struct ubifs_info *c);
 int dbg_chk_lpt_free_spc(struct ubifs_info *c);
 int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len);
-int dbg_check_synced_i_size(struct inode *inode);
+int dbg_check_synced_i_size(const struct ubifs_info *c, struct inode *inode);
 int dbg_check_dir(struct ubifs_info *c, const struct inode *dir);
 int dbg_check_tnc(struct ubifs_info *c, int extra);
 int dbg_check_idx_size(struct ubifs_info *c, long long idx_size);
@@ -416,7 +416,9 @@ static inline int dbg_check_ltab(struct ubifs_info *c)            { return 0; }
 static inline int dbg_chk_lpt_free_spc(struct ubifs_info *c)      { return 0; }
 static inline int dbg_chk_lpt_sz(struct ubifs_info *c,
 				 int action, int len)             { return 0; }
-static inline int dbg_check_synced_i_size(struct inode *inode)    { return 0; }
+static inline int
+dbg_check_synced_i_size(const struct ubifs_info *c,
+			struct inode *inode)                      { return 0; }
 static inline int dbg_check_dir(struct ubifs_info *c,
 				const struct inode *dir)          { return 0; }
 static inline int dbg_check_tnc(struct ubifs_info *c, int extra)  { return 0; }
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index d1725a9..98014bf 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -524,7 +524,7 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	ubifs_assert(mutex_is_locked(&dir->i_mutex));
 	ubifs_assert(mutex_is_locked(&inode->i_mutex));
 
-	err = dbg_check_synced_i_size(inode);
+	err = dbg_check_synced_i_size(c, inode);
 	if (err)
 		return err;
 
@@ -579,7 +579,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 		inode->i_nlink, dir->i_ino);
 	ubifs_assert(mutex_is_locked(&dir->i_mutex));
 	ubifs_assert(mutex_is_locked(&inode->i_mutex));
-	err = dbg_check_synced_i_size(inode);
+	err = dbg_check_synced_i_size(c, inode);
 	if (err)
 		return err;
 
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 5e7fccf..7cf738a 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1263,7 +1263,7 @@ int ubifs_setattr(struct dentry *dentry, struct iattr *attr)
 	if (err)
 		return err;
 
-	err = dbg_check_synced_i_size(inode);
+	err = dbg_check_synced_i_size(c, inode);
 	if (err)
 		return err;
 
-- 
1.7.2.3

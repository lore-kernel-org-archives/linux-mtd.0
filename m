Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnfmA-0003qI-B4
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 04:08:40 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A3A81806E1
 for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2015 15:59:01 +1200 (NZST)
From: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] Improve speed of JFFS2 at startup
Date: Thu, 30 Apr 2015 15:57:52 +1200
Message-Id: <1430366272-6956-2-git-send-email-mark.tomlinson@alliedtelesis.co.nz>
In-Reply-To: <1430366272-6956-1-git-send-email-mark.tomlinson@alliedtelesis.co.nz>
References: <1430366272-6956-1-git-send-email-mark.tomlinson@alliedtelesis.co.nz>
Cc: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At startup, reading a directory (for example to do an ls), requires finding
information on every file. To support JFFS2 recovery from partially written
blocks, the JFFS2 driver must scan all data blocks to verify the checksums
are correct just to be able to correctly report the length of a file. This
will take some time, and will be dependent on the amount of data on the
filesystem.

What makes this worse is that any path lookup will lock the dentry cache
to add the new entry. The JFFS2 driver then spends time finding the file
information (reading the entire file), before it returns the new dentry
information allowing the cache to be unlocked. During this time, no other
files in the same directory can be opened or even tested for existence.

However, there is no need for the dentry cache to be locked for the scan of
the file. The JFFS2 driver already locks the file, so the file will not be
deleted or modified. It also ensures that if another process tries to scan
the same file, the second process will be blocked and the scan only proceed
once.

To make the scan occur without locking the cache, a new vfs call has been
added which allows a filesystem to scan the file, but not return anything.
When the lookup occurs after this, the JFFS2 driver will find this
information and can quickly return the filled-in dentry.
---
 fs/jffs2/dir.c     | 41 ++++++++++++++++++++++++++++++++++-------
 fs/namei.c         | 44 ++++++++++++++++++++++++++++++++++++++------
 include/linux/fs.h |  1 +
 3 files changed, 73 insertions(+), 13 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 1ba5c97..69c0ec4 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -36,6 +36,7 @@ static int jffs2_rmdir (struct inode *,struct dentry *);
 static int jffs2_mknod (struct inode *,struct dentry *,umode_t,dev_t);
 static int jffs2_rename (struct inode *, struct dentry *,
 			 struct inode *, struct dentry *);
+static void jffs2_prescan(struct inode *dir_i, struct qstr *d_name);
 
 const struct file_operations jffs2_dir_operations =
 {
@@ -51,6 +52,7 @@ const struct inode_operations jffs2_dir_inode_operations =
 {
 	.create =	jffs2_create,
 	.lookup =	jffs2_lookup,
+	.prescan =	jffs2_prescan,
 	.link =		jffs2_link,
 	.unlink =	jffs2_unlink,
 	.symlink =	jffs2_symlink,
@@ -74,8 +76,12 @@ const struct inode_operations jffs2_dir_inode_operations =
    and we use the same hash function as the dentries. Makes this
    nice and simple
 */
-static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
-				   unsigned int flags)
+/* The prescan function does not have a dentry to fill in, so create this common function
+ * which is just passed the name and the inode for the directory.
+ * This function is very similar to the original jffs2_lookup, except for the arguments
+ * and the fact that the dentry (now not passed) is not updated.
+ */
+static struct inode *jffs2_lookup_common(struct inode *dir_i, struct qstr *d_name)
 {
 	struct jffs2_inode_info *dir_f;
 	struct jffs2_full_dirent *fd = NULL, *fd_list;
@@ -84,7 +90,7 @@ static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
 
 	jffs2_dbg(1, "jffs2_lookup()\n");
 
-	if (target->d_name.len > JFFS2_MAX_NAME_LEN)
+	if (d_name->len > JFFS2_MAX_NAME_LEN)
 		return ERR_PTR(-ENAMETOOLONG);
 
 	dir_f = JFFS2_INODE_INFO(dir_i);
@@ -92,11 +98,11 @@ static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
 	mutex_lock(&dir_f->sem);
 
 	/* NB: The 2.2 backport will need to explicitly check for '.' and '..' here */
-	for (fd_list = dir_f->dents; fd_list && fd_list->nhash <= target->d_name.hash; fd_list = fd_list->next) {
-		if (fd_list->nhash == target->d_name.hash &&
+	for (fd_list = dir_f->dents; fd_list && fd_list->nhash <= d_name->hash; fd_list = fd_list->next) {
+		if (fd_list->nhash == d_name->hash &&
 		    (!fd || fd_list->version > fd->version) &&
-		    strlen(fd_list->name) == target->d_name.len &&
-		    !strncmp(fd_list->name, target->d_name.name, target->d_name.len)) {
+		    strlen(fd_list->name) == d_name->len &&
+		    !strncmp(fd_list->name, d_name->name, d_name->len)) {
 			fd = fd_list;
 		}
 	}
@@ -108,6 +114,27 @@ static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
 		if (IS_ERR(inode))
 			pr_warn("iget() failed for ino #%u\n", ino);
 	}
+	return inode;
+}
+
+/* Fill in an inode, and store the information in cache. This allows a
+ * subsequent jffs2_lookup() call to proceed quickly, which is useful
+ * since the jffs2_lookup() call will have the directory entry cache
+ * locked.
+ */
+static void jffs2_prescan(struct inode *dir_i, struct qstr *d_name)
+{
+	(void)jffs2_lookup_common(dir_i, d_name);
+}
+
+/* jffs2_lookup function has the same functionality as before,
+ * just refactored */
+static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
+				   unsigned int flags)
+{
+	struct inode *inode;
+
+	inode = jffs2_lookup_common(dir_i, &target->d_name);
 
 	return d_splice_alias(inode, target);
 }
diff --git a/fs/namei.c b/fs/namei.c
index 4a8d998b..9c6c293e 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1322,13 +1322,12 @@ static void follow_dotdot(struct nameidata *nd)
  *
  * dir->d_inode->i_mutex must be held
  */
-static struct dentry *lookup_dcache(struct qstr *name, struct dentry *dir,
-				    unsigned int flags, bool *need_lookup)
+static struct dentry *lookup_dcache_no_alloc(struct qstr *name, struct dentry *dir,
+                                             unsigned int flags)
 {
 	struct dentry *dentry;
 	int error;
 
-	*need_lookup = false;
 	dentry = d_lookup(dir, name);
 	if (dentry) {
 		if (dentry->d_flags & DCACHE_OP_REVALIDATE) {
@@ -1345,6 +1344,16 @@ static struct dentry *lookup_dcache(struct qstr *name, struct dentry *dir,
 			}
 		}
 	}
+	return dentry;
+}
+
+static struct dentry *lookup_dcache(struct qstr *name, struct dentry *dir,
+				    unsigned int flags, bool *need_lookup)
+{
+	struct dentry *dentry;
+
+	*need_lookup = false;
+	dentry = lookup_dcache_no_alloc(name, dir, flags);
 
 	if (!dentry) {
 		dentry = d_alloc(dir, name);
@@ -1497,9 +1506,32 @@ static int lookup_slow(struct nameidata *nd, struct path *path)
 	parent = nd->path.dentry;
 	BUG_ON(nd->inode != parent->d_inode);
 
-	mutex_lock(&parent->d_inode->i_mutex);
-	dentry = __lookup_hash(&nd->last, parent, nd->flags);
-	mutex_unlock(&parent->d_inode->i_mutex);
+	dentry = NULL;
+	if (parent->d_inode->i_op->prescan) {
+		/* First, just try to find the dentry in the cache.
+		 * If it is not present, don't do anything.
+		 */
+		mutex_lock(&parent->d_inode->i_mutex);
+		dentry = lookup_dcache_no_alloc(&nd->last, parent, nd->flags);
+		mutex_unlock(&parent->d_inode->i_mutex);
+
+		/* Not in cache. Warn filesystem layer that a lookup is coming.
+		 * This can be done without the directory's mutex held, since
+		 * no dentry is being filled in here.
+		 */
+		if (dentry == NULL) {
+			parent->d_inode->i_op->prescan(parent->d_inode, &nd->last);
+		}
+	}
+	if (dentry == NULL) {
+		/* Actually perform the lookup via the filesystem. The prescan
+		 * done above will hopefully ensure this is now a quick operation,
+		 * so the directory's mutex is not held for a long time.
+		 */
+		mutex_lock(&parent->d_inode->i_mutex);
+		dentry = __lookup_hash(&nd->last, parent, nd->flags);
+		mutex_unlock(&parent->d_inode->i_mutex);
+	}
 	if (IS_ERR(dentry))
 		return PTR_ERR(dentry);
 	path->mnt = nd->path.mnt;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 35ec87e..8d68867 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1639,6 +1639,7 @@ struct inode_operations {
 			   umode_t create_mode, int *opened);
 	int (*tmpfile) (struct inode *, struct dentry *, umode_t);
 	int (*set_acl)(struct inode *, struct posix_acl *, int);
+	void (*prescan) (struct inode *dir, struct qstr *name);
 
 	/* WARNING: probably going away soon, do not use! */
 	int (*dentry_open)(struct dentry *, struct file *, const struct cred *);
-- 
1.9.1

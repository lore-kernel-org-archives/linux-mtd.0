Subject: [RFC] Reinstate NFS exportability for JFFS2.
From: David Woodhouse <dwmw2@infradead.org>
To: linux-fsdevel@vger.kernel.org
Content-Type: text/plain
Date: Thu, 01 May 2008 20:42:59 +0100
Message-Id: <1209670979.25560.587.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: hch@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On top of commit 27c72b040c0be8f3704ed0b6b84c12cbba24a7e8 (in the
mtd-2.6 tree if Linus hasn't pulled it yet), this provides
export_operations for JFFS2. 

It doesn't yet solve the readdirplus deadlock described in
http://lists.infradead.org/pipermail/linux-mtd/2007-March/017663.html 

You also still need to set fsid manually when exporting it -- I'm
thinking of adding a 'get_fsid' to the export_operations to allow the
filesystem to provide its own...

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 7da69ea..25f6472 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -22,6 +22,7 @@
 #include <linux/mtd/super.h>
 #include <linux/ctype.h>
 #include <linux/namei.h>
+#include <linux/exportfs.h>
 #include "compr.h"
 #include "nodelist.h"
 
@@ -62,6 +63,64 @@ static int jffs2_sync_fs(struct super_block *sb, int wait)
 	return 0;
 }
 
+static struct inode *jffs2_nfs_get_inode(struct super_block *sb, uint64_t ino,
+					 uint32_t generation)
+{
+	return jffs2_iget(sb, ino);
+}
+
+static struct dentry *jffs2_fh_to_dentry(struct super_block *sb, struct fid *fid,
+					 int fh_len, int fh_type)
+{
+        return generic_fh_to_dentry(sb, fid, fh_len, fh_type,
+                                    jffs2_nfs_get_inode);
+}
+
+static struct dentry *jffs2_fh_to_parent(struct super_block *sb, struct fid *fid,
+					 int fh_len, int fh_type)
+{
+        return generic_fh_to_parent(sb, fid, fh_len, fh_type,
+                                    jffs2_nfs_get_inode);
+}
+
+static struct dentry *jffs2_get_parent(struct dentry *child)
+{
+	struct jffs2_inode_info *f;
+	struct dentry *parent;
+	struct inode *inode;
+	uint32_t pino;
+
+	if (!S_ISDIR(child->d_inode->i_mode))
+		return ERR_PTR(-EACCES);
+
+	f = JFFS2_INODE_INFO(child->d_inode);
+
+	pino = f->inocache->pino_nlink;
+
+	JFFS2_DEBUG("Parent of directory ino #%u is #%u\n",
+		    f->inocache->ino, pino);
+
+	inode = jffs2_iget(child->d_inode->i_sb, pino);
+	if (IS_ERR(inode)) {
+		JFFS2_ERROR("Failed to get inode #%u: %ld\n", pino,
+			    PTR_ERR(inode));
+		return ERR_CAST(inode);
+	}
+
+	parent = d_alloc_anon(inode);
+	if (!parent) {
+		iput(inode);
+		parent = ERR_PTR(-ENOMEM);
+	}
+	return parent;
+}
+
+static struct export_operations jffs2_export_ops = {
+	.get_parent = jffs2_get_parent,
+	.fh_to_dentry = jffs2_fh_to_dentry,
+	.fh_to_parent = jffs2_fh_to_parent,
+};
+
 static const struct super_operations jffs2_super_operations =
 {
 	.alloc_inode =	jffs2_alloc_inode,
@@ -104,6 +163,7 @@ static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
 	spin_lock_init(&c->inocache_lock);
 
 	sb->s_op = &jffs2_super_operations;
+ 	sb->s_export_op = &jffs2_export_ops;
 	sb->s_flags = sb->s_flags | MS_NOATIME;
 	sb->s_xattr = jffs2_xattr_handlers;
 #ifdef CONFIG_JFFS2_FS_POSIX_ACL

-- 
dwmw2

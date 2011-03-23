Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2DNm-00038S-Jk
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2011 02:01:11 +0000
Received: by iyf40 with SMTP id 40so9140956iyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Mar 2011 19:01:08 -0700 (PDT)
From: Valerie Aurora <valerie.aurora@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux@vger.kernel.org
Subject: [PATCH 17/74] fallthru: jffs2 fallthru support
Date: Tue, 22 Mar 2011 18:58:53 -0700
Message-Id: <1300845590-14184-18-git-send-email-valerie.aurora@gmail.com>
In-Reply-To: <1300845590-14184-1-git-send-email-valerie.aurora@gmail.com>
References: <1300845590-14184-1-git-send-email-valerie.aurora@gmail.com>
Cc: Felix Fietkau <nbd@openwrt.org>, Valerie Aurora <valerie.aurora@gmail.com>,
	Valerie Aurora <vaurora@redhat.com>,
	linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Felix Fietkau <nbd@openwrt.org>

Add support for fallthru dentries to jffs2.

XXX - untested changes from David Woodhouse and Valerie Aurora.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Felix Fietkau <nbd@openwrt.org>
Signed-off-by: Valerie Aurora <vaurora@redhat.com>
Signed-off-by: Valerie Aurora <valerie.aurora@gmail.com>
---
 fs/jffs2/dir.c        |   44 ++++++++++++++++++++++++++++++++++++++++----
 include/linux/jffs2.h |    6 ++++++
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index a5dbf12..dc0e01e 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -36,6 +36,7 @@ static int jffs2_rename (struct inode *, struct dentry *,
 			 struct inode *, struct dentry *);
 
 static int jffs2_whiteout (struct inode *, struct dentry *, struct dentry *);
+static int jffs2_fallthru (struct inode *, struct dentry *);
 
 const struct file_operations jffs2_dir_operations =
 {
@@ -60,6 +61,7 @@ const struct inode_operations jffs2_dir_inode_operations =
 	.rename =	jffs2_rename,
 	.check_acl =	jffs2_check_acl,
 	.whiteout =     jffs2_whiteout,
+	.fallthru =     jffs2_fallthru,
 	.setattr =	jffs2_setattr,
 	.setxattr =	jffs2_setxattr,
 	.getxattr =	jffs2_getxattr,
@@ -104,10 +106,14 @@ static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
 	}
 	if (fd) {
 		spin_lock(&target->d_lock);
-		if (fd->type == DT_WHT)
+		switch (fd->type) {
+		case DT_WHT:
 			target->d_flags |= DCACHE_WHITEOUT;
-		else
+		case JFFS2_DT_FALLTHRU:
+			target->d_flags |= DCACHE_FALLTHRU;
+		default:
 			ino = fd->ino;
+		}
 		spin_unlock(&target->d_lock);
 	}
 	mutex_unlock(&dir_f->sem);
@@ -132,6 +138,8 @@ static int jffs2_readdir(struct file *filp, void *dirent, filldir_t filldir)
 	struct inode *inode = filp->f_path.dentry->d_inode;
 	struct jffs2_full_dirent *fd;
 	unsigned long offset, curofs;
+	ino_t ino;
+	char d_type;
 
 	D1(printk(KERN_DEBUG "jffs2_readdir() for dir_i #%lu\n", filp->f_path.dentry->d_inode->i_ino));
 
@@ -165,13 +173,20 @@ static int jffs2_readdir(struct file *filp, void *dirent, filldir_t filldir)
 				  fd->name, fd->ino, fd->type, curofs, offset));
 			continue;
 		}
-		if (!fd->ino) {
+		if (fd->type == JFFS2_DT_FALLTHRU) {
+			/* XXX placeholder until generic_readdir_fallthru() arrives */
+			ino = 1;
+			d_type = DT_UNKNOWN;
+		} else if (!fd->ino && (fd->type != DT_WHT)) {
 			D2(printk(KERN_DEBUG "Skipping deletion dirent \"%s\"\n", fd->name));
 			offset++;
 			continue;
+		} else {
+			ino = fd->ino;
+			d_type = fd->type;
 		}
 		D2(printk(KERN_DEBUG "Dirent %ld: \"%s\", ino #%u, type %d\n", offset, fd->name, fd->ino, fd->type));
-		if (filldir(dirent, fd->name, strlen(fd->name), offset, fd->ino, fd->type) < 0)
+		if (filldir(dirent, fd->name, strlen(fd->name), offset, ino, d_type) < 0)
 			break;
 		offset++;
 	}
@@ -791,6 +806,26 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, int mode, de
 	return ret;
 }
 
+static int jffs2_fallthru (struct inode *dir, struct dentry *dentry)
+{
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(dir->i_sb);
+	uint32_t now;
+	int ret;
+
+	now = get_seconds();
+	ret = jffs2_do_link(c, JFFS2_INODE_INFO(dir), 0, DT_UNKNOWN,
+			    dentry->d_name.name, dentry->d_name.len, now);
+	if (ret)
+		return ret;
+
+	d_instantiate(dentry, NULL);
+	spin_lock(&dentry->d_lock);
+	dentry->d_flags |= DCACHE_FALLTHRU;
+	spin_unlock(&dentry->d_lock);
+
+	return 0;
+}
+
 static int jffs2_whiteout (struct inode *dir, struct dentry *old_dentry,
 			   struct dentry *new_dentry)
 {
@@ -823,6 +858,7 @@ static int jffs2_whiteout (struct inode *dir, struct dentry *old_dentry,
 		return ret;
 
 	spin_lock(&new_dentry->d_lock);
+	new_dentry->d_flags &= ~DCACHE_FALLTHRU;
 	new_dentry->d_flags |= DCACHE_WHITEOUT;
 	spin_unlock(&new_dentry->d_lock);
 	d_add(new_dentry, NULL);
diff --git a/include/linux/jffs2.h b/include/linux/jffs2.h
index 6404e01..1749127 100644
--- a/include/linux/jffs2.h
+++ b/include/linux/jffs2.h
@@ -115,6 +115,12 @@ struct jffs2_unknown_node
 	jint32_t hdr_crc;
 };
 
+/*
+ * Non-standard directory entry type(s), for on-disk use
+ */
+
+#define                JFFS2_DT_FALLTHRU       (DT_WHT + 1)
+
 struct jffs2_raw_dirent
 {
 	jint16_t magic;
-- 
1.7.0.4

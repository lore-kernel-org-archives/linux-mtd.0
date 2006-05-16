From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1147822221.30771.6.camel@shinybook.infradead.org>
References: <1147178706.16853.6.camel@sauron.oktetlabs.ru>
	<1147249742.16853.16.camel@sauron.oktetlabs.ru>
	<20060510133510.GD31935@wohnheim.fh-wedel.de>
	<1147269251.16853.50.camel@sauron.oktetlabs.ru>
	<20060510135814.GG31935@wohnheim.fh-wedel.de>
	<1147635584.2551.20.camel@shinybook.infradead.org>
	<1147702746.20604.10.camel@sauron.oktetlabs.ru>
	<1147822221.30771.6.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Wed, 17 May 2006 00:31:32 +0100
Message-Id: <1147822293.30771.8.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] reserved pool
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-05-17 at 00:30 +0100, David Woodhouse wrote:
> I cleaned it up so it looks like this.... 

-ENOPATCH....

--- a/fs/jffs2/jffs2_fs_sb.h
+++ b/fs/jffs2/jffs2_fs_sb.h
@@ -61,6 +61,9 @@ struct jffs2_sb_info {
 	uint8_t resv_blocks_gcbad;	/* ... pick a block from the bad_list to GC */
 	uint8_t resv_blocks_gcmerge;	/* ... merge pages when garbage collecting */
 
+
+	uint32_t resv_blocks_root;	/* How many extra eraseblocks are reserved for root */
+
 	uint32_t nospc_dirty_size;
 
 	uint32_t nr_blocks;
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -191,7 +191,7 @@ int jffs2_setattr(struct dentry *dentry,
 int jffs2_statfs(struct super_block *sb, struct kstatfs *buf)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
-	unsigned long avail;
+	unsigned long avail, size;
 
 	buf->f_type = JFFS2_SUPER_MAGIC;
 	buf->f_bsize = 1 << PAGE_SHIFT;
@@ -202,8 +202,9 @@ int jffs2_statfs(struct super_block *sb,
 
 	spin_lock(&c->erase_completion_lock);
 	avail = c->dirty_size + c->free_size;
-	if (avail > c->sector_size * c->resv_blocks_write)
-		avail -= c->sector_size * c->resv_blocks_write;
+	size = c->sector_size * (c->resv_blocks_write + c->resv_blocks_root);
+	if (avail > size)
+		avail -= size;
 	else
 		avail = 0;
 	spin_unlock(&c->erase_completion_lock);
@@ -348,10 +349,16 @@ void jffs2_dirty_inode(struct inode *ino
 int jffs2_remount_fs (struct super_block *sb, int *flags, char *data)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+	int ret;
 
 	if (c->flags & JFFS2_SB_FLAG_RO && !(sb->s_flags & MS_RDONLY))
 		return -EROFS;
 
+	/* Re-parse mount options */
+	ret = jffs2_parse_options(sb, data);
+	if (ret)
+		return ret;
+
 	/* We stop if it was running, then restart if it needs to.
 	   This also catches the case where it was stopped and this
 	   is just a remount to restart it.
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -400,6 +400,9 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
 /* erase.c */
 void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count);
 
+/* super.c */
+int jffs2_parse_options(struct super_block *sb, char *opts);
+
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 /* wbuf.c */
 int jffs2_flush_wbuf_gc(struct jffs2_sb_info *c, uint32_t ino);
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <linux/compiler.h>
+#include <linux/capability.h>
 #include <linux/sched.h> /* For cond_resched() */
 #include "nodelist.h"
 #include "debug.h"
@@ -47,6 +48,10 @@ int jffs2_reserve_space(struct jffs2_sb_
 {
 	int ret = -EAGAIN;
 	int blocksneeded = c->resv_blocks_write;
+
+	if (prio != ALLOC_DELETION && !capable(CAP_SYS_RESOURCE))
+		blocksneeded += c->resv_blocks_root;
+
 	/* align it */
 	minsize = PAD(minsize);
 
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -24,10 +24,13 @@
 #include <linux/mtd/mtd.h>
 #include <linux/ctype.h>
 #include <linux/namei.h>
+#include <linux/parser.h>
+#include <linux/seq_file.h>
 #include "compr.h"
 #include "nodelist.h"
 
 static void jffs2_put_super(struct super_block *);
+static int jffs2_show_options(struct seq_file *m, struct vfsmount *mnt);
 
 static kmem_cache_t *jffs2_inode_cachep;
 
@@ -78,6 +81,7 @@ static struct super_operations jffs2_sup
 	.clear_inode =	jffs2_clear_inode,
 	.dirty_inode =	jffs2_dirty_inode,
 	.sync_fs =	jffs2_sync_fs,
+	.show_options = jffs2_show_options,
 };
 
 static int jffs2_sb_compare(struct super_block *sb, void *data)
@@ -152,14 +156,14 @@ static struct super_block *jffs2_get_sb_
 	sb->s_op = &jffs2_super_operations;
 	sb->s_flags = flags | MS_NOATIME;
 
-	ret = jffs2_do_fill_super(sb, data, flags & MS_SILENT ? 1 : 0);
-
-	if (ret) {
-		/* Failure case... */
-		up_write(&sb->s_umount);
-		deactivate_super(sb);
-		return ERR_PTR(ret);
-	}
+	/* Parse mount options */
+	ret = jffs2_parse_options(sb, data);
+	if (ret)
+		goto error;
+
+	ret = jffs2_do_fill_super(sb, data, flags & MS_SILENT ? 1 : 0);
+	if (ret)
+		goto error;
 
 	sb->s_flags |= MS_ACTIVE;
 	return sb;
@@ -169,6 +173,12 @@ static struct super_block *jffs2_get_sb_
 	put_mtd_device(mtd);
 
 	return sb;
+
+ error:
+	/* Failure case... */
+	up_write(&sb->s_umount);
+	deactivate_super(sb);
+	return ERR_PTR(ret);
 }
 
 static struct super_block *jffs2_get_sb_mtdnr(struct file_system_type *fs_type,
@@ -273,6 +283,72 @@ out:
 	return ERR_PTR(err);
 }
 
+/*
+ * Mount option identifiers.
+ */
+enum {
+	JFFS2_OPT_RP_SIZE,
+	JFFS2_OPT_LAST_FAKE
+};
+
+/*
+ * Supported mount options.
+ */
+static struct match_token tokens[] = {
+	{JFFS2_OPT_RP_SIZE, "rpsize=%u"}, /* Size of the reserved pool in KiB */
+	{JFFS2_OPT_LAST_FAKE, NULL}       /* End of list marker */
+};
+
+#define JFFS2_MAX_ARGS	1
+
+int jffs2_parse_options(struct super_block *sb, char *opts)
+{
+	unsigned int opt;
+	char *p;
+	substring_t args[JFFS2_MAX_ARGS];
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+
+	if (!opts)
+		return 0;
+
+	while ((p = strsep(&opts, ","))) {
+		int token;
+
+		if (!*p)
+			continue;
+
+		token = match_token(p, tokens, args);
+
+		switch (token) {
+		case JFFS2_OPT_RP_SIZE:
+			if (match_int(&args[0], &opt))
+				return -EINVAL;
+			opt = (opt + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT;
+			if (opt > c->mtd->size/c->mtd->erasesize) {
+				printk(KERN_ERR "Reserved pool too large; max is %lu %uKiB blocks\n",
+				       c->mtd->size/PAGE_CACHE_SIZE, 1 << (PAGE_CACHE_SHIFT - 10));
+				return -EINVAL;
+			}
+			c->resv_blocks_root = opt;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int jffs2_show_options(struct seq_file *m, struct vfsmount *mnt)
+{
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(mnt->mnt_sb);
+
+	if (c->resv_blocks_root)
+		seq_printf(m, ",rpsize=%u", c->resv_blocks_root/c->sector_size);
+
+	return 0;
+}
+
 static void jffs2_put_super (struct super_block *sb)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);

-- 
dwmw2

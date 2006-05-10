Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fdk4d-0002Et-Jt
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 04:29:41 -0400
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 69069472FB
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 May 2006 12:29:02 +0400 (MSD)
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1147178706.16853.6.camel@sauron.oktetlabs.ru>
References: <1147178706.16853.6.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Wed, 10 May 2006 12:29:02 +0400
Message-Id: <1147249742.16853.16.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH/RFC] reserved pool
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-09 at 16:45 +0400, Artem B. Bityutskiy wrote:
> Hello,
> 
> long time I was asked to solve a problem when users eat all the file
> system free space and the system cannot boot because different programs
> can't write any longer (-ENOSPC). I made a straight-forward patch and it
> solved the problem.

The patch is updated
(http://git.infradead.org/?p=users/dedekind/dedekind-mtd-2.6.git;a=commit;h=73229f32650fcefbcc0b0bf8b4c48fae1a70c10d).

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index ea1f37d..f5d4319 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -348,10 +348,16 @@ void jffs2_dirty_inode(struct inode *ino
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
diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
index 4bcfb55..9f6bc18 100644
--- a/fs/jffs2/jffs2_fs_sb.h
+++ b/fs/jffs2/jffs2_fs_sb.h
@@ -97,6 +97,11 @@ struct jffs2_sb_info {
 
 	uint32_t wbuf_pagesize; /* 0 for NOR and other flashes with no wbuf */
 
+	/* Size of the reserved pool. I.e., how many bytes of flash space are
+	 * reserved for root. Mortals cannot use it (-ENOSPC is returned). Set
+	 * up via mount options. */
+	unsigned int rp_size;
+
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	/* Write-behind buffer for NAND flash */
 	unsigned char *wbuf;
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index f6645af..ffe4176 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -18,6 +18,7 @@ #include <linux/config.h>
 #include <linux/fs.h>
 #include <linux/types.h>
 #include <linux/jffs2.h>
+#include <linux/capability.h>
 #include "jffs2_fs_sb.h"
 #include "jffs2_fs_i.h"
 #include "summary.h"
@@ -255,6 +256,23 @@ #endif
 	return ret;
 }
 
+/*
+ * Check whether there is enough space for a user to write.
+ */
+static inline int jffs2_user_can_write(struct jffs2_sb_info *c)
+{
+	unsigned int avail;
+	
+	if (capable(CAP_SYS_ADMIN))
+		return 1;
+
+	avail = c->dirty_size + c->free_size + c->unchecked_size +
+		c->erasing_size - c->resv_blocks_write * c->sector_size
+		- c->nospc_dirty_size;
+
+	return avail > c->rp_size;
+}
+
 #define ALLOC_NORMAL	0	/* Normal allocation */
 #define ALLOC_DELETION	1	/* Deletion node. Best to allow it */
 #define ALLOC_GC	2	/* Space requested for GC. Give it or die */
@@ -399,6 +417,9 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
 
 /* erase.c */
 void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count);
+
+/* super.c */
+int jffs2_parse_options(struct super_block *sb, char *opts);
 
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 /* wbuf.c */
diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 49127a1..547af15 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -57,6 +57,12 @@ int jffs2_reserve_space(struct jffs2_sb_
 
 	spin_lock(&c->erase_completion_lock);
 
+        if (prio != ALLOC_DELETION && !jffs2_user_can_write(c)) {
+		spin_unlock(&c->erase_completion_lock);
+		up(&c->alloc_sem);
+		return -ENOSPC;
+	}
+
 	/* this needs a little more thought (true <tglx> :)) */
 	while(ret == -EAGAIN) {
 		while(c->nr_free_blocks + c->nr_erasing_blocks < blocksneeded) {
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index ffd8e84..d9db0bb 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -24,10 +24,13 @@ #include <linux/pagemap.h>
 #include <linux/mtd/mtd.h>
 #include <linux/ctype.h>
 #include <linux/namei.h>
+#include <linux/parser.h>
+#include <linux/seq_file.h>
 #include "compr.h"
 #include "nodelist.h"
 
 static void jffs2_put_super(struct super_block *);
+static int jffs2_show_options(struct seq_file *m, struct vfsmount
*mnt);
 
 static kmem_cache_t *jffs2_inode_cachep;
 
@@ -78,6 +81,7 @@ static struct super_operations jffs2_sup
 	.clear_inode =	jffs2_clear_inode,
 	.dirty_inode =	jffs2_dirty_inode,
 	.sync_fs =	jffs2_sync_fs,
+	.show_options = jffs2_show_options,
 };
 
 static int jffs2_sb_compare(struct super_block *sb, void *data)
@@ -152,15 +156,15 @@ static struct super_block *jffs2_get_sb_
 	sb->s_op = &jffs2_super_operations;
 	sb->s_flags = flags | MS_NOATIME;
 
-	ret = jffs2_do_fill_super(sb, data, flags & MS_SILENT ? 1 : 0);
+ 	/* Parse mount options */
+ 	ret = jffs2_parse_options(sb, data);
+ 	if (ret)
+ 		goto error;
+ 	
+ 	ret = jffs2_do_fill_super(sb, data, flags & MS_SILENT ? 1 : 0);
+ 	if (ret) 
+ 		goto error;
 
-	if (ret) {
-		/* Failure case... */
-		up_write(&sb->s_umount);
-		deactivate_super(sb);
-		return ERR_PTR(ret);
-	}
-
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
 
 static struct super_block *jffs2_get_sb_mtdnr(struct file_system_type
*fs_type,
@@ -271,6 +281,70 @@ static struct super_block *jffs2_get_sb(
 out:
 	path_release(&nd);
 	return ERR_PTR(err);
+}
+
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
+	{JFFS2_OPT_RP_SIZE, "rpsize=%u"}, /* Size of the reserved pool in KiB
*/
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
+	while ((p = strsep(&opts, ",")) != NULL) {
+		int token;
+
+		if (!*p)
+			continue;
+		
+		token = match_token(p, tokens, args);
+
+		switch (token) {
+			case JFFS2_OPT_RP_SIZE:
+				if (match_int(&args[0], &opt))
+					return -EINVAL;
+				c->rp_size = opt * 1024;
+				if (c->rp_size > c->mtd->size) {
+					JFFS2_WARNING("too large reserved pool size, max is %u KB\n",
+						      c->mtd->size/1024);
+					return -EINVAL;
+				}
+				break;
+			default:
+				return -EINVAL;
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
+	if (c->rp_size)
+		seq_printf(m, ",rpsize=%d", c->rp_size/1024);
+	return 0;
 }
 
 static void jffs2_put_super (struct super_block *sb)

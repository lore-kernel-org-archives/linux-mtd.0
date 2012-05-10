Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSV4G-0000DI-R8
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 15:14:13 +0000
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] allow JFFS2 to complete xattr integrity check on
 first GC scan.
Date: Thu, 10 May 2012 17:14:03 +0200
Message-Id: <1336662843-2653-1-git-send-email-jcd@tribudubois.net>
Cc: Jean-Christophe DUBOIS <jcd@tribudubois.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Unlike file data integrity the xattr data integrity was not checked
before some explicit access to the attribute was made.

This could leave in the system a number of corrupted extended attributes
which will be detected only at access time and possibly at a very late
time compared to the time the corruption actually happened.

This patch adds the ability to check for extended attribute integrity
on first GC scan pass (similar to file data integrity check). This allows
for all present attributes to be completly verified before any use of them.

In order to work correctly this patch also needs the patch allowing
JFFS2 to discriminate between recoverable and non recoverable errors
on extended attributes.

Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
---
 fs/jffs2/readinode.c |    1 +
 fs/jffs2/xattr.c     |    7 +++++++
 fs/jffs2/xattr.h     |    2 ++
 3 files changed, 10 insertions(+)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index dc0437e..69eeadb 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1415,6 +1415,7 @@ int jffs2_do_crccheck_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *i
 		mutex_unlock(&f->sem);
 		jffs2_do_clear_inode(c, f);
 	}
+	jffs2_xattr_do_crccheck_inode(c, ic);
 	kfree (f);
 	return ret;
 }
diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index c18c0ab..3034e97 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -437,6 +437,8 @@ static void unrefer_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datu
  *   is called to release xattr related objects when unmounting. 
  * check_xattr_ref_inode(c, ic)
  *   is used to confirm inode does not have duplicate xattr name/value pair.
+ * jffs2_xattr_do_crccheck_inode(c, ic)
+ *   is used to force xattr data integrity check during the initial gc scan.
  * -------------------------------------------------- */
 static int verify_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
 {
@@ -684,6 +686,11 @@ static int check_xattr_ref_inode(struct jffs2_sb_info *c, struct jffs2_inode_cac
 	return rc;
 }
 
+void jffs2_xattr_do_crccheck_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	check_xattr_ref_inode(c, ic);
+}
+
 /* -------- xattr subsystem functions ---------------
  * jffs2_init_xattr_subsystem(c)
  *   is used to initialize semaphore and list_head, and some variables.
diff --git a/fs/jffs2/xattr.h b/fs/jffs2/xattr.h
index 7be4beb..467ff37 100644
--- a/fs/jffs2/xattr.h
+++ b/fs/jffs2/xattr.h
@@ -77,6 +77,7 @@ extern void jffs2_clear_xattr_subsystem(struct jffs2_sb_info *c);
 extern struct jffs2_xattr_datum *jffs2_setup_xattr_datum(struct jffs2_sb_info *c,
 							 uint32_t xid, uint32_t version);
 
+extern void jffs2_xattr_do_crccheck_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
 extern void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
 extern void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
 
@@ -108,6 +109,7 @@ extern ssize_t jffs2_listxattr(struct dentry *, char *, size_t);
 #define jffs2_build_xattr_subsystem(c)
 #define jffs2_clear_xattr_subsystem(c)
 
+#define jffs2_xattr_do_crccheck_inode(c, ic)
 #define jffs2_xattr_delete_inode(c, ic)
 #define jffs2_xattr_free_inode(c, ic)
 #define jffs2_verify_xattr(c)			(1)
-- 
1.7.9.5

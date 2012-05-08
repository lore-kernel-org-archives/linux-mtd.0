Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SRjk9-0007Zq-Vt
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 12:42:20 +0000
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] check xattr data integrity during first GC scan.
Date: Tue,  8 May 2012 14:41:51 +0200
Message-Id: <1336480911-16707-1-git-send-email-jcd@tribudubois.net>
Cc: Jean-Christophe DUBOIS <jcd@tribudubois.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch allows JFFS2 to distinguish between a recoverable
and non recoverable errors and to act accordingly.

Furthermore, extended attribute integrity is now checked on
first GC pass (at the same time as the file data integrity
is checked).

Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
---
 fs/jffs2/readinode.c |    1 +
 fs/jffs2/xattr.c     |   21 +++++++++++++++------
 fs/jffs2/xattr.h     |    2 ++
 3 files changed, 18 insertions(+), 6 deletions(-)

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
index b55b803..a7d8e22 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -11,6 +11,8 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#define JFFS2_XATTR_IS_CORRUPTED	1
+
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/fs.h>
@@ -153,7 +155,7 @@ static int do_verify_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_dat
 		JFFS2_ERROR("node CRC failed at %#08x, read=%#08x, calc=%#08x\n",
 			    offset, je32_to_cpu(rx.hdr_crc), crc);
 		xd->flags |= JFFS2_XFLAGS_INVALID;
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	}
 	totlen = PAD(sizeof(rx) + rx.name_len + 1 + je16_to_cpu(rx.value_len));
 	if (je16_to_cpu(rx.magic) != JFFS2_MAGIC_BITMASK
@@ -169,7 +171,7 @@ static int do_verify_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_dat
 			    je32_to_cpu(rx.xid), xd->xid,
 			    je32_to_cpu(rx.version), xd->version);
 		xd->flags |= JFFS2_XFLAGS_INVALID;
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	}
 	xd->xprefix = rx.xprefix;
 	xd->name_len = rx.name_len;
@@ -227,12 +229,12 @@ static int do_load_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum
 	data[xd->name_len] = '\0';
 	crc = crc32(0, data, length);
 	if (crc != xd->data_crc) {
-		JFFS2_WARNING("node CRC failed (JFFS2_NODETYPE_XREF)"
+		JFFS2_WARNING("node CRC failed (JFFS2_NODETYPE_XATTR)"
 			      " at %#08x, read: 0x%08x calculated: 0x%08x\n",
 			      ref_offset(xd->node), xd->data_crc, crc);
 		kfree(data);
 		xd->flags |= JFFS2_XFLAGS_INVALID;
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	}
 
 	xd->flags |= JFFS2_XFLAGS_HOT;
@@ -435,6 +437,8 @@ static void unrefer_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datu
  *   is called to release xattr related objects when unmounting. 
  * check_xattr_ref_inode(c, ic)
  *   is used to confirm inode does not have duplicate xattr name/value pair.
+ * jffs2_xattr_do_crccheck_inode(c, ic)
+ *   is used to force xattr data integrity check during the initial gc scan.
  * -------------------------------------------------- */
 static int verify_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
 {
@@ -462,7 +466,7 @@ static int verify_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref
 	if (crc != je32_to_cpu(rr.node_crc)) {
 		JFFS2_ERROR("node CRC failed at %#08x, read=%#08x, calc=%#08x\n",
 			    offset, je32_to_cpu(rr.node_crc), crc);
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	}
 	if (je16_to_cpu(rr.magic) != JFFS2_MAGIC_BITMASK
 	    || je16_to_cpu(rr.nodetype) != JFFS2_NODETYPE_XREF
@@ -472,7 +476,7 @@ static int verify_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref
 			    offset, je16_to_cpu(rr.magic), JFFS2_MAGIC_BITMASK,
 			    je16_to_cpu(rr.nodetype), JFFS2_NODETYPE_XREF,
 			    je32_to_cpu(rr.totlen), PAD(sizeof(rr)));
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	}
 	ref->ino = je32_to_cpu(rr.ino);
 	ref->xid = je32_to_cpu(rr.xid);
@@ -682,6 +686,11 @@ static int check_xattr_ref_inode(struct jffs2_sb_info *c, struct jffs2_inode_cac
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

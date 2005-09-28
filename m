Received: from tyo201.gate.nec.co.jp ([210.143.35.51])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKXbx-0001Jn-Pg
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 04:48:41 -0400
Message-ID: <433A57D8.9030501@ak.jp.nec.com>
Date: Wed, 28 Sep 2005 17:44:08 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
References: <20050823124649.GB30853@wohnheim.fh-wedel.de>	<1124801569.29448.13.camel@hades.cambridge.redhat.com>	<430C429B.6040500@ak.jp.nec.com>
	<431E772B.9090004@ak.jp.nec.com>	<20050908194915.GG20668@wohnheim.fh-wedel.de>	<43210C7A.60109@ak.jp.nec.com>	<20050909072416.GA19251@wohnheim.fh-wedel.de>	<43225DEB.4070809@ak.jp.nec.com>	<20050911114642.GA11788@wohnheim.fh-wedel.de>	<4324E525.60805@ak.jp.nec.com>	<20050912064038.GA21304@wohnheim.fh-wedel.de>
	<43255FF5.4020903@ak.jp.nec.com>
In-Reply-To: <43255FF5.4020903@ak.jp.nec.com>
Content-Type: multipart/mixed; boundary="------------080001040805010002060304"
Cc: James Morris <jmorris@redhat.com>, Ma Yun <sx_yunma@hotmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Stephen Smalley <sds@tycho.nsa.gov>,
	Kaigai Kohei <kaigai@ak.jp.nec.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------080001040805010002060304
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I revised the previous xattr patch in jffs2 based on some suggestions.

[1] scanning xattr related node for cleaned-up scan.c.
     (jffs2_xattr_scan.c-cleanup.patch)
[2] enables xattr support in jffs2.
     (jffs2_xattr_take-3.patch)
(*) We can apply jffs2_xattr_take-3.patch for current CVS independently.

The following points are updated.

- jffs2_scan_xattr_node() and jffs2_scan_xref_node() are implemented
   with considering the cleaned-up scan.c. (jffs2_xattr_scan.c-cleanup.patch)
   Since I can't build the cleaned-up source, this patch has not been verified yet.
   But same code is included in jffs2_xattr_take-3.patch, and it works correctly.

- A deadlock problem was detected in take-2 patch.
   Thus, the order of acquiring semaphore was changed.
   There was down_write(&c->xattr_sem) under down(&c->alloc_sem) in take-2 patch.
   Now, I avoid such an implementation. In do_jffs2_setxattr(), xattr_sem is
   acquired after alloc_sem is done.

- "include/linux/jffs2_fs_x.h" was moved to "fs/jffs2/xattr.h".

- 'void *owner' in struct jffs2_raw_node_ref was removed.
- 'int state' in struct jffs2_inode_cache was removed, and
   'u8 class' and 'u8 flags', 'uint16_t state' were added on instead.

   GC uses raw->next_in_ino for reverse-reference to xattr_datum/xattr_ref
   from jffs_raw_node_ref.

- the declaration of jffs2_xattr_ref was changed. The strange cast was removed,
   and the variables not-used concurrently are defined as union type.
   ('uint32_t xid' and 'struct jffs2_xattr_datum *xd' are not used concurrently.
    'uint32_t ino' and 'struct jffs2_inode_cache *ic' are not used concurrently.)

- A xattr prefixes like 'security.' are represented by 8bit code, and omit it
   from name-strings.

- jffs2_xattr_datum->xlist was removed, and 'uint32_t refcnt' was added.
   Scanning inodes which share the same xattr_datum is not used.
   Thus, this list is not necessary and enough in reference counter.

- some functions/variables/structures are renamed.
   struct jffs2_xattr_cache -> struct jffs2_xattr_datum

   kmem_cache_t *xattr_cache_slab -> xattr_datum_cache
   kmem_cache_t *xattr_ref_slab -> xattr_ref_cache

   jffs2_init_xattr_caches()  -> jffs2_init_xattr_subsystem()
   jffs2_build_xattr_caches() -> jffs2_build_xattr_subsystem()
   jffs2_clear_xattr_caches() -> jffs2_clear_xattr_subsystem()
         ,,,and so on.

The remaining work is as follows:
   - Additional revising besed on any comments.
   - Test & Stabilization.
   - The implementation for POSIX ACL support.
   - The implementation for XATTR support in mkfs.jffs2.

Signed-off-by: KaiGai Kohei <kaigai@ak.jp.nec.com>

Thanks,
-- 
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>

--------------080001040805010002060304
Content-Type: text/x-patch;
 name="jffs2_xattr_take-3.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2_xattr_take-3.patch"

diff -prNU3 mtd-0927/fs/Kconfig mtd-0927.xattr/fs/Kconfig
--- mtd-0927/fs/Kconfig	2005-09-07 04:34:52.000000000 -0400
+++ mtd-0927.xattr/fs/Kconfig	2005-09-26 19:17:32.000000000 -0400
@@ -64,6 +64,23 @@ config JFFS2_FS_WRITEBUFFER
 	    - NOR flash with transparent ECC
 	    - DataFlash
 
+config JFFS2_XATTR
+	bool "JFFS2 XATTR support (EXPERIMENTAL)"
+	depends on JFFS2_FS && EXPERIMENTAL
+	default n
+	help
+	  This enables the Extended Attributes(XATTR) support in JFFS2.
+	  XATTR is name:value pairs associated with inodes by the kernel
+	  or by users.
+	  It's neccesary for persistent security context in SELinux.
+	  
+	  In addition, the following kinds of prefixes are supported now.
+	  - security.*
+	  - user.*
+	  - trusted.*
+	  
+	  - system.posix_acl_{access|default} are in TODO list now.
+
 config JFFS2_SUMMARY
 	bool "JFFS2 summary support (EXPERIMENTAL)"
 	depends on JFFS2_FS && EXPERIMENTAL
diff -prNU3 mtd-0927/fs/jffs2/Makefile.common mtd-0927.xattr/fs/jffs2/Makefile.common
--- mtd-0927/fs/jffs2/Makefile.common	2005-09-07 04:34:53.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/Makefile.common	2005-09-26 19:16:05.000000000 -0400
@@ -12,6 +12,7 @@ jffs2-y	+= symlink.o build.o erase.o bac
 jffs2-y	+= super.o debug.o
 
 jffs2-$(CONFIG_JFFS2_FS_WRITEBUFFER)	+= wbuf.o
+jffs2-$(CONFIG_JFFS2_XATTR)	+= xattr.o
 jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
 jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
 jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
diff -prNU3 mtd-0927/fs/jffs2/build.c mtd-0927.xattr/fs/jffs2/build.c
--- mtd-0927/fs/jffs2/build.c	2005-09-21 11:52:33.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/build.c	2005-09-26 19:06:31.000000000 -0400
@@ -160,6 +160,7 @@ static int jffs2_build_filesystem(struct
 		ic->scan_dents = NULL;
 		cond_resched();
 	}
+	jffs2_build_xattr_subsystem(c);
 	c->flags &= ~JFFS2_SB_FLAG_BUILDING;
 	
 	dbg_fsbuild("FS build complete\n");
@@ -178,6 +179,7 @@ exit:
 				jffs2_free_full_dirent(fd);
 			}
 		}
+		jffs2_clear_xattr_subsystem(c);
 	}
 
 	return ret;
diff -prNU3 mtd-0927/fs/jffs2/dir.c mtd-0927.xattr/fs/jffs2/dir.c
--- mtd-0927/fs/jffs2/dir.c	2005-09-07 04:34:54.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/dir.c	2005-09-26 19:06:31.000000000 -0400
@@ -57,7 +57,12 @@ struct inode_operations jffs2_dir_inode_
 	.rmdir =	jffs2_rmdir,
 	.mknod =	jffs2_mknod,
 	.rename =	jffs2_rename,
+	.permission =	jffs2_permission,
 	.setattr =	jffs2_setattr,
+	.setxattr =	jffs2_setxattr,
+	.getxattr =	jffs2_getxattr,
+	.listxattr =	jffs2_listxattr,
+	.removexattr =	jffs2_removexattr
 };
 
 /***********************************************************************/
diff -prNU3 mtd-0927/fs/jffs2/file.c mtd-0927.xattr/fs/jffs2/file.c
--- mtd-0927/fs/jffs2/file.c	2005-09-07 04:34:54.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/file.c	2005-09-26 19:06:31.000000000 -0400
@@ -57,7 +57,12 @@ struct file_operations jffs2_file_operat
 
 struct inode_operations jffs2_file_inode_operations =
 {
-	.setattr =	jffs2_setattr
+	.permission =	jffs2_permission,
+	.setattr =	jffs2_setattr,
+	.setxattr =	jffs2_setxattr,
+	.getxattr =	jffs2_getxattr,
+	.listxattr =	jffs2_listxattr,
+	.removexattr =	jffs2_removexattr
 };
 
 struct address_space_operations jffs2_file_address_operations =
diff -prNU3 mtd-0927/fs/jffs2/fs.c mtd-0927.xattr/fs/jffs2/fs.c
--- mtd-0927/fs/jffs2/fs.c	2005-09-07 04:34:54.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/fs.c	2005-09-26 19:06:31.000000000 -0400
@@ -218,6 +218,7 @@ void jffs2_clear_inode (struct inode *in
 	
 	D1(printk(KERN_DEBUG "jffs2_clear_inode(): ino #%lu mode %o\n", inode->i_ino, inode->i_mode));
 
+	jffs2_xattr_delete_inode(c, f->inocache);
 	jffs2_do_clear_inode(c, f);
 }
 
@@ -490,9 +491,12 @@ int jffs2_do_fill_super(struct super_blo
 	}
 	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *));
 
-	if ((ret = jffs2_do_mount_fs(c)))
+	if ((ret = jffs2_init_xattr_subsystem(c)))
 		goto out_inohash;
 
+	if ((ret = jffs2_do_mount_fs(c)))
+		goto out_xattr;
+
 	ret = -EINVAL;
 
 	D1(printk(KERN_DEBUG "jffs2_do_fill_super(): Getting root inode\n"));
@@ -523,6 +527,8 @@ int jffs2_do_fill_super(struct super_blo
 		vfree(c->blocks);
 	else
 		kfree(c->blocks);
+ out_xattr:
+	jffs2_clear_xattr_subsystem(c);
  out_inohash:
 	kfree(c->inocache_list);
  out_wbuf:
diff -prNU3 mtd-0927/fs/jffs2/gc.c mtd-0927.xattr/fs/jffs2/gc.c
--- mtd-0927/fs/jffs2/gc.c	2005-09-07 04:34:54.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/gc.c	2005-09-26 19:06:31.000000000 -0400
@@ -258,6 +258,16 @@ int jffs2_garbage_collect_pass(struct jf
 
 	ic = jffs2_raw_ref_to_ic(raw);
 
+	/* When 'ic' refers xattr_datum/xattr_ref, this node is GCed as xattr.
+	   We can decide whether this node is inode or xattr by ic->class.
+	   ret = 0 : ic is xattr_datum/xattr_ref, and GC was SUCCESSED.
+	   ret < 0 : ic is xattr_datum/xattr_ref, but GC was FAILED.
+	   ret > 0 : ic is NOT xattr_datum/xattr_ref.
+	*/
+	ret = jffs2_garbage_collect_xattr(c, ic);
+	if (ret <= 0)
+		goto release_sem;
+
 	/* We need to hold the inocache. Either the erase_completion_lock or
 	   the inocache_lock are sufficient; we trade down since the inocache_lock 
 	   causes less contention. */
diff -prNU3 mtd-0927/fs/jffs2/malloc.c mtd-0927.xattr/fs/jffs2/malloc.c
--- mtd-0927/fs/jffs2/malloc.c	2005-09-20 10:27:34.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/malloc.c	2005-09-26 21:01:14.000000000 -0400
@@ -26,6 +26,10 @@ static kmem_cache_t *tmp_dnode_info_slab
 static kmem_cache_t *raw_node_ref_slab;
 static kmem_cache_t *node_frag_slab;
 static kmem_cache_t *inode_cache_slab;
+#ifdef CONFIG_JFFS2_XATTR
+static kmem_cache_t *xattr_datum_cache;
+static kmem_cache_t *xattr_ref_cache;
+#endif
 
 int __init jffs2_create_slab_caches(void)
 {
@@ -68,8 +72,24 @@ int __init jffs2_create_slab_caches(void
 	inode_cache_slab = kmem_cache_create("jffs2_inode_cache",
 					     sizeof(struct jffs2_inode_cache),
 					     0, 0, NULL, NULL);
-	if (inode_cache_slab)
-		return 0;
+	if (!inode_cache_slab)
+		goto err;
+
+#ifdef CONFIG_JFFS2_XATTR
+	xattr_datum_cache = kmem_cache_create("jffs2_xattr_datum",
+					     sizeof(struct jffs2_xattr_datum),
+					     0, 0, NULL, NULL);
+	if (!xattr_datum_cache)
+		goto err;
+
+	xattr_ref_cache = kmem_cache_create("jffs2_xattr_ref",
+					   sizeof(struct jffs2_xattr_ref),
+					   0, 0, NULL, NULL);
+	if (!xattr_ref_cache)
+		goto err;
+#endif
+
+	return 0;
  err:
 	jffs2_destroy_slab_caches();
 	return -ENOMEM;
@@ -91,6 +111,12 @@ void jffs2_destroy_slab_caches(void)
 		kmem_cache_destroy(node_frag_slab);
 	if(inode_cache_slab)
 		kmem_cache_destroy(inode_cache_slab);
+#ifdef CONFIG_JFFS2_XATTR
+	if(xattr_datum_cache)
+		kmem_cache_destroy(xattr_datum_cache);
+	if(xattr_ref_cache)
+		kmem_cache_destroy(xattr_ref_cache);
+#endif
 }
 
 struct jffs2_full_dirent *jffs2_alloc_full_dirent(int namesize)
@@ -205,3 +231,35 @@ void jffs2_free_inode_cache(struct jffs2
 	dbg_memalloc("%p\n", x);
 	kmem_cache_free(inode_cache_slab, x);
 }
+
+#ifdef CONFIG_JFFS2_XATTR
+
+struct jffs2_xattr_datum *jffs2_alloc_xattr_datum(void)
+{
+	struct jffs2_xattr_datum *xd;
+	xd = kmem_cache_alloc(xattr_datum_cache, GFP_KERNEL);
+	dbg_memalloc("%p\n", xd);
+	return xd;
+}
+
+void jffs2_free_xattr_datum(struct jffs2_xattr_datum *xd)
+{
+	dbg_memalloc("%p\n", xd);
+	kmem_cache_free(xattr_datum_cache, xd);
+}
+
+struct jffs2_xattr_ref *jffs2_alloc_xattr_ref(void)
+{
+	struct jffs2_xattr_ref *ref;
+	ref = kmem_cache_alloc(xattr_ref_cache, GFP_KERNEL);
+	dbg_memalloc("%p\n", ref);
+	return ref;
+}
+
+void jffs2_free_xattr_ref(struct jffs2_xattr_ref *ref)
+{
+	dbg_memalloc("%p\n", ref);
+	kmem_cache_free(xattr_ref_cache, ref);
+}
+
+#endif
diff -prNU3 mtd-0927/fs/jffs2/nodelist.c mtd-0927.xattr/fs/jffs2/nodelist.c
--- mtd-0927/fs/jffs2/nodelist.c	2005-09-21 09:28:35.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/nodelist.c	2005-09-26 19:06:31.000000000 -0400
@@ -937,6 +937,7 @@ void jffs2_free_ino_caches(struct jffs2_
 		this = c->inocache_list[i];
 		while (this) {
 			next = this->next;
+			jffs2_xattr_free_inode(c, this);
 			jffs2_free_inode_cache(this);
 			this = next;
 		}
diff -prNU3 mtd-0927/fs/jffs2/nodelist.h mtd-0927.xattr/fs/jffs2/nodelist.h
--- mtd-0927/fs/jffs2/nodelist.h	2005-09-07 04:34:54.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/nodelist.h	2005-09-26 19:21:53.000000000 -0400
@@ -20,6 +20,7 @@
 #include <linux/jffs2.h>
 #include <linux/jffs2_fs_sb.h>
 #include <linux/jffs2_fs_i.h>
+#include "xattr.h"
 #include "summary.h"
 
 #ifdef __ECOS
@@ -107,11 +108,16 @@ struct jffs2_inode_cache {
 		temporary lists of dirents, and later must be set to
 		NULL to mark the end of the raw_node_ref->next_in_ino
 		chain. */
+	u8 class;	/* It's used for identification */
+	u8 flags;
+	uint16_t state;
 	struct jffs2_inode_cache *next;
 	struct jffs2_raw_node_ref *nodes;
 	uint32_t ino;
 	int nlink;
-	int state;
+#ifdef CONFIG_JFFS2_XATTR
+	struct list_head ilist;
+#endif
 };
 
 /* Inode states for 'state' above. We need the 'GC' state to prevent
@@ -125,6 +131,8 @@ struct jffs2_inode_cache {
 #define INO_STATE_READING	5	/* In read_inode() */
 #define INO_STATE_CLEARING	6	/* In clear_inode() */
 
+#define INO_FLAGS_XATTR_CHECKED	0x01	/* has no duplicate xattr_ref */
+
 #define INOCACHE_HASHSIZE 128
 
 /*
@@ -375,6 +383,13 @@ void jffs2_free_node_frag(struct jffs2_n
 struct jffs2_inode_cache *jffs2_alloc_inode_cache(void);
 void jffs2_free_inode_cache(struct jffs2_inode_cache *);
 
+#ifdef CONFIG_JFFS2_XATTR
+struct jffs2_xattr_datum *jffs2_alloc_xattr_datum(void);
+void jffs2_free_xattr_datum(struct jffs2_xattr_datum *);
+struct jffs2_xattr_ref *jffs2_alloc_xattr_ref(void);
+void jffs2_free_xattr_ref(struct jffs2_xattr_ref *);
+#endif /* CONFIG_JFFS2_XATTR */
+
 /* gc.c */
 int jffs2_garbage_collect_pass(struct jffs2_sb_info *c);
 
diff -prNU3 mtd-0927/fs/jffs2/readinode.c mtd-0927.xattr/fs/jffs2/readinode.c
--- mtd-0927/fs/jffs2/readinode.c	2005-09-20 10:27:34.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/readinode.c	2005-09-26 19:06:31.000000000 -0400
@@ -902,6 +902,7 @@ int jffs2_do_read_inode(struct jffs2_sb_
 		f->inocache->ino = f->inocache->nlink = 1;
 		f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
 		f->inocache->state = INO_STATE_READING;
+		init_xattr_inode_cache(f->inocache);
 		jffs2_add_ino_cache(c, f->inocache);
 	}
 	if (!f->inocache) {
diff -prNU3 mtd-0927/fs/jffs2/scan.c mtd-0927.xattr/fs/jffs2/scan.c
--- mtd-0927/fs/jffs2/scan.c	2005-09-21 09:05:22.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/scan.c	2005-09-26 19:06:31.000000000 -0400
@@ -309,6 +309,159 @@ int jffs2_scan_classify_jeb(struct jffs2
 		return BLK_STATE_ALLDIRTY;
 }
 
+#ifdef CONFIG_JFFS2_XATTR
+
+#if 1	/* In cleaned up scan.c, this section is not necessary. */
+static inline uint32_t dirty_space(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				   uint32_t unpadded_space)
+{
+	DIRTY_SPACE(PAD(unpadded_space));
+
+	return PAD(unpadded_space);;
+}
+
+static inline uint32_t used_space(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				  uint32_t unpadded_space)
+{
+	USED_SPACE(PAD(unpadded_space));
+
+	return PAD(unpadded_space);
+}
+
+#endif	/* In cleaned up scan.c, this section is not necessary. */
+
+static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				 struct jffs2_raw_xattr *rx, uint32_t ofs)
+{
+	struct jffs2_xattr_datum *xd;
+	struct jffs2_raw_node_ref *raw;
+	uint32_t crc;
+
+	crc = crc32(0, rx, sizeof(struct jffs2_raw_xattr)-8);
+	if (crc != je32_to_cpu(rx->node_crc)) {
+		printk(KERN_NOTICE "%s node CRC failed on node at 0x%08x: "
+		       "Read 0x%08x, calculated 0x%08x\n",
+		       __FUNCTION__, ofs, je32_to_cpu(rx->node_crc), crc);
+		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
+		return 0;
+	}
+
+	xd = jffs2_find_xattr_datum(c, je32_to_cpu(rx->xid));
+	if (xd) {
+		printk(KERN_NOTICE "%s() duplicate xid=%u found. "
+		       "on node at 0x%08x, later one is ignored.\n",
+		       __FUNCTION__, je32_to_cpu(rx->xid), ofs);
+		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
+		return 0;
+	}
+
+	crc = crc32(0, rx->data, rx->name_len + 1 + je16_to_cpu(rx->value_len));
+	if (crc != je32_to_cpu(rx->data_crc)) {
+		printk(KERN_NOTICE "%s data CRC failed on node at 0x%08x: "
+		       "Read 0x%08x, calculated 0x%08x\n",
+		       __FUNCTION__, ofs, je32_to_cpu(rx->node_crc), crc);
+		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
+		return 0;
+	}
+
+	xd = jffs2_alloc_xattr_datum();
+	if (!xd)
+		return -ENOMEM;
+	init_xattr_datum(xd);
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw) {
+		jffs2_free_xattr_datum(xd);
+		return -ENOMEM;
+	}
+
+	xd->xid = je32_to_cpu(rx->xid);
+	if (xd->xid > c->highest_xseqno)
+		c->highest_xseqno = xd->xid;
+	xd->xprefix = rx->xprefix;	/* 8bit width */
+	xd->name_len = rx->name_len;	/* 8bit width */
+	xd->value_len = je16_to_cpu(rx->value_len);
+	xd->data_crc = je32_to_cpu(rx->data_crc);
+	xd->node = raw;
+
+	raw->__totlen = PAD(je32_to_cpu(rx->totlen));
+	raw->flash_offset = ofs | REF_PRISTINE;
+	raw->next_phys = NULL;
+	raw->next_in_ino = (void *)xd;
+	if (!jeb->first_node)
+		jeb->first_node = raw;
+	if (jeb->last_node)
+		jeb->last_node->next_phys = raw;
+	jeb->last_node = raw;
+
+	used_space(c, jeb, je32_to_cpu(rx->totlen));
+
+	jffs2_attach_xattr_datum(c, xd);
+
+	return 0;
+}
+
+static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				struct jffs2_raw_xref *rr, uint32_t ofs)
+{
+	struct jffs2_xattr_ref *ref;
+	struct jffs2_raw_node_ref *raw;
+	uint32_t crc;
+
+	crc = crc32(0, rr, sizeof(*rr)-4);
+	if (crc != je32_to_cpu(rr->node_crc)) {
+		printk(KERN_NOTICE "%s node CRC failed on node at 0x%08x: "
+		       "Read 0x%08x, calculated 0x%08x\n",
+		       __FUNCTION__, ofs, je32_to_cpu(rr->node_crc), crc);
+		dirty_space(c, jeb, je32_to_cpu(rr->totlen));
+		return 0;
+	}
+
+	ref = jffs2_alloc_xattr_ref();
+	if (!ref)
+		return -ENOMEM;
+	init_xattr_ref(ref);
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw) {
+		jffs2_free_xattr_ref(ref);
+		return -ENOMEM;
+	}
+
+	/* BEFORE jffs2_build_xattr_subsystem() called, 
+	 * ref->xid is used to store 32bit xid, xd is not used
+	 * ref->ino is used to store 32bit inode-number, ic is not used
+	 * Thoes variables are declared as union, thus using those
+	 * are exclusive. In a similar way, ref->ilist is temporarily
+	 * used to chain all xattr_ref object. It's re-chained to
+	 * jffs2_inode_cache in jffs2_build_xattr_subsystem() correctly.
+	 */
+
+	ref->seqno = je32_to_cpu(rr->seqno);
+	if (ref->seqno > c->highest_xseqno)
+		c->highest_xseqno = ref->seqno;
+	ref->ino = je32_to_cpu(rr->ino);
+	ref->xid = je32_to_cpu(rr->xid);
+	ref->node = raw;
+
+	raw->__totlen = PAD(je32_to_cpu(rr->totlen));
+	raw->flash_offset = ofs | REF_PRISTINE;
+	raw->next_phys = NULL;
+	raw->next_in_ino = (void *)ref;
+	if (!jeb->first_node)
+		jeb->first_node = raw;
+	if (jeb->last_node)
+		jeb->last_node->next_phys = raw;
+	jeb->last_node = raw;
+
+	used_space(c, jeb, je32_to_cpu(rr->totlen));
+
+	list_add_tail(&ref->ilist, &c->xattr_temp);
+
+	return 0;
+}
+#endif
+
 static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				unsigned char *buf, uint32_t buf_size, struct jffs2_summary *s) {
 	struct jffs2_unknown_node *node;
@@ -617,6 +770,43 @@ scan_more:	
 			ofs += PAD(je32_to_cpu(node->totlen));
 			break;
 
+#ifdef CONFIG_JFFS2_XATTR
+		case JFFS2_NODETYPE_XATTR:
+			if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
+				/* FIXME: In cleaned-up scan.c, this If-block is not necessary. */
+				buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
+				D1(printk(KERN_DEBUG "Fewer than %d bytes (xattr node) left to end of buf."
+					  " Reading 0x%x at 0x%08x\n",je32_to_cpu(node->totlen), buf_len, ofs));
+				err = jffs2_fill_scan_buf(c, buf, ofs, buf_len);
+				if (err)
+					return err;
+				buf_ofs = ofs;
+				node = (void *)buf;
+			}
+			err = jffs2_scan_xattr_node(c, jeb, (void *)node, ofs);
+			if (err)
+				return err;
+			ofs += PAD(je32_to_cpu(node->totlen));
+			break;
+		case JFFS2_NODETYPE_XREF:
+			if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
+				/* FIXME: In cleaned-up scan.c, this If-block is not necessary. */
+				buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
+				D1(printk(KERN_DEBUG "Fewer than %d bytes (xref node) left to end of buf."
+					  " Reading 0x%x at 0x%08x\n",je32_to_cpu(node->totlen), buf_len, ofs));
+				err = jffs2_fill_scan_buf(c, buf, ofs, buf_len);
+				if (err)
+					return err;
+				buf_ofs = ofs;
+				node = (void *)buf;
+			}
+			err = jffs2_scan_xref_node(c, jeb, (void *)node, ofs);
+			if (err)
+				return err;
+			ofs += PAD(je32_to_cpu(node->totlen));
+			break;
+#endif	/* CONFIG_JFFS2_XATTR */
+
 		case JFFS2_NODETYPE_CLEANMARKER:
 			D1(printk(KERN_DEBUG "CLEANMARKER node found at 0x%08x\n", ofs));
 			if (je32_to_cpu(node->totlen) != c->cleanmarker_size) {
@@ -724,6 +914,7 @@ struct jffs2_inode_cache *jffs2_scan_mak
 
 	ic->ino = ino;
 	ic->nodes = (void *)ic;
+	init_xattr_inode_cache(ic);
 	jffs2_add_ino_cache(c, ic);
 	if (ino == 1)
 		ic->nlink = 1;
diff -prNU3 mtd-0927/fs/jffs2/super.c mtd-0927.xattr/fs/jffs2/super.c
--- mtd-0927/fs/jffs2/super.c	2005-09-07 04:34:55.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/super.c	2005-09-26 19:06:31.000000000 -0400
@@ -151,6 +151,7 @@ static struct super_block *jffs2_get_sb_
 
 	sb->s_op = &jffs2_super_operations;
 	sb->s_flags = flags | MS_NOATIME;
+	sb->s_xattr = jffs2_xattr_handlers;
 
 	ret = jffs2_do_fill_super(sb, data, (flags&MS_VERBOSE)?1:0);
 
@@ -293,6 +294,7 @@ static void jffs2_put_super (struct supe
 		kfree(c->blocks);
 	jffs2_flash_cleanup(c);
 	kfree(c->inocache_list);
+	jffs2_clear_xattr_subsystem(c);
 	if (c->mtd->sync)
 		c->mtd->sync(c->mtd);
 
diff -prNU3 mtd-0927/fs/jffs2/symlink.c mtd-0927.xattr/fs/jffs2/symlink.c
--- mtd-0927/fs/jffs2/symlink.c	2005-07-17 07:13:47.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/symlink.c	2005-09-26 19:06:31.000000000 -0400
@@ -24,7 +24,12 @@ struct inode_operations jffs2_symlink_in
 {	
 	.readlink =	generic_readlink,
 	.follow_link =	jffs2_follow_link,
-	.setattr =	jffs2_setattr
+	.permission =	jffs2_permission,
+	.setattr =	jffs2_setattr,
+	.setxattr =	jffs2_setxattr,
+	.getxattr =	jffs2_getxattr,
+	.listxattr =	jffs2_listxattr,
+	.removexattr =	jffs2_removexattr
 };
 
 static int jffs2_follow_link(struct dentry *dentry, struct nameidata *nd)
diff -prNU3 mtd-0927/fs/jffs2/write.c mtd-0927.xattr/fs/jffs2/write.c
--- mtd-0927/fs/jffs2/write.c	2005-09-07 04:34:55.000000000 -0400
+++ mtd-0927.xattr/fs/jffs2/write.c	2005-09-26 19:06:31.000000000 -0400
@@ -36,7 +36,7 @@ int jffs2_do_new_inode(struct jffs2_sb_i
 	f->inocache->nlink = 1;
 	f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
 	f->inocache->state = INO_STATE_PRESENT;
-
+	init_xattr_inode_cache(f->inocache);
 
 	jffs2_add_ino_cache(c, f->inocache);
 	D1(printk(KERN_DEBUG "jffs2_do_new_inode(): Assigned ino# %d\n", f->inocache->ino));
diff -prNU3 mtd-0927/fs/jffs2/xattr.c mtd-0927.xattr/fs/jffs2/xattr.c
--- mtd-0927/fs/jffs2/xattr.c	1969-12-31 19:00:00.000000000 -0500
+++ mtd-0927.xattr/fs/jffs2/xattr.c	2005-09-26 19:06:31.000000000 -0400
@@ -0,0 +1,1046 @@
+/*-------------------------------------------------------------------------*
+ *  File: fs/jffs2/xattr.c
+ *  XATTR support on JFFS2 FileSystem
+ *
+ *  Implemented by KaiGai Kohei <kaigai@ak.jp.nec.com>
+ *  Copyright (C) 2005 NEC Corporation
+ *
+ *  For licensing information, see the file 'LICENCE' in the jffs2 directory.
+ *-------------------------------------------------------------------------*/
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include <linux/time.h>
+#include <linux/pagemap.h>
+#include <linux/highmem.h>
+#include <linux/crc32.h>
+#include <linux/jffs2.h>
+#include <linux/xattr.h>
+#include <linux/mtd/mtd.h>
+#include "nodelist.h"
+
+/* ---- decralation of internal use functions ----------------- */
+static void reclaim_xattr_datum(struct jffs2_sb_info *c);
+static void unload_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd);
+
+static struct jffs2_xattr_datum *create_xattr_datum(struct jffs2_sb_info *c,
+						    int xprefix, const char *xname,
+						    const char *xvalue, int xsize,
+						    uint32_t phys_ofs);
+static void delete_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd);
+
+static struct jffs2_xattr_ref *create_xattr_ref(struct jffs2_sb_info *c,
+						struct jffs2_inode_cache *ic,
+						struct jffs2_xattr_datum *xd,
+						uint32_t phys_ofs);
+static void delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref);
+
+static int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
+			     char *buffer, size_t size);
+static int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
+			     const char *buffer, size_t size, int flags);
+
+/* ---- XATTR Handler for "user.*" --------------------- */
+static int jffs2_user_getxattr(struct inode *inode, const char *name,
+                               void *buffer, size_t size)
+{
+	int ret;
+
+	if (!strcmp(name, ""))
+		return -EINVAL;
+
+	ret = permission(inode, MAY_WRITE, NULL);
+	if (ret)
+		return ret;
+
+	return do_jffs2_getxattr(inode, JFFS2_XPREFIX_USER, name, buffer, size);
+}
+
+static int jffs2_user_setxattr(struct inode *inode, const char *name, const void *buffer,
+                               size_t size, int flags)
+{
+	int ret;
+
+	if (!strcmp(name, "") == 0)
+		return -EINVAL;
+
+	if ( !S_ISREG(inode->i_mode) &&
+	    (!S_ISDIR(inode->i_mode) || inode->i_mode & S_ISVTX))
+		return -EPERM;
+
+	ret = permission(inode, MAY_WRITE, NULL);
+	if (ret)
+		return ret;
+
+	return do_jffs2_setxattr(inode, JFFS2_XPREFIX_USER, name, buffer, size, flags);
+}
+
+static size_t jffs2_user_listxattr(struct inode *inode, char *list, size_t list_size,
+				   const char *name, size_t name_len)
+{
+	int retlen = sizeof(XATTR_USER_PREFIX) + name_len;
+
+	if (list && retlen <= list_size) {
+		strcpy(list, XATTR_USER_PREFIX);
+		strcpy(list+sizeof(XATTR_USER_PREFIX)-1, name);
+	}
+
+	return retlen;
+}
+
+static struct xattr_handler jffs2_user_xattr_handler = {
+	.prefix = XATTR_USER_PREFIX,
+	.list = jffs2_user_listxattr,
+	.set = jffs2_user_setxattr,
+	.get = jffs2_user_getxattr
+};
+
+/* ---- XATTR Handler for "trusted.*" ------------------ */
+static int jffs2_trusted_getxattr(struct inode *inode, const char *name,
+				  void *buffer, size_t size)
+{
+	if (!strcmp(name, ""))
+		return -EINVAL;
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	return do_jffs2_getxattr(inode, JFFS2_XPREFIX_TRUSTED, name, buffer, size);
+}
+
+static int jffs2_trusted_setxattr(struct inode *inode, const char *name, const void *buffer,
+				  size_t size, int flags)
+{
+	if (!strcmp(name, ""))
+		return -EINVAL;
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	return do_jffs2_setxattr(inode, JFFS2_XPREFIX_TRUSTED, name, buffer, size, flags);
+}
+
+static size_t jffs2_trusted_listxattr(struct inode *inode, char *list, size_t list_size,
+				      const char *name, size_t name_len)
+{
+	int retlen = sizeof(XATTR_TRUSTED_PREFIX) + name_len;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return 0; /* ignore this entry */
+
+	if (list && retlen<=list_size) {
+		strcpy(list, XATTR_TRUSTED_PREFIX);
+		strcpy(list+sizeof(XATTR_TRUSTED_PREFIX)-1, name);
+	}
+
+	return retlen;
+}
+
+static struct xattr_handler jffs2_trusted_xattr_handler = {
+	.prefix = XATTR_TRUSTED_PREFIX,
+	.list = jffs2_trusted_listxattr,
+	.set = jffs2_trusted_setxattr,
+	.get = jffs2_trusted_getxattr
+};
+
+/* ---- XATTR Handler for "security.*" ----------------- */
+static int jffs2_security_getxattr(struct inode *inode, const char *name,
+				   void *buffer, size_t size)
+{
+	if (!strcmp(name, ""))
+		return -EINVAL;
+
+	return do_jffs2_getxattr(inode, JFFS2_XPREFIX_SECURITY, name, buffer, size);
+}
+
+static int jffs2_security_setxattr(struct inode *inode, const char *name, const void *buffer,
+				   size_t size, int flags)
+{
+	if (!strcmp(name, ""))
+		return -EINVAL;
+
+	return do_jffs2_setxattr(inode, JFFS2_XPREFIX_SECURITY, name, buffer, size, flags);
+}
+
+static size_t jffs2_security_listxattr(struct inode *inode, char *list, size_t list_size,
+				       const char *name, size_t name_len)
+{
+	size_t retlen = sizeof(XATTR_SECURITY_PREFIX) + name_len;
+
+	if (list && retlen <= list_size) {
+		strcpy(list, XATTR_SECURITY_PREFIX);
+		strcpy(list+sizeof(XATTR_SECURITY_PREFIX)-1, name);
+	}
+
+	return retlen;
+}
+
+static struct xattr_handler jffs2_security_xattr_handler = {
+	.prefix = XATTR_SECURITY_PREFIX,
+	.list = jffs2_security_listxattr,
+	.set = jffs2_security_setxattr,
+	.get = jffs2_security_getxattr
+};
+/* ----------------------------------------------------- */
+struct xattr_handler *jffs2_xattr_handlers[] = {
+	&jffs2_user_xattr_handler,
+	&jffs2_security_xattr_handler,
+	&jffs2_trusted_xattr_handler,
+	NULL
+};
+
+static struct xattr_handler *xprefix_to_handler(int xprefix) {
+	struct xattr_handler *ret;
+
+	switch (xprefix) {
+	case JFFS2_XPREFIX_USER:
+		ret = &jffs2_user_xattr_handler;
+		break;
+	case JFFS2_XPREFIX_SECURITY:
+		ret = &jffs2_security_xattr_handler;
+		break;
+	case JFFS2_XPREFIX_TRUSTED:
+		ret = &jffs2_trusted_xattr_handler;
+		break;
+	default:
+		ret = NULL;
+		break;
+	}
+	return ret;
+}
+
+static uint32_t jffs2_xattr_datum_hashkey(int xprefix, const char *xname, const char *xvalue, int xsize)
+{
+	int name_len = strlen(xname);
+
+	return crc32(xprefix, xname, name_len) ^ crc32(xprefix, xvalue, xsize);
+}
+/* ---- Build-up and Destruct XATTR-Cache functions ----------- */
+int jffs2_init_xattr_subsystem(struct jffs2_sb_info *c)
+{
+	int i;
+
+	c->xattrindex = kmalloc((XATTRINDEX_HASHSIZE+1)*sizeof(struct list_head), GFP_KERNEL);
+	if (!c->xattrindex)
+		return -ENOMEM;
+
+	init_rwsem(&c->xattr_sem);
+
+	for (i=0; i<=XATTRINDEX_HASHSIZE; i++)
+		INIT_LIST_HEAD(&c->xattrindex[i]);
+
+	//c->xdatum_mem_threshold = 20 * 1024;	/* Default 20KB */
+	c->xdatum_mem_threshold = 32 * 1024;	/* Default 32KB */
+
+	return 0;
+}
+
+void jffs2_clear_xattr_subsystem(struct jffs2_sb_info *c)
+{
+	struct jffs2_xattr_datum *xd, *_xd;
+	struct jffs2_xattr_ref *ref, *_ref;
+	int i;
+
+	if (!c->xattrindex)
+		return;		/* not initialized */
+
+	list_for_each_entry_safe(ref, _ref, &c->xattr_temp, ilist)
+		jffs2_free_xattr_ref(ref);
+
+	for (i=0; i<XATTRINDEX_HASHSIZE; i++) {
+		list_for_each_entry_safe(xd, _xd, &c->xattrindex[i], xindex) {
+			list_del(&xd->xindex);
+			if (xd->xname)
+				kfree(xd->xname);
+			jffs2_free_xattr_datum(xd);
+		}
+	}
+
+	kfree(c->xattrindex);
+	c->xattrindex = NULL;
+}
+
+void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c)
+{
+	struct jffs2_xattr_ref *ref, *_ref;
+	struct jffs2_xattr_datum *xd, *_xd;
+	struct jffs2_inode_cache *ic;
+	int i;
+
+	BUG_ON(!(c->flags & JFFS2_SB_FLAG_BUILDING));
+
+	/* Phase.1 */
+	list_for_each_entry_safe(ref, _ref, &c->xattr_temp, ilist) {
+		list_del_init(&ref->ilist);
+		/* At this point, ref->xid and ref->ino contain XID and inode number.
+		   ref->xd and ref->ic are not valid yet. */
+		xd = jffs2_find_xattr_datum(c, ref->xid);
+		ic = jffs2_get_ino_cache(c, ref->ino);
+		if (!xd) {
+			printk(KERN_NOTICE "building xref {ino=%u, xid=%u} is not found.\n",
+			       ref->xid, ref->ino);
+			ref->node->next_in_ino = NULL;
+			jffs2_mark_node_obsolete(c, ref->node);
+			jffs2_free_xattr_ref(ref);
+			continue;
+		}
+		ref->xd = xd;
+		ref->ic = ic;
+		xd->refcnt++;
+		list_add_tail(&ref->ilist, &ic->ilist);
+		D1(printk(KERN_NOTICE "bind XREF{ino=%u, xid=%u}\n", ic->ino, xd->xid));
+	}
+	/* After this, ref->xid/ino are never used. */
+
+	/* Phase.2 */
+	for (i=0; i<XATTRINDEX_HASHSIZE; i++) {
+		list_for_each_entry_safe(xd, _xd, &c->xattrindex[i], xindex) {
+			list_del_init(&xd->xindex);
+			if (!xd->refcnt) {
+				printk(KERN_NOTICE "unrefered xattr_datum found xid=%u\n", xd->xid);
+				delete_xattr_datum(c, xd);
+			}
+		}
+	}
+	/* build complete */
+	printk(KERN_NOTICE "%s complete.\n", __FUNCTION__);
+}
+
+struct jffs2_xattr_datum *jffs2_find_xattr_datum(struct jffs2_sb_info *c, uint32_t xid)
+{
+	struct jffs2_xattr_datum *xd;
+	int i = xid % XATTRINDEX_HASHSIZE;
+
+	/* It's only used in scanning/building process. */
+	BUG_ON(!(c->flags & (JFFS2_SB_FLAG_SCANNING|JFFS2_SB_FLAG_BUILDING)));
+
+	list_for_each_entry(xd, &c->xattrindex[i], xindex) {
+		if (xd->xid==xid)
+			return xd;
+	}
+	return NULL;
+}
+
+void jffs2_attach_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	int i = xd->xid % XATTRINDEX_HASHSIZE;
+
+	/* It's only used in scanning process. */
+	BUG_ON(!(c->flags & JFFS2_SB_FLAG_SCANNING));
+
+	list_add_tail(&xd->xindex, &c->xattrindex[i]);
+}
+
+/* ---- Internal XATTR related functions ------------------------------------ */
+static void reclaim_xattr_datum(struct jffs2_sb_info *c)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_datum *xd, *_xd;
+	uint32_t target, before;
+	static int index = 0;
+
+	before = c->xdatum_mem_usage;
+	target = c->xdatum_mem_usage * 4 / 5; /* 20% reduction */
+	while(1) {
+		list_for_each_entry_safe(xd, _xd, &c->xattrindex[index], xindex) {
+			if (xd->flags & JFFS2_XDATUM_FLAGS_HOT) {
+				xd->flags &= ~JFFS2_XDATUM_FLAGS_HOT;
+			} else {
+				unload_xattr_datum(c, xd);
+			}
+			if (c->xdatum_mem_usage <= target)
+				goto out;
+		}
+		index = (index+1) % XATTRINDEX_HASHSIZE;
+	}
+ out:
+	printk(KERN_NOTICE "JFFS2: reclaim_xattr_cache() before: %d Byte  after: %d Byte\n",
+			   before, c->xdatum_mem_usage);
+}
+
+static int do_load_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_write(xattr_sem) */
+	char *data;
+	size_t readlen;
+	uint32_t crc, length;
+	int i, ret, retry = 0;
+
+	D1(printk(KERN_NOTICE "%s xid=%u xprefix=%d\n", __FUNCTION__, xd->xid, xd->xprefix));
+ retry:
+	length = xd->name_len + 1 + xd->value_len;
+	data = kmalloc(length, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	BUG_ON(!xd->node);
+	ret = jffs2_flash_read(c, ref_offset(xd->node)+sizeof(struct jffs2_raw_xattr),
+			       length, &readlen, data);
+
+	if (ret || length!=readlen) {
+		printk(KERN_WARNING "jffs2_flash_read()=%d, request: %d, readlen: %d, at 0x%08x\n",
+		       ret, length, readlen, ref_offset(xd->node));
+		kfree(data);
+		return ret ? ret : -EIO;
+	}
+
+	data[xd->name_len] = '\0';
+	crc = crc32(0, data, length);
+	if (crc != xd->data_crc) {
+		printk(KERN_WARNING "node CRC failed (JFFS2_NODETYPE_XREF)"
+				    " at 0x%08x, read: 0x%08x calculated: 0x%08x\n",
+				    ref_offset(xd->node), xd->data_crc, crc);
+		kfree(data);
+		return -EIO;
+	}
+
+	xd->flags = JFFS2_XDATUM_FLAGS_HOT;
+	xd->xname = data;
+	xd->xvalue = data+xd->name_len+1;
+
+	c->xdatum_mem_usage += length;
+
+	xd->hashkey = jffs2_xattr_datum_hashkey(xd->xprefix, xd->xname, xd->xvalue, xd->value_len);
+	i = xd->hashkey % XATTRINDEX_HASHSIZE;
+	list_add(&xd->xindex, &c->xattrindex[i]);
+
+	if (c->xdatum_mem_usage > c->xdatum_mem_threshold && retry==0) {
+		reclaim_xattr_datum(c);
+		if (!xd->xname) {
+			retry = 1;
+			goto retry;
+		}
+	}
+
+	return 0;
+}
+
+static inline int load_xattr_datum_nolock(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_write(xattr_sem); */
+	if (unlikely(!xd->xname))
+		return do_load_xattr_datum(c, xd);
+	return 0;
+}
+
+static inline int load_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_read(xattr_sem); */
+	int ret;
+
+	if (likely(xd->xname))
+		return 0;
+
+	up_read(&c->xattr_sem);
+	down_write(&c->xattr_sem);
+	ret = load_xattr_datum_nolock(c, xd);
+	downgrade_write(&c->xattr_sem);
+
+	return ret;
+}
+
+static void unload_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_write(xattr_sem) */
+	D1(printk(KERN_NOTICE "%s xid=%u xprefix=%d\n", __FUNCTION__, xd->xid, xd->xprefix));
+
+	if (xd->xname) {
+		c->xdatum_mem_usage -= (xd->name_len + 1 + xd->value_len);
+		kfree(xd->xname);
+	}
+
+	list_del_init(&xd->xindex);
+	xd->hashkey = 0;
+	xd->xname = NULL;
+	xd->xvalue = NULL;
+}
+
+static int save_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd, uint32_t phys_ofs)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_raw_xattr rx;
+	struct jffs2_raw_node_ref *raw;
+	struct kvec vecs[2];
+	uint32_t length;
+	int ret, totlen;
+
+	ret = load_xattr_datum_nolock(c, xd);
+	if (ret)
+		return ret;
+
+	vecs[0].iov_base = &rx;
+	vecs[0].iov_len = PAD(sizeof(rx));
+	vecs[1].iov_base = xd->xname;
+	vecs[1].iov_len = xd->name_len + 1 + xd->value_len;
+	totlen = vecs[0].iov_len + vecs[1].iov_len;
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw)
+		return -ENOMEM;
+	raw->flash_offset = phys_ofs;
+	raw->__totlen = PAD(totlen);
+	raw->next_phys = NULL;
+	raw->next_in_ino = (void *)xd;
+
+	/* Setup raw-xattr */
+	rx.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rx.nodetype = cpu_to_je16(JFFS2_NODETYPE_XATTR);
+	rx.totlen = cpu_to_je32(totlen);
+	rx.hdr_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_unknown_node)-4));
+
+	rx.xid = cpu_to_je32(xd->xid);
+	rx.xprefix = xd->xprefix;
+	rx.name_len = xd->name_len;
+	rx.value_len = cpu_to_je16(xd->value_len);
+	rx.data_crc = cpu_to_je32(crc32(0, vecs[1].iov_base, vecs[1].iov_len));
+	rx.node_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_raw_xattr)-8));
+
+	ret = jffs2_flash_writev(c, vecs, 2, phys_ofs, &length, 0);
+	if (ret || totlen!=length) {
+		printk(KERN_NOTICE "%s:%d Write of %d bytes at 0x%08x failed. returned %d, retlen %d\n",
+		       __FILE__, __LINE__, totlen, phys_ofs, ret, length);
+		ret = ret ? ret : -EIO;
+		if (length) {
+			raw->flash_offset |= REF_OBSOLETE;
+			raw->next_in_ino = NULL;
+			jffs2_add_physical_node_ref(c, raw);
+			jffs2_mark_node_obsolete(c, raw);
+		} else {
+			jffs2_free_raw_node_ref(raw);
+		}
+		return ret;
+	}
+	/* success */
+	raw->flash_offset |= REF_PRISTINE;
+	jffs2_add_physical_node_ref(c, raw);
+	if (xd->node) {
+		xd->node->next_in_ino = NULL;
+		jffs2_mark_node_obsolete(c, xd->node);
+	}
+	xd->node = raw;
+
+	return 0;
+}
+
+static struct jffs2_xattr_datum *create_xattr_datum(struct jffs2_sb_info *c,
+						    int xprefix, const char *xname,
+						    const char *xvalue, int xsize,
+						    uint32_t phys_ofs)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_datum *xd;
+	uint32_t hashkey, nlen;
+	char *data;
+	int i, rc;
+
+	/* Search xattr_datum has same xname/xvalue by index */
+	hashkey = jffs2_xattr_datum_hashkey(xprefix, xname, xvalue, xsize);
+	i = hashkey % XATTRINDEX_HASHSIZE;
+	list_for_each_entry(xd, &c->xattrindex[i], xindex) {
+		if (xd->hashkey==hashkey
+		    && xd->xprefix==xprefix
+		    && xd->value_len==xsize
+		    && !strcmp(xd->xname, xname)
+		    && !memcmp(xd->xvalue, xvalue, xsize)) {
+			xd->refcnt++;
+			return xd;
+		}
+	}
+
+	/* Not found, Create NEW XATTR-Cache */
+	nlen = strlen(xname);
+
+	xd = jffs2_alloc_xattr_datum();
+	if (!xd)
+		return ERR_PTR(-ENOMEM);
+	init_xattr_datum(xd);   /* class = RAWNODE_CLASS_XATTR_DATUM, refcnt = 0 */
+
+	data = kmalloc(nlen + 1 + xsize, GFP_KERNEL);
+	if (!data) {
+		jffs2_free_xattr_datum(xd);
+		return ERR_PTR(-ENOMEM);
+	}
+	strcpy(data, xname);
+	data[nlen] = '\0';
+	memcpy(data + nlen + 1, xvalue, xsize);
+
+	xd->refcnt++;	/* refcnt = 1 */
+	xd->flags = JFFS2_XDATUM_FLAGS_HOT;
+	xd->xprefix = xprefix;
+	xd->xid = ++c->highest_xseqno;
+
+	xd->hashkey = hashkey;
+	xd->xname = data;
+	xd->xvalue = data + nlen + 1;
+	xd->name_len = nlen;
+	xd->value_len = xsize;
+	xd->data_crc = crc32(0, data, xd->name_len + 1 + xd->value_len);
+
+	rc = save_xattr_datum(c, xd, phys_ofs);
+	if (rc) {
+		kfree(xd->xname);
+		jffs2_free_xattr_datum(xd);
+		return ERR_PTR(rc);
+	}
+
+	/* Insert Hash Index */
+	i = hashkey % XATTRINDEX_HASHSIZE;
+	list_add(&xd->xindex, &c->xattrindex[i]);
+
+	c->xdatum_mem_usage += xd->name_len + 1 + xd->value_len;
+	if (c->xdatum_mem_usage > c->xdatum_mem_threshold)
+		reclaim_xattr_datum(c);
+
+	return xd;
+}
+
+static void delete_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_write(xattr_sem) */
+	BUG_ON(xd->refcnt);
+
+	unload_xattr_datum(c, xd);
+	if (xd->node) {
+		xd->node->next_in_ino = NULL;
+		jffs2_mark_node_obsolete(c, xd->node);
+	}
+	jffs2_free_xattr_datum(xd);
+}
+
+static int save_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref, uint32_t phys_ofs)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_raw_node_ref *raw;
+	struct jffs2_raw_xref rr;
+	uint32_t length;
+	int ret;
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw)
+		return -ENOMEM;
+	raw->flash_offset = phys_ofs;
+	raw->__totlen = PAD(sizeof(rr));
+	raw->next_phys = NULL;
+	raw->next_in_ino = (void *)ref;
+
+	rr.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rr.nodetype = cpu_to_je16(JFFS2_NODETYPE_XREF);
+	rr.totlen = cpu_to_je32(sizeof(rr));
+	rr.hdr_crc = cpu_to_je32(crc32(0, &rr, sizeof(struct jffs2_unknown_node)-4));
+
+	rr.seqno = cpu_to_je32(ref->seqno);
+	rr.ino = cpu_to_je32(ref->ic->ino);
+	rr.xid = cpu_to_je32(ref->xd->xid);
+	rr.node_crc = cpu_to_je32(crc32(0, &rr, sizeof(struct jffs2_raw_xref)-4));
+
+	ret = jffs2_flash_write(c, phys_ofs, sizeof(rr), &length, (char *)&rr);
+	if (ret || sizeof(rr)!=length) {
+		printk(KERN_NOTICE "%s:%d Write of %zd bytes at 0x%08x failed. returned %d, retlen %zd\n",
+		       __FILE__, __LINE__, sizeof(rr), phys_ofs, ret, length);
+		ret = ret ? ret : -EIO;
+		if (length) {
+			raw->flash_offset |= REF_OBSOLETE;
+			raw->next_in_ino = NULL;
+			jffs2_add_physical_node_ref(c, raw);
+			jffs2_mark_node_obsolete(c, raw);
+		} else {
+			jffs2_free_raw_node_ref(raw);
+		}
+		return ret;
+	}
+	raw->flash_offset |= REF_PRISTINE;
+
+	jffs2_add_physical_node_ref(c, raw);
+	if (ref->node) {
+		ref->node->next_in_ino = NULL;
+		jffs2_mark_node_obsolete(c, ref->node);
+	}
+	ref->node = raw;
+
+	return 0;
+}
+
+static struct jffs2_xattr_ref *create_xattr_ref(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic,
+						struct jffs2_xattr_datum *xd, uint32_t phys_ofs)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_ref *ref;
+	int ret;
+
+	/* Duplication Check */
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		if (ref->xd == xd)
+			return ERR_PTR(-EINVAL);
+	}
+
+	ref = jffs2_alloc_xattr_ref();
+	if (!ref)
+		return ERR_PTR(-ENOMEM);
+	init_xattr_ref(ref);	/* class = RAWNODE_CLASS_XATTR_REF */
+	
+	ref->seqno = ++c->highest_xseqno;
+	ref->ic = ic;
+	ref->xd = xd;
+
+	ret = save_xattr_ref(c, ref, phys_ofs);
+	if (ret) {
+		jffs2_free_xattr_ref(ref);
+		return ERR_PTR(ret);
+	}
+
+	/* Chain to inode */
+	list_add(&ref->ilist, &ic->ilist);
+
+	return ref; /* success */
+}
+
+static void delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_datum *xd;
+
+	BUG_ON(!ref->node);
+	ref->node->next_in_ino = NULL;
+	jffs2_mark_node_obsolete(c, ref->node);
+
+	list_del(&ref->ilist);
+	xd = ref->xd;
+	xd->refcnt--;
+	if (!xd->refcnt)
+		delete_xattr_datum(c, xd);
+
+	jffs2_free_xattr_ref(ref);
+}
+
+void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	struct jffs2_xattr_ref *ref, *_ref;
+
+	if (!ic || ic->nlink > 0)
+		return;
+
+	down_write(&c->xattr_sem);
+	list_for_each_entry_safe(ref, _ref, &ic->ilist, ilist)
+		delete_xattr_ref(c, ref);
+	up_write(&c->xattr_sem);
+}
+
+void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	/* It's called from jffs2_free_ino_caches() */
+	struct jffs2_xattr_datum *xd;
+	struct jffs2_xattr_ref *ref, *_ref;
+
+	down_write(&c->xattr_sem);
+	list_for_each_entry_safe(ref, _ref, &ic->ilist, ilist) {
+		list_del(&ref->ilist);
+		xd = ref->xd;
+		xd->refcnt--;
+		if (!xd->refcnt) {
+			unload_xattr_datum(c, xd);
+			jffs2_free_xattr_datum(xd);
+		}
+		jffs2_free_xattr_ref(ref);
+	}
+	up_write(&c->xattr_sem);
+}
+
+static int do_check_xattr_ref_ilist(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	struct jffs2_xattr_ref *ref, *cmp;
+	int ret = 0;
+
+	down_write(&c->xattr_sem);
+ retry:
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		ret = load_xattr_datum_nolock(c, ref->xd);
+		if (ret)
+			goto out;
+		cmp = ref;
+		list_for_each_entry_continue(cmp, &ic->ilist, ilist) {
+			ret = load_xattr_datum_nolock(c, cmp->xd);
+			if (ret)
+				goto out;
+			if (ref->xd->xprefix == cmp->xd->xprefix
+			    && !strcmp(ref->xd->xname, cmp->xd->xname)) {
+				delete_xattr_ref(c, ref->seqno > cmp->seqno ? cmp : ref);
+				goto retry;
+			}
+		}
+	}
+ out:
+	up_write(&c->xattr_sem);
+
+	if (!ret)
+		ic->flags |= INO_FLAGS_XATTR_CHECKED;
+
+	return ret;
+}
+
+static inline int check_xattr_ref_ilist(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	if (likely(ic->flags & INO_FLAGS_XATTR_CHECKED))
+		return 0;
+	return do_check_xattr_ref_ilist(c, ic);
+}
+
+ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
+{
+	struct inode *inode = dentry->d_inode;
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_ref *ref;
+	struct jffs2_xattr_datum *xd;
+	struct xattr_handler *xhandle;
+	int len, ret;
+
+	ret = check_xattr_ref_ilist(c, ic);
+	if (unlikely(ret))
+		return ret;
+
+	down_read(&c->xattr_sem);
+	len = 0;
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		BUG_ON(ref->ic!=ic);
+		xd = ref->xd;
+		ret = load_xattr_datum(c, xd);
+		if (ret<0)
+			goto out;
+
+		xhandle = xprefix_to_handler(xd->xprefix);
+		if (!xhandle)
+			continue;
+
+		if (buffer) {
+			ret = xhandle->list(inode, buffer+len, size-len, xd->xname, xd->name_len);
+		} else {
+			ret = xhandle->list(inode, NULL, 0, xd->xname, xd->name_len);
+		}
+		if (ret < 0)
+			goto out;
+		len += ret;
+	}
+ out:
+	up_read(&c->xattr_sem);
+	return ret;
+}
+
+static int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
+			     char *buffer, size_t size)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_datum *xd;
+	struct jffs2_xattr_ref *ref;
+	int ret;
+
+	ret = check_xattr_ref_ilist(c, ic);
+	if (unlikely(ret))
+		return ret;
+
+	down_read(&c->xattr_sem);
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		BUG_ON(ref->ic!=ic);
+
+		xd = ref->xd;
+		if (xd->xprefix != xprefix)
+			continue;
+
+		ret = load_xattr_datum(c, xd);
+		if (ret)
+			goto out;
+
+		if (!strcmp(xname, xd->xname)) {
+			ret = xd->value_len;
+			if (buffer) {
+				if (size < ret) {
+					ret = -ERANGE;
+				} else {
+					memcpy(buffer, xd->xvalue, xd->value_len);
+				}
+			}
+			goto out;
+		}
+	}
+	ret = -ENODATA;
+ out:
+	up_read(&c->xattr_sem);
+	return ret;
+}
+
+static int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
+			     const char *buffer, size_t size, int flags)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_datum *xd;
+	struct jffs2_xattr_ref *ref, *nref;
+	uint32_t phys_ofs, length, request;
+	int ret;
+
+	ret = check_xattr_ref_ilist(c, ic);
+	if (unlikely(ret))
+		return ret;
+
+	request = PAD(sizeof(*xd) + strlen(xname) + 1 + size);
+	ret = jffs2_reserve_space(c, request, &phys_ofs, &length, ALLOC_NORMAL, JFFS2_SUMMARY_NOSUM_SIZE);
+	if (ret) {
+		printk(KERN_NOTICE "%s:%d jffs2_reserve_space()=%d length=%d request=%d at 0x%08x\n",
+		       __FILE__, __LINE__, ret, length, request, phys_ofs);
+		return ret;
+	}
+
+	/* Find existing xattr */
+	down_write(&c->xattr_sem);
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		xd = ref->xd;
+		if (xd->xprefix != xprefix)
+			continue;
+
+		ret = load_xattr_datum(c, xd);
+		if (ret)
+			goto out;
+
+		if (!strcmp(xd->xname, xname)) {
+			if (flags & XATTR_CREATE) {
+				ret = -EEXIST;
+				goto out;
+			}
+			goto found;
+		}
+	}
+	/* not found */
+	ref = NULL;
+	if (flags & XATTR_REPLACE) {
+		ret = -ENODATA;
+		goto out;
+	}
+	if (!buffer) {
+		ret = -EINVAL;
+		goto out;
+	}
+ found:
+	xd = create_xattr_datum(c, xprefix, xname, buffer, size, phys_ofs);
+	if (IS_ERR(xd)) {
+		ret = PTR_ERR(xd);
+		goto out;
+	}
+	up_write(&c->xattr_sem);
+	jffs2_complete_reservation(c);
+
+	/* create xattr_ref */
+	request = PAD(sizeof(*nref));
+	ret = jffs2_reserve_space(c, request, &phys_ofs, &length, ALLOC_NORMAL, JFFS2_SUMMARY_NOSUM_SIZE);
+	if (ret) {
+		printk(KERN_NOTICE "%s:%d jffs2_reserve_space()=%d length=%d request=%d at 0x%08x\n",
+		       __FILE__, __LINE__, ret, length, request, phys_ofs);
+		down_write(&c->xattr_sem);
+		xd->refcnt--;
+		if (!xd->refcnt)
+			delete_xattr_datum(c, xd);
+		up_write(&c->xattr_sem);
+		return ret;
+	}
+	down_write(&c->xattr_sem);
+	nref = create_xattr_ref(c, ic, xd, phys_ofs);
+	if (IS_ERR(nref)) {
+		ret = PTR_ERR(nref);
+		xd->refcnt--;
+		if (!xd->refcnt)
+			delete_xattr_datum(c, xd);
+		goto out;
+	} else if (ref) {
+		/* If replaced xattr_ref exists */
+		delete_xattr_ref(c, ref);
+	}
+ out:
+	up_write(&c->xattr_sem);
+	jffs2_complete_reservation(c);
+
+	return ret;
+}
+
+static int jffs2_garbage_collect_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_write(xattr_sem), and called from GC thread */
+	uint32_t phys_ofs, totlen, length;
+	int ret;
+
+	BUG_ON(!xd->node);
+
+	totlen = ref_totlen(c, c->gcblock, xd->node);
+	if (totlen < sizeof(struct jffs2_raw_xattr))
+		return -EINVAL;
+
+	ret = jffs2_reserve_space_gc(c, totlen, &phys_ofs, &length, JFFS2_SUMMARY_NOSUM_SIZE);
+	if (ret || length < totlen) {
+		printk(KERN_WARNING "jffs2_reserve_space_gc() = %d "
+				    "request: %d byte reserved: %d byte",
+				    ret, totlen, length);
+		return ret ? ret : -EBADFD;
+	}
+
+	ret = load_xattr_datum_nolock(c, xd);
+	if (!ret)
+		ret = save_xattr_datum(c, xd, phys_ofs);
+
+	return ret;
+}
+
+
+static int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
+{
+	/* must be called under down(alloc_sem) */
+	uint32_t phys_ofs, totlen, length;
+	int ret;
+
+	BUG_ON(!ref->node);
+
+	totlen = ref_totlen(c, c->gcblock, ref->node);
+	if (totlen != sizeof(struct jffs2_raw_xref))
+		return -EINVAL;
+
+	ret = jffs2_reserve_space_gc(c, totlen, &phys_ofs, &length, JFFS2_SUMMARY_NOSUM_SIZE);
+	if (ret || length < totlen) {
+		printk(KERN_WARNING "jffs2_reserve_space_gc() = %d"
+		       " request: %d byte reserved: %d byte", ret, totlen, length);
+		return ret ? ret : -EBADFD;
+	}
+
+	ret = save_xattr_ref(c, ref, phys_ofs);
+
+	return ret;
+}
+
+int jffs2_garbage_collect_xattr(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	struct jffs2_xattr_datum *xd;
+	struct jffs2_xattr_ref *ref;
+	int ret;
+
+	switch (ic->class) {
+	case RAWNODE_CLASS_XATTR_DATUM:
+		spin_unlock(&c->erase_completion_lock);
+
+		down_write(&c->xattr_sem);
+		xd = (struct jffs2_xattr_datum *)ic;
+		ret = xd ? jffs2_garbage_collect_xattr_datum(c, xd) : 0;
+		up_write(&c->xattr_sem);
+		break;
+	case RAWNODE_CLASS_XATTR_REF:
+		spin_unlock(&c->erase_completion_lock);
+
+		down_write(&c->xattr_sem);
+		ref = (struct jffs2_xattr_ref *)ic;
+		ret = ref ? jffs2_garbage_collect_xattr_ref(c, ref) : 0;
+		up_write(&c->xattr_sem);
+		break;
+	default:
+		/* This node is not xattr_datum/xattr_ref */
+		ret = 1;
+		break;
+	}
+	return ret;
+}
diff -prNU3 mtd-0927/fs/jffs2/xattr.h mtd-0927.xattr/fs/jffs2/xattr.h
--- mtd-0927/fs/jffs2/xattr.h	1969-12-31 19:00:00.000000000 -0500
+++ mtd-0927.xattr/fs/jffs2/xattr.h	2005-09-26 19:41:26.000000000 -0400
@@ -0,0 +1,137 @@
+/*-------------------------------------------------------------------------*
+ *  File: fs/jffs2/xattr.c
+ *  XATTR support on JFFS2 FileSystem
+ *
+ *  Implemented by KaiGai Kohei <kaigai@ak.jp.nec.com>
+ *  Copyright (C) 2005 NEC Corporation
+ *
+ *  For licensing information, see the file 'LICENCE' in the jffs2 directory.
+ *-------------------------------------------------------------------------*/
+
+#ifndef _JFFS2_FS_XATTR_H_
+#define _JFFS2_FS_XATTR_H_
+
+#include <linux/xattr.h>
+
+#define XATTRINDEX_HASHSIZE (57)
+#define XATTR_USER_PREFIX		"user."
+#define XATTR_TRUSTED_PREFIX		"trusted."
+
+#define JFFS2_XPREFIX_USER		1	/* for "user.*" */
+#define JFFS2_XPREFIX_SECURITY		2	/* for "security.*" */
+#define JFFS2_XPREFIX_ACL_ACCESS	3	/* for "system.posix_acl_access" */
+#define JFFS2_XPREFIX_ACL_DEFAULT	4	/* for "system.posix_acl_default" */
+#define JFFS2_XPREFIX_TRUSTED		5	/* for "trusted.*" */
+#define JFFS2_XPREFIX_INVALID		6
+
+#define JFFS2_XDATUM_FLAGS_HOT		0x01	/* This is hot xattr_datum */
+
+#define RAWNODE_CLASS_INODE_CACHE	0
+#define RAWNODE_CLASS_XATTR_DATUM	1
+#define RAWNODE_CLASS_XATTR_REF		2
+
+struct jffs2_xattr_datum
+{
+	void *always_null;
+	u8 class;
+	u8 flags;
+	u16 xprefix;			/* see JFFS2_XATTR_PREFIX_* */
+
+	struct jffs2_raw_node_ref *node;
+	struct list_head xindex;	/* chained from c->xattrindex[n] */
+	uint32_t refcnt;		/* # of xattr_ref refers this */
+	uint32_t xid;
+
+	uint32_t data_crc;
+	uint32_t hashkey;
+	char *xname;		/* XATTR name without prefix */
+	uint32_t name_len;	/* length of xname */
+	char *xvalue;		/* XATTR value */
+	uint32_t value_len;	/* length of xvalue */
+};
+
+struct jffs2_inode_cache;	/* forward refence */
+struct jffs2_xattr_ref
+{
+	void *always_null;
+	u8 class;
+	u8 flags;		/* Currently unused */
+	u16 unused;
+
+	uint32_t seqno;
+	struct jffs2_raw_node_ref *node;
+	union {
+		struct jffs2_inode_cache *ic;	/* reference to jffs2_inode_cache */
+		uint32_t ino;			/* only used in scanning/building  */
+	};
+	union {
+		struct jffs2_xattr_datum *xd;	/* reference to jffs2_xattr_datum */
+		uint32_t xid;			/* only used in sccanning/building */
+	};
+	struct list_head ilist;			/* chained from ic->ilist */
+};
+
+#ifdef CONFIG_JFFS2_XATTR
+
+extern int jffs2_init_xattr_subsystem(struct jffs2_sb_info *c);
+extern void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c);
+extern void jffs2_clear_xattr_subsystem(struct jffs2_sb_info *c);
+
+extern struct jffs2_xattr_datum *jffs2_find_xattr_datum(struct jffs2_sb_info *c, uint32_t xid);
+extern void jffs2_attach_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd);
+
+extern void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
+extern void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
+extern int jffs2_garbage_collect_xattr(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
+
+extern struct xattr_handler *jffs2_xattr_handlers[];
+#define jffs2_permission	NULL
+extern ssize_t jffs2_listxattr(struct dentry *, char *, size_t);
+#define jffs2_getxattr		generic_getxattr
+#define jffs2_setxattr		generic_setxattr
+#define jffs2_removexattr	generic_removexattr
+
+/*---- Any inline initialize functions ----*/
+#define init_xattr_inode_cache(x) INIT_LIST_HEAD(&((x)->ilist))
+
+static inline void init_xattr_datum(struct jffs2_xattr_datum *xd)
+{
+	memset(xd, 0, sizeof(struct jffs2_xattr_datum));
+	xd->class = RAWNODE_CLASS_XATTR_DATUM;
+	INIT_LIST_HEAD(&xd->xindex);
+}
+
+static inline void init_xattr_ref(struct jffs2_xattr_ref *ref)
+{
+	memset(ref, 0, sizeof(struct jffs2_xattr_ref));
+	ref->class = RAWNODE_CLASS_XATTR_REF;
+	INIT_LIST_HEAD(&ref->ilist);
+}
+
+#else
+
+static inline int jffs2_init_xattr_subsystem(struct jffs2_sb_info *c) { return 0; }
+static inline void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c) {}
+static inline void jffs2_clear_xattr_subsystem(struct jffs2_sb_info *c) {}
+
+static inline void *jffs2_find_xattr_datum(void *c, uint32_t xid) { return NULL; }
+static inline void jffs2_attach_xattr_datum(void *c, void *xd) {}
+
+static inline void jffs2_xattr_delete_inode(void *c, void *ic) {}
+static inline void jffs2_xattr_free_inode(void *c, void *ic) {}
+static inline int jffs2_garbage_collect_xattr(void *c, void *ic) { return 1; }
+
+#define jffs2_xattr_handlers	NULL
+#define jffs2_permission	NULL
+#define jffs2_listxattr		NULL
+#define jffs2_getxattr		NULL
+#define jffs2_setxattr		NULL
+#define jffs2_removexattr	NULL
+
+#define init_xattr_inode_cache(x)
+static inline void init_xattr_datum(void *xd) {}
+static inline void init_xattr_ref(void *ref) {}
+
+#endif /* CONFIG_JFFS2_XATTR */
+
+#endif /* _JFFS2_FS_XATTR_H_ */
diff -prNU3 mtd-0927/include/linux/jffs2.h mtd-0927.xattr/include/linux/jffs2.h
--- mtd-0927/include/linux/jffs2.h	2005-09-26 07:37:23.000000000 -0400
+++ mtd-0927.xattr/include/linux/jffs2.h	2005-09-26 19:11:10.000000000 -0400
@@ -65,6 +65,9 @@
 
 #define JFFS2_NODETYPE_SUMMARY (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 6)
 
+#define JFFS2_NODETYPE_XATTR (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 8)
+#define JFFS2_NODETYPE_XREF (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 9)
+
 // Maybe later...
 //#define JFFS2_NODETYPE_CHECKPOINT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
 //#define JFFS2_NODETYPE_OPTIONS (JFFS2_FEATURE_RWCOMPAT_COPY | JFFS2_NODE_ACCURATE | 4)
@@ -151,6 +154,32 @@ struct jffs2_raw_inode
 	uint8_t data[0];
 } __attribute__((packed));
 
+struct jffs2_raw_xattr {
+	jint16_t magic;
+	jint16_t nodetype;	/* = JFFS2_NODETYPE_XATTR */
+	jint32_t totlen;
+	jint32_t hdr_crc;
+	jint32_t xid;		/* XATTR identifier number */
+	uint8_t xprefix;
+	uint8_t name_len;
+	jint16_t value_len;
+	jint32_t data_crc;
+	jint32_t node_crc;
+	uint8_t data[0];
+} __attribute__((packed));
+
+struct jffs2_raw_xref
+{
+	jint16_t magic;
+	jint16_t nodetype;	/* = JFFS2_NODETYPE_XREF */
+	jint32_t totlen;
+	jint32_t hdr_crc;
+	jint32_t seqno;		/* sequencial number */
+	jint32_t ino;		/* inode number */
+	jint32_t xid;		/* XATTR identifier number */
+	jint32_t node_crc;
+} __attribute__((packed));
+
 struct jffs2_raw_summary
 {
 	jint16_t magic;
@@ -169,6 +198,8 @@ union jffs2_node_union 
 {
 	struct jffs2_raw_inode i;
 	struct jffs2_raw_dirent d;
+	struct jffs2_raw_xattr x;
+	struct jffs2_raw_xref r;
 	struct jffs2_raw_summary s;
 	struct jffs2_unknown_node u;
 };
diff -prNU3 mtd-0927/include/linux/jffs2_fs_sb.h mtd-0927.xattr/include/linux/jffs2_fs_sb.h
--- mtd-0927/include/linux/jffs2_fs_sb.h	2005-09-21 09:37:34.000000000 -0400
+++ mtd-0927.xattr/include/linux/jffs2_fs_sb.h	2005-09-26 19:06:31.000000000 -0400
@@ -115,6 +115,14 @@ struct jffs2_sb_info {
 
 	struct jffs2_summary *summary;		/* Summary information */
 
+#ifdef CONFIG_JFFS2_XATTR
+	uint32_t highest_xseqno;
+	struct list_head *xattrindex;
+#define xattr_temp xattrindex[XATTRINDEX_HASHSIZE]
+	struct rw_semaphore xattr_sem;
+	uint32_t xdatum_mem_usage;
+	uint32_t xdatum_mem_threshold;
+#endif
 	/* OS-private pointer for getting back to master superblock info */
 	void *os_priv;
 };

--------------080001040805010002060304
Content-Type: text/x-patch;
 name="jffs2_xattr_scan.c-cleanup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2_xattr_scan.c-cleanup.patch"

--- cleanup-scan.c	2005-09-25 03:48:35.000000000 -0400
+++ cleanup-scan.xattr.c	2005-09-25 03:53:16.000000000 -0400
@@ -337,6 +337,139 @@ static int jffs2_scan_dirent_node(struct
 	return 0;
 }
 
+#ifdef CONFIG_JFFS2_XATTR
+static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				 struct jffs2_raw_xattr *rx, uint32_t ofs)
+{
+	struct jffs2_xattr_datum *xd;
+	struct jffs2_raw_node_ref *raw;
+	uint32_t crc;
+
+	crc = crc32(0, rx, sizeof(struct jffs2_raw_xattr)-8);
+	if (crc != je32_to_cpu(rx->node_crc)) {
+		printk(KERN_NOTICE "%s node CRC failed on node at 0x%08x: "
+		       "Read 0x%08x, calculated 0x%08x\n",
+		       __FUNCTION__, ofs, je32_to_cpu(rx->node_crc), crc);
+		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
+		return 0;
+	}
+
+	xd = jffs2_find_xattr_datum(c, je32_to_cpu(rx->xid));
+	if (xd) {
+		printk(KERN_NOTICE "%s() duplicate xid=%u found. "
+		       "on node at 0x%08x, later one is ignored.\n",
+		       __FUNCTION__, je32_to_cpu(rx->xid), ofs);
+		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
+		return 0;
+	}
+
+	crc = crc32(0, rx->data, rx->name_len + 1 + je16_to_cpu(rx->value_len));
+	if (crc != je32_to_cpu(rx->data_crc)) {
+		printk(KERN_NOTICE "%s data CRC failed on node at 0x%08x: "
+		       "Read 0x%08x, calculated 0x%08x\n",
+		       __FUNCTION__, ofs, je32_to_cpu(rx->node_crc), crc);
+		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
+		return 0;
+	}
+
+	xd = jffs2_alloc_xattr_datum();
+	if (!xd)
+		return -ENOMEM;
+	init_xattr_datum(xd);
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw) {
+		jffs2_free_xattr_datum(xd);
+		return -ENOMEM;
+	}
+
+	xd->xid = je32_to_cpu(rx->xid);
+	if (xd->xid > c->highest_xseqno)
+		c->highest_xseqno = xd->xid;
+	xd->xprefix = rx->xprefix;	/* 8bit width */
+	xd->name_len = rx->name_len;	/* 8bit width */
+	xd->value_len = je16_to_cpu(rx->value_len);
+	xd->data_crc = je32_to_cpu(rx->data_crc);
+	xd->node = raw;
+
+	raw->__totlen = PAD(je32_to_cpu(rx->totlen));
+	raw->flash_offset = ofs | REF_PRISTINE;
+	raw->next_phys = NULL;
+	raw->next_in_ino = (void *)xd;
+	if (!jeb->first_node)
+		jeb->first_node = raw;
+	if (jeb->last_node)
+		jeb->last_node->next_phys = raw;
+	jeb->last_node = raw;
+
+	used_space(c, jeb, je32_to_cpu(rx->totlen));
+
+	jffs2_attach_xattr_datum(c, xd);
+
+	return 0;
+}
+
+static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				struct jffs2_raw_xref *rr, uint32_t ofs)
+{
+	struct jffs2_xattr_ref *ref;
+	struct jffs2_raw_node_ref *raw;
+	uint32_t crc;
+
+	crc = crc32(0, rr, sizeof(*rr)-4);
+	if (crc != je32_to_cpu(rr->node_crc)) {
+		printk(KERN_NOTICE "%s node CRC failed on node at 0x%08x: "
+		       "Read 0x%08x, calculated 0x%08x\n",
+		       __FUNCTION__, ofs, je32_to_cpu(rr->node_crc), crc);
+		dirty_space(c, jeb, je32_to_cpu(rr->totlen));
+		return 0;
+	}
+
+	ref = jffs2_alloc_xattr_ref();
+	if (!ref)
+		return -ENOMEM;
+	init_xattr_ref(ref);
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw) {
+		jffs2_free_xattr_ref(ref);
+		return -ENOMEM;
+	}
+
+	/* BEFORE jffs2_build_xattr_subsystem() called, 
+	 * ref->xid is used to store 32bit xid, xd is not used
+	 * ref->ino is used to store 32bit inode-number, ic is not used
+	 * Thoes variables are declared as union, thus using those
+	 * are exclusive. In a similar way, ref->ilist is temporarily
+	 * used to chain all xattr_ref object. It's re-chained to
+	 * jffs2_inode_cache in jffs2_build_xattr_subsystem() correctly.
+	 */
+
+	ref->seqno = je32_to_cpu(rr->seqno);
+	if (ref->seqno > c->highest_xseqno)
+		c->highest_xseqno = ref->seqno;
+	ref->ino = je32_to_cpu(rr->ino);
+	ref->xid = je32_to_cpu(rr->xid);
+	ref->node = raw;
+
+	raw->__totlen = PAD(je32_to_cpu(rr->totlen));
+	raw->flash_offset = ofs | REF_PRISTINE;
+	raw->next_phys = NULL;
+	raw->next_in_ino = (void *)ref;
+	if (!jeb->first_node)
+		jeb->first_node = raw;
+	if (jeb->last_node)
+		jeb->last_node->next_phys = raw;
+	jeb->last_node = raw;
+
+	used_space(c, jeb, je32_to_cpu(rr->totlen));
+
+	list_add_tail(&ref->ilist, &c->xattr_temp);
+
+	return 0;
+}
+#endif /* CONFIG_JFFS2_XATTR */
+
 
 static int cleanmarkerfound;
 static int jffs2_nand_initial_scan(struct jffs2_sb *c,
@@ -510,6 +643,20 @@ static int jffs2_scan_eraseblock(struct 
 				return ret;
 			ofs += PAD(je32_to_cpu(node->totlen));
 			break;
+#ifdef CONFIG_JFFS2_XATTR
+		case JFFS2_NODETYPE_XATTR:
+			ret = jffs2_scan_xattr_node(c, jeb, (void *)node, ofs);
+			if (ret)
+				return ret;
+			ofs += PAD(je32_to_cpu(node->totlen));
+			break;
+		case JFFS2_NODETYPE_XREF:
+			ret = jffs2_scan_xref_node(c, jeb, (void *)node, ofs);
+			if (ret)
+				return ret;
+			ofs += PAD(je32_to_cpu(node->totlen));
+			break;
+#endif /* CONFIG_JFFS2_XATR */
 		case JFFS2_NODETYPE_PADDING:
 			ofs += dirty_space(c, jeb, je32_to_cpu(node->totlen));
 			break;

--------------080001040805010002060304--

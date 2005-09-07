Received: from tyo201.gate.nec.co.jp ([202.32.8.214])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ECsGy-00043J-9v
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2005 01:15:19 -0400
Message-ID: <431E772B.9090004@ak.jp.nec.com>
Date: Wed, 07 Sep 2005 14:14:19 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <430AF95F.1050704@ak.jp.nec.com>	<20050823124649.GB30853@wohnheim.fh-wedel.de>	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
	<430C429B.6040500@ak.jp.nec.com>
In-Reply-To: <430C429B.6040500@ak.jp.nec.com>
Content-Type: multipart/mixed; boundary="------------010008010200080200080001"
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
--------------010008010200080200080001
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

This attached patch enables XATTR support in JFFS2. (take-2)
# The contribution has slowed due to the trouble related to GC :-(

The my first patch posted in Aug 23 is revised at the points as follows.

- get/setxattr are implemented as a method of generic XATTR handler.
- new methods for "user.*" and "trusted.*" prefix were added.

- Time to retrieve the duplicate XATTR-cache shortened, when setxattr().
   In first implementation, we must scan all XATTR-cache to find the duplicate
   one, and it's so expensive. Now, we cau use the hash-list of XATTR-cache
   which is indexed by own contents.

- Now, Garbage Collector can deal JFFS2_NODETYPE_XATTR and JFFS2_NODETYPE_XREF.
   It seems to me that GC can mark unconditionally any nodes without inode
   as obsolete. But new JFFS2_NODETYPE_XATTR/XREF should be an exception.
   GC must not mark them as obsolete, although their "next_in_ino" is NULL.

   ----[ jffs2_garbage_collect_pass() in gc.c ]------------------------
   249  if (!raw->next_in_ino) {       <-- unconditionally mark it as obsolete.
   250      /* Inode-less node. Clean marker, snapshot or something like that */
   251      /* FIXME: If it's something that needs to be copied, including something
   252         we don't grok that has JFFS2_NODETYPE_RWCOMPAT_COPY, we should do so */
   253      spin_unlock(&c->erase_completion_lock);
   254      jffs2_mark_node_obsolete(c, raw);
   255      up(&c->alloc_sem);
   256      goto eraseit_lock;
   257  }
   --------------------------------------------------------------------

   I added a new variable 'owner' into jffs2_raw_node_ref to resolve this.
   It refers jffs2_xattr_cache or jffs2_xattr_ref object when raw-node reflect
   XATTR-node. Thus, we can distinguish XATTR-node and others by whether 'owner'
   is NULL or not.

- Consistency has improved.
   check_xattr_ref_ilist() checks XATTRs which are binded to same inode.
   If multiple XATTR has same name exist, older one is marked as obsolete.
   In first implementation, there are possibilities to be created multiple
   XATTRs have same name in an inode, when system-crash happens durling setxattr()

The remaining work is as follows:
  - Test & Stabilization.
  - The implementation for POSIX ACL support.
  - The implementation for XATTR support in mkfs.jffs2.

Signed-off-by: KaiGai Kohei <kaigai@ak.jp.nec.com>

Thanks,
-- 
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>

--------------010008010200080200080001
Content-Type: text/x-patch;
 name="jffs2_xattr_take-2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2_xattr_take-2.patch"

diff -rpNU3 mtd-0829/fs/Kconfig mtd-0829.xattr/fs/Kconfig
--- mtd-0829/fs/Kconfig	2005-05-09 18:00:10.000000000 -0400
+++ mtd-0829.xattr/fs/Kconfig	2005-09-06 10:30:52.000000000 -0400
@@ -64,6 +64,22 @@ config JFFS2_FS_WRITEBUFFER
 	    - NOR flash with transparent ECC
 	    - DataFlash
 
+config JFFS2_XATTR
+	bool "JFFS2 XATTR support (EXPERIMENTAL)"
+	depends on JFFS2_FS
+	default n
+	help
+	  This enables the XATTR support in JFFS2.
+	  
+	  It's neccesary for persistent security context in SELinux.
+	  Now, we can use the following kinds of prefix.
+	  
+	  - security.*
+	  - user.*
+	  - trust.*
+	  
+	  - system.posix_acl_{access|default} are in TODO list now.
+
 config JFFS2_COMPRESSION_OPTIONS
 	bool "Advanced compression options for JFFS2"
 	default n
diff -rpNU3 mtd-0829/fs/jffs2/Makefile.common mtd-0829.xattr/fs/jffs2/Makefile.common
--- mtd-0829/fs/jffs2/Makefile.common	2005-07-17 18:00:13.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/Makefile.common	2005-09-06 10:31:26.000000000 -0400
@@ -12,6 +12,7 @@ jffs2-y	+= symlink.o build.o erase.o bac
 jffs2-y	+= super.o debug.o
 
 jffs2-$(CONFIG_JFFS2_FS_WRITEBUFFER)	+= wbuf.o
+jffs2-$(CONFIG_JFFS2_XATTR)	+= xattr.o
 jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
 jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
 jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
diff -rpNU3 mtd-0829/fs/jffs2/build.c mtd-0829.xattr/fs/jffs2/build.c
--- mtd-0829/fs/jffs2/build.c	2005-07-30 18:00:11.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/build.c	2005-09-06 10:28:53.000000000 -0400
@@ -165,6 +165,7 @@ static int jffs2_build_filesystem(struct
 		ic->scan_dents = NULL;
 		cond_resched();
 	}
+	jffs2_build_xattr_caches(c);
 	c->flags &= ~JFFS2_SB_FLAG_BUILDING;
 	
 	D1(printk(KERN_DEBUG "Pass 3 complete\n"));
@@ -184,6 +185,7 @@ exit:
 				jffs2_free_full_dirent(fd);
 			}
 		}
+		jffs2_clear_xattr_caches(c);
 	}
 
 	return ret;
diff -rpNU3 mtd-0829/fs/jffs2/dir.c mtd-0829.xattr/fs/jffs2/dir.c
--- mtd-0829/fs/jffs2/dir.c	2005-08-17 18:00:11.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/dir.c	2005-09-06 10:28:53.000000000 -0400
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
diff -rpNU3 mtd-0829/fs/jffs2/file.c mtd-0829.xattr/fs/jffs2/file.c
--- mtd-0829/fs/jffs2/file.c	2005-07-06 18:00:13.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/file.c	2005-09-06 10:28:53.000000000 -0400
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
diff -rpNU3 mtd-0829/fs/jffs2/fs.c mtd-0829.xattr/fs/jffs2/fs.c
--- mtd-0829/fs/jffs2/fs.c	2005-08-06 18:00:16.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/fs.c	2005-09-06 10:28:53.000000000 -0400
@@ -217,6 +217,8 @@ void jffs2_clear_inode (struct inode *in
 	
 	D1(printk(KERN_DEBUG "jffs2_clear_inode(): ino #%lu mode %o\n", inode->i_ino, inode->i_mode));
 
+	if (f->inocache && !f->inocache->nlink)
+		jffs2_xattr_clear_inode(c, f->inocache);
 	jffs2_do_clear_inode(c, f);
 }
 
@@ -504,6 +506,9 @@ int jffs2_do_fill_super(struct super_blo
 	}
 	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *));
 
+	if ((ret = jffs2_init_xattr_caches(c)))
+		goto out_inohash;
+
 	if ((ret = jffs2_do_mount_fs(c)))
 		goto out_inohash;
 
@@ -537,6 +542,7 @@ int jffs2_do_fill_super(struct super_blo
 		vfree(c->blocks);
 	else
 		kfree(c->blocks);
+	jffs2_clear_xattr_caches(c);
  out_inohash:
 	kfree(c->inocache_list);
  out_wbuf:
diff -rpNU3 mtd-0829/fs/jffs2/gc.c mtd-0829.xattr/fs/jffs2/gc.c
--- mtd-0829/fs/jffs2/gc.c	2005-08-17 18:00:12.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/gc.c	2005-09-06 10:28:53.000000000 -0400
@@ -251,7 +251,12 @@ int jffs2_garbage_collect_pass(struct jf
 		/* FIXME: If it's something that needs to be copied, including something
 		   we don't grok that has JFFS2_NODETYPE_RWCOMPAT_COPY, we should do so */
 		spin_unlock(&c->erase_completion_lock);
-		jffs2_mark_node_obsolete(c, raw);
+		if (raw->owner) {
+			/* JFFS2_NODETYPE_XATTR or JFFS2_NODETYPE_XREF */
+			ret = jffs2_garbage_collect_xattr(c, raw);
+		} else {
+			jffs2_mark_node_obsolete(c, raw);
+		}
 		up(&c->alloc_sem);
 		goto eraseit_lock;
 	}
diff -rpNU3 mtd-0829/fs/jffs2/malloc.c mtd-0829.xattr/fs/jffs2/malloc.c
--- mtd-0829/fs/jffs2/malloc.c	2005-07-27 18:00:18.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/malloc.c	2005-09-06 10:28:53.000000000 -0400
@@ -26,6 +26,10 @@ static kmem_cache_t *tmp_dnode_info_slab
 static kmem_cache_t *raw_node_ref_slab;
 static kmem_cache_t *node_frag_slab;
 static kmem_cache_t *inode_cache_slab;
+#ifdef CONFIG_JFFS2_XATTR
+static kmem_cache_t *xattr_cache_slab;
+static kmem_cache_t *xattr_ref_slab;
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
+	xattr_cache_slab = kmem_cache_create("jffs2_xattr_cache",
+					     sizeof(struct jffs2_xattr_cache),
+					     0, 0, NULL, NULL);
+	if (!xattr_cache_slab)
+		goto err;
+
+	xattr_ref_slab = kmem_cache_create("jffs2_xattr_ref",
+					   sizeof(struct jffs2_xattr_ref),
+					   0, 0, NULL, NULL);
+	if (!xattr_ref_slab)
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
+	if(xattr_cache_slab)
+		kmem_cache_destroy(xattr_cache_slab);
+	if(xattr_ref_slab)
+		kmem_cache_destroy(xattr_ref_slab);
+#endif
 }
 
 struct jffs2_full_dirent *jffs2_alloc_full_dirent(int namesize)
@@ -169,6 +195,7 @@ struct jffs2_raw_node_ref *jffs2_alloc_r
 	struct jffs2_raw_node_ref *ret;
 	ret = kmem_cache_alloc(raw_node_ref_slab, GFP_KERNEL);
 	JFFS2_DBG_MEMALLOC("%p\n", ret);
+	memset(ret, 0, sizeof(*ret));	/* to guarantee owner==NULL */
 	return ret;
 }
 
@@ -205,3 +232,35 @@ void jffs2_free_inode_cache(struct jffs2
 	JFFS2_DBG_MEMALLOC("%p\n", x);
 	kmem_cache_free(inode_cache_slab, x);
 }
+
+#ifdef CONFIG_JFFS2_XATTR
+
+struct jffs2_xattr_cache *jffs2_alloc_xattr_cache(void)
+{
+	struct jffs2_xattr_cache *xc;
+	xc = kmem_cache_alloc(xattr_cache_slab, GFP_KERNEL);
+	JFFS2_DBG_MEMALLOC("%p\n", xc);
+	return xc;
+}
+
+void jffs2_free_xattr_cache(struct jffs2_xattr_cache *xc)
+{
+	JFFS2_DBG_MEMALLOC("%p\n", xc);
+	kmem_cache_free(xattr_cache_slab, xc);
+}
+
+struct jffs2_xattr_ref *jffs2_alloc_xattr_ref(void)
+{
+	struct jffs2_xattr_ref *ref;
+	ref = kmem_cache_alloc(xattr_ref_slab, GFP_KERNEL);
+	JFFS2_DBG_MEMALLOC("%p\n", ref);
+	return ref;
+}
+
+void jffs2_free_xattr_ref(struct jffs2_xattr_ref *ref)
+{
+	JFFS2_DBG_MEMALLOC("%p\n", ref);
+	kmem_cache_free(xattr_ref_slab, ref);
+}
+
+#endif
diff -rpNU3 mtd-0829/fs/jffs2/nodelist.c mtd-0829.xattr/fs/jffs2/nodelist.c
--- mtd-0829/fs/jffs2/nodelist.c	2005-08-22 18:00:15.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/nodelist.c	2005-09-06 10:28:53.000000000 -0400
@@ -934,6 +934,7 @@ void jffs2_free_ino_caches(struct jffs2_
 		this = c->inocache_list[i];
 		while (this) {
 			next = this->next;
+			jffs2_xattr_free_inode(c, this);
 			jffs2_free_inode_cache(this);
 			this = next;
 		}
diff -rpNU3 mtd-0829/fs/jffs2/nodelist.h mtd-0829.xattr/fs/jffs2/nodelist.h
--- mtd-0829/fs/jffs2/nodelist.h	2005-08-17 18:00:12.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/nodelist.h	2005-09-06 10:28:53.000000000 -0400
@@ -20,6 +20,7 @@
 #include <linux/jffs2.h>
 #include <linux/jffs2_fs_sb.h>
 #include <linux/jffs2_fs_i.h>
+#include <linux/jffs2_fs_x.h>
 
 #ifdef __ECOS
 #include "os-ecos.h"
@@ -80,6 +81,7 @@ struct jffs2_raw_node_ref
 	struct jffs2_raw_node_ref *next_phys;
 	uint32_t flash_offset;
 	uint32_t __totlen; /* This may die; use ref_totlen(c, jeb, ) below */
+	void *owner;
 };
 
         /* flash_offset & 3 always has to be zero, because nodes are
@@ -111,6 +113,10 @@ struct jffs2_inode_cache {
 	uint32_t ino;
 	int nlink;
 	int state;
+#ifdef CONFIG_JFFS2_XATTR
+	struct list_head ilist;
+	uint8_t ilist_checked;
+#endif
 };
 
 /* Inode states for 'state' above. We need the 'GC' state to prevent
@@ -367,6 +373,13 @@ void jffs2_free_node_frag(struct jffs2_n
 struct jffs2_inode_cache *jffs2_alloc_inode_cache(void);
 void jffs2_free_inode_cache(struct jffs2_inode_cache *);
 
+#ifdef CONFIG_JFFS2_XATTR
+struct jffs2_xattr_cache *jffs2_alloc_xattr_cache(void);
+void jffs2_free_xattr_cache(struct jffs2_xattr_cache *);
+struct jffs2_xattr_ref *jffs2_alloc_xattr_ref(void);
+void jffs2_free_xattr_ref(struct jffs2_xattr_ref *);
+#endif /* CONFIG_JFFS2_XATTR */
+
 /* gc.c */
 int jffs2_garbage_collect_pass(struct jffs2_sb_info *c);
 
diff -rpNU3 mtd-0829/fs/jffs2/readinode.c mtd-0829.xattr/fs/jffs2/readinode.c
--- mtd-0829/fs/jffs2/readinode.c	2005-08-17 18:00:12.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/readinode.c	2005-09-06 10:28:53.000000000 -0400
@@ -902,6 +902,7 @@ int jffs2_do_read_inode(struct jffs2_sb_
 		f->inocache->ino = f->inocache->nlink = 1;
 		f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
 		f->inocache->state = INO_STATE_READING;
+		initxattr_jffs2_inode_cache(f->inocache);
 		jffs2_add_ino_cache(c, f->inocache);
 	}
 	if (!f->inocache) {
diff -rpNU3 mtd-0829/fs/jffs2/scan.c mtd-0829.xattr/fs/jffs2/scan.c
--- mtd-0829/fs/jffs2/scan.c	2005-07-20 18:00:12.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/scan.c	2005-09-06 10:28:53.000000000 -0400
@@ -57,6 +57,12 @@ static int jffs2_scan_inode_node(struct 
 				 struct jffs2_raw_inode *ri, uint32_t ofs);
 static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				 struct jffs2_raw_dirent *rd, uint32_t ofs);
+#ifdef CONFIG_JFFS2_XATTR
+static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				 struct jffs2_raw_xattr *rx, uint32_t ofs);
+static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				struct jffs2_raw_xref *rr, uint32_t ofs);
+#endif
 
 #define BLK_STATE_ALLFF		0
 #define BLK_STATE_CLEAN		1
@@ -552,7 +558,40 @@ scan_more:	
 			if (err) return err;
 			ofs += PAD(je32_to_cpu(node->totlen));
 			break;
-
+#ifdef CONFIG_JFFS2_XATTR
+		case JFFS2_NODETYPE_XATTR:
+			if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
+				buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
+				D1(printk(KERN_DEBUG "Fewer than %d bytes (xattr node) left to end of buf."
+				          " Reading 0x%x at 0x%08x\n",je32_to_cpu(node->totlen), buf_len, ofs));
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
+				buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
+				D1(printk(KERN_DEBUG "Fewer than %d bytes (xref node) left to end of buf."
+				          " Reading 0x%x at 0x%08x\n",je32_to_cpu(node->totlen), buf_len, ofs));
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
+#endif
 		case JFFS2_NODETYPE_CLEANMARKER:
 			D1(printk(KERN_DEBUG "CLEANMARKER node found at 0x%08x\n", ofs));
 			if (je32_to_cpu(node->totlen) != c->cleanmarker_size) {
@@ -665,6 +704,7 @@ static struct jffs2_inode_cache *jffs2_s
 
 	ic->ino = ino;
 	ic->nodes = (void *)ic;
+	initxattr_jffs2_inode_cache(ic);
 	jffs2_add_ino_cache(c, ic);
 	if (ino == 1)
 		ic->nlink = 1;
@@ -820,6 +860,190 @@ static int jffs2_scan_dirent_node(struct
 	return 0;
 }
 
+#ifdef CONFIG_JFFS2_XATTR
+static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				 struct jffs2_raw_xattr *rx, uint32_t ofs)
+{
+	struct jffs2_raw_node_ref *raw;
+	struct jffs2_xattr_cache *xc;
+	uint32_t crc;
+	int xtype, nlen, vlen;
+
+	crc = crc32(0, rx, sizeof(*rx)-8);
+	if (crc != je32_to_cpu(rx->node_crc)) {
+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Node CRC failed"
+		       " on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+		       ofs, je32_to_cpu(rx->node_crc), crc);
+		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
+		return 0;
+	}
+
+	nlen = JFFS2_XATTR_NAMELEN(je32_to_cpu(rx->length));
+	vlen = JFFS2_XATTR_VALUELEN(je32_to_cpu(rx->length));
+	if (je32_to_cpu(rx->totlen) != sizeof(*rx)+PAD(nlen+1)+PAD(vlen)) {
+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): length mimatch!"
+		       " totlen=%d length=0x%08x nlen=%d vlen=%d on 0x%08x\n",
+		       je32_to_cpu(rx->totlen), je32_to_cpu(rx->length), nlen, vlen, ofs);
+		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
+		return 0;
+	}
+
+	crc = crc32(0, rx->data, PAD(nlen+1)+PAD(vlen));
+	if (crc != je32_to_cpu(rx->data_crc)) {
+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Data CRC failed"
+		       " on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+		       ofs, je32_to_cpu(rx->data_crc), crc);
+		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
+		return 0;
+	}
+
+	xc = jffs2_find_xattr_cache_xid(c, je32_to_cpu(rx->xid));
+	if (xc) {
+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Duplicate XID Found"
+		       " on node at 0x%08x XID=%d Later one ignored\n", ofs, xc->xid);
+		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
+		return 0;
+	}
+
+	xtype = jffs2_xattr_prefix_to_xtype(rx->data, nlen);
+	if (JFFS2_XATTRTYPE_INVALID==xtype) {
+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Unsupported xattr type"
+		       " on node at 0x%08x\n", ofs);
+		USED_SPACE(PAD(je32_to_cpu(rx->totlen)));
+		return 0;
+	}
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw)
+		return -ENOMEM;
+
+	xc = jffs2_alloc_xattr_cache();
+	if (!xc) {
+		jffs2_free_raw_node_ref(raw);
+		return -ENOMEM;
+	}
+	initxattr_jffs2_xattr_cache(xc);
+
+	xc->xid = je32_to_cpu(rx->xid);
+	if (xc->xid > c->highest_xid)
+		c->highest_xid = xc->xid;
+	xc->xtype = xtype;
+	xc->node = raw;
+	xc->name_len = nlen;
+	xc->value_len = vlen;
+	xc->data_crc = crc;
+
+	raw->__totlen = PAD(je32_to_cpu(rx->totlen));
+	raw->flash_offset = ofs | REF_PRISTINE;
+	raw->next_phys = NULL;
+	raw->next_in_ino = NULL;
+	if (!jeb->first_node)
+		jeb->first_node = raw;
+	if (jeb->last_node)
+		jeb->last_node->next_phys = raw;
+	jeb->last_node = raw;
+	USED_SPACE(PAD(je32_to_cpu(rx->totlen)));
+
+	jffs2_attach_xattr_cache(c, xc);
+
+	D1(printk(KERN_NOTICE "XATTR_CACHE: XID=%d inserted\n", xc->xid));
+	return 0;
+}
+
+static inline int jffs2_scan_xref_node_helper(struct jffs2_sb_info *c,
+			struct jffs2_xattr_ref *new, struct jffs2_xattr_ref *old)
+{
+	/* (uint32_t)new->xc == (uint32_t)old->xc has been made sure. */
+	if ((uint32_t)new->ic == (uint32_t)old->ic) {
+		if (new->seqno > old->seqno) {
+			jffs2_mark_node_obsolete(c, old->node);
+			old->seqno = new->seqno;
+			old->node = new->node;
+		} else {
+			jffs2_mark_node_obsolete(c, new->node);
+		}
+		return 1; /* 'new' should be released. */
+	}
+	return 0;
+}
+
+static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				struct jffs2_raw_xref *rr, uint32_t ofs)
+{
+	struct jffs2_raw_node_ref *raw;
+	struct jffs2_xattr_ref *ref, *pos, *pos2;
+	uint32_t crc;
+
+	crc = crc32(0, rr, sizeof(*rr)-4);
+	if (crc != je32_to_cpu(rr->node_crc)) {
+		printk(KERN_NOTICE "jffs2_scan_xref_node(): Node CRC failed"
+		       " on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+		       ofs, je32_to_cpu(rr->node_crc), crc);
+		DIRTY_SPACE(PAD(je32_to_cpu(rr->totlen)));
+		return 0;
+	}
+
+	ref = jffs2_alloc_xattr_ref();
+	if (!ref)
+		return -ENOMEM;
+	initxattr_jffs2_xattr_ref(ref);
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw) {
+		jffs2_free_xattr_ref(ref);
+		return -ENOMEM;
+	}
+
+	ref->seqno = je32_to_cpu(rr->seqno);
+	if (ref->seqno > c->highest_seqno)
+		c->highest_seqno = ref->seqno;
+	ref->ic = (void *)je32_to_cpu(rr->ino);
+	ref->xc = (void *)je32_to_cpu(rr->xid);
+
+	raw->__totlen = PAD(je32_to_cpu(rr->totlen));
+	raw->flash_offset = ofs | REF_PRISTINE;
+	raw->next_phys = NULL;
+	raw->next_in_ino = NULL;
+	ref->node = raw;
+	
+	if (!jeb->first_node)
+		jeb->first_node = raw;
+	if (jeb->last_node)
+		jeb->last_node->next_phys = raw;
+	jeb->last_node = raw;
+
+	/* chaining to x->xattr_temp */
+	list_for_each_entry(pos, &c->xattr_temp, xlist) {
+		if ((uint32_t)pos->xc == (uint32_t)ref->xc) {
+			/* Duplicate Checking */
+			if (jffs2_scan_xref_node_helper(c, ref, pos)) {
+				jffs2_free_xattr_ref(ref);
+				DIRTY_SPACE(PAD(je32_to_cpu(rr->totlen)));
+				return 0;
+			}
+			list_for_each_entry(pos2, &pos->ilist, ilist) {
+				if (jffs2_scan_xref_node_helper(c, ref, pos2)) {
+					jffs2_free_xattr_ref(ref);
+					DIRTY_SPACE(PAD(je32_to_cpu(rr->totlen)));
+					return 0;
+				}
+			}
+			/* No Duplication Nodes exist */
+			list_add_tail(&ref->ilist, &pos->ilist);
+			USED_SPACE(PAD(je32_to_cpu(rr->totlen)));
+			D1(printk(KERN_NOTICE "XATTR_REF: XID=%d INO=%d inserted\n",
+			       (uint32_t)ref->xc, (uint32_t)ref->ic));
+			return 0;
+		}
+	}
+	list_add_tail(&ref->xlist, &c->xattr_temp);
+	USED_SPACE(PAD(je32_to_cpu(rr->totlen)));
+	D1(printk(KERN_NOTICE "XATTR_REF: XID=%d INO=%d inserted\n",
+	       (uint32_t)ref->xc, (uint32_t)ref->ic));
+	return 0;
+}
+#endif /* CONFIG_JFFS2_XATTR */
+
 static int count_list(struct list_head *l)
 {
 	uint32_t count = 0;
diff -rpNU3 mtd-0829/fs/jffs2/super.c mtd-0829.xattr/fs/jffs2/super.c
--- mtd-0829/fs/jffs2/super.c	2005-07-12 18:00:11.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/super.c	2005-09-06 10:28:53.000000000 -0400
@@ -151,6 +151,7 @@ static struct super_block *jffs2_get_sb_
 
 	sb->s_op = &jffs2_super_operations;
 	sb->s_flags = flags | MS_NOATIME;
+	sb->s_xattr = jffs2_xattr_handlers;
 
 	ret = jffs2_do_fill_super(sb, data, (flags&MS_VERBOSE)?1:0);
 
@@ -290,6 +291,7 @@ static void jffs2_put_super (struct supe
 		kfree(c->blocks);
 	jffs2_flash_cleanup(c);
 	kfree(c->inocache_list);
+	jffs2_clear_xattr_caches(c);
 	if (c->mtd->sync)
 		c->mtd->sync(c->mtd);
 
diff -rpNU3 mtd-0829/fs/jffs2/symlink.c mtd-0829.xattr/fs/jffs2/symlink.c
--- mtd-0829/fs/jffs2/symlink.c	2005-07-17 18:00:20.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/symlink.c	2005-09-06 10:28:53.000000000 -0400
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
diff -rpNU3 mtd-0829/fs/jffs2/write.c mtd-0829.xattr/fs/jffs2/write.c
--- mtd-0829/fs/jffs2/write.c	2005-08-17 18:00:12.000000000 -0400
+++ mtd-0829.xattr/fs/jffs2/write.c	2005-09-06 10:28:53.000000000 -0400
@@ -36,7 +36,7 @@ int jffs2_do_new_inode(struct jffs2_sb_i
 	f->inocache->nlink = 1;
 	f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
 	f->inocache->state = INO_STATE_PRESENT;
-
+	initxattr_jffs2_inode_cache(f->inocache);
 
 	jffs2_add_ino_cache(c, f->inocache);
 	D1(printk(KERN_DEBUG "jffs2_do_new_inode(): Assigned ino# %d\n", f->inocache->ino));
diff -rpNU3 mtd-0829/fs/jffs2/xattr.c mtd-0829.xattr/fs/jffs2/xattr.c
--- mtd-0829/fs/jffs2/xattr.c	1969-12-31 19:00:00.000000000 -0500
+++ mtd-0829.xattr/fs/jffs2/xattr.c	2005-09-06 10:28:53.000000000 -0400
@@ -0,0 +1,1170 @@
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
+static uint32_t jffs2_xattr_cache_hashkey(int xtype, const char *xname, const char *xvalue, int xsize);
+static void reclaim_xattr_cache(struct jffs2_sb_info *c);
+static void unload_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc);
+
+static int create_xattr_cache(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic,
+			      int xtype, const char *xname, const char *xvalue, int xsize);
+static void delete_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc);
+
+static struct jffs2_xattr_ref *
+create_xattr_ref(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic, struct jffs2_xattr_cache *xc);
+static void delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref);
+
+static int do_jffs2_getxattr(struct inode *inode, int xtype, const char *xname,
+			     char *buffer, size_t size);
+static int do_jffs2_setxattr(struct inode *inode, int xtype, const char *xname,
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
+	return do_jffs2_getxattr(inode, JFFS2_XATTRTYPE_USER, name, buffer, size);
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
+	return do_jffs2_setxattr(inode, JFFS2_XATTRTYPE_USER, name, buffer, size, flags);
+}
+
+static size_t jffs2_user_listxattr(struct inode *inode, char *list, size_t list_size,
+				   const char *name, size_t name_len)
+{
+	int ret;
+
+	if (!strcmp(name, ""))
+		return -EINVAL;
+	ret = permission(inode, MAY_READ, NULL);
+	if (ret)
+		return ret;
+
+	return 1;	/* permit to copy */
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
+	return do_jffs2_getxattr(inode, JFFS2_XATTRTYPE_TRUSTED, name, buffer, size);
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
+	return do_jffs2_setxattr(inode, JFFS2_XATTRTYPE_TRUSTED, name, buffer, size, flags);
+}
+
+static size_t jffs2_trusted_listxattr(struct inode *inode, char *list, size_t list_size,
+				      const char *name, size_t name_len)
+{
+	if (!capable(CAP_SYS_ADMIN))
+		return 0; /* ignore this entry */
+	return 1;
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
+	return do_jffs2_getxattr(inode, JFFS2_XATTRTYPE_SECURITY, name, buffer, size);
+}
+
+static int jffs2_security_setxattr(struct inode *inode, const char *name, const void *buffer,
+				   size_t size, int flags)
+{
+	if (!strcmp(name, ""))
+		return -EINVAL;
+
+	return do_jffs2_setxattr(inode, JFFS2_XATTRTYPE_SECURITY, name, buffer, size, flags);
+}
+
+static size_t jffs2_security_listxattr(struct inode *inode, char *list, size_t list_size,
+				       const char *name, size_t name_len)
+{
+	return 1; /* permit to copy */
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
+/* ---- Build-up and Destruct XATTR-Cache functions ----------- */
+int jffs2_init_xattr_caches(struct jffs2_sb_info *c)
+{
+	int i;
+
+	c->xattrcache = kmalloc((XATTRCACHE_HASHSIZE+1)*sizeof(struct list_head), GFP_KERNEL);
+	if (!c->xattrcache)
+		return -ENOMEM;
+
+	init_rwsem(&c->xattr_sem);
+
+	for (i=0; i<=XATTRCACHE_HASHSIZE; i++)
+		INIT_LIST_HEAD(&c->xattrcache[i]);
+
+	c->xcache_mem_threshold = 64 * 1024;	/* Default 64KB */
+
+	return 0;
+}
+
+void jffs2_clear_xattr_caches(struct jffs2_sb_info *c)
+{
+	struct jffs2_xattr_cache *xc, *_xc;
+	struct jffs2_xattr_ref *ref, *_ref;
+	int i;
+
+	if (!c->xattrcache)
+		return;		/* not initialized yet */
+
+	if ( !(c->flags & (JFFS2_SB_FLAG_SCANNING|JFFS2_SB_FLAG_BUILDING)) )
+		goto free_xcache;
+
+	list_for_each_entry_safe(ref, _ref, &c->xattr_temp, xlist)
+		jffs2_free_xattr_ref(ref);
+
+	for (i=0; i<XATTRCACHE_HASHSIZE; i++) {
+		list_for_each_entry_safe(xc, _xc, &c->xattrcache[i], xcache) {
+			list_del(&xc->xcache);
+			list_for_each_entry_safe(ref, _ref, &xc->xlist, xlist) {
+				list_del(&ref->xlist);
+				list_del(&ref->ilist);
+				jffs2_free_xattr_ref(ref);
+			}
+			if (xc->xname)
+				kfree(xc->xname);
+			jffs2_free_xattr_cache(xc);
+		}
+	}
+
+ free_xcache:
+	kfree(c->xattrcache);
+	c->xattrcache = NULL;
+}
+
+void jffs2_build_xattr_caches(struct jffs2_sb_info *c)
+{
+	struct jffs2_xattr_ref *xref, *_xref, *iref, *_iref;
+	struct jffs2_inode_cache *ic;
+	struct jffs2_xattr_cache *xc, *_xc;
+	uint32_t xid, ino;
+	struct list_head temp_list;
+	int i;
+
+	BUG_ON(!(c->flags & JFFS2_SB_FLAG_BUILDING));
+
+	INIT_LIST_HEAD(&temp_list);
+
+	/* Phase.1 */
+	list_for_each_entry_safe(xref, _xref, &c->xattr_temp, xlist) {
+		list_del_init(&xref->xlist);
+		list_add(&temp_list, &xref->ilist);
+
+		xid = (uint32_t)xref->xc;
+
+		xc = jffs2_find_xattr_cache_xid(c, xid);
+		if (!xc) {
+			printk(KERN_NOTICE "xid = %d is not found on xattr_cache\n", xid);
+			list_for_each_entry_safe(iref, _iref, &temp_list, ilist) {
+				list_del(&iref->ilist);
+				jffs2_mark_node_obsolete(c, iref->node);
+				jffs2_free_xattr_ref(iref);
+			}
+			continue;
+		}
+
+		list_for_each_entry_safe(iref, _iref, &temp_list, ilist) {
+			list_del_init(&iref->ilist);
+
+			BUG_ON(xid!=(uint32_t)iref->xc);
+
+			ino = (uint32_t)iref->ic;
+			ic = jffs2_get_ino_cache(c, ino);
+			if (!ic) {
+				printk(KERN_NOTICE "ino = %d is not found on inode_cache\n", ino);
+				jffs2_mark_node_obsolete(c, iref->node);
+				jffs2_free_xattr_ref(iref);
+				continue;
+			}
+			iref->ic = ic;
+			iref->xc = xc;
+			list_add_tail(&iref->ilist, &ic->ilist);
+			list_add_tail(&iref->xlist, &xc->xlist);
+			D2(printk(KERN_NOTICE "Bind XATTR-REF(xid=%d, ino=%d)\n", xc->xid, ic->ino));
+		}
+		BUG_ON(!list_empty(&temp_list));
+	}
+	/* Phase.2 */
+	for (i=0; i<XATTRCACHE_HASHSIZE; i++) {
+		list_for_each_entry_safe(xc, _xc, &c->xattrcache[i], xcache) {
+			list_del_init(&xc->xcache);
+			if (list_empty(&xc->xlist)) {
+				printk(KERN_NOTICE "Unrefered XATTR-Cache found XID=%d\n", xc->xid);
+				jffs2_free_xattr_cache(xc);
+			}
+		}
+	}
+	/* After this steps, xattrcache is used as index of XATTR-entry */
+}
+
+struct jffs2_xattr_cache *jffs2_find_xattr_cache_xid(struct jffs2_sb_info *c, uint32_t xid)
+{
+	struct jffs2_xattr_cache *xc;
+	int i = xid % XATTRCACHE_HASHSIZE;
+
+	/* It's only used in scanning/building process. */
+	BUG_ON(!(c->flags & (JFFS2_SB_FLAG_SCANNING|JFFS2_SB_FLAG_BUILDING)));
+
+	list_for_each_entry(xc, &c->xattrcache[i], xcache) {
+		if (xc->xid==xid)
+			return xc;
+	}
+	return NULL;
+}
+
+void jffs2_attach_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	int i = xc->xid % XATTRCACHE_HASHSIZE;
+
+	/* It's only used in scanning process. */
+	BUG_ON(!(c->flags & JFFS2_SB_FLAG_SCANNING));
+
+	list_add(&xc->xcache, &c->xattrcache[i]);
+}
+
+/*---- internal utility functions -------------------------------------------------*/
+struct
+{
+	int xtype;
+	int length;
+	char *prefix;
+	struct xattr_handler *handler;
+} __xattr_prefix[] = {
+	[JFFS2_XATTRTYPE_USER] =	{JFFS2_XATTRTYPE_USER, sizeof(XATTR_USER_PREFIX)-1,
+					 XATTR_USER_PREFIX, &jffs2_user_xattr_handler},
+	[JFFS2_XATTRTYPE_SECURITY] =	{JFFS2_XATTRTYPE_SECURITY, sizeof(XATTR_SECURITY_PREFIX)-1,
+					 XATTR_SECURITY_PREFIX, &jffs2_security_xattr_handler},
+	[JFFS2_XATTRTYPE_TRUSTED] =	{JFFS2_XATTRTYPE_TRUSTED, sizeof(XATTR_TRUSTED_PREFIX)-1,
+					 XATTR_TRUSTED_PREFIX, &jffs2_trusted_xattr_handler},
+	[JFFS2_XATTRTYPE_INVALID] =	{JFFS2_XATTRTYPE_INVALID, 0, NULL, NULL}
+};
+
+char *jffs2_xattr_xtype_to_prefix(int xtype)
+{
+	if (xtype>0 && xtype<JFFS2_XATTRTYPE_INVALID)
+		return __xattr_prefix[xtype].prefix;
+	return NULL;
+}
+
+int jffs2_xattr_prefix_to_xtype(const char *xname, int nlen)
+{
+	int i;
+
+	for (i=1; i<JFFS2_XATTRTYPE_INVALID; i++) {
+		if (!__xattr_prefix[i].prefix || __xattr_prefix[i].length>nlen)
+			continue;
+		if (!strncmp(__xattr_prefix[i].prefix, xname, __xattr_prefix[i].length))
+			return __xattr_prefix[i].xtype;
+	}
+	return JFFS2_XATTRTYPE_INVALID;
+}
+
+int jffs2_xattr_xtype_to_length(int xtype)
+{
+	if (xtype>0 && xtype<JFFS2_XATTRTYPE_INVALID) {
+		if (!__xattr_prefix[xtype].length)
+			return -EINVAL;
+		return __xattr_prefix[xtype].length;
+	}
+	return -EINVAL;
+}
+
+struct xattr_handler *jffs2_xattr_xtype_to_handler(int xtype)
+{
+	if (xtype>0 && xtype<JFFS2_XATTRTYPE_INVALID)
+		return __xattr_prefix[xtype].handler;
+	return NULL;
+}
+
+static uint32_t jffs2_xattr_cache_hashkey(int xtype, const char *xname, const char *xvalue, int xsize)
+{
+	int name_len = strlen(xname);
+
+	return crc32(xtype, xname, name_len) ^ crc32(xtype, xvalue, xsize);
+}
+
+/* ---- Internal XATTR related functions ------------------------------------ */
+static void reclaim_xattr_cache(struct jffs2_sb_info *c)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_cache *xc, *_xc;
+	int target, before;
+	static int index = 0;
+
+	before = c->xcache_mem_usage;
+	target = c->xcache_mem_threshold * 4 / 5; /* 20% reduction */
+	while(1) {
+		list_for_each_entry_safe(xc, _xc, &c->xattrcache[index], xcache) {
+			if (xc->flags & JFFS2_XCACHE_FLAGS_ACTIVE) {
+				xc->flags &= ~JFFS2_XCACHE_FLAGS_ACTIVE;
+			} else {
+				unload_xattr_cache(c, xc);
+			}
+			if (c->xcache_mem_usage <= target)
+				goto out;
+		}
+		index = (index+1) % XATTRCACHE_HASHSIZE;
+	}
+ out:
+	printk(KERN_NOTICE "JFFS2: reclaim_xattr_cache() before: %d Byte  after: %d Byte\n",
+			   before, c->xcache_mem_usage);
+}
+
+static int do_load_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	/* must be called under down_write(xattr_sem) */
+	char *data;
+	size_t readlen;
+	uint32_t crc;
+	int i, ret, length, retry = 0;
+
+	D2(printk(KERN_NOTICE "do_load_xattr_cache(xid=%d xtype=%d)\n", xc->xid, xc->xtype));
+
+ retry:
+	length = PAD(xc->name_len+1) + PAD(xc->value_len);
+	data = kmalloc(length, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	/* c->alloc_sem should be hold when xc->node is refered */
+	down(&c->alloc_sem);
+
+	BUG_ON(!xc->node);
+	ret = jffs2_flash_read(c, ref_offset(xc->node)+sizeof(struct jffs2_raw_xattr),
+			       length, &readlen, data);
+	up(&c->alloc_sem);
+
+	if (ret || length!=readlen) {
+		kfree(data);
+		return ret ? ret : -EIO;
+	}
+
+	memset(data+xc->name_len, 0, PAD(xc->name_len+1)-xc->name_len);
+	memset(data+PAD(xc->name_len+1) + xc->value_len, 0, PAD(xc->value_len)-xc->value_len);
+
+	crc = crc32(0, data, length);
+	if (crc != xc->data_crc) {
+		kfree(data);
+		return -EIO;
+	}
+
+	if (jffs2_xattr_prefix_to_xtype(data, xc->name_len) != xc->xtype) {
+		kfree(data);
+		return -EIO;
+	}
+
+	xc->flags = JFFS2_XCACHE_FLAGS_ACTIVE;
+
+	xc->xname = data;
+	xc->xvalue = data+PAD(xc->name_len+1);
+	c->xcache_mem_usage += length;
+
+	xc->hashkey = jffs2_xattr_cache_hashkey(xc->xtype, xc->xname, xc->xvalue, xc->value_len);
+	i = xc->hashkey % XATTRCACHE_HASHSIZE;
+	list_add(&xc->xcache, &c->xattrcache[i]);
+
+	if (c->xcache_mem_usage > c->xcache_mem_threshold && retry==0) {
+		reclaim_xattr_cache(c);
+		if (!xc->xname) {
+			retry = 1;
+			goto retry;
+		}
+	}
+
+	return 0;
+}
+
+static inline int load_xattr_cache_nolock(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	/* must be called under down_write(xattr_sem); */
+	if (unlikely(!xc->xname))
+		return do_load_xattr_cache(c, xc);
+	return 0;
+}
+
+static inline int load_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	/* must be called under down_read(xattr_sem); */
+	int ret;
+
+	if (likely(xc->xname))
+		return 0;
+
+	up_read(&c->xattr_sem);
+	down_write(&c->xattr_sem);
+	ret = load_xattr_cache_nolock(c, xc);
+	downgrade_write(&c->xattr_sem);
+
+	return ret;
+}
+
+static void unload_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	/* must be called under down_write(xattr_sem) */
+	D2(printk(KERN_NOTICE "do_unload_xattr_cache(xid=%d xtype=%d)\n", xc->xid, xc->xtype));
+
+	if (xc->xname) {
+		c->xcache_mem_usage -= (PAD(xc->name_len+1)+PAD(xc->value_len));
+		kfree(xc->xname);
+	}
+
+	list_del_init(&xc->xcache);
+	xc->hashkey = 0;
+	xc->xname = NULL;
+	xc->xvalue = NULL;
+}
+
+static int save_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	/* must be called under down_write(xattr_sem) */
+	/* gc=1, if called from GC */
+
+	struct jffs2_raw_xattr rx;
+	struct jffs2_raw_node_ref *raw;
+	struct kvec vecs[2];
+	uint32_t length, phys_ofs;
+	int ret, totlen;
+
+	BUG_ON(!xc->xname);
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw)
+		return -ENOMEM;
+
+	vecs[0].iov_base = &rx;
+	vecs[0].iov_len = PAD(sizeof(rx));
+	vecs[1].iov_base = xc->xname;
+	vecs[1].iov_len = PAD(xc->name_len+1)+PAD(xc->value_len);
+	totlen = vecs[0].iov_len + vecs[1].iov_len;
+
+	/* Setup raw-xattr */
+	rx.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rx.nodetype = cpu_to_je16(JFFS2_NODETYPE_XATTR);
+	rx.totlen = cpu_to_je32(totlen);
+	rx.hdr_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_unknown_node)-4));
+
+	rx.xid = cpu_to_je32(xc->xid);
+	rx.length = cpu_to_je32(JFFS2_XATTR_LENGTH(xc->name_len, xc->value_len));
+	rx.data_crc = cpu_to_je32(crc32(0, xc->xname, vecs[1].iov_len));
+	rx.node_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_raw_xattr)-8));
+
+	ret = jffs2_reserve_space(c, totlen, &phys_ofs, &length, ALLOC_NORMAL);
+	if (ret) {
+		printk("%s:%d jffs2_reserve_space() = %d phys_ofs = %08x totlen = %d length = %d\n",
+		       __FILE__, __LINE__, ret, phys_ofs, totlen, length);
+		jffs2_free_raw_node_ref(raw);
+		return ret;
+	}
+	raw->flash_offset = phys_ofs;
+	raw->__totlen = vecs[0].iov_len + vecs[1].iov_len;
+	raw->next_phys = NULL;
+	raw->next_in_ino = NULL;
+	raw->owner = xc;
+
+	ret = jffs2_flash_writev(c, vecs, 2, phys_ofs, &length, 0);
+	if (ret || totlen!=length) {
+		printk(KERN_NOTICE "%s:%d Write of %d bytes at 0x%08x failed. returned %d, retlen %d\n",
+		       __FILE__, __LINE__, totlen, phys_ofs, ret, length);
+		ret = ret ? ret : -EIO;
+		if (length) {
+			raw->flash_offset |= REF_OBSOLETE;
+			jffs2_add_physical_node_ref(c, raw);
+			jffs2_mark_node_obsolete(c, raw);
+		} else {
+			jffs2_free_raw_node_ref(raw);
+		}
+		jffs2_complete_reservation(c);
+		return ret;
+	}
+	/* success */
+	raw->flash_offset |= REF_PRISTINE;
+	jffs2_add_physical_node_ref(c, raw);
+	if (xc->node) {
+		xc->node->owner = NULL;
+		jffs2_mark_node_obsolete(c, xc->node);
+	}
+
+	xc->node = raw;
+
+	jffs2_complete_reservation(c);
+
+	return 0;
+}
+
+static int create_xattr_cache(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic,
+			      int xtype, const char *xname, const char *xvalue, int xsize)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_cache *xc;
+	struct jffs2_xattr_ref *ref;
+	uint32_t hashkey;
+	int i, ret, prlen, nlen, dlen;
+	char *data, *prefix;
+
+	/* Index search */
+	if ((prlen=jffs2_xattr_xtype_to_length(xtype))<0)
+		return -EINVAL;
+
+	hashkey = jffs2_xattr_cache_hashkey(xtype, xname, xvalue, xsize);
+	i = hashkey % XATTRCACHE_HASHSIZE;
+	list_for_each_entry(xc, &c->xattrcache[i], xcache) {
+		if (xc->hashkey==hashkey
+		    && xc->xtype==xtype
+		    && xc->value_len==xsize
+		    && !strcmp(xc->xname+prlen, xname)
+		    && !memcmp(xc->xvalue, xvalue, xsize)) {
+			/* Shared-XATTR found! */
+			D2(printk(KERN_NOTICE "Shared XATTR found XID=%d\n", xc->xid));
+			ref = create_xattr_ref(c, ic, xc);
+			return IS_ERR(ref) ? PTR_ERR(ref) : 0;
+		}
+	}
+
+	/* Not found, Create NEW XATTR-Cache */
+	if (!(prefix=jffs2_xattr_xtype_to_prefix(xtype)))
+		return -EINVAL;
+
+	nlen = prlen + strlen(xname);
+	dlen = PAD(nlen+1)+PAD(xsize);
+
+	xc = jffs2_alloc_xattr_cache();
+	if (!xc)
+		return -ENOMEM;
+	initxattr_jffs2_xattr_cache(xc);
+
+	data = kmalloc(dlen, GFP_KERNEL);
+	if (!data) {
+		jffs2_free_xattr_cache(xc);
+		return -ENOMEM;
+	}
+	memset(data, 0, dlen);
+	strcpy(data, prefix);
+	strcpy(data+prlen, xname);
+	memcpy(data+PAD(nlen+1), xvalue, xsize);
+
+	xc->xid = ++c->highest_xid;
+	xc->xtype = xtype;
+	xc->flags = JFFS2_XCACHE_FLAGS_ACTIVE;
+	xc->data_crc = crc32(0, data, dlen);
+
+	xc->hashkey = hashkey;
+	xc->xname = data;
+	xc->name_len = nlen;
+	xc->xvalue = data + PAD(nlen+1);
+	xc->value_len = xsize;
+
+	/* Create XREF */
+	ref = create_xattr_ref(c, ic, xc);
+	if (IS_ERR(ref)) {
+		kfree(data);
+		jffs2_free_xattr_cache(xc);
+		return PTR_ERR(ref);
+	}
+
+	ret = save_xattr_cache(c, xc);
+	if (ret)
+		delete_xattr_ref(c, ref);
+
+	/* Insert Hash Index */
+	i = hashkey % XATTRCACHE_HASHSIZE;
+	list_add(&xc->xcache, &c->xattrcache[i]);
+
+	c->xcache_mem_usage += (PAD(xc->name_len+1)+PAD(xc->value_len));
+
+	if (c->xcache_mem_usage > c->xcache_mem_threshold)
+		reclaim_xattr_cache(c);
+
+	return ret;
+}
+
+static void delete_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	/* must be called under down_write(xattr_sem) and down(alloc_sem) */
+	BUG_ON(!list_empty(&xc->xlist));
+
+	unload_xattr_cache(c, xc);
+	if (xc->node) {
+		xc->node->owner = NULL;
+		jffs2_mark_node_obsolete(c, xc->node);
+	}
+	jffs2_free_xattr_cache(xc);
+}
+
+static int save_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
+{
+	/* must be called under down_write(xattr_sem) */
+	/* gc=1, if called from GC */
+	struct jffs2_raw_node_ref *raw;
+	struct jffs2_raw_xref rr;
+	uint32_t phys_ofs, length;
+	int ret;
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw)
+		return -ENOMEM;
+
+	ret = jffs2_reserve_space(c, sizeof(rr), &phys_ofs, &length, ALLOC_NORMAL);
+	if (ret) {
+		printk(KERN_NOTICE "%s:%d jffs2_reserve_space() = %d length =%d sizeof(rr) = %d\n",
+		       __FILE__, __LINE__, ret, length, sizeof(rr));
+		return ret;
+	}
+
+	rr.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rr.nodetype = cpu_to_je16(JFFS2_NODETYPE_XREF);
+	rr.totlen = cpu_to_je32(sizeof(rr));
+	rr.hdr_crc = cpu_to_je32(crc32(0, &rr, sizeof(struct jffs2_unknown_node)-4));
+
+	rr.seqno = cpu_to_je32(ref->seqno);
+	rr.ino = cpu_to_je32(ref->ic->ino);
+	rr.xid = cpu_to_je32(ref->xc->xid);
+	rr.node_crc = cpu_to_je32(crc32(0, &rr, sizeof(struct jffs2_raw_xref)-4));
+
+	raw->flash_offset = phys_ofs;
+	raw->__totlen = sizeof(rr);
+	raw->next_phys = NULL;
+	raw->next_in_ino = NULL;
+	raw->owner = ref;
+
+	ret = jffs2_flash_write(c, phys_ofs, sizeof(rr), &length, (char *)&rr);
+	if (ret || sizeof(rr)!=length) {
+		printk(KERN_NOTICE "%s:%d Write of %zd bytes at 0x%08x failed. returned %d, retlen %zd\n",
+		       __FILE__, __LINE__, sizeof(rr), phys_ofs, ret, length);
+		ret = ret ? ret : -EIO;
+		if (length) {
+			raw->flash_offset |= REF_OBSOLETE;
+			jffs2_add_physical_node_ref(c, raw);
+			jffs2_mark_node_obsolete(c, raw);
+		} else {
+			jffs2_free_raw_node_ref(raw);
+		}
+		jffs2_complete_reservation(c);
+		return ret;
+	}
+	raw->flash_offset |= REF_PRISTINE;
+
+	jffs2_add_physical_node_ref(c, raw);
+	if (ref->node) {
+		ref->node->owner = NULL;
+		jffs2_mark_node_obsolete(c, ref->node);
+	}
+	ref->node = raw;
+
+	jffs2_complete_reservation(c);
+
+	return 0;
+}
+
+static struct jffs2_xattr_ref *create_xattr_ref(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic,
+						struct jffs2_xattr_cache *xc)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_ref *ref;
+	int ret;
+
+	/* Duplication Check */
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		if (ref->xc == xc)
+			return ERR_PTR(-EINVAL);
+	}
+
+	ref = jffs2_alloc_xattr_ref();
+	if (!ref)
+		return ERR_PTR(-ENOMEM);
+	initxattr_jffs2_xattr_ref(ref);
+	
+	ref->seqno = ++c->highest_seqno;
+	ref->ic = ic;
+	ref->xc = xc;
+
+	ret = save_xattr_ref(c, ref);
+	if (ret) {
+		jffs2_free_xattr_ref(ref);
+		return ERR_PTR(ret);
+	}
+
+	/* Setup Reference */
+	list_add(&ref->ilist, &ic->ilist);
+	list_add(&ref->xlist, &xc->xlist);
+
+	return ref; /* success */
+}
+
+static void delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_cache *xc;
+
+
+	xc = ref->xc;
+	list_del(&ref->ilist);
+	list_del(&ref->xlist);
+
+	down(&c->alloc_sem);
+
+	BUG_ON(!ref->node);
+	ref->node->owner = NULL;
+	jffs2_mark_node_obsolete(c, ref->node);
+
+	if (list_empty(&xc->xlist))
+		delete_xattr_cache(c, xc);
+	up(&c->alloc_sem);
+
+	jffs2_free_xattr_ref(ref);
+}
+
+/* ---- External XATTR Handler ------------------------- */
+void jffs2_xattr_clear_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	struct jffs2_xattr_ref *ref, *_ref;
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
+	struct jffs2_xattr_cache *xc;
+	struct jffs2_xattr_ref *ref, *_ref;
+
+	down_write(&c->xattr_sem);
+	list_for_each_entry_safe(ref, _ref, &ic->ilist, ilist) {
+		xc=ref->xc;
+		list_del(&ref->ilist);
+		list_del(&ref->xlist);
+		if (list_empty(&xc->xlist)) {
+			unload_xattr_cache(c, xc);
+			jffs2_free_xattr_cache(xc);
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
+		if ((ret = load_xattr_cache_nolock(c, ref->xc)))
+			goto out;
+		cmp = ref;
+		list_for_each_entry_continue(cmp, &ic->ilist, ilist) {
+			if ((ret = load_xattr_cache_nolock(c, cmp->xc)))
+				goto out;
+			if (ref->xc->xtype == cmp->xc->xtype
+			    && !strcmp(ref->xc->xname, cmp->xc->xname)) {
+				delete_xattr_ref(c, ref->seqno > cmp->seqno ? cmp : ref);
+				goto retry;
+			}
+		}
+	}
+ out:
+	up_write(&c->xattr_sem);
+
+	D2(printk(KERN_NOTICE "%s ino=%d ret=%d\n", __FUNCTION__, ic->ino, ret));
+
+	ic->ilist_checked = ret ? 0 : 1;
+
+	return ret;
+}
+
+static inline int check_xattr_ref_ilist(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	if (likely(!ic->ilist_checked))
+		return do_check_xattr_ref_ilist(c, ic);
+	return 0;
+}
+
+ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
+{
+	struct inode *inode = dentry->d_inode;
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_ref *ref;
+	struct jffs2_xattr_cache *xc;
+	struct xattr_handler *xhandle;
+	int len, ret;
+
+	if (unlikely((ret=check_xattr_ref_ilist(c, ic))))
+		return ret;
+
+	down_read(&c->xattr_sem);
+	len = 0;
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		BUG_ON(ref->ic!=ic);
+		xc = ref->xc;
+		ret = load_xattr_cache(c, xc);
+		if (ret<0)
+			goto out;
+
+		xhandle = jffs2_xattr_xtype_to_handler(xc->xtype);
+		if (xhandle) {
+			ret = xhandle->list(inode, NULL, 0, xc->xname, xc->name_len);
+			if (!ret)
+				continue;
+			if (ret<0)
+				goto out;
+			if (buffer) {
+				if (size < len+xc->name_len+1) {
+					ret = -ERANGE;
+					goto out;
+				}
+				strcpy(buffer+len, xc->xname);
+			}
+			len += xc->name_len+1;
+		}
+	}
+ out:
+	up_read(&c->xattr_sem);
+	return ret;
+}
+
+static int do_jffs2_getxattr(struct inode *inode, int xtype, const char *xname,
+			     char *buffer, size_t size)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_cache *xc;
+	struct jffs2_xattr_ref *ref;
+	int ret, prlen;
+
+	if ((prlen=jffs2_xattr_xtype_to_length(xtype))<0)
+		return prlen;
+
+	if (unlikely((ret=check_xattr_ref_ilist(c, ic))))
+		return ret;
+
+	down_read(&c->xattr_sem);
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		BUG_ON(ref->ic!=ic);
+		xc = ref->xc;
+		if (xc->xtype != xtype)
+			continue;
+
+		ret = load_xattr_cache(c, xc);
+		if (ret)
+			goto out;
+
+		if (!strcmp(xname, xc->xname+prlen)) {
+			ret = xc->value_len;
+			if (buffer) {
+				if (size<ret) {
+					ret = -ERANGE;
+				} else {
+					memcpy(buffer, xc->xvalue, xc->value_len);
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
+static int do_jffs2_setxattr(struct inode *inode, int xtype, const char *xname,
+			     const char *buffer, size_t size, int flags)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_cache *xc;
+	struct jffs2_xattr_ref *ref;
+
+	int ret, prlen;
+
+	if (unlikely((ret=check_xattr_ref_ilist(c, ic))))
+		return ret;
+
+	if ((prlen = jffs2_xattr_xtype_to_length(xtype))<0)
+		return prlen;
+
+	down_write(&c->xattr_sem);
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		xc = ref->xc;
+		BUG_ON(ref->ic!=ic);
+		if (xc->xtype!=xtype)
+			continue;
+		ret = load_xattr_cache(c, xc);
+		if (ret)
+			goto out;
+		if (!strcmp(xc->xname+prlen, xname)) {
+			/* XATTR Found */
+			if (flags & XATTR_CREATE) {
+				ret = -EEXIST;
+				goto out;
+			}
+			if (buffer) {
+				ret = create_xattr_cache(c, ic, xtype, xname, buffer, size);
+				if (ret)
+					goto out;
+			}
+			delete_xattr_ref(c, ref);
+			goto out;
+		}
+	}
+	/* Not Found */
+	if (flags & XATTR_REPLACE) {
+		ret = -ENODATA;
+		goto out;
+	}
+	if (!buffer) {
+		ret = -EINVAL;
+		goto out;
+	}
+	/* Create New XATTR Node */
+	ret = create_xattr_cache(c, ic, xtype, xname, buffer, size);
+ out:
+	up_write(&c->xattr_sem);
+
+	return ret;
+}
+
+int jffs2_garbage_collect_xattr(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *raw)
+{
+	/* must be called under down_XXX(alloc_sem) */
+	union jffs2_node_union *node;
+	struct jffs2_raw_node_ref *nraw;
+	uint32_t phys_ofs, totlen, length, crc;
+	int ret, nodetype, nlen, vlen;
+
+	BUG_ON(!raw->owner);
+
+	totlen = ref_totlen(c, c->gcblock, raw);
+	if (totlen < sizeof(struct jffs2_unknown_node))
+		return -EINVAL;
+
+	ret = jffs2_reserve_space_gc(c, totlen, &phys_ofs, &length);
+	if (ret || length<totlen) {
+		printk(KERN_WARNING "jffs2_reserve_space_gc() = %d "
+				    "request: %d byte reserved: %d byte",
+				    ret, totlen, length);
+		return ret ? ret : -EBADFD;
+	}
+
+	node = kmalloc(totlen, GFP_KERNEL);
+	if (!node) {
+		printk(KERN_WARNING "kmalloc() failed for XATTR GC processing.\n");
+		return -ENOMEM;
+	}
+
+	ret = jffs2_flash_read(c, ref_offset(raw), totlen, &length, (char *)node);
+	if (!ret && length != totlen) {
+		printk(KERN_WARNING "Node read failed at 0x%08x\n", ref_offset(raw));
+		kfree(node);
+		return ret ? ret : -EIO;
+	}
+
+	ret = -EBADFD;
+	crc = crc32(0, node, sizeof(struct jffs2_unknown_node)-4);
+	if (je32_to_cpu(node->u.hdr_crc) != crc) {
+		printk(KERN_WARNING "Header CRC failed on JFFS2_NODETYPE_XATTR/XREF"
+		       " at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+		       ref_offset(raw), je32_to_cpu(node->u.hdr_crc), crc);
+		goto error;
+	}
+	if (totlen != je32_to_cpu(node->u.totlen)) {
+		printk(KERN_WARNING "Node Length Failed on JFFS2_NODETYPE_XATTR/XREF"
+		       " at 0x%08x: totlen=%d, calculated=%d",
+		       ref_offset(raw), totlen, sizeof(node->u.totlen));
+		goto error;
+	}
+
+	nodetype = je16_to_cpu(node->u.nodetype);
+	switch(nodetype) {
+	case JFFS2_NODETYPE_XATTR:
+		crc = crc32(0, node, sizeof(node->x)-8);
+		if (je32_to_cpu(node->x.node_crc) != crc) {
+			printk(KERN_WARNING "Node CRC failed on JFFS2_NODETYPE_XATTR"
+			       " at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+			       ref_offset(raw), je32_to_cpu(node->x.node_crc), crc);
+			goto error;
+		}
+
+		nlen = JFFS2_XATTR_NAMELEN(je32_to_cpu(node->x.length));
+		vlen = JFFS2_XATTR_VALUELEN(je32_to_cpu(node->x.length));
+		if (totlen != sizeof(node->x)+PAD(nlen+1)+PAD(vlen)) {
+			printk(KERN_WARNING "Node Length Failed on JFFS2_NODETYPE_XATTR"
+			       " at 0x%08x: totlen=%d, calculated=%d",
+			       ref_offset(raw), totlen, sizeof(node->x)+PAD(nlen+1)+PAD(vlen));
+			goto error;
+		}
+
+		crc = crc32(0, node->x.data, PAD(nlen+1)+PAD(vlen));
+		if (je32_to_cpu(node->x.data_crc) != crc) {
+			printk(KERN_WARNING "Data CRC failed on JFFS2_NODETYPE_XATTR"
+			       " at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+			       ref_offset(raw), je32_to_cpu(node->x.data_crc), crc);
+			goto error;
+		}
+		break;
+	case JFFS2_NODETYPE_XREF:
+		crc = crc32(0, node, sizeof(node->r)-4);
+		if (je32_to_cpu(node->r.node_crc) != crc) {
+			printk(KERN_WARNING "Node CRC failed on JFFS2_NODETYPE_XREF"
+			       " at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+			       ref_offset(raw), je32_to_cpu(node->r.node_crc), crc);
+			goto error;
+		}
+		if (totlen != sizeof(node->r)) {
+			printk(KERN_WARNING "Node Length Failed on JFFS2_NODETYPE_XREF"
+			       " at 0x%08x: totlen=%d, expected=%d",
+			       ref_offset(raw), totlen, sizeof(node->r));
+			goto error;
+		}
+		break;
+	default:
+		printk(KERN_WARNING "Unknown node type for REF_PRISTINE node at 0x%08x: 0x%04x\n",
+		       ref_offset(raw), je16_to_cpu(node->u.nodetype));
+		goto error;
+		break;
+	}
+
+	nraw = jffs2_alloc_raw_node_ref();
+	if (!nraw) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	nraw->flash_offset = phys_ofs;
+	nraw->__totlen = totlen;
+	nraw->next_phys = NULL;
+	nraw->next_in_ino = NULL;
+	nraw->owner = raw->owner;
+
+	ret = jffs2_flash_write(c, phys_ofs, totlen, &length, (char *)node);
+	if (ret || (totlen!=length)) {
+		printk(KERN_NOTICE "Write of %d bytes at 0x%08x failed. returned %d, retlen %zd\n",
+		       totlen, phys_ofs, ret, length);
+		if (length) {
+			nraw->flash_offset |= REF_OBSOLETE;
+			jffs2_add_physical_node_ref(c, nraw);
+			jffs2_mark_node_obsolete(c, nraw);
+		} else {
+			jffs2_free_raw_node_ref(nraw);
+		}
+		ret = ret ? ret : -EIO;
+		goto error;
+	}
+	nraw->flash_offset |= REF_PRISTINE;
+	jffs2_add_physical_node_ref(c, nraw);
+
+	switch (nodetype) {
+	case JFFS2_NODETYPE_XATTR:
+		((struct jffs2_xattr_cache *)raw->owner)->node = nraw;
+		break;
+	case JFFS2_NODETYPE_XREF:
+		((struct jffs2_xattr_ref *)raw->owner)->node = nraw;
+		break;
+	default:
+		BUG();
+		break;
+	}
+	jffs2_mark_node_obsolete(c, raw);
+	ret = 0;
+ error:
+	kfree(node);
+	return ret;
+}
diff -rpNU3 mtd-0829/include/linux/jffs2.h mtd-0829.xattr/include/linux/jffs2.h
--- mtd-0829/include/linux/jffs2.h	2005-07-26 18:00:09.000000000 -0400
+++ mtd-0829.xattr/include/linux/jffs2.h	2005-09-06 10:28:53.000000000 -0400
@@ -59,6 +59,8 @@
 #define JFFS2_NODETYPE_INODE (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 2)
 #define JFFS2_NODETYPE_CLEANMARKER (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
 #define JFFS2_NODETYPE_PADDING (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 4)
+#define JFFS2_NODETYPE_XATTR (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 8)
+#define JFFS2_NODETYPE_XREF (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 9)
 
 // Maybe later...
 //#define JFFS2_NODETYPE_CHECKPOINT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
@@ -146,9 +148,39 @@ struct jffs2_raw_inode
 	uint8_t data[0];
 } __attribute__((packed));
 
+struct jffs2_raw_xattr
+{
+	jint16_t magic;
+	jint16_t nodetype;	/* JFFS2_NODETYPE_XATTR */
+	jint32_t totlen;
+	jint32_t hdr_crc;
+
+	jint32_t xid;		/* XATTR identifier number */
+	jint32_t length;	/* upper 12bit = length of name */
+				/* lower 20bit = length of value */
+	jint32_t data_crc;
+	jint32_t node_crc;
+	uint8_t data[0];
+} __attribute__((packed));
+
+struct jffs2_raw_xref
+{
+	jint16_t magic;
+	jint16_t nodetype;	/* JFFS2_NODETYPE_XREF */
+	jint32_t totlen;
+	jint32_t hdr_crc;
+
+	jint32_t seqno;		/* sequencial number */
+	jint32_t ino;		/* inode number */
+	jint32_t xid;		/* XATTR identifier number */
+	jint32_t node_crc;
+} __attribute__((packed));
+
 union jffs2_node_union {
 	struct jffs2_raw_inode i;
 	struct jffs2_raw_dirent d;
+	struct jffs2_raw_xattr x;
+	struct jffs2_raw_xref r;
 	struct jffs2_unknown_node u;
 };
 
diff -rpNU3 mtd-0829/include/linux/jffs2_fs_sb.h mtd-0829.xattr/include/linux/jffs2_fs_sb.h
--- mtd-0829/include/linux/jffs2_fs_sb.h	2005-05-19 18:00:14.000000000 -0400
+++ mtd-0829.xattr/include/linux/jffs2_fs_sb.h	2005-09-06 10:28:53.000000000 -0400
@@ -112,6 +112,16 @@ struct jffs2_sb_info {
 	uint32_t fsdata_len;
 #endif
 
+#ifdef CONFIG_JFFS2_XATTR
+	uint32_t highest_xid;
+	uint32_t highest_seqno;
+	struct list_head *xattrcache;
+#define xattr_temp xattrcache[XATTRCACHE_HASHSIZE]
+	struct rw_semaphore xattr_sem;
+
+	uint32_t xcache_mem_usage;
+	uint32_t xcache_mem_threshold;
+#endif
 	/* OS-private pointer for getting back to master superblock info */
 	void *os_priv;
 };
diff -rpNU3 mtd-0829/include/linux/jffs2_fs_x.h mtd-0829.xattr/include/linux/jffs2_fs_x.h
--- mtd-0829/include/linux/jffs2_fs_x.h	1969-12-31 19:00:00.000000000 -0500
+++ mtd-0829.xattr/include/linux/jffs2_fs_x.h	2005-09-06 10:28:53.000000000 -0400
@@ -0,0 +1,140 @@
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
+#define XATTRCACHE_HASHSIZE (57)
+#define JFFS2_XATTR_NAMELEN(x)		(((x)>>20) & 0x00000fff)
+#define JFFS2_XATTR_VALUELEN(x)		( (x)      & 0x000fffff)
+#define JFFS2_XATTR_LENGTH(n,v)		(((n)&0x00000fff)<<20|((v)&0x000fffff))
+
+#define XATTR_USER_PREFIX		"user."
+#define XATTR_TRUSTED_PREFIX		"trusted."
+
+#define JFFS2_XATTRTYPE_USER		1	/* for "user.*" */
+#define JFFS2_XATTRTYPE_SECURITY	2	/* for "security.*" */
+#define JFFS2_XATTRTYPE_ACL_ACCESS	3	/* for "system.posix_acl_access" */
+#define JFFS2_XATTRTYPE_ACL_DEFAULT	4	/* for "system.posix_acl_default" */
+#define JFFS2_XATTRTYPE_TRUSTED		5	/* for "trusted.*" */
+#define JFFS2_XATTRTYPE_INVALID		6
+
+#define JFFS2_XCACHE_FLAGS_ACTIVE	0x0001	/* This is HOT cache */
+
+struct jffs2_xattr_cache
+{
+	struct list_head xcache;	/* chained to c->xcache */
+	struct list_head xlist;		/* jffs_xattr_ref is chained here */
+	struct jffs2_raw_node_ref *node;
+
+	uint32_t xid;
+	uint16_t xtype;		/* See JFFS2_XATTRTYPE_* */
+	uint16_t flags;		/* See JFFS2_XCACHE_FLAGS_* */
+	uint32_t data_crc;
+
+	uint32_t hashkey;
+	char *xname;		/* XATTR name */
+	int name_len;		/* length of xname */
+	char *xvalue;		/* XATTR value */
+	int value_len;		/* length of xvalue */
+};
+
+struct jffs2_inode_cache;	/* forward refence */
+struct jffs2_xattr_ref
+{
+	uint32_t seqno;		/* sequencial number */
+	struct list_head ilist;	/* list from jffs2_inode_cache */
+	struct list_head xlist;	/* list from jffs2_xattr_cache */
+	struct jffs2_xattr_cache *xc;
+	struct jffs2_inode_cache *ic;
+	struct jffs2_raw_node_ref *node;
+};
+
+#ifdef CONFIG_JFFS2_XATTR
+
+extern int jffs2_init_xattr_caches(struct jffs2_sb_info *c);
+extern void jffs2_build_xattr_caches(struct jffs2_sb_info *c);
+extern void jffs2_clear_xattr_caches(struct jffs2_sb_info *c);
+extern struct jffs2_xattr_cache *jffs2_find_xattr_cache_xid(struct jffs2_sb_info *c, uint32_t xid);
+extern void jffs2_attach_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc);
+
+extern char *jffs2_xattr_xtype_to_prefix(int xtype);
+extern int jffs2_xattr_prefix_to_xtype(const char *xname, int nlen);
+extern int jffs2_xattr_xtype_to_length(int xtype);
+
+extern void jffs2_xattr_clear_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
+extern void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
+
+extern struct xattr_handler *jffs2_xattr_handlers[];
+
+#define jffs2_permission	NULL
+extern ssize_t jffs2_listxattr(struct dentry *, char *, size_t);
+#define jffs2_getxattr		generic_getxattr
+#define jffs2_setxattr		generic_setxattr
+#define jffs2_removexattr	generic_removexattr
+
+extern int jffs2_garbage_collect_xattr(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *raw);
+/*---- Any inline initialize functions ----*/
+#define initxattr_jffs2_inode_cache(x) INIT_LIST_HEAD(&((x)->ilist))
+
+static inline void initxattr_jffs2_xattr_cache(struct jffs2_xattr_cache *xc)
+{
+	memset(xc, 0, sizeof(struct jffs2_xattr_cache));
+	INIT_LIST_HEAD(&xc->xcache);
+	INIT_LIST_HEAD(&xc->xlist);
+}
+
+static inline void initxattr_jffs2_xattr_ref(struct jffs2_xattr_ref *ref)
+{
+	memset(ref, 0, sizeof(struct jffs2_xattr_ref));
+	INIT_LIST_HEAD(&ref->ilist);
+	INIT_LIST_HEAD(&ref->xlist);
+}
+
+#else
+
+static inline void jffs2_xattr_write_down(void *c){}
+static inline void jffs2_xattr_write_up(void *c){}
+static inline void jffs2_xattr_read_down(void *c){}
+static inline void jffs2_xattr_read_up(void *c){}
+
+static inline int jffs2_init_xattr_caches(void *c){ return 0; }
+static inline void jffs2_build_xattr_caches(void *c){}
+static inline void jffs2_clear_xattr_caches(void *c){}
+static inline void *jffs2_find_xattr_cache_xid(void *c, uint32_t x){ BUG(); return NULL; }
+static inline void jffs2_attach_xattr_cache(void *c, void *xc){ BUG(); }
+
+static inline void *jffs2_xattr_xtype_to_prefix(int xtype){ BUG(); }
+static inline int jffs2_xattr_prefix_to_xtype(char *xname, int nlen){ BUG(); }
+static inline int jffs2_xattr_xtype_to_length(int xtype){ BUG(); }
+
+static inline void jffs2_xattr_clear_inode(void *c, void *ic){}
+static inline void jffs2_xattr_free_inode(void *c, void *ic){}
+
+static inline void jffs2_unlink_xattr_inode(void *c, void *ic){}
+#define jffs2_xattr_handlers	NULL
+
+#define jffs2_permission	NULL
+#define jffs2_listxattr		NULL
+#define jffs2_getxattr		NULL
+#define jffs2_setxattr		NULL
+#define jffs2_removexattr	NULL
+
+static inline int jffs2_garbage_collect_xattr(void *, void *){ BUG(); }
+
+#define initxattr_jffs2_inode_cache(x)
+static inline void initxattr_jffs2_xattr_cache(struct jffs2_xattr_cache *xc){}
+static inline void initxattr_jffs2_xattr_ref(struct jffs2_xattr_ref *ref){}
+
+#endif /* CONFIG_JFFS2_XATTR */
+
+#endif /* _JFFS2_FS_XATTR_H_ */

--------------010008010200080200080001--

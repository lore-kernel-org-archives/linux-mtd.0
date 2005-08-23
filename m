Received: from tyo202.gate.nec.co.jp ([210.143.35.52])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7VxJ-0006Co-HS
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 06:24:45 -0400
Message-ID: <430AF95F.1050704@ak.jp.nec.com>
Date: Tue, 23 Aug 2005 19:24:31 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------040209010302090401060409"
Cc: dwmw2@infradead.org
Subject: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040209010302090401060409
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hello,

The attached patch provids XATTR support in JFFS2.
We can apply it to mtd-snapshot-20050822.tar.bz2 tree.

I hope your worthwhile comments for improvement.
# By coincidence, two patches for similar functionality are posted in same day :)
# I changed the subject of this mail a bit to avoid confusion.

This implementation added two new node types JFFS2_NODETYPE_XATTR
and JFFS2_NODETYPE_XREF.
JFFS2_NODETYPE_XATTR node has a set of XATTR entry which contains
name and value. It's represented as jffs2_raw_xattr structure on MTD-device.
JFFS2_NODETYPE_XREF node has a set of reference to associate inode with XATTR.
It's represented as jffs2_raw_xref structure on MTD-device.

* Data Structure
 - jffs2_xattr_cache
  This object contains XATTR name/value. It must be refered by an inode
  at least. When the last inode which refers jffs2_xattr_cache is unlinked,
  jffs2_xattr_cache will be deleted.
  XATTR name/value is not loaded until inode object is allocated.

 - jffs2_xattr_ref
  This object refers jffs2_inode_cache and jffs2_xattr_cache, and chains each other.
  When we walk on ref->ilist from jffs2_inode_cache, we can scan all the XATTR which
  is bound to this inode. Adversely, we can scan all the inode which refers this
  XATTR, when we walk on ref->xlist from jffs2_xattr_cache.

struct jffs2_xattr_cache
{
        struct list_head xcache; <-- It's chained from struct jffs2_sb_info (global hash list).
        struct list_head xlist;  <-- jffs2_xattr_ref is chained on this list.
        struct jffs2_raw_node_ref *node;

        uint32_t xid;            <-- Unique Identifier
        uint32_t version;

        uint32_t crc;
        char *xname;    /* XATTR name */   <--
        char *xvalue;   /* XATTR value */
        int xsize;      /* size of XATTR value */
};

struct jffs2_xattr_ref
{
        uint32_t seqno;         /* sequencial number */
        uint32_t flags;
        struct list_head ilist; /* list from jffs2_inode_cache */
        struct list_head xlist; /* list from jffs2_xattr_cache */
        struct jffs2_xattr_cache *xc;
        struct jffs2_inode_cache *ic;
        struct jffs2_raw_node_ref *node;
};


* How to work

[1] FS mounting
When jffs2 is mounting, xattrcache which is array of list_head
is created by kmalloc() on jffs2_sb_info first.

Then jffs2_scan_eraseblock() is called on each erase block,
and jffs2_scan_xattr_node() and jffs2_scan_xref_node() are
used to treat two new node-type.
jffs2_scan_xattr_node() create jffs2_xattr_cache object and chain
it to xattrcache. jffs2_scan_xref_node() create jffs2_xattr_ref
object and chain it to temporary list.

Next, jffs2_build_xattr_caches() is called. This function associate
jffs2_inode_cache with jffs2_xattr_cache by using jffs2_xattr_ref.
(struct jffs2_xattr_ref *)ref->ilist ... Chained jffs2_inode_cache
(struct jffs2_xattr_ref *)ref->xlist ... Chained jffs2_xattr_cache

[2] inode-creation
When inode object is created, jffs2_get_xattr_inode() will be called.
It walks on ilist on inode-cache and calls do_load_xattr_cache() for
related XATTR object to load XATTR name/value.

[3] getxattr/setxattr
We can refer an jffs2_inode_cache object in {get|set}xattr handler,
and walks on jffs2_inode_cache->ilist for looking up target XATTR.
In setxattr case, do_create_xattr_cache() is called for creation
new XATTR-node, then do_delete_xattr_ref() is used for old-node.


* Example of use

[root@saba ~]# dd if=jffs2.xattr.img of=/dev/mtdblock0
8192+0 records in
8192+0 records out
[root@saba ~]# mount -t jffs2 /dev/mtdblock0 /mnt/0
[root@saba ~]# ls -lZ /mnt/0
drwxr-xr-x  root     root     system_u:object_r:bin_t          bin/
drwxr-xr-x  root     root     system_u:object_r:mnt_t          dev/
drwxr-xr-x  root     root     system_u:object_r:etc_t          etc/
-rw-r--r--  root     root     system_u:object_r:mnt_t          hoge
-rwxr-xr-x  root     root     system_u:object_r:mnt_t          init*
drwxr-xr-x  root     root     system_u:object_r:lib_t          lib/
drwxr-xr-x  root     root     system_u:object_r:mnt_t          loopfs/
drwxr-xr-x  root     root     system_u:object_r:mnt_t          proc/
lrwxrwxrwx  root     root     system_u:object_r:bin_t          sbin
drwxr-xr-x  root     root     system_u:object_r:mnt_t          sys/
drwxr-xr-x  root     root     system_u:object_r:mnt_t          sysroot/
[root@saba ~]#


* ToDo List

(1) stabilization
 o more tests and debugging are necessary. I hope any trouble reporting.
   I don't have real MTD device. This implementation is developed on
   MTD-RAM pseudo device. Does it work on real MTD-devices ?

(2) performance & scalability
 o Currently, any XATTR objects are guarded by a xattr_sem. But this
   implementation is not scale, I guess. To divid locking is necessary.
 o When setxattr() is called, the system scans XATTR cache to look for
   same combination of name/value and share it.
   But it's so expensive process, to reduce finding-step is necessary.

(3) more functionality
 o Currently, only XATTR has "security.*" prefix is supported.
   It's enough to use SELinux, but that's more useful if we can use
   POSIX-ACL and so on.
 o modifying mkfs.jffs2 command.

Thanks,
-- 
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>

--------------040209010302090401060409
Content-Type: text/x-patch;
 name="jffs2_xattr_take-1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2_xattr_take-1.patch"

diff -rpNU3 mtd/fs/Kconfig mtd-xattr/fs/Kconfig
--- mtd/fs/Kconfig	2005-05-10 07:00:10.000000000 +0900
+++ mtd-xattr/fs/Kconfig	2005-08-23 10:30:27.000000000 +0900
@@ -51,6 +51,15 @@ config JFFS2_FS_DEBUG
 	  If reporting bugs, please try to have available a full dump of the
 	  messages at debug level 1 while the misbehaviour was occurring.
 
+config JFFS2_XATTR
+	bool "JFFS2 XATTR support (EXPERIMENTAL)"
+	depends on JFFS2_FS
+	default n
+	help
+	 This enables the XATTR support in JFFS2.
+	 
+	 It's neccesary for persistent security context in SELinux.
+
 config JFFS2_FS_WRITEBUFFER
 	bool "JFFS2 write-buffering support"
 	depends on JFFS2_FS
diff -rpNU3 mtd/fs/jffs2/Makefile.common mtd-xattr/fs/jffs2/Makefile.common
--- mtd/fs/jffs2/Makefile.common	2005-07-18 07:00:13.000000000 +0900
+++ mtd-xattr/fs/jffs2/Makefile.common	2005-08-23 10:31:18.000000000 +0900
@@ -11,6 +11,7 @@ jffs2-y	+= read.o nodemgmt.o readinode.o
 jffs2-y	+= symlink.o build.o erase.o background.o fs.o writev.o
 jffs2-y	+= super.o debug.o
 
+jffs2-$(CONFIG_JFFS2_XATTR)	+= xattr.o
 jffs2-$(CONFIG_JFFS2_FS_WRITEBUFFER)	+= wbuf.o
 jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
 jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
diff -rpNU3 mtd/fs/jffs2/build.c mtd-xattr/fs/jffs2/build.c
--- mtd/fs/jffs2/build.c	2005-07-31 07:00:11.000000000 +0900
+++ mtd-xattr/fs/jffs2/build.c	2005-08-23 11:02:27.000000000 +0900
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
@@ -353,6 +355,7 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
 
 	if (jffs2_build_filesystem(c)) {
 		D1(printk(KERN_DEBUG "build_fs failed\n"));
+		jffs2_clear_xattr_caches(c);
 		jffs2_free_ino_caches(c);
 		jffs2_free_raw_node_refs(c);
 #ifndef __ECOS
diff -rpNU3 mtd/fs/jffs2/dir.c mtd-xattr/fs/jffs2/dir.c
--- mtd/fs/jffs2/dir.c	2005-08-18 07:00:11.000000000 +0900
+++ mtd-xattr/fs/jffs2/dir.c	2005-08-23 11:02:27.000000000 +0900
@@ -58,6 +58,10 @@ struct inode_operations jffs2_dir_inode_
 	.mknod =	jffs2_mknod,
 	.rename =	jffs2_rename,
 	.setattr =	jffs2_setattr,
+	.setxattr =	jffs2_setxattr,
+	.getxattr =	jffs2_getxattr,
+	.listxattr =	jffs2_listxattr,
+	.removexattr =	jffs2_removexattr
 };
 
 /***********************************************************************/
@@ -236,8 +240,11 @@ static int jffs2_unlink(struct inode *di
 
 	ret = jffs2_do_unlink(c, dir_f, dentry->d_name.name, 
 			      dentry->d_name.len, dead_f, now);
-	if (dead_f->inocache)
+	if (dead_f->inocache) {
 		dentry->d_inode->i_nlink = dead_f->inocache->nlink;
+		if (!dead_f->inocache->nlink)
+			jffs2_unlink_xattr_inode(c, dead_f->inocache);
+	}
 	if (!ret)
 		dir_i->i_mtime = dir_i->i_ctime = ITIME(now);
 	return ret;
diff -rpNU3 mtd/fs/jffs2/file.c mtd-xattr/fs/jffs2/file.c
--- mtd/fs/jffs2/file.c	2005-07-07 07:00:13.000000000 +0900
+++ mtd-xattr/fs/jffs2/file.c	2005-08-23 11:02:27.000000000 +0900
@@ -57,7 +57,11 @@ struct file_operations jffs2_file_operat
 
 struct inode_operations jffs2_file_inode_operations =
 {
-	.setattr =	jffs2_setattr
+	.setattr =	jffs2_setattr,
+	.setxattr =	jffs2_setxattr,
+	.getxattr =	jffs2_getxattr,
+	.listxattr =	jffs2_listxattr,
+	.removexattr =	jffs2_removexattr
 };
 
 struct address_space_operations jffs2_file_address_operations =
diff -rpNU3 mtd/fs/jffs2/fs.c mtd-xattr/fs/jffs2/fs.c
--- mtd/fs/jffs2/fs.c	2005-08-07 07:00:16.000000000 +0900
+++ mtd-xattr/fs/jffs2/fs.c	2005-08-23 11:02:27.000000000 +0900
@@ -310,6 +310,15 @@ void jffs2_read_inode (struct inode *ino
 		printk(KERN_WARNING "jffs2_read_inode(): Bogus imode %o for ino %lu\n", inode->i_mode, (unsigned long)inode->i_ino);
 	}
 
+#ifdef CONFIG_JFFS2_XATTR
+	ret = jffs2_get_xattr_inode(c, f->inocache);
+	if (ret) {
+		up(&f->sem);
+		jffs2_do_clear_inode(c, f);
+		make_bad_inode(inode);
+		return;
+	}
+#endif
 	up(&f->sem);
 
 	D1(printk(KERN_DEBUG "jffs2_read_inode() returning\n"));
@@ -504,6 +513,20 @@ int jffs2_do_fill_super(struct super_blo
 	}
 	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *));
 
+#ifdef CONFIG_JFFS2_XATTR
+	/* Initialization of XATTR related members */
+	c->xattrcache = kmalloc(XATTRCACHE_HASHSIZE * sizeof(struct list_head), GFP_KERNEL);
+	if (!c->xattrcache) {
+		kfree(c->inocache_list);
+		ret = -ENOMEM;
+		goto out_wbuf;
+	}
+	for (ret=0; ret<XATTRCACHE_HASHSIZE; ret++)
+		INIT_LIST_HEAD(&c->xattrcache[ret]);
+	INIT_LIST_HEAD(&c->xattr_temp);
+	init_rwsem(&c->xattr_sem);
+#endif
+
 	if ((ret = jffs2_do_mount_fs(c)))
 		goto out_inohash;
 
@@ -531,6 +554,7 @@ int jffs2_do_fill_super(struct super_blo
 
  out_root_i:
 	iput(root_i);
+	jffs2_clear_xattr_caches(c);
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
 	if (c->mtd->flags & MTD_NO_VIRTBLOCKS)
@@ -538,6 +562,9 @@ int jffs2_do_fill_super(struct super_blo
 	else
 		kfree(c->blocks);
  out_inohash:
+#ifdef CONFIG_JFFS2_XATTR
+	kfree(c->xattrcache);
+#endif
 	kfree(c->inocache_list);
  out_wbuf:
 	jffs2_flash_cleanup(c);
diff -rpNU3 mtd/fs/jffs2/malloc.c mtd-xattr/fs/jffs2/malloc.c
--- mtd/fs/jffs2/malloc.c	2005-07-28 07:00:18.000000000 +0900
+++ mtd-xattr/fs/jffs2/malloc.c	2005-08-23 11:02:27.000000000 +0900
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
@@ -205,3 +231,35 @@ void jffs2_free_inode_cache(struct jffs2
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
diff -rpNU3 mtd/fs/jffs2/nodelist.h mtd-xattr/fs/jffs2/nodelist.h
--- mtd/fs/jffs2/nodelist.h	2005-08-18 07:00:12.000000000 +0900
+++ mtd-xattr/fs/jffs2/nodelist.h	2005-08-23 11:02:27.000000000 +0900
@@ -20,6 +20,7 @@
 #include <linux/jffs2.h>
 #include <linux/jffs2_fs_sb.h>
 #include <linux/jffs2_fs_i.h>
+#include <linux/jffs2_fs_x.h>
 
 #ifdef __ECOS
 #include "os-ecos.h"
@@ -111,6 +112,9 @@ struct jffs2_inode_cache {
 	uint32_t ino;
 	int nlink;
 	int state;
+#ifdef CONFIG_JFFS2_XATTR
+	struct list_head ilist;
+#endif
 };
 
 /* Inode states for 'state' above. We need the 'GC' state to prevent
@@ -367,6 +371,13 @@ void jffs2_free_node_frag(struct jffs2_n
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
 
diff -rpNU3 mtd/fs/jffs2/readinode.c mtd-xattr/fs/jffs2/readinode.c
--- mtd/fs/jffs2/readinode.c	2005-08-18 07:00:12.000000000 +0900
+++ mtd-xattr/fs/jffs2/readinode.c	2005-08-23 13:08:59.000000000 +0900
@@ -902,6 +902,7 @@ int jffs2_do_read_inode(struct jffs2_sb_
 		f->inocache->ino = f->inocache->nlink = 1;
 		f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
 		f->inocache->state = INO_STATE_READING;
+		initxattr_jffs2_inode_cache(f->inocache);
 		jffs2_add_ino_cache(c, f->inocache);
 	}
 	if (!f->inocache) {
@@ -965,6 +966,8 @@ void jffs2_do_clear_inode(struct jffs2_s
 		jffs2_free_full_dirent(fd);
 	}
 
+	jffs2_put_xattr_inode(c, f->inocache);
+
 	if (f->inocache && f->inocache->state != INO_STATE_CHECKING) {
 		jffs2_set_inocache_state(c, f->inocache, INO_STATE_CHECKEDABSENT);
 		if (f->inocache->nodes == (void *)f->inocache)
diff -rpNU3 mtd/fs/jffs2/scan.c mtd-xattr/fs/jffs2/scan.c
--- mtd/fs/jffs2/scan.c	2005-07-21 07:00:12.000000000 +0900
+++ mtd-xattr/fs/jffs2/scan.c	2005-08-23 11:02:27.000000000 +0900
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
@@ -820,6 +860,184 @@ static int jffs2_scan_dirent_node(struct
 	return 0;
 }
 
+#ifdef CONFIG_JFFS2_XATTR
+static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				 struct jffs2_raw_xattr *rx, uint32_t ofs)
+{
+	struct jffs2_raw_node_ref *raw;
+	struct jffs2_xattr_cache *xc;
+	uint32_t crc;
+	int nlen, vlen;
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
+	nlen = XATTR_NAMELEN(je32_to_cpu(rx->length));
+	vlen = XATTR_VALUELEN(je32_to_cpu(rx->length));
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
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw)
+		return -ENOMEM;
+	raw->__totlen = PAD(je32_to_cpu(rx->totlen));
+	raw->flash_offset = ofs | REF_PRISTINE;
+	raw->next_phys = NULL;
+	raw->next_in_ino = NULL;
+	if (!jeb->first_node)
+		jeb->first_node = raw;
+	if (jeb->last_node)
+		jeb->last_node->next_phys = raw;
+	jeb->last_node = raw;
+
+	xc = jffs2_find_xattr_cache(c, je32_to_cpu(rx->xid));
+	if (!xc) {
+		xc = jffs2_alloc_xattr_cache();
+		if (!xc) {
+			jffs2_free_raw_node_ref(raw);
+			return -ENOMEM;
+		}
+		initxattr_jffs2_xattr_cache(xc);
+
+		xc->xid = je32_to_cpu(rx->xid);
+		xc->version = je32_to_cpu(rx->version);
+
+		if (xc->xid > c->highest_xid)
+			c->highest_xid = xc->xid;
+
+		jffs2_attach_xattr_cache(c, xc);
+	}
+
+	USED_SPACE(PAD(je32_to_cpu(rx->totlen)));
+	if (xc->version > je32_to_cpu(rx->version)) {
+		/* This node is obsolete */
+		jffs2_mark_node_obsolete(c, raw);
+	} else {
+		if (xc->node)
+			jffs2_mark_node_obsolete(c, xc->node);
+		xc->version = je32_to_cpu(rx->version);
+		xc->node = raw;
+	}
+	BUG_ON(!xc->node);
+
+	printk(KERN_NOTICE "XATTR_CACHE: XID=%d inserted\n", xc->xid);
+	return 0;
+}
+
+static inline int jffs2_scan_xref_node_helper(struct jffs2_sb_info *c, struct jffs2_xattr_ref *new,
+					      struct jffs2_xattr_ref *old)
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
+			printk(KERN_NOTICE "XATTR_REF: XID=%d INO=%d inserted\n",
+			       (uint32_t)ref->xc, (uint32_t)ref->ic);
+			return 0;
+		}
+	}
+	list_add_tail(&ref->xlist, &c->xattr_temp);
+	USED_SPACE(PAD(je32_to_cpu(rr->totlen)));
+	printk(KERN_NOTICE "XATTR_REF: XID=%d INO=%d inserted\n",
+	       (uint32_t)ref->xc, (uint32_t)ref->ic);
+	return 0;
+}
+#endif /* CONFIG_JFFS2_XATTR */
+
 static int count_list(struct list_head *l)
 {
 	uint32_t count = 0;
diff -rpNU3 mtd/fs/jffs2/super.c mtd-xattr/fs/jffs2/super.c
--- mtd/fs/jffs2/super.c	2005-07-13 07:00:11.000000000 +0900
+++ mtd-xattr/fs/jffs2/super.c	2005-08-23 11:02:27.000000000 +0900
@@ -282,6 +282,7 @@ static void jffs2_put_super (struct supe
 	down(&c->alloc_sem);
 	jffs2_flush_wbuf_pad(c);
 	up(&c->alloc_sem);
+	jffs2_clear_xattr_caches(c);
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
 	if (c->mtd->flags & MTD_NO_VIRTBLOCKS)
@@ -290,6 +291,9 @@ static void jffs2_put_super (struct supe
 		kfree(c->blocks);
 	jffs2_flash_cleanup(c);
 	kfree(c->inocache_list);
+#ifdef CONFIG_JFFS2_XATTR
+	kfree(c->xattrcache);
+#endif
 	if (c->mtd->sync)
 		c->mtd->sync(c->mtd);
 
diff -rpNU3 mtd/fs/jffs2/symlink.c mtd-xattr/fs/jffs2/symlink.c
--- mtd/fs/jffs2/symlink.c	2005-07-18 07:00:20.000000000 +0900
+++ mtd-xattr/fs/jffs2/symlink.c	2005-08-23 11:02:27.000000000 +0900
@@ -24,7 +24,11 @@ struct inode_operations jffs2_symlink_in
 {	
 	.readlink =	generic_readlink,
 	.follow_link =	jffs2_follow_link,
-	.setattr =	jffs2_setattr
+	.setattr =	jffs2_setattr,
+	.setxattr =	jffs2_setxattr,
+	.getxattr =	jffs2_getxattr,
+	.listxattr =	jffs2_listxattr,
+	.removexattr =	jffs2_removexattr
 };
 
 static int jffs2_follow_link(struct dentry *dentry, struct nameidata *nd)
diff -rpNU3 mtd/fs/jffs2/write.c mtd-xattr/fs/jffs2/write.c
--- mtd/fs/jffs2/write.c	2005-08-18 07:00:12.000000000 +0900
+++ mtd-xattr/fs/jffs2/write.c	2005-08-23 11:02:27.000000000 +0900
@@ -36,7 +36,7 @@ int jffs2_do_new_inode(struct jffs2_sb_i
 	f->inocache->nlink = 1;
 	f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
 	f->inocache->state = INO_STATE_PRESENT;
-
+	initxattr_jffs2_inode_cache(f->inocache);
 
 	jffs2_add_ino_cache(c, f->inocache);
 	D1(printk(KERN_DEBUG "jffs2_do_new_inode(): Assigned ino# %d\n", f->inocache->ino));
diff -rpNU3 mtd/fs/jffs2/xattr.c mtd-xattr/fs/jffs2/xattr.c
--- mtd/fs/jffs2/xattr.c	1970-01-01 09:00:00.000000000 +0900
+++ mtd-xattr/fs/jffs2/xattr.c	2005-08-23 12:47:01.000000000 +0900
@@ -0,0 +1,704 @@
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
+/*---- decralation of internal use functions ----*/
+static int do_load_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc);
+static void do_unload_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc);
+static int do_save_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc);
+static int do_create_xattr_cache(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic,
+				 const char *name, const char *buffer, size_t size);
+static void do_delete_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc);
+
+static struct jffs2_xattr_ref *do_create_xattr_ref(struct jffs2_sb_info *c,
+				struct jffs2_inode_cache *ic, struct jffs2_xattr_cache *xc);
+static void do_delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref);
+
+/*---- Implementations of XATTR functions ----*/
+void jffs2_build_xattr_caches(struct jffs2_sb_info *c)
+{
+	struct jffs2_xattr_ref *xref, *_xref, *iref, *_iref;
+	struct jffs2_inode_cache *ic;
+	struct jffs2_xattr_cache *xc;
+	uint32_t xid, ino;
+	struct list_head temp_list;
+
+	BUG_ON(!(c->flags & JFFS2_SB_FLAG_BUILDING));
+
+	down_write(&c->xattr_sem);
+
+	INIT_LIST_HEAD(&temp_list);
+
+	list_for_each_entry_safe(xref, _xref, &c->xattr_temp, xlist) {
+		list_del_init(&xref->xlist);
+		list_add(&temp_list, &xref->ilist);
+
+		xid = (uint32_t)xref->xc;
+
+		xc = jffs2_find_xattr_cache(c, xid);
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
+				D1(printk(KERN_NOTICE "ino = %d is not found on inode_cache\n", ino));
+				jffs2_mark_node_obsolete(c, iref->node);
+				jffs2_free_xattr_ref(iref);
+				continue;
+			}
+			iref->ic = ic;
+			iref->xc = xc;
+			list_add_tail(&iref->ilist, &ic->ilist);
+			list_add_tail(&iref->xlist, &xc->xlist);
+			D1(printk(KERN_NOTICE "Bind XATTR-REF(xid=%d, ino=%d)\n", xc->xid, ic->ino));
+		}
+		BUG_ON(!list_empty(&temp_list));
+	}
+	up_write(&c->xattr_sem);
+}
+
+void jffs2_clear_xattr_caches(struct jffs2_sb_info *c)
+{
+	struct jffs2_xattr_cache *xc, *_xc;
+	struct jffs2_xattr_ref *ref, *_ref;
+	int i;
+
+	down_write(&c->xattr_sem);
+	list_for_each_entry_safe(ref, _ref, &c->xattr_temp, xlist)
+		jffs2_free_xattr_ref(ref);
+
+	for (i=0; i<XATTRCACHE_HASHSIZE; i++) {
+		list_for_each_entry_safe(xc, _xc, &c->xattrcache[i], xcache) {
+			jffs2_dettach_xattr_cache(c, xc);
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
+	up_write(&c->xattr_sem);
+}
+
+struct jffs2_xattr_cache *jffs2_find_xattr_cache(struct jffs2_sb_info *c, uint32_t xid)
+{
+	struct jffs2_xattr_cache *xc;
+	int i = xid % XATTRCACHE_HASHSIZE;
+
+	list_for_each_entry(xc, &c->xattrcache[i], xcache) {
+		if (xc->xid==xid)
+			return xc;
+	}
+	return NULL;
+}
+
+static int is_active_xattr_cache(struct jffs2_xattr_cache *xc)
+{
+	struct jffs2_xattr_ref *ref;
+
+	list_for_each_entry(ref, &xc->xlist, xlist) {
+		if (ref->flags & XREF_FLAGS_ACTIVE)
+			return 1; /* Active */
+	}
+	return 0; /* Not Active */
+}
+
+static int do_load_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	struct jffs2_raw_xattr rx;
+	size_t length;
+	uint32_t crc;
+	char *data;
+	int ret, nlen, vlen, dlen;
+
+	if (xc->xname)
+		return 0; /* No need to read */
+
+	BUG_ON(!xc->node);
+
+	ret = jffs2_flash_read(c, ref_offset(xc->node), sizeof(rx), &length, (char *)&rx);
+	if (ret || length!=sizeof(rx)) {
+		ret = ret ? ret : -EIO;
+		return ret;
+	}
+
+	crc = crc32(0, &rx, sizeof(rx)-8);
+	if (crc != je32_to_cpu(rx.node_crc))
+		return -EIO;
+
+	nlen = XATTR_NAMELEN(je32_to_cpu(rx.length));
+	vlen = XATTR_VALUELEN(je32_to_cpu(rx.length));
+	dlen = PAD(nlen+1)+PAD(vlen);
+
+	data = kmalloc(dlen, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = jffs2_flash_read(c, ref_offset(xc->node)+sizeof(rx), dlen, &length, data);
+	if (ret || length!=dlen) {
+		ret = ret ? ret : -EIO;
+		kfree(data);
+		return ret;
+	}
+	memset(data+nlen, 0, PAD(nlen+1)-nlen); /* PADDING and NULL terminate string */
+	memset(data+dlen, 0, PAD(dlen)-dlen);
+
+	crc = crc32(0, data, dlen);
+	if (crc != je32_to_cpu(rx.data_crc)) {
+		kfree(data);
+		return -EIO;
+	}
+
+	xc->crc = crc;
+	xc->xname = data;
+	xc->xvalue = data+PAD(nlen+1);
+	xc->xsize = vlen;	
+
+	D1(printk("do_load_xattr_cache(xid=%d, xname='%s')\n", xc->xid, xc->xname));
+
+	return 0;
+}
+
+static void do_unload_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	D1(printk("do_unload_xattr_cache(xid=%d, xname='%s')\n", xc->xid, xc->xname));
+
+	if (xc->xname)
+		kfree(xc->xname);
+	xc->xname = NULL;
+	xc->xvalue = NULL;
+	xc->xsize = 0;
+	xc->crc = 0;
+}
+
+static int do_save_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	struct jffs2_raw_xattr rx;
+	struct jffs2_raw_node_ref *raw;
+	struct kvec vecs[2];
+	uint32_t length, phys_ofs;
+	int ret, nlen, totlen;
+
+	if (!xc->xname)
+		return -ENODATA;
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw)
+		return -ENOMEM;
+
+	nlen = strlen(xc->xname);
+	vecs[0].iov_base = &rx;
+	vecs[0].iov_len = PAD(sizeof(rx));
+	vecs[1].iov_base = xc->xname;
+	vecs[1].iov_len = PAD(nlen+1)+PAD(xc->xsize);
+	totlen = vecs[0].iov_len + vecs[1].iov_len;
+
+	/* Setup raw-xattr */
+	rx.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rx.nodetype = cpu_to_je16(JFFS2_NODETYPE_XATTR);
+	rx.totlen = cpu_to_je32(totlen);
+	rx.hdr_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_unknown_node)-4));
+
+	rx.xid = cpu_to_je32(xc->xid);
+	rx.version = cpu_to_je32(++xc->version);
+	rx.length = cpu_to_je32(XATTR_TOTLEN(nlen, xc->xsize));
+	rx.data_crc = cpu_to_je32(xc->crc);
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
+	if (xc->node)
+		jffs2_mark_node_obsolete(c, xc->node);
+
+	xc->node = raw;
+
+	jffs2_complete_reservation(c);
+
+	return 0;
+}
+
+static int do_create_xattr_cache(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic,
+				 const char *name, const char *buffer, size_t size)
+{
+	struct jffs2_xattr_cache *xc;
+	struct jffs2_xattr_ref *ref;
+	char *data;
+	int i, ret, length;
+
+	/* Looking up same name/value XATTR */
+	/* TODO: reduce seraching cost */
+	for (i=0; i<XATTRCACHE_HASHSIZE; i++) {
+		list_for_each_entry(xc, &c->xattrcache[i], xcache) {
+			if (!xc->xname || xc->xsize!=size)
+				continue;
+			if (strcmp(name, xc->xname))
+				continue;
+			if (memcmp(buffer, xc->xvalue, size))
+				continue;
+			D1(printk(KERN_NOTICE "Duplicate XATTR-Cache Found XID=%d\n", xc->xid));
+			goto found;
+		}
+	}
+
+	/* Not found, Create NEW XATTR-Cache */
+	xc = jffs2_alloc_xattr_cache();
+	if (!xc)
+		return -ENOMEM;
+	initxattr_jffs2_xattr_cache(xc);
+
+	length = strlen(name)+1;
+	data = kmalloc(PAD(length)+PAD(size), GFP_KERNEL);
+	if (!data) {
+		jffs2_free_xattr_cache(xc);
+		return -ENOMEM;
+	}
+	
+	memset(data, 0, PAD(length)+PAD(size));
+	strcpy(data, name);
+	memcpy(data+PAD(length), buffer, size);
+
+	xc->xid = ++c->highest_xid;
+	xc->version = 1;
+
+	xc->crc = crc32(0, data, PAD(length)+PAD(size));
+	xc->xname = data;
+	xc->xvalue = data+PAD(length);
+	xc->xsize = size;
+
+	jffs2_attach_xattr_cache(c, xc);
+
+	D1(printk(KERN_NOTICE "Create New XATTR-Cache XID=%d\n", xc->xid));
+
+ found:
+	ref = do_create_xattr_ref(c, ic, xc);
+	if (IS_ERR(ref)) {
+		if (!is_active_xattr_cache(xc)) {
+			if (xc->xname)
+				kfree(xc->xname);
+			xc->crc = 0;
+			xc->xname = NULL;
+			xc->xvalue = NULL;
+			xc->xsize = 0;
+		}
+		if (list_empty(&xc->xlist)) {
+			jffs2_dettach_xattr_cache(c, xc);
+			jffs2_free_xattr_cache(xc);
+		}
+		return (int)ref;
+	}
+	ref->flags |= XREF_FLAGS_ACTIVE;
+
+	ret = do_save_xattr_cache(c, xc);
+	if (ret)
+		do_delete_xattr_ref(c, ref);
+
+	D1(printk(KERN_NOTICE "do_save_xattr_cache() = %d\n", ret));
+
+	return ret;
+}
+
+static void do_delete_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	BUG_ON(!list_empty(&xc->xlist));
+
+	D1(printk(KERN_NOTICE "do_delete_xattr_cache() XID=%d XNAME=%s\n",
+	          xc->xid, xc->xname ? xc->xname : "<NULL>"));
+
+	jffs2_dettach_xattr_cache(c, xc);
+	if (xc->node)
+		jffs2_mark_node_obsolete(c, xc->node);
+
+	if (xc->xname)
+		kfree(xc->xname);
+	jffs2_free_xattr_cache(xc);
+}
+
+static struct jffs2_xattr_ref *do_create_xattr_ref(struct jffs2_sb_info *c,
+				struct jffs2_inode_cache *ic, struct jffs2_xattr_cache *xc)
+{
+	struct jffs2_xattr_ref *tmp, *ref = NULL;
+	struct jffs2_raw_node_ref *raw = NULL;
+	struct jffs2_raw_xref rr;
+	int ret = -ENOMEM;
+	uint32_t phys_ofs, length;
+
+	D1(printk("do_create_xattr_ref(xid=%d, ino=%d)\n", xc->xid, ic->ino));
+
+	/* Duplicate Check */
+	list_for_each_entry(tmp, &ic->ilist, ilist) {
+		if (tmp->xc == xc)
+			return ERR_PTR(-EINVAL);
+	}
+
+	ref = jffs2_alloc_xattr_ref();
+	if (!ref)
+		goto error;
+	initxattr_jffs2_xattr_ref(ref);
+	ref->seqno = ++c->highest_seqno;
+
+	/* Setup raw-node-ref */
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw)
+		goto error;
+
+	ret = jffs2_reserve_space(c, sizeof(rr), &phys_ofs, &length, ALLOC_NORMAL);
+	if (ret) {
+		printk(KERN_NOTICE "%s:%d jffs2_reserve_space() = %d length =%d sizeof(rr) = %d\n",
+		       __FILE__, __LINE__, ret, length, sizeof(rr));
+		ret = ret ? ret : -EIO;
+		goto error;
+	}
+	raw->flash_offset = phys_ofs;
+	raw->__totlen = sizeof(rr);
+	raw->next_phys = NULL;
+	raw->next_in_ino = NULL;
+
+	/* write JFFS2_NODETYPE_XREF */
+	rr.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rr.nodetype = cpu_to_je16(JFFS2_NODETYPE_XREF);
+	rr.totlen = cpu_to_je32(sizeof(rr));
+	rr.hdr_crc = cpu_to_je32(crc32(0, &rr, sizeof(struct jffs2_unknown_node)-4));
+
+	rr.seqno = cpu_to_je32(ref->seqno);
+	rr.ino = cpu_to_je32(ic->ino);
+	rr.xid = cpu_to_je32(xc->xid);
+	rr.node_crc = cpu_to_je32(crc32(0, &rr, sizeof(struct jffs2_raw_xref)-4));
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
+			raw = NULL; /* do not free in error-path */
+		}
+		jffs2_complete_reservation(c);
+		goto error;
+	}
+
+	raw->flash_offset |= REF_PRISTINE;
+	jffs2_add_physical_node_ref(c, raw);
+	jffs2_complete_reservation(c);
+
+	/* Setup Reference */
+	ref->ic = ic;
+	ref->xc = xc;
+	list_add(&ref->ilist, &ic->ilist);
+	list_add(&ref->xlist, &xc->xlist);
+	ref->node = raw;
+
+	return ref; /* success */
+
+ error:
+	if (raw)
+		jffs2_free_raw_node_ref(raw);
+	if (ref)
+		jffs2_free_xattr_ref(ref);
+	return ERR_PTR(ret);
+}
+
+static void do_delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
+{
+	struct jffs2_xattr_cache *xc;
+
+	BUG_ON(!ref->node);
+
+	xc = ref->xc;
+	list_del(&ref->ilist);
+	list_del(&ref->xlist);
+	jffs2_mark_node_obsolete(c, ref->node);
+	D1(printk(KERN_NOTICE "do_delete_xattr_ref(xid=%d, ino=%d)\n", ref->xc->xid, ref->ic->ino));
+	if (list_empty(&xc->xlist))
+		do_delete_xattr_cache(c, xc);
+	jffs2_free_xattr_ref(ref);
+}
+
+int jffs2_get_xattr_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	struct jffs2_xattr_ref *ref;
+	int ret = 0;
+
+	D1(printk("jffs2_get_xattr_inode(ino=%d)\n", ic->ino));
+
+	down_write(&c->xattr_sem);
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		ret = do_load_xattr_cache(c, ref->xc);
+		if (ret) {
+			struct jffs2_xattr_ref *pos;
+			list_for_each_entry(pos, &ic->ilist, ilist) {
+				if (pos==ref)
+					break;
+				if (!is_active_xattr_cache(pos->xc))
+					do_unload_xattr_cache(c, pos->xc);
+			}
+			goto out;
+		}
+		ref->flags |= XREF_FLAGS_ACTIVE;
+	}
+ out:
+	up_write(&c->xattr_sem);
+
+	return ret;
+}
+
+void jffs2_put_xattr_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	struct jffs2_xattr_ref *ref;
+
+	D1(printk("jffs2_put_xattr_inode(ino=%d)\n", ic->ino));
+
+	down_write(&c->xattr_sem);
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		if (!is_active_xattr_cache(ref->xc))
+			do_unload_xattr_cache(c, ref->xc);
+	}
+	up_write(&c->xattr_sem);
+}
+
+void jffs2_unlink_xattr_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	struct jffs2_xattr_ref *ref, *tmp;
+
+	D1(printk("jffs2_unlink_xattr_inode(ino=%d)\n", ic->ino));
+
+	down_write(&c->xattr_sem);
+
+	list_for_each_entry_safe(ref, tmp, &ic->ilist, ilist)
+		do_delete_xattr_ref(c, ref);
+
+	up_write(&c->xattr_sem);
+}
+
+static int do_jffs2_getxattr(struct inode *inode, const char *name, void *buffer, size_t size)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_ref *ref;
+	struct jffs2_xattr_cache *xc;
+	int ret;
+
+	if (!name)
+		return -EINVAL;
+
+	down_read(&c->xattr_sem);
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		xc = ref->xc;
+		BUG_ON(ref->ic!=ic || !xc->xname);
+		if (!strcmp(name, xc->xname)) {
+			if (!buffer) {
+				ret = xc->xsize;
+			} else if (xc->xsize > size) {
+				ret = -ERANGE;
+			} else {
+				memcpy(buffer, xc->xvalue, xc->xsize);
+				ret = xc->xsize;
+			}
+			goto out;
+		}
+	}
+	ret = -ENODATA;	/* Not Found */
+ out:
+	up_read(&c->xattr_sem);
+
+	return ret;
+}
+
+static int do_jffs2_setxattr(struct inode *inode, const char *name,
+			     const void *buffer, size_t size, int flags)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_ref *ref;
+	struct jffs2_xattr_cache *xc;
+	int ret = 0;
+
+	if (!name)
+		return -EINVAL;
+
+	down_write(&c->xattr_sem);
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		xc = ref->xc;
+		BUG_ON(ref->ic!=ic || !xc->xname);
+		if (!strcmp(xc->xname, name)) {
+			/* XATTR found */
+			if (flags & XATTR_CREATE) {
+				ret = -EEXIST;
+				goto out;
+			}
+
+			if (buffer) {
+				ret = do_create_xattr_cache(c, ic, name, buffer, size);
+				if (ret)
+					goto out;
+			}
+
+			do_delete_xattr_ref(c, ref);
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
+	ret = do_create_xattr_cache(c, ic, name, buffer, size);
+ out:
+	up_write(&c->xattr_sem);
+
+	return ret;
+}
+
+/* ---- Security Related XATTR handlers -------------------------------------- */
+static ssize_t jffs2_security_getxattr(struct inode *inode, const char *name, char *buffer, size_t size)
+{
+	if (name[sizeof(XATTR_SECURITY_PREFIX)-1]=='\0')
+		return -EINVAL;
+
+	return do_jffs2_getxattr(inode, name, buffer, size);
+}
+
+static int jffs2_security_setxattr(struct inode *inode, const char *name, const char *buffer, size_t size, int flags)
+{
+	if (name[sizeof(XATTR_SECURITY_PREFIX)-1]=='\0')
+		return -EINVAL;
+
+	return do_jffs2_setxattr(inode, name, buffer, size, flags);
+}
+
+/* ---- JFFS2 inode_operations related to XATTR ------------------------------ */
+ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
+{
+	struct inode *inode = dentry->d_inode;
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_ref *ref;
+	struct jffs2_xattr_cache *xc;
+	int ret, nlen;
+
+	down_read(&c->xattr_sem);
+	ret = 0;
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		xc = ref->xc;
+		BUG_ON(ref->ic!=ic || !xc->xname);
+		nlen = strlen(xc->xname);
+		if (!buffer) {
+			ret += nlen+1;
+		} else if (ret+nlen+1 > size) {
+			ret = -ERANGE;
+			goto out;
+		} else {
+			memcpy(buffer+ret, xc->xname, nlen+1);
+			ret += nlen+1;
+		}
+	}
+ out:
+	up_read(&c->xattr_sem);
+	return ret;
+}
+
+ssize_t jffs2_getxattr(struct dentry *dentry, const char *name, void *buffer, size_t size)
+{
+	ssize_t ret = -EOPNOTSUPP;
+
+	if (!strncmp(name, XATTR_SECURITY_PREFIX, sizeof(XATTR_SECURITY_PREFIX)-1)) {
+		ret = jffs2_security_getxattr(dentry->d_inode, name, (char *)buffer, size);
+#ifdef JFFS2_POSIX_ACL
+	} else if (...) {
+	/* TODO: POSIX ACL Support */
+#endif
+	}
+
+	return ret;
+}
+
+int jffs2_setxattr(struct dentry *dentry, const char *name, const void *value, size_t size, int flags)
+{
+	int ret = -EOPNOTSUPP;
+
+	if (!strncmp(name, XATTR_SECURITY_PREFIX, sizeof(XATTR_SECURITY_PREFIX)-1)) {
+		ret = jffs2_security_setxattr(dentry->d_inode, name, (void *)value, size, flags);
+#ifdef JFFS2_POSIX_ACL
+	/* TODO: POSIX ACL Support */
+#endif
+	}
+
+	return ret;
+}
+
+int jffs2_removexattr(struct dentry *dentry, const char *name){
+	return jffs2_setxattr(dentry, name, NULL, 0, XATTR_REPLACE);
+}
+
diff -rpNU3 mtd/include/linux/jffs2.h mtd-xattr/include/linux/jffs2.h
--- mtd/include/linux/jffs2.h	2005-07-27 07:00:09.000000000 +0900
+++ mtd-xattr/include/linux/jffs2.h	2005-08-23 11:02:27.000000000 +0900
@@ -59,6 +59,8 @@
 #define JFFS2_NODETYPE_INODE (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 2)
 #define JFFS2_NODETYPE_CLEANMARKER (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
 #define JFFS2_NODETYPE_PADDING (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 4)
+#define JFFS2_NODETYPE_XATTR (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 8)
+#define JFFS2_NODETYPE_XREF (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 9)
 
 // Maybe later...
 //#define JFFS2_NODETYPE_CHECKPOINT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
@@ -146,9 +148,40 @@ struct jffs2_raw_inode
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
+	jint32_t version;	/* XATTR version number */
+	jint32_t length;	/* upper 12bit = the length of xname */
+				/* lower 20bit = the length of xvalue */
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
 
diff -rpNU3 mtd/include/linux/jffs2_fs_sb.h mtd-xattr/include/linux/jffs2_fs_sb.h
--- mtd/include/linux/jffs2_fs_sb.h	2005-05-20 07:00:14.000000000 +0900
+++ mtd-xattr/include/linux/jffs2_fs_sb.h	2005-08-23 11:02:27.000000000 +0900
@@ -112,6 +112,13 @@ struct jffs2_sb_info {
 	uint32_t fsdata_len;
 #endif
 
+#ifdef CONFIG_JFFS2_XATTR
+	uint32_t highest_xid;		/* version number for XATTR-Node */
+	uint32_t highest_seqno;		/* seqno for XREF-Node */
+	struct list_head *xattrcache;
+	struct list_head xattr_temp;	/* temporary use in mounting */
+	struct rw_semaphore xattr_sem;
+#endif
 	/* OS-private pointer for getting back to master superblock info */
 	void *os_priv;
 };
diff -rpNU3 mtd/include/linux/jffs2_fs_x.h mtd-xattr/include/linux/jffs2_fs_x.h
--- mtd/include/linux/jffs2_fs_x.h	1970-01-01 09:00:00.000000000 +0900
+++ mtd-xattr/include/linux/jffs2_fs_x.h	2005-08-23 12:47:21.000000000 +0900
@@ -0,0 +1,119 @@
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
+#define XATTRCACHE_HASHSIZE (64)
+#define XATTR_NAMELEN(x)    (((x)>>20) & 0x00000fff)
+#define XATTR_VALUELEN(x)   ( (x)      & 0x000fffff)
+#define XATTR_TOTLEN(n,v)   ((((n)<<20)&0xfff00000) | ((v)&0x000fffff))
+
+struct jffs2_xattr_cache
+{
+	/* hash list chain from sb->xattrcache */
+	struct list_head xcache;
+	/* link list to jffs2_xattr_ref */
+	/* when list_empty(&xc->xlist) is true, no-inode refers this XATR */
+	struct list_head xlist;
+	/* reference to raw-ndoe */
+	struct jffs2_raw_node_ref *node;
+
+	uint32_t xid;
+	uint32_t version;
+
+	uint32_t crc;
+	char *xname;	/* XATTR name */
+	char *xvalue;	/* XATTR value */
+	int xsize;	/* size of XATTR value */
+};
+
+#define XREF_FLAGS_ACTIVE	(0x0001)
+
+struct jffs2_inode_cache;	/* forward refence */
+struct jffs2_xattr_ref
+{
+	uint32_t seqno;		/* sequencial number */
+	uint32_t flags;	
+	struct list_head ilist;	/* list from jffs2_inode_cache */
+	struct list_head xlist;	/* list from jffs2_xattr_cache */
+	struct jffs2_xattr_cache *xc;
+	struct jffs2_inode_cache *ic;
+	struct jffs2_raw_node_ref *node;
+};
+
+#ifdef CONFIG_JFFS2_XATTR
+
+extern void jffs2_build_xattr_caches(struct jffs2_sb_info *c);
+extern void jffs2_clear_xattr_caches(struct jffs2_sb_info *c);
+extern struct jffs2_xattr_cache *jffs2_find_xattr_cache(struct jffs2_sb_info *c, uint32_t xid);
+
+extern int jffs2_get_xattr_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
+extern void jffs2_put_xattr_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
+extern void jffs2_unlink_xattr_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
+
+extern ssize_t jffs2_listxattr(struct dentry *, char *, size_t);
+extern ssize_t jffs2_getxattr(struct dentry *, const char *, void *, size_t);
+extern int jffs2_setxattr(struct dentry *, const char *, const void *, size_t, int);
+extern int jffs2_removexattr(struct dentry *, const char *);
+
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
+static inline void jffs2_attach_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	int i = xc->xid % XATTRCACHE_HASHSIZE;
+	list_add(&xc->xcache, &c->xattrcache[i]);
+}
+
+static inline void jffs2_dettach_xattr_cache(struct jffs2_sb_info *c, struct jffs2_xattr_cache *xc)
+{
+	list_del(&xc->xcache);
+}
+
+#else /* CONFIG_JFFS2_XATTR */
+
+#define initxattr_jffs2_inode_cache(x)
+#define initxattr_jffs2_xattr_cache(x)	BUG()
+#define initxattr_jffs2_xattr_ref(x)	BUG()
+static inline void jffs2_build_xattr_caches(void *c){}
+static inline void jffs2_clear_xattr_caches(void *c){}
+static inline void jffs2_attach_xattr_cache(void *c, void *xc){ BUG(); }
+static inline void jffs2_dettach_xattr_cache(void *c, void *xc){ BUG(); }
+static inline void *jffs2_find_xattr_cache(void *c, uint32_t xid){ BUG(); return NULL; }
+
+static inline int jffs2_get_xattr_inode(void *c, void *ic){ return 0; }
+static inline void jffs2_put_xattr_inode(void *c, void *ic){}
+static inline void jffs2_unlink_xattr_inode(void *c, void *ic){}
+
+#define jffs2_listxattr		NULL
+#define jffs2_getxattr		NULL
+#define jffs2_setxattr		NULL
+#define jffs2_removexattr	NULL
+#define jffs2_xattr_handlers	NULL
+
+#endif /* CONFIG_JFFS2_XATTR */
+
+#endif /* _JFFS2_FS_XATTR_H_ */

--------------040209010302090401060409--

Received: from bay21-f19.bay21.hotmail.com ([65.54.233.108] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7tOq-0000VD-It
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 07:26:40 -0400
Message-ID: <BAY21-F191EACF7F23AC5886AC788F5A80@phx.gbl>
From: "Ma Yun" <sx_yunma@hotmail.com>
To: joern@wohnheim.fh-wedel.de, linux-mtd@lists.infradead.org
Date: Wed, 24 Aug 2005 19:08:38 +0800
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_NextPart_000_2d58_7d49_5dd4"
Cc: 
Subject: Re: [PATCH] XATTR support in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_2d58_7d49_5dd4
Content-Type: text/plain; format=flowed

Thank joern! I am sorry for my poor kernel code experience.

I have modified the patch.

Below is the implemention mechanism :)

1. background

The implementing of EAs in jffs2 is based on Epxa embedded board.

(ARM920T core+ 64M SDRAM + 16M NOR FLASH ...)

In our project, the extended attributes name length and value length are no 
more
than 256 bytes. So I defined the EA structure like this:
      struct jffs2_xattr {
	uint8_t namelen;	/* Length of name */
	uint8_t valuelen;	/* Length of value */
	char name[0];             /* Attribute name (include null-terminator)*/
		                 /* Attribute Valude immediately follows name*/
      }__attribute__((packed));

2. Overall design

. Extended attributes are stored in-lined in the dirent inode.
. The extended attributes list consist of a veriable (0 or more) number of
   extended attribute entries.
. Each extended attribute entry is a <name, value> pair where <name>
   is constructed from a null-terminated ascii string and <value> is 
arbitrary
   data.
. The EA name/value are not loaded until we get/set/list/remove them. Read 
them
   from flash directly.

Extended attribute entry format:

0                  1                   2                       2 + namelen + 
1
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
|Name length | Value length | Name string  \0| Value ...	 |
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Extended attribute list format:

0                        JFFS2_XATTR_SIZE(ea1)
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
| First EA element | Second EA element | ......                 |
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Extended attribute list store in-lined in the dirent inode.

Just like below:
+++++++++++++++++++++++++++++++++++++++++++++++++++
| Common head   |pino |   ......   |node_crc|name_crc|name... |EA list...|
+++++++++++++++++++++++++++++++++++++++++++++++++++

3. Data structure

- jffs2_xattr

struct jffs2_xattr {
	uint8_t namelen;
	uint8_t valuelen;
	char name[0];

}__attribute__((packed));

- jffs2_xattr_list

struct jffs2_xattr_list {
	struct jffs2_xattr xattr[0];
}__attribute__((packed));

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/

------=_NextPart_000_2d58_7d49_5dd4
Content-Type: text/plain; name="jffs2-xattr.patch"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="jffs2-xattr.patch"

diff -Nur linux-2.6.10.mxc/fs/jffs2/dir.c linux-2.6.10.jffs2/fs/jffs2/dir.c
--- linux-2.6.10.mxc/fs/jffs2/dir.c	2005-08-19 15:40:26.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/dir.c	2005-08-24 16:59:05.769507944 +0800
@@ -19,6 +19,7 @@
#include <linux/jffs2.h>
#include <linux/jffs2_fs_i.h>
#include <linux/jffs2_fs_sb.h>
+#include <linux/jffs2_xattr.h>
#include <linux/time.h>
#include "nodelist.h"

@@ -58,6 +59,12 @@

struct inode_operations jffs2_dir_inode_operations =
{
+#ifdef CONFIG_JFFS2_FS_XATTR
+	.getxattr =     jffs2_getxattr,
+	.setxattr =     jffs2_setxattr,
+	.listxattr =    jffs2_listxattr,
+	.removexattr =  jffs2_removexattr,
+#endif
	.create =	NAMEI_COMPAT(jffs2_create),
	.lookup =	NAMEI_COMPAT(jffs2_lookup),
	.link =		jffs2_link,
@@ -270,9 +277,11 @@
	/* XXX: This is ugly */
	type = (old_dentry->d_inode->i_mode & S_IFMT) >> 12;
	if (!type) type = DT_REG;
-
+#ifndef CONFIG_JFFS2_FS_XATTR
	ret = jffs2_do_link(c, dir_f, f->inocache->ino, type, dentry->d_name.name, 
dentry->d_name.len);
-
+#else
+	ret = jffs2_do_link_xattr(old_dentry->parent, c, dir_f, f->inocache->ino, 
type, dentry->d_name.name, dentry->d_name.len);
+#endif
	if (!ret) {
		down(&f->sem);
		old_dentry->d_inode->i_nlink = ++f->inocache->nlink;
@@ -744,11 +753,15 @@
	/* XXX: This is ugly */
	type = (old_dentry->d_inode->i_mode & S_IFMT) >> 12;
	if (!type) type = DT_REG;
-
+#ifndef CONFIG_JFFS2_FS_XATTR
	ret = jffs2_do_link(c, JFFS2_INODE_INFO(new_dir_i),
			    old_dentry->d_inode->i_ino, type,
			    new_dentry->d_name.name, new_dentry->d_name.len);
-
+#else
+	ret = jffs2_do_link_xattr(old_dentry->d_parent, c, 
JFFS2_INODE_INFO(new_dir_i),
+			    old_dentry->d_inode->i_ino, type,
+			    new_dentry->d_name.name, new_dentry->d_name.len);
+#endif
	if (ret)
		return ret;

diff -Nur linux-2.6.10.mxc/fs/jffs2/file.c 
linux-2.6.10.jffs2/fs/jffs2/file.c
--- linux-2.6.10.mxc/fs/jffs2/file.c	2005-08-19 15:40:26.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/file.c	2005-08-23 20:55:37.000000000 +0800
@@ -20,6 +20,7 @@
#include <linux/highmem.h>
#include <linux/crc32.h>
#include <linux/jffs2.h>
+#include <linux/jffs2_xattr.h>
#include "nodelist.h"

extern int generic_file_open(struct inode *, struct file *) 
__attribute__((weak));
@@ -55,6 +56,12 @@

struct inode_operations jffs2_file_inode_operations =
{
+#ifdef CONFIG_JFFS2_FS_XATTR
+        .setxattr = jffs2_setxattr,
+        .getxattr = jffs2_getxattr,
+        .listxattr = jffs2_listxattr,
+        .removexattr = jffs2_removexattr,
+#endif
	.setattr =	jffs2_setattr
};

diff -Nur linux-2.6.10.mxc/fs/jffs2/Makefile 
linux-2.6.10.jffs2/fs/jffs2/Makefile
--- linux-2.6.10.mxc/fs/jffs2/Makefile	2005-08-19 15:40:26.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/Makefile	2005-08-24 16:27:05.067499032 +0800
@@ -11,6 +11,7 @@
jffs2-y	+= symlink.o build.o erase.o background.o fs.o writev.o
jffs2-y	+= super.o

+jffs2-$(CONFIG_JFFS2_FS_XATTR)	+= writex.o xattr.o
jffs2-$(CONFIG_JFFS2_FS_NAND)	+= wbuf.o
jffs2-$(CONFIG_JFFS2_FS_NOR_ECC) += wbuf.o
jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
diff -Nur linux-2.6.10.mxc/fs/jffs2/nodelist.c 
linux-2.6.10.jffs2/fs/jffs2/nodelist.c
--- linux-2.6.10.mxc/fs/jffs2/nodelist.c	2005-08-19 15:40:26.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/nodelist.c	2005-08-23 20:56:23.000000000 
+0800
@@ -173,6 +173,7 @@
				goto free_out;
			}
			/* sanity check */
+#ifndef CONFIG_JFFS2_FS_XATTR
			if (PAD((node.d.nsize + sizeof (node.d))) != PAD(je32_to_cpu 
(node.d.totlen))) {
				printk(KERN_NOTICE "jffs2_get_inode_nodes(): Illegal nsize in node at 
0x%08x: nsize 0x%02x, totlen %04x\n",
				       ref_offset(ref), node.d.nsize, je32_to_cpu(node.d.totlen));
@@ -180,6 +181,7 @@
				spin_lock(&c->erase_completion_lock);
				continue;
			}
+#endif
			if (je32_to_cpu(node.d.version) > *highest_version)
				*highest_version = je32_to_cpu(node.d.version);
			if (ref_obsolete(ref)) {
diff -Nur linux-2.6.10.mxc/fs/jffs2/nodelist.h 
linux-2.6.10.jffs2/fs/jffs2/nodelist.h
--- linux-2.6.10.mxc/fs/jffs2/nodelist.h	2005-08-19 15:40:26.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/nodelist.h	2005-08-24 16:28:25.190318512 
+0800
@@ -412,6 +412,9 @@
int jffs2_do_link (struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f, 
uint32_t ino, uint8_t type, const char *name, int namelen);


+/* writex.c */
+int jffs2_do_link_xattr(struct dentry *parent, struct jffs2_sb_info *c, 
struct jffs2_inode_info *dir_f, uint32_t ino, uint8_t type, const char 
*name, int namelen)
+
/* readinode.c */
void jffs2_truncate_fraglist (struct jffs2_sb_info *c, struct rb_root *list, 
uint32_t size);
int jffs2_add_full_dnode_to_inode(struct jffs2_sb_info *c, struct 
jffs2_inode_info *f, struct jffs2_full_dnode *fn);
diff -Nur linux-2.6.10.mxc/fs/jffs2/symlink.c 
linux-2.6.10.jffs2/fs/jffs2/symlink.c
--- linux-2.6.10.mxc/fs/jffs2/symlink.c	2005-08-19 15:40:26.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/symlink.c	2005-08-24 16:58:58.051681232 
+0800
@@ -16,6 +16,7 @@
#include <linux/slab.h>
#include <linux/fs.h>
#include <linux/namei.h>
+#include <linux/jffs2_xattr.h>
#include "nodelist.h"

static int jffs2_follow_link(struct dentry *dentry, struct nameidata *nd);
@@ -23,6 +24,12 @@

struct inode_operations jffs2_symlink_inode_operations =
{
+#ifdef CONFIG_JFFS2_FS_XATTR
+        .setxattr =     jffs2_setxattr,
+        .getxattr =     jffs2_getxattr,
+        .listxattr =    jffs2_listxattr,
+        .removexattr =  jffs2_removexattr,
+#endif
	.readlink =	generic_readlink,
	.follow_link =	jffs2_follow_link,
	.put_link =	jffs2_put_link,
diff -Nur linux-2.6.10.mxc/fs/jffs2/writex.c 
linux-2.6.10.jffs2/fs/jffs2/writex.c
--- linux-2.6.10.mxc/fs/jffs2/writex.c	1970-01-01 08:00:00.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/writex.c	2005-08-24 16:53:53.050048528 +0800
@@ -0,0 +1,129 @@
+/*
+ * JFFS2 -- Journalling Flash File System, Version 2.  *
+ *
+ * Copyright (C) 2001-2003 Motorola, Inc.
+ *
+ * Created by Ma yun <yunma@sc.mcel.mot.com>
+ *
+ * For licensing information, see the file 'LICENCE' in this directory.
+ *
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/fs.h>
+#include <linux/crc32.h>
+#include <linux/slab.h>
+#include <linux/pagemap.h>
+#include <linux/mtd/mtd.h>
+#include <linux/jffs2_xattr.h>
+#include "nodelist.h"
+#include "compr.h"
+
+int jffs2_do_link_xattr(struct dentry *parent, struct jffs2_sb_info *c, 
struct jffs2_inode_info *dir_f, uint32_t ino, uint8_t type, const char 
*name, int namelen)
+{
+	struct jffs2_raw_dirent *rd, findnode;
+	struct jffs2_full_dirent *fd;
+	struct jffs2_inode_info *p;
+	struct jffs2_raw_node_ref *raw = NULL;
+	uint32_t alloclen, phys_ofs;
+	char *xattr;
+	size_t readlen;
+	int size, n_version = 0, ret;
+
+	memset(&findnode, 0, sizeof(findnode));
+
+	p = JFFS2_INODE_INFO(parent->d_inode);
+
+	down(&p->sem);
+	for (fd = p->dents; fd; fd = fd->next)
+		if (fd->ino == ino && fd->version >= n_version) n_version = fd->version;
+	for (fd = p->dents; fd; fd = fd->next)
+		if (fd->ino == ino && fd->version == n_version) break;
+	if (fd->ino == ino) {
+		for (raw = fd->raw; raw && raw->next_in_ino; raw = raw->next_in_ino) {
+                        phys_ofs = ref_offset(raw);
+			ret = jffs2_flash_read(c, phys_ofs, sizeof(findnode), &readlen,(char 
*)&findnode);
+			if (readlen != sizeof(findnode) || ret) {
+				up(&p->sem);
+				printk(KERN_WARNING"Error reading node from 0x%08x: %d\n",phys_ofs, 
ret);
+				return ret;
+			}
+			if ((je32_to_cpu(findnode.ino) == ino) && je16_to_cpu(findnode.nodetype) 
== JFFS2_NODETYPE_DIRENT) break;
+		}
+	} else {
+		up(&p->sem);
+		printk(KERN_WARNING"ea_get: can not find the file" );
+		return -1;
+	}
+	up(&p->sem);
+
+	/* get xattr size*/
+	size = je32_to_cpu(findnode.totlen) - (findnode.nsize) - sizeof(findnode);
+	if (size == 0) {
+		xattr = kmalloc(namelen, GFP_KERNEL);
+		memcpy(xattr, name, namelen);
+		size  = namelen;
+	} else {
+		xattr = kmalloc(size + namelen, GFP_KERNEL);
+		phys_ofs = ref_offset(raw);
+		ret = jffs2_flash_read(c, phys_ofs + sizeof(findnode) + findnode.nsize, 
size, &readlen, xattr+namelen);
+		if (ret|| readlen != size){
+			printk(KERN_WARNING"Error reading node form 0x%08x: %d\n", phys_ofs, 
ret);
+			return ret;
+		}
+		memcpy(xattr, name, namelen);
+		size += namelen;
+	}
+	rd = jffs2_alloc_raw_dirent();
+	if (!rd)
+		return -ENOMEM;
+
+	ret = jffs2_reserve_space(c, sizeof(*rd)+size, &phys_ofs, &alloclen, 
ALLOC_NORMAL);
+	if (ret) {
+		jffs2_free_raw_dirent(rd);
+		return ret;
+	}
+
+	down(&dir_f->sem);
+
+	/* Build a deletion node */
+	rd->magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rd->nodetype = cpu_to_je16(JFFS2_NODETYPE_DIRENT);
+	rd->totlen = cpu_to_je32(sizeof(*rd) + size);
+	rd->hdr_crc = cpu_to_je32(crc32(0, rd, sizeof(struct 
jffs2_unknown_node)-4));
+
+	rd->pino = cpu_to_je32(dir_f->inocache->ino);
+	rd->version = cpu_to_je32(++dir_f->highest_version);
+	rd->ino = cpu_to_je32(ino);
+	rd->mctime = cpu_to_je32(get_seconds());
+	rd->nsize = namelen;
+
+	rd->type = type;
+
+	rd->node_crc = cpu_to_je32(crc32(0, rd, sizeof(*rd)-8));
+	rd->name_crc = cpu_to_je32(crc32(0, name, namelen));
+
+	fd = jffs2_write_dirent(c, dir_f, rd, xattr, size, phys_ofs, 
ALLOC_NORMAL);
+	fd->nhash = full_name_hash(name, namelen);
+	fd->name[namelen]=0;
+
+	jffs2_free_raw_dirent(rd);
+	if (IS_ERR(fd)) {
+		jffs2_complete_reservation(c);
+		up(&dir_f->sem);
+		return PTR_ERR(fd);
+	}
+
+	/* File it. This will mark the old one obsolete. */
+	jffs2_add_fd_to_list(c, fd, &dir_f->dents);
+
+	jffs2_complete_reservation(c);
+
+	up(&dir_f->sem);
+	kfree(xattr);
+	return 0;
+}
+
+
+
diff -Nur linux-2.6.10.mxc/fs/jffs2/xattr.c 
linux-2.6.10.jffs2/fs/jffs2/xattr.c
--- linux-2.6.10.mxc/fs/jffs2/xattr.c	1970-01-01 08:00:00.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/xattr.c	2005-08-24 11:43:25.000000000 +0800
@@ -0,0 +1,439 @@
+/*
+ * JFFS2 -- Journalling Flash File System, Version 2.
+ *
+ * Copyright(C) 2005 Motorola, Inc.
+ *
+ * Created by Ma yun <yunma@sc.mcel.mot.com>
+ *
+ * For licensing information, see the file 'LICENCE' in the jffs2 
directory.
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/fs.h>
+#include <linux/xattr.h>
+#include <linux/crc32.h>
+#include <linux/jffs2.h>
+#include <linux/jffs2_fs_i.h>
+#include <linux/jffs2_fs_sb.h>
+#include <linux/jffs2_xattr.h>
+#include <linux/mtd/mtd.h>
+#include <linux/time.h>
+#include "nodelist.h"
+
+
+struct xattr_buffer {
+	int size;				/* the size of buffer */
+	struct jffs2_xattr_list *xattr;		/* EAs list */
+};
+
+static int ea_get(struct dentry *parent, struct inode *inode, struct 
xattr_buffer *ea_buf, int min_size)
+{
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode), *p;
+	struct jffs2_raw_dirent	findnode;
+	struct jffs2_raw_node_ref *raw = NULL;
+	struct jffs2_full_dirent *fd_list = NULL;
+	size_t readlen;
+	int size;
+	uint32_t offset = 0;
+	uint32_t ino = f->inocache->ino;
+	int	mem_size = 0;
+	int	ret = 0;
+	int	n_version =0 ;
+
+	memset(&findnode, 0, sizeof(findnode));
+
+	/* lookup the dirent list and find raw dirent*/
+	p = JFFS2_INODE_INFO(parent->d_inode);
+	down(&p->sem);
+	for (fd_list = p->dents; fd_list; fd_list = fd_list->next)
+		if (fd_list->ino == ino && fd_list->version >= n_version) n_version = 
fd_list->version;
+
+	for (fd_list = p->dents; fd_list; fd_list = fd_list->next)
+		if (fd_list->ino == ino && fd_list->version == n_version) break;
+
+	if (fd_list->ino == ino) {
+		for (raw = fd_list->raw; raw && raw->next_in_ino; raw = raw->next_in_ino) 
{
+			offset = ref_offset(raw);
+			ret = jffs2_flash_read(c, offset, sizeof(findnode), &readlen,(char 
*)&findnode);
+			if (readlen != sizeof(findnode) || ret) {
+				up(&p->sem);
+				printk(KERN_WARNING"Error reading node from 0x%08x: %d\n",offset,ret);
+				return ret;
+			}
+			if ((je32_to_cpu(findnode.ino) == ino) && je16_to_cpu(findnode.nodetype) 
== JFFS2_NODETYPE_DIRENT) break;
+		}
+	} else {
+		up(&p->sem);
+		printk(KERN_WARNING"ea_get: can not find the file" );
+		return -1;
+	}
+	up(&p->sem);
+	/* actually, we should check CRC */
+
+	/* end of CRC check */
+	size = je32_to_cpu(findnode.totlen) - (findnode.nsize) - sizeof(findnode);
+	mem_size = max(size, min_size);
+	if (!mem_size) {
+		ea_buf->size = 0;
+		return 0;
+	} else {
+		/* allo`cate a buffer to work with */
+		ea_buf->size = mem_size;
+		ea_buf->xattr = kmalloc(mem_size, GFP_KERNEL);
+
+		if (ea_buf->xattr == NULL)
+			return -ENOMEM;
+		/* copy rd EAs to ea_buf */
+		offset = ref_offset(raw);
+		ret = jffs2_flash_read(c, offset + sizeof(findnode) + findnode.nsize, 
size, &readlen, (char *)ea_buf->xattr);
+		if (ret|| readlen != size) {
+			printk(KERN_WARNING"Error reading node form 0x%08x: %d\n", offset, ret);
+			return ret;
+		}
+		return size;
+	}
+}
+
+
+static int ea_put(struct dentry *parent, struct inode *inode, struct 
xattr_buffer *ea_buf, int new_size)
+{
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode), *p;
+	struct jffs2_raw_dirent *rd, findnode;
+	struct jffs2_raw_node_ref *raw;
+	struct jffs2_full_dirent *fd, *fd_list = NULL;
+	uint32_t direntlen, offset, alloclen, readlen;
+	int ret = 0;
+	char *name, *write_buf = NULL;
+	int namelen = 0;
+	uint32_t ino = f->inocache->ino;
+	int	n_version =0 ;
+
+	memset(&findnode, 0, sizeof(findnode));
+	/* lookup the dirent list and find raw dirent*/
+	p = JFFS2_INODE_INFO(parent->d_inode);
+	down(&p->sem);
+
+	for (fd_list = p->dents; fd_list; fd_list = fd_list->next)
+		if (fd_list->ino == ino && fd_list->version >= n_version) n_version = 
fd_list->version;
+
+	for (fd_list = p->dents; fd_list; fd_list = fd_list->next)
+		if (fd_list->ino == ino && fd_list->version == fd_list->version) break;
+
+	if (fd_list->ino == ino) {
+		for (raw = fd_list->raw; raw && raw->next_in_ino; raw = raw->next_in_ino) 
{
+			offset = ref_offset(raw);
+			ret = jffs2_flash_read(c, offset, sizeof(findnode), &readlen,(char 
*)&findnode);
+			if (ret||readlen != sizeof(findnode)) {
+				up(&p->sem);
+				printk(KERN_WARNING"Error reading node from 0x%08x: %d\n",offset,ret);
+				return ret;
+			}
+			if ((je32_to_cpu(findnode.ino) == ino) && je16_to_cpu(findnode.nodetype) 
== JFFS2_NODETYPE_DIRENT) break;
+		}
+	} else {
+		up(&p->sem);
+		printk(KERN_WARNING"ea_put: can not find the file" );
+		return -1;
+	}
+	up(&p->sem);
+
+	namelen = findnode.nsize;
+
+	/* alloc write_buf for write flash */
+	write_buf  = kmalloc(namelen + new_size, GFP_KERNEL);
+	if (!write_buf)
+		return -ENOMEM;
+
+	/* get the name in write_buf */
+	ret = jffs2_flash_read(c, offset + sizeof(findnode), findnode.nsize, 
&readlen, write_buf);
+	if (ret||readlen != findnode.nsize) {
+		printk(KERN_WARNING"Error reading node form 0x%08x: %d\n", offset, ret);
+		return ret;
+	}
+	/* get the name in "name" */
+	name = kmalloc(namelen + 1, GFP_KERNEL);
+	if (!name) {
+		kfree(write_buf);
+		return -ENOMEM;
+	}
+	memcpy(name, write_buf, namelen);
+	/* find the space for write */
+	direntlen = sizeof(findnode) + namelen + new_size;
+	ret = jffs2_reserve_space(c, direntlen, &offset, &alloclen, ALLOC_NORMAL);
+	if (ret)
+		return ret;
+	/* alloc the raw_dirent cache */
+	rd = jffs2_alloc_raw_dirent();
+	if (!rd) {
+		kfree(write_buf);
+		kfree(name);
+		return -ENOMEM;
+	}
+
+	down(&p->sem);
+
+	rd->magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rd->nodetype = cpu_to_je16(JFFS2_NODETYPE_DIRENT);
+	rd->totlen = cpu_to_je32(direntlen);
+	rd->hdr_crc = cpu_to_je32(crc32(0, rd, sizeof(struct jffs2_unknown_node) - 
4));
+
+	rd->pino = cpu_to_je32(p->inocache->ino);
+	rd->version = cpu_to_je32(++p->highest_version);
+	rd->ino	= findnode.ino;
+	rd->mctime = cpu_to_je32(get_seconds());
+	rd->nsize = namelen;
+	rd->unused[0] = ea_buf->size;
+	/* fix me*/
+	memcpy(&(write_buf[namelen]), ea_buf->xattr, new_size);
+	rd->type = findnode.type;
+	rd->node_crc = cpu_to_je32(crc32(0, rd, sizeof(*rd) - 8));
+	rd->name_crc = cpu_to_je32(crc32(0, write_buf, namelen));
+
+	fd = jffs2_write_dirent(c, p, rd, write_buf, namelen + new_size, offset, 
ALLOC_NORMAL);
+	/* restore the name */
+	fd->nhash = full_name_hash(name, namelen);
+	fd->name[namelen] = 0;
+	if (IS_ERR(fd)) {
+		kfree(write_buf);
+		kfree(name);
+		jffs2_free_raw_dirent(rd);
+		jffs2_complete_reservation(c);
+		up(&p->sem);
+		return PTR_ERR(fd);
+	}
+	jffs2_add_fd_to_list(c, fd, &p->dents);
+	jffs2_complete_reservation(c);
+	jffs2_free_raw_dirent(rd);
+	up(&p->sem);
+
+	kfree(write_buf);
+	kfree(name);
+
+	return 0;
+}
+
+
+static void ea_release(struct xattr_buffer *ea_buf)
+{
+	if (ea_buf->size)
+		kfree(ea_buf->xattr);
+}
+ssize_t jffs2_getxattr(struct dentry *dentry, const char *name, void *data, 
size_t buf_size)
+{
+	struct inode *inode = dentry->d_inode;
+	struct dentry *parent;
+	struct jffs2_xattr_list *ealist;
+	struct jffs2_xattr	*ea;
+	struct xattr_buffer	ea_buf;
+	int xattr_size;
+	ssize_t	size;
+	int namelen = strlen(name);
+	char *value;
+
+	if (name == NULL)
+		return -EINVAL;
+
+	D1(printk(KERN_DEBUG"jffs2_getxattr: name=%s, buffer=%p, 
buffer_size=%ld",name,data,(long)buf_size));
+
+	parent = dentry->d_parent;
+	xattr_size = ea_get(parent, inode, &ea_buf, 0);
+	if (xattr_size < 0) {
+		size = xattr_size;
+		goto out;
+	}
+
+	if (xattr_size == 0)
+		goto not_found;
+
+	ealist = (struct jffs2_xattr_list *)ea_buf.xattr;
+
+	/* Find the named attribute*/
+	for (ea=FIRST_XATTR(ealist); ea < END_XATTR(ealist,xattr_size); ea = 
NEXT_XATTR(ea))
+		if ((namelen == ea->namelen) &&
+			memcmp(name,ea->name,namelen)==0) {
+		/* Found */
+		size = ea->valuelen;
+		if (!data)
+			goto release;
+		else if (size > buf_size) {
+			size = -ERANGE;
+			goto release;
+		}
+		value = ((char *)&ea->name) + ea->namelen + 1;
+		memcpy(data,value,size);
+		goto release;
+	}
+not_found:
+	data = NULL;
+	size = -ENODATA;
+release:
+	ea_release(&ea_buf);
+out:
+	return size;
+}
+
+int jffs2_setxattr(struct dentry *dentry, const char *name, const void 
*value, size_t value_len, int flags)
+{
+	struct inode *inode = dentry->d_inode;
+	struct dentry *parent;
+	struct jffs2_xattr_list *ealist;
+	struct jffs2_xattr	*ea, *old_ea = NULL, *next_ea = NULL;
+	struct xattr_buffer	ea_buf;
+	int found=0;
+	int xattr_size = 0;
+	int namelen = strlen(name);
+	int old_ea_size = 0;
+	int new_size;			/* the size of new EAs */
+	int length;
+	int ret;
+
+	if (value == NULL || value_len == 0) {
+		value = "";
+		value_len = 0;
+	}
+
+	parent = dentry->d_parent;
+	/* read the inode's EAs */
+	xattr_size = ea_get(parent, inode, &ea_buf, 0);
+	if (xattr_size < 0) {
+		ret = xattr_size;
+		goto out;
+	}
+
+again:
+	ealist = (struct jffs2_xattr_list *)ea_buf.xattr;
+	new_size = sizeof(struct jffs2_xattr_list);
+
+	if (xattr_size) {
+		for (ea = FIRST_XATTR(ealist); ea < END_XATTR(ealist,xattr_size); ea = 
NEXT_XATTR(ea)) {
+			if ((namelen == ea->namelen) &&
+				(memcmp(name, ea->name,namelen) == 0)) {
+				found = 1;
+				if (flags & XATTR_CREATE) {
+					ret = -EEXIST;
+					goto release;
+				}
+				old_ea = ea;
+				old_ea_size = JFFS2_XATTR_SIZE(ea);
+				next_ea = NEXT_XATTR(ea);
+			} else
+				new_size += JFFS2_XATTR_SIZE(ea);
+		}
+	}
+
+	if (!found) {
+		if (flags & XATTR_REPLACE) {
+			ret = -ENODATA;
+			goto release;
+		}
+		if (value == NULL) {
+			ret = 0;
+			goto release;
+		}
+	}
+	if (value && value_len)
+		new_size += sizeof(struct jffs2_xattr) + namelen + 1 + value_len;
+
+	/* compare with the size of current buffer */
+	if (new_size > ea_buf.size) {
+		/*
+		 * We need to reallocate more space for merged ea list
+		 */
+		ea_release(&ea_buf);
+		xattr_size = ea_get(parent, inode, &ea_buf, new_size);
+		if (xattr_size < 0) {
+			ret = xattr_size;
+			goto out;
+		}
+		goto again;
+	}
+
+	/* remove the old ea of the same name */
+	if (found) {
+		length = (char *)END_XATTR(ealist,xattr_size) - (char *)next_ea;
+		if (length > 0)
+			memmove(old_ea,next_ea,length);
+		xattr_size -= old_ea_size;
+	}
+	/* add new EA to the end */
+	if (value && value_len) {
+		ea = (struct jffs2_xattr *)((char *)ealist + xattr_size);
+		ea->namelen = namelen;
+		ea->valuelen = value_len;
+		memcpy(ea->name, name, namelen);
+		ea->name[namelen] = 0;
+		if (value_len)
+			memcpy(ea->name + namelen + 1, value, value_len);
+		xattr_size += JFFS2_XATTR_SIZE(ea);
+	}
+	/* DEGUG*/
+	if (new_size != xattr_size) {
+		printk(KERN_ERR"jffs2_setxattr: xattr_size = %d, new_size = %d\n", 
xattr_size, new_size);
+		ret = -EINVAL;
+		goto release;
+	}
+	if (new_size == sizeof(struct jffs2_xattr_list))
+		new_size = 0;
+
+	ret = ea_put(parent, inode, &ea_buf, new_size);
+	goto out;
+release:
+	ea_release(&ea_buf);
+out:
+	return ret;
+}
+
+ssize_t jffs2_listxattr(struct dentry *dentry, char *data, size_t buf_size)
+{
+	struct inode *inode = dentry->d_inode;
+	struct dentry *parent;
+	char *buffer;
+	ssize_t size = 0;
+	int xattr_size;
+	struct jffs2_xattr_list *ealist;
+	struct jffs2_xattr *ea;
+	struct xattr_buffer ea_buf;
+
+	memset(data, 0, buf_size);
+
+	parent = dentry->d_parent;
+	xattr_size = ea_get(parent, inode, &ea_buf, 0);
+	if (xattr_size < 0) {
+		size = xattr_size;
+		goto out;
+	}
+	if (xattr_size == 0)
+		goto release;
+
+	ealist = (struct jffs2_xattr_list *)ea_buf.xattr;
+
+	for (ea = FIRST_XATTR(ealist); ea < END_XATTR(ealist, xattr_size); ea = 
NEXT_XATTR(ea))
+		size += ea->namelen + 1;
+
+	if (!data)
+		goto release;
+
+	if (size > buf_size) {
+		size = -ERANGE;
+		goto release;
+	}
+	buffer = data;
+	for (ea = FIRST_XATTR(ealist); ea < END_XATTR(ealist, xattr_size); ea = 
NEXT_XATTR(ea)) {
+		memcpy(buffer, ea->name, ea->namelen);
+		buffer[ea->namelen] = '\\';
+		buffer += ea->namelen +1;
+	}
+release:
+	ea_release(&ea_buf);
+out:
+	return size;
+}
+
+int jffs2_removexattr(struct dentry *dentry, const char *name)
+{
+	return jffs2_setxattr(dentry, name, NULL, 0, XATTR_REPLACE);
+}
diff -Nur linux-2.6.10.mxc/fs/Kconfig linux-2.6.10.jffs2/fs/Kconfig
--- linux-2.6.10.mxc/fs/Kconfig	2005-08-19 15:40:26.000000000 +0800
+++ linux-2.6.10.jffs2/fs/Kconfig	2005-08-19 15:50:52.000000000 +0800
@@ -1201,6 +1201,12 @@
	  Further information on the design and implementation of JFFS2 is
	  available at <http://sources.redhat.com/jffs2/>.

+config JFFS2_FS_XATTR
+	bool "JFFS2 extended attributes"
+	depends on JFFS2_FS
+	help
+	 JFFS2 extended attributes
+
config JFFS2_FS_DEBUG
	int "JFFS2 debugging verbosity (0 = quiet, 2 = noisy)"
	depends on JFFS2_FS
diff -Nur linux-2.6.10.mxc/include/linux/jffs2_xattr.h 
linux-2.6.10.jffs2/include/linux/jffs2_xattr.h
--- linux-2.6.10.mxc/include/linux/jffs2_xattr.h	1970-01-01 
08:00:00.000000000 +0800
+++ linux-2.6.10.jffs2/include/linux/jffs2_xattr.h	2005-08-23 
21:00:34.000000000 +0800
@@ -0,0 +1,48 @@
+/*
+ *
+ * Copyright(C) 2005 Motorola, Inc.
+ *
+ * Created by Ma yun <yunma@sc.mcel.mot.com>
+ *
+ * For licensing information, see the file 'LICENCE' in the jffs2 
directory.
+ */
+
+
+#ifndef  _JFFS2_XATTR
+#define  _JFFS2_XATTR
+
+/* jffs2_xattr describe the on-disk format of the extended attributes.
+ *
+ */
+struct jffs2_xattr {
+	uint8_t namelen;	/* Length of name */
+	uint8_t valuelen;	/* Length of value */
+	char name[0];		/* Attribute name (include null-terminator)*/
+				/* Attribute Valude immediately follows name */
+}__attribute__((packed));
+
+struct jffs2_xattr_list {
+	struct jffs2_xattr xattr[0];	/* EAs list */
+}__attribute__((packed));
+
+
+/*
+ * Some macros for dealing with variable length EA lists.
+ */
+#define JFFS2_XATTR_SIZE(xattr)	\
+	(sizeof(struct jffs2_xattr) + (xattr)->namelen + 1 + \
+	(xattr)->valuelen)
+#define NEXT_XATTR(xattr)	\
+	((struct jffs2_xattr *)(((char *)(xattr)) + (JFFS2_XATTR_SIZE(xattr))))
+#define FIRST_XATTR(xattr_list)	\
+	((xattr_list)->xattr)
+#define END_XATTR(xattr_list,size)	\
+	((struct jffs2_xattr *)(((char *)(xattr_list)) + size))
+
+extern int jffs2_setxattr(struct dentry *, const char *, const void *, 
size_t, int);
+extern ssize_t jffs2_getxattr(struct dentry *, const char *, void *, 
size_t);
+extern ssize_t jffs2_listxattr(struct dentry *, char *, size_t);
+extern int jffs2_removexattr(struct dentry *, const char *);
+
+#endif
+


------=_NextPart_000_2d58_7d49_5dd4--

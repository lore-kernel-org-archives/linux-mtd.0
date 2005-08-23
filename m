Received: from bay21-f29.bay21.hotmail.com ([65.54.233.118] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7POr-0008NZ-TL
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 04:24:37 +0100
Message-ID: <BAY21-F2970080DD3DE9F24391283F5A90@phx.gbl>
From: "Ma Yun" <sx_yunma@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 23 Aug 2005 11:24:20 +0800
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_NextPart_000_5343_4bc7_4efb"
Subject: [PATCH] XATTR support in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_5343_4bc7_4efb
Content-Type: text/plain; format=flowed

Hi!

I've implemented the extended attributes for JFFS2. The implementation 
mechanism is simple, but it can work:). This implementation support standard 
extended attributes system call, such as setxattr, getxattr .... but does 
not support ACL.

The patch is based on Linux-2.6.10

Comments are welcome...

Signed-off-by: Yun Ma <sx_yunma@hotmail.com>


===========================
Best Regards

Yun Ma

_________________________________________________________________
FREE pop-up blocking with the new MSN Toolbar - get it now! 
http://toolbar.msn.click-url.com/go/onm00200415ave/direct/01/

------=_NextPart_000_5343_4bc7_4efb
Content-Type: text/plain; name="patch-jffs2-xattr.patch"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="patch-jffs2-xattr.patch"

diff -uNr linux-2.6.10.mxc/fs/jffs2/file.c 
linux-2.6.10.jffs2/fs/jffs2/file.c
--- linux-2.6.10.mxc/fs/jffs2/file.c	2005-08-19 15:40:26.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/file.c	2005-08-19 15:48:40.000000000 +0800
@@ -20,6 +20,9 @@
#include <linux/highmem.h>
#include <linux/crc32.h>
#include <linux/jffs2.h>
+#ifdef CONFIG_JFFS2_FS_XATTR
+#include <linux/jffs2_xattr.h>
+#endif
#include "nodelist.h"

extern int generic_file_open(struct inode *, struct file *) 
__attribute__((weak));
@@ -55,6 +58,12 @@

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

diff -uNr linux-2.6.10.mxc/fs/jffs2/Makefile 
linux-2.6.10.jffs2/fs/jffs2/Makefile
--- linux-2.6.10.mxc/fs/jffs2/Makefile	2005-08-19 15:40:26.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/Makefile	2005-08-19 15:44:39.000000000 +0800
@@ -11,6 +11,7 @@
jffs2-y	+= symlink.o build.o erase.o background.o fs.o writev.o
jffs2-y	+= super.o

+jffs2-$(CONFIG_JFFS2_FS_XATTR)	+= xattr.o
jffs2-$(CONFIG_JFFS2_FS_NAND)	+= wbuf.o
jffs2-$(CONFIG_JFFS2_FS_NOR_ECC) += wbuf.o
jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
diff -uNr linux-2.6.10.mxc/fs/jffs2/nodelist.c 
linux-2.6.10.jffs2/fs/jffs2/nodelist.c
--- linux-2.6.10.mxc/fs/jffs2/nodelist.c	2005-08-19 15:40:26.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/nodelist.c	2005-08-19 15:47:12.000000000 
+0800
@@ -173,6 +173,7 @@
				goto free_out;
			}
			/* sanity check */
+			#ifndef CONFIG_JFFS2_FS_XATTR
			if (PAD((node.d.nsize + sizeof (node.d))) != PAD(je32_to_cpu 
(node.d.totlen))) {
				printk(KERN_NOTICE "jffs2_get_inode_nodes(): Illegal nsize in node at 
0x%08x: nsize 0x%02x, totlen %04x\n",
				       ref_offset(ref), node.d.nsize, je32_to_cpu(node.d.totlen));
@@ -180,6 +181,7 @@
				spin_lock(&c->erase_completion_lock);
				continue;
			}
+			#endif
			if (je32_to_cpu(node.d.version) > *highest_version)
				*highest_version = je32_to_cpu(node.d.version);
			if (ref_obsolete(ref)) {
diff -uNr linux-2.6.10.mxc/fs/jffs2/xattr.c 
linux-2.6.10.jffs2/fs/jffs2/xattr.c
--- linux-2.6.10.mxc/fs/jffs2/xattr.c	1970-01-01 08:00:00.000000000 +0800
+++ linux-2.6.10.jffs2/fs/jffs2/xattr.c	2005-08-19 16:17:29.000000000 +0800
@@ -0,0 +1,467 @@
+/*
+ *
+ * Copyright 2005 Motorola, Inc. All Rights Reserved.
+ *
+ * Created by Ma yun <yunma@sc.mcel.mot.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  
USA
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
+	int size;				/* the size of current use  buffer */
+	struct jffs2_xattr_list *xattr;		/* buffer containing EAs list */
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
+	/* lookup the dirent list and find raw dirent*/
+
+	p = JFFS2_INODE_INFO(parent->d_inode);
+	down(&p->sem);
+	for(fd_list = p->dents; fd_list; fd_list = fd_list->next){
+		if (fd_list->ino == ino && fd_list->version >= n_version) n_version = 
fd_list->version;
+	}
+
+	for(fd_list = p->dents; fd_list; fd_list = fd_list->next){
+                if (fd_list->ino == ino && fd_list->version == n_version) 
break;
+        }
+
+	if (fd_list->ino == ino) {
+		for(raw = fd_list->raw; raw && raw->next_in_ino; raw = raw->next_in_ino){
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
+		if (ea_buf->xattr == NULL) {
+			return -ENOMEM;
+		}
+		/* copy rd EAs to ea_buf */
+		offset = ref_offset(raw);
+		ret = jffs2_flash_read(c, offset + sizeof(findnode) + findnode.nsize, 
size, &readlen, (char *)ea_buf->xattr);
+		if (ret|| readlen != size){
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
+        struct jffs2_raw_node_ref *raw;
+        struct jffs2_full_dirent *fd, *fd_list = NULL;
+	uint32_t direntlen, offset, alloclen, readlen;
+	int ret = 0;
+	char *name, *write_buf = NULL;
+	int namelen = 0;
+	uint32_t ino = f->inocache->ino;
+	int     n_version =0 ;
+
+	memset(&findnode, 0, sizeof(findnode));
+	/* lookup the dirent list and find raw dirent*/
+        p = JFFS2_INODE_INFO(parent->d_inode);
+       	down(&p->sem);
+
+	for(fd_list = p->dents; fd_list; fd_list = fd_list->next){
+                if (fd_list->ino == ino && fd_list->version >= n_version) 
n_version = fd_list->version;
+        }
+
+	for(fd_list = p->dents; fd_list; fd_list = fd_list->next)
+                if (fd_list->ino == ino && fd_list->version == 
fd_list->version) break;
+
+        if (fd_list->ino == ino){
+                for(raw = fd_list->raw; raw && raw->next_in_ino; raw = 
raw->next_in_ino) {
+                        offset = ref_offset(raw);
+                        ret = jffs2_flash_read(c, offset, sizeof(findnode), 
&readlen,(char *)&findnode);
+                        if (ret||readlen != sizeof(findnode)) {
+				up(&p->sem);
+                                printk(KERN_WARNING"Error reading node from 
0x%08x: %d\n",offset,ret);
+                                return ret;
+                        }
+                        if ((je32_to_cpu(findnode.ino) == ino) && 
je16_to_cpu(findnode.nodetype) == JFFS2_NODETYPE_DIRENT) break;
+                }
+        } else {
+		up(&p->sem);
+                printk(KERN_WARNING"ea_put: can not find the file" );
+                return -1;
+        }
+	up(&p->sem);
+
+	namelen = findnode.nsize;
+
+	/* alloc write_buf for write flash */
+	write_buf  = kmalloc(namelen + new_size, GFP_KERNEL);
+        if (!write_buf) {
+                return -ENOMEM;
+        }
+	/* get the name in write_buf */
+        ret = jffs2_flash_read(c, offset + sizeof(findnode), 
findnode.nsize, &readlen, write_buf);
+	if (ret||readlen != findnode.nsize){
+		printk(KERN_WARNING"Error reading node form 0x%08x: %d\n", offset, ret);
+		return ret;
+	}
+	/* get the name in "name" */
+	name = kmalloc(namelen + 1, GFP_KERNEL);
+	if (!name) {
+		if (write_buf)
+			kfree(write_buf);
+		return -ENOMEM;
+	}
+	memcpy(name, write_buf, namelen);
+	/* find the space for write */
+	direntlen = sizeof(findnode) + namelen + new_size;
+	ret = jffs2_reserve_space(c, direntlen, &offset, &alloclen, ALLOC_NORMAL);
+	if (ret) {
+		return ret;
+	}
+	/* alloc the raw_dirent cache */
+	rd = jffs2_alloc_raw_dirent();
+	if (!rd) {
+		if (write_buf)
+			kfree(write_buf);
+		if (name)
+			kfree(name);
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
+		if (write_buf)
+			kfree(write_buf);
+		if (name)
+			kfree(name);
+		jffs2_free_raw_dirent(rd);
+		jffs2_complete_reservation(c);
+		up(&p->sem);
+		return PTR_ERR(fd);
+	}
+	jffs2_add_fd_to_list(c, fd, &p->dents);
+	jffs2_complete_reservation(c);
+	jffs2_free_raw_dirent(rd);
+	up(&p->sem);
+	if (write_buf)
+		kfree(write_buf);
+	if (name)
+		kfree(name);
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
+//	down_read(&JFFS2_INODE_INFO(inode)->xattr_sem);
+	parent = dentry->d_parent;
+	xattr_size = ea_get(parent, inode, &ea_buf, 0);
+	if (xattr_size < 0) {
+		size = xattr_size;
+		goto out;
+	}
+
+	if (xattr_size == 0) {
+		goto not_found;
+	}
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
+//	up_read(&JFFS2_INODE_INFO(inode)->xattr_sem);
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
+  again:
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
+   release:
+	ea_release(&ea_buf);
+   out:
+	//up_write(&JFFS2_INODE_INFO(inode)->xattr_sem);
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
+	//down_read(&JFFS2_INODE_INFO(inode)->xattr_sem);
+	parent = dentry->d_parent;
+	xattr_size = ea_get(parent, inode, &ea_buf, 0);
+	if (xattr_size < 0) {
+		size = xattr_size;
+		goto out;
+	}
+	if (xattr_size == 0) {
+		goto release;
+	}
+
+	ealist = (struct jffs2_xattr_list *)ea_buf.xattr;
+
+	for (ea = FIRST_XATTR(ealist); ea < END_XATTR(ealist, xattr_size); ea = 
NEXT_XATTR(ea))
+		size += ea->namelen +1;
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
+   release:
+	ea_release(&ea_buf);
+   out:
+//	up_read(&JFFS2_INODE_INFO(inode)->xattr_sem);
+	return size;
+}
+
+int jffs2_removexattr(struct dentry *dentry, const char *name)
+{
+	return jffs2_setxattr(dentry, name, NULL, 0, XATTR_REPLACE);
+}
diff -uNr linux-2.6.10.mxc/fs/Kconfig linux-2.6.10.jffs2/fs/Kconfig
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
diff -uNr linux-2.6.10.mxc/include/linux/jffs2_xattr.h 
linux-2.6.10.jffs2/include/linux/jffs2_xattr.h
--- linux-2.6.10.mxc/include/linux/jffs2_xattr.h	1970-01-01 
08:00:00.000000000 +0800
+++ linux-2.6.10.jffs2/include/linux/jffs2_xattr.h	2005-08-19 
16:20:18.000000000 +0800
@@ -0,0 +1,59 @@
+/*
+ *
+ * Copyright 2005 Motorola, Inc. All Rights Reserved.
+ *
+ * Created by Ma yun <yunma@sc.mcel.mot.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  
USA
+ */
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


------=_NextPart_000_5343_4bc7_4efb--

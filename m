Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E7Y4D-00086H-Io
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 08:39:53 -0400
Date: Tue, 23 Aug 2005 14:39:23 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ma Yun <sx_yunma@hotmail.com>
Message-ID: <20050823123923.GA30853@wohnheim.fh-wedel.de>
References: <BAY21-F2970080DD3DE9F24391283F5A90@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY21-F2970080DD3DE9F24391283F5A90@phx.gbl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] XATTR support in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 23 August 2005 11:24:20 +0800, Ma Yun wrote:
> 
> I've implemented the extended attributes for JFFS2. The implementation 
> mechanism is simple, but it can work:). This implementation support 
> standard extended attributes system call, such as setxattr, getxattr .... 
> but does not support ACL.
> 
> The patch is based on Linux-2.6.10
> 
> Comments are welcome...

Great stuff!

First round of comments follows...

> diff -uNr linux-2.6.10.mxc/fs/jffs2/file.c 
> linux-2.6.10.jffs2/fs/jffs2/file.c
> --- linux-2.6.10.mxc/fs/jffs2/file.c	2005-08-19 15:40:26.000000000 +0800
> +++ linux-2.6.10.jffs2/fs/jffs2/file.c	2005-08-19 15:48:40.000000000 +0800
> @@ -20,6 +20,9 @@
> #include <linux/highmem.h>
> #include <linux/crc32.h>
> #include <linux/jffs2.h>
> +#ifdef CONFIG_JFFS2_FS_XATTR
> +#include <linux/jffs2_xattr.h>
> +#endif

Include that file unconditionally.

...

> +			#ifndef CONFIG_JFFS2_FS_XATTR

#ifdef and friends should start in the first column.

...

> diff -uNr linux-2.6.10.mxc/fs/jffs2/xattr.c 
> linux-2.6.10.jffs2/fs/jffs2/xattr.c
> --- linux-2.6.10.mxc/fs/jffs2/xattr.c	1970-01-01 08:00:00.000000000 +0800
> +++ linux-2.6.10.jffs2/fs/jffs2/xattr.c	2005-08-19 
> 16:17:29.000000000 +0800
> @@ -0,0 +1,467 @@
> +/*
> + *
> + * Copyright 2005 Motorola, Inc. All Rights Reserved.
> + *
> + * Created by Ma yun <yunma@sc.mcel.mot.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  
> USA

Would be nice if you could remove the GPL preamble from the most
important part of the file (first page when opened up).  Not sure if
your lawyers require this.

> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/fs.h>
> +#include <linux/xattr.h>
> +#include <linux/crc32.h>
> +#include <linux/jffs2.h>
> +#include <linux/jffs2_fs_i.h>
> +#include <linux/jffs2_fs_sb.h>
> +#include <linux/jffs2_xattr.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/time.h>
> +#include "nodelist.h"
> +
> +
> +struct xattr_buffer {
> +	int size;				/* the size of current use  
> buffer */

Your mailer is adding line breaks.  The patch is unusable like this.

...

> +		if (ea_buf->xattr == NULL) {
> +			return -ENOMEM;
> +		}

Curly brackets for single lines are usually frowned upon.  See
Documentation/CodingStyle.

> +		/* copy rd EAs to ea_buf */
> +		offset = ref_offset(raw);
> +		ret = jffs2_flash_read(c, offset + sizeof(findnode) + 
> findnode.nsize, size, &readlen, (char *)ea_buf->xattr);
> +		if (ret|| readlen != size){
> +			printk(KERN_WARNING"Error reading node form 0x%08x: 
> %d\n", offset, ret);
> +			return ret;
> +		}
> +		return size;
> +	}
> +}
> +
> +
> +static int ea_put(struct dentry *parent, struct inode *inode, struct 
> xattr_buffer *ea_buf, int new_size)
> +{
> +	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
> +	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode), *p;
> +	struct jffs2_raw_dirent *rd, findnode;
> +        struct jffs2_raw_node_ref *raw;
> +        struct jffs2_full_dirent *fd, *fd_list = NULL;

Quoting makes the tab vs. 8 chars difference visible. :)

> +	uint32_t direntlen, offset, alloclen, readlen;
> +	int ret = 0;
> +	char *name, *write_buf = NULL;
> +	int namelen = 0;
> +	uint32_t ino = f->inocache->ino;
> +	int     n_version =0 ;
> +
> +	memset(&findnode, 0, sizeof(findnode));
> +	/* lookup the dirent list and find raw dirent*/
> +        p = JFFS2_INODE_INFO(parent->d_inode);
> +       	down(&p->sem);
> +
> +	for(fd_list = p->dents; fd_list; fd_list = fd_list->next){
           ^                                                     ^
Extra space where indicated.

...

> +		if (write_buf)
> +			kfree(write_buf);

Same check is done inside kfree already.  Remove the conditional.

...

> +ssize_t jffs2_getxattr(struct dentry *dentry, const char *name, void 
> *data, size_t buf_size)
> +{
> +	struct inode *inode = dentry->d_inode;
> +	struct dentry *parent;
> +	struct jffs2_xattr_list *ealist;
> +	struct jffs2_xattr	*ea;
> +	struct xattr_buffer	ea_buf;
> +	int xattr_size;
> +	ssize_t	size;
> +	int namelen = strlen(name);
> +	char *value;
> +
> +	if (name == NULL)
> +		return -EINVAL;
> +
> +	D1(printk(KERN_DEBUG"jffs2_getxattr: name=%s, buffer=%p, 
> buffer_size=%ld",name,data,(long)buf_size));
> +
> +//	down_read(&JFFS2_INODE_INFO(inode)->xattr_sem);

What happened here?

> +	parent = dentry->d_parent;
> +	xattr_size = ea_get(parent, inode, &ea_buf, 0);
> +	if (xattr_size < 0) {
> +		size = xattr_size;
> +		goto out;
> +	}

...

> +/* jffs2_xattr describe the on-disk format of the extended attributes.
> + *
> + */
> +struct jffs2_xattr {
> +	uint8_t namelen;	/* Length of name */
> +	uint8_t valuelen;	/* Length of value */
> +	char name[0];		/* Attribute name (include null-terminator)*/
> +				/* Attribute Valude immediately follows name 
> */

Why just 8bit length fields?

> +}__attribute__((packed));
> +
> +struct jffs2_xattr_list {
> +	struct jffs2_xattr xattr[0];	/* EAs list */
> +}__attribute__((packed));

An array of variable-length members?  This looks wrong.

> +
> +
> +/*
> + * Some macros for dealing with variable length EA lists.
> + */
> +#define JFFS2_XATTR_SIZE(xattr)	\
> +	(sizeof(struct jffs2_xattr) + (xattr)->namelen + 1 + \
> +	(xattr)->valuelen)

Inconsistent.  Either add the NUL-termination to both key and value,
or to none of them.

> +#define NEXT_XATTR(xattr)	\
> +	((struct jffs2_xattr *)(((char *)(xattr)) + 
> (JFFS2_XATTR_SIZE(xattr))))
> +#define FIRST_XATTR(xattr_list)	\
> +	((xattr_list)->xattr)
> +#define END_XATTR(xattr_list,size)	\
> +	((struct jffs2_xattr *)(((char *)(xattr_list)) + size))
> +
> +extern int jffs2_setxattr(struct dentry *, const char *, const void *, 
> size_t, int);
> +extern ssize_t jffs2_getxattr(struct dentry *, const char *, void *, 
> size_t);
> +extern ssize_t jffs2_listxattr(struct dentry *, char *, size_t);
> +extern int jffs2_removexattr(struct dentry *, const char *);
> +
> +#endif
> +
> 

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack

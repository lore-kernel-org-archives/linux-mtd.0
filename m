Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fcmrq-0005FR-Sj
	for linux-mtd@lists.infradead.org; Sun, 07 May 2006 13:16:34 -0400
Date: Sun, 7 May 2006 19:16:01 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
Message-ID: <20060507171601.GA7990@wohnheim.fh-wedel.de>
References: <445C476A.2090506@ak.jp.nec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <445C476A.2090506@ak.jp.nec.com>
Cc: jmorris@redhat.com, sds@tycho.nsa.gov, russell@coker.com.au,
	linux-mtd@lists.infradead.org, lorenzo@gnu.org, dwmw2@infradead.org
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The code already looks quite good on the surface.  Finding deeper
problems takes more time, which I lack.  So there are not many
comments in this round.

On Sat, 6 May 2006 15:51:22 +0900, KaiGai Kohei wrote:
> +
> +static struct posix_acl *jffs2_acl_from_medium(const void *value, size_t size)
> +{
> +	const char *end = (char *)value + size;

This cast appears to be unnecessary.  Gcc has an extention that allows
arithmetic on void* pointers.  The behaviour is just as if the pointer
was casted to unsigned long and back - quite useful.

> +	ver = je32_to_cpu(((jffs2_acl_header *)value)->a_version);

In this case, it might make sense to create a local variable:
	jffs2_acl_header *header = value;
	...
	ver = je32_to_cpu(header->a_version);

If only a single field is used from the header, this is a matter of
taste.  If it occurs more often, the local variable helps with
readability.

> +	value = (char *)value + sizeof(jffs2_acl_header);

Can be removed.

> +	for (i=0; i < count; i++) {
> +		jffs2_acl_entry *entry = (jffs2_acl_entry *)value;

This cast can be removed.  void* can implicitly be cast to any pointer
type.  Also, would it be possible to move this variable to the
beginning of the function and use it for the version check?

> +		if ((char *)value + sizeof(jffs2_acl_entry_short) > end)

This and two more can be removed.

There is a reason to remove explicit casts whereever possible - and
why a strongly typed language like C++ can cause problems.  With every
explicit cast, the compiler has to assume that everything is correct
here, even if it isn't.  And if explicit casts are used everywhere in
the source, a human will usually do the same and ignore bugs that
should have been obvious.

In C, esp. with the gcc extension for void* arithmetic, explicit casts
are very rarely needed.  And those few cases are easily checked by
humans for correctness.

Strong typing can also help to avoid bugs, but usually 95% of the code
is better off with weak typing, as in C.  Some of the remaining cases
are caught by sparse with __bitwise and friends, so by my estimate 99%
of the code is better off without strong typing.

> +	jffs2_acl = (jffs2_acl_header *)kmalloc(sizeof(jffs2_acl_header)

kmalloc() returns a void*, so no explicit cast is needed.

> +	return (char *)jffs2_acl;

And this function returns void*, so this explicit cast isn't needed
either.

> --- mtd-2.6.git/fs/jffs2/acl.h	1970-01-01 09:00:00.000000000 +0900
> +++ mtd-2.6.0506/fs/jffs2/acl.h	2006-05-06 11:28:19.000000000 +0900
> @@ -0,0 +1,46 @@

#ifndef JFFS2_ACL_H
#define JFFS2_ACL_H
...
#endif

> +#ifdef __KERNEL__
> +#ifdef CONFIG_JFFS2_FS_POSIX_ACL
> +
> +#define JFFS2_ACL_NOT_CACHED ((void *)-1)
> +
> +extern int jffs2_permission(struct inode *, int, struct nameidata *);
> +extern int jffs2_acl_chmod(struct inode *);
> +extern int jffs2_init_acl(struct inode *, struct inode *);
> +extern void jffs2_clear_acl(struct inode *);
> +
> +extern struct xattr_handler jffs2_acl_access_xattr_handler;
> +extern struct xattr_handler jffs2_acl_default_xattr_handler;
> +
> +#else
> +
> +#define jffs2_permission NULL
> +#define jffs2_acl_chmod(inode)		(0)
> +#define jffs2_init_acl(inode,dir)	(0)
> +#define jffs2_clear_acl(inode)
> +
> +#endif	/* CONFIG_JFFS2_FS_POSIX_ACL */
> +#endif	/* __KERNEL__ */

The kernel is in a fairly bad shape wrt. seperating userspace
interface and in-kernel headers.  dwmw2 is currently trying to sort
things out.  Splitting this part into a seperate file would make his
job a bit easier.

> @@ -107,11 +109,16 @@ struct jffs2_inode_cache {
>  		temporary lists of dirents, and later must be set to
>  		NULL to mark the end of the raw_node_ref->next_in_ino
>  		chain. */
> +	u8 class;	/* It's used for identification */
> +	u8 flags;
> +	uint16_t state;
>  	struct jffs2_inode_cache *next;
>  	struct jffs2_raw_node_ref *nodes;
>  	uint32_t ino;
>  	int nlink;
> -	int state;
> +#ifdef CONFIG_JFFS2_FS_XATTR
> +	struct list_head ilist;
> +#endif
>  };

Why does this field depend on CONFIG_JFFS2_FS_XATTR, while the above
doesn't?  It looks as if splitting state into several fields is a
generic cleanup and can be merged independently of xattr support.

> [...]

Overall, the code looks nicer than most of the current jffs2, that is
good.  What worries me a bit is the number of #ifdef's in it.  In
sufficient number, those can make any code unmaintainable.  In the
headers and in malloc.c, they are fine.  In other files, it would be
good if they could get removed somehow.

Jörn

-- 
He who knows that enough is enough will always have enough.
-- Lao Tsu

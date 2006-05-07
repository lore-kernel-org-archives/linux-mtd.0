Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1Fcies-0001nP-Kc
	for linux-mtd@lists.infradead.org; Sun, 07 May 2006 08:46:50 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <445C476A.2090506@ak.jp.nec.com>
References: <445C476A.2090506@ak.jp.nec.com>
Content-Type: text/plain
Date: Sun, 07 May 2006 16:46:13 +0400
Message-Id: <1147005973.2516.13.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern@wohnheim.fh-wedel.de, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

KaiGai Kohei wrote:
> Hello,
> 
> This attached patches provide xattr support including POSIX-ACL and
> SELinux support on JFFS2 (version.5).
> We can apply those patches to the latest git-tree.
> - xattr_on_jffs2.kernel.version-5.patch can be applied to mtd-2.6.git.
> - xattr_on_jffs2.utils.version-5.patch can be applied to mtd-utils.git

I've quickly glanced at the xattr.h file.

>
+/*-------------------------------------------------------------------------*
> + *  File: fs/jffs2/xattr.c
Not sure it makes sense to specify file name here.

> +#include <linux/xattr.h>
You're using 'struct list_head' in your 'xattr.h' file, wouldn't it be a
good tone to add #include <linux/lists.h> then?

> +struct jffs2_xattr_datum
> +{
> +	void *always_null;
> +	u8 class;
> +	u8 flags;
> +	u16 xprefix;			/* see JFFS2_XATTR_PREFIX_* */
> +
> +	struct jffs2_raw_node_ref *node;
> +	struct list_head xindex;	/* chained from c->xattrindex[n] */
> +	uint32_t refcnt;		/* # of xattr_ref refers this */
> +	uint32_t xid;
> +	uint32_t version;
> +
> +	uint32_t data_crc;
> +	uint32_t hashkey;
> +	char *xname;		/* XATTR name without prefix */
> +	uint32_t name_len;	/* length of xname */
> +	char *xvalue;		/* XATTR value */
> +	uint32_t value_len;	/* length of xvalue */
> +};
Would be cuter to use Linux-style comments.

> +struct jffs2_inode_cache;	/* forward refence */
A classic example of a senseless comment :-)

> +extern struct jffs2_xattr_datum *jffs2_setup_xattr_datum(struct
jffs2_sb_info *c,
> +                                                  uint32_t xid,
uint32_t version);
> +
> +extern void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct
jffs2_inode_cache *ic);
> +extern void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct
jffs2_inode_cache *ic);
> +
> +extern int jffs2_garbage_collect_xattr(struct jffs2_sb_info *c,
struct jffs2_inode_cache *ic);
I wouldn't follow old JFFS2 style and would not exceed the 80-characters
per line limit.

> +/*---- Any inline initialize functions ----*/
> +#define init_xattr_inode_cache(x) INIT_LIST_HEAD(&((x)->ilist))
Wierd comment.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.

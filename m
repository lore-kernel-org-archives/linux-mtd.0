Received: from tyo201.gate.nec.co.jp ([202.32.8.193])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fcu8n-0000x6-Ne
	for linux-mtd@lists.infradead.org; Sun, 07 May 2006 21:02:30 -0400
Message-ID: <445E9880.1000404@ak.jp.nec.com>
Date: Mon, 08 May 2006 10:01:52 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <445C476A.2090506@ak.jp.nec.com>	
	<1147005973.2516.13.camel@sauron.oktetlabs.ru>
	<1147007911.2766.108.camel@pmac.infradead.org>
In-Reply-To: <1147007911.2766.108.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, joern@wohnheim.fh-wedel.de
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, David and Aterm.
Thanks for your comments.

David Woodhouse wrote:
> On Sun, 2006-05-07 at 16:46 +0400, Artem B. Bityutskiy wrote:
> 
>> +/*-------------------------------------------------------------------------*
>>> + *  File: fs/jffs2/xattr.c
>> Not sure it makes sense to specify file name here.
> 
> It's a common thing to do though; I don't think it matters much.
> 
> I would prefer to to have a consistent 'header' across all the JFFS2
> files though -- I would have been inclined to copy the form used in
> those. It's purely cosmetic though.

I agree. The file header part at xattr.[ch], acl.[ch], security.c,
xattr_user.c and xattr_trusted.c should be updated.

>>> +#include <linux/xattr.h>
>> You're using 'struct list_head' in your 'xattr.h' file, wouldn't it be a
>> good tone to add #include <linux/lists.h> then?
> 
> Yes, it's good practice to include the header files you need directly,
> rather than relying on the C file to include stuff like <linux/list.h>
> before including "xattr.h". 

OK, I'll fix it.

>>> +struct jffs2_xattr_datum
>>> +{
>>> +	void *always_null;
>>> +	u8 class;
>>> +	u8 flags;
>>> +	u16 xprefix;			/* see JFFS2_XATTR_PREFIX_* */
>>> +
>>> +	struct jffs2_raw_node_ref *node;
>>> +	struct list_head xindex;	/* chained from c->xattrindex[n] */
>>> +	uint32_t refcnt;		/* # of xattr_ref refers this */
>>> +	uint32_t xid;
>>> +	uint32_t version;
>>> +
>>> +	uint32_t data_crc;
>>> +	uint32_t hashkey;
>>> +	char *xname;		/* XATTR name without prefix */
>>> +	uint32_t name_len;	/* length of xname */
>>> +	char *xvalue;		/* XATTR value */
>>> +	uint32_t value_len;	/* length of xvalue */
>>> +};
> 
>> Would be cuter to use Linux-style comments.
> 
> I think Artem is referring to kernel-doc style comments, which look like
> this...
> 
> /**
>  * struct jffs2_xattr_datum - inode_cache equivalent for XATTR data
>  * 
>  * @always_null: Equivalent of ic->scan_dents. Must be NULL
>  * @class:       Used to distinguish from jffs2_inode_cache/jffs2_xattr_ref
> ...
> 
> I suppose it _might_ be nice if we were to do kerneldoc-style comments
> all through JFFS2, and create a proper set of documentation for the
> source code. I don't think it's fair to expert _you_ to start on that
> though; there's plenty of work for Artem to do first if he wants that. 
> 
> Personally, I prefer the comments _with_ the struct members, on the
> right-hand-side as you've placed them. I'd want to keep those even if we
> _do_ also have the kerneldoc comments which produce _external_
> documentation for printing.

I'll follow the common style on jffs2 implementation, when we can arrive
at an agreement. Now, I hope to suspend it.

>>> +struct jffs2_inode_cache;	/* forward refence */
>> A classic example of a senseless comment :-)
> 
> Yes, it's best to avoid commenting on things which don't need it.

I'll remove it.
(Futhermore, it's wrong in spelling. orz)

>>> +extern struct jffs2_xattr_datum *jffs2_setup_xattr_datum(struct jffs2_sb_info *c,
>>> +                                                  uint32_t xid, uint32_t version);
>>> +
>>> +extern void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
>>> +extern void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
>>> +
>>> +extern int jffs2_garbage_collect_xattr(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
> 
>> I wouldn't follow old JFFS2 style and would not exceed the 80-characters
>> per line limit.
> 
> Even in prototypes? I disagree. Limiting yourself to 80 characters just
> makes it messier.

I'll follow the common style on jffs2 implementation, when we can arrive
at an agreement. Now, I hope to suspend it.


>>> +/*---- Any inline initialize functions ----*/
>>> +#define init_xattr_inode_cache(x) INIT_LIST_HEAD(&((x)->ilist))
>> Wierd comment.
> 
> I think it was meant to read something like:
> 
>  /*----- inline initialisation functions -----*/
> 
> But yes, since there's only one 'function' defined there and it's fairly
> obvious that it's an initialisation function, the comment is probably
> not needed.
> 
> If all Artem can come up with is cosmetics, then I'm sure we're doing
> well :)

Ah, some inline functions were defined here at the previous versions of
xattr patches. This comment remained with old information.

Futhermore, init_xattr_inode_cache() will become also unnecesary because
'list_head ilist' will be replaced by 'struct jffs2_xattr_ref *xref' and
'xref' will be initialized as NULL by memset(ic, 0, sizeof(*ic)).
David suggested me to use single direction list instead of list_head for
memory usage reduction at previous reply.

Thus, I'll remove both this comment and definition of init_xattr_inode_cache().

Thanks,
-- 
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>

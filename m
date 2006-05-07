Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1Fcj3z-0002D6-Uh
	for linux-mtd@lists.infradead.org; Sun, 07 May 2006 09:12:53 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <1147005973.2516.13.camel@sauron.oktetlabs.ru>
References: <445C476A.2090506@ak.jp.nec.com>
	<1147005973.2516.13.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Sun, 07 May 2006 17:12:09 +0400
Message-Id: <1147007529.2516.20.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, joern@wohnheim.fh-wedel.de,
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

Hi, few refinements,

On Sun, 2006-05-07 at 16:46 +0400, Artem B. Bityutskiy wrote:
> > +#include <linux/xattr.h>
> You're using 'struct list_head' in your 'xattr.h' file, wouldn't it be a
> good tone to add #include <linux/lists.h> then?
> 
> > +struct jffs2_xattr_datum
> > +{
> > +	void *always_null;
> > +	u8 class;
> > +	u8 flags;
> > +	u16 xprefix;			/* see JFFS2_XATTR_PREFIX_* */
> > +
> > +	struct jffs2_raw_node_ref *node;
> > +	struct list_head xindex;	/* chained from c->xattrindex[n] */
> > +	uint32_t refcnt;		/* # of xattr_ref refers this */
> > +	uint32_t xid;
> > +	uint32_t version;
> > +
> > +	uint32_t data_crc;
> > +	uint32_t hashkey;
> > +	char *xname;		/* XATTR name without prefix */
> > +	uint32_t name_len;	/* length of xname */
> > +	char *xvalue;		/* XATTR value */
> > +	uint32_t value_len;	/* length of xvalue */
> > +};
> Would be cuter to use Linux-style comments.
I mean, this is not a requirement, this is just my opinion. But David is
the maintainer, and he does not agree here, so please, ignore this.

> > +struct jffs2_inode_cache;	/* forward refence */
> A classic example of a senseless comment :-)
Err, sorry, I meant, this comment is not really useful and might be
removed.

> > +/*---- Any inline initialize functions ----*/
> > +#define init_xattr_inode_cache(x) INIT_LIST_HEAD(&((x)->ilist))
> Wierd comment.
How about to just remove this comment?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.

Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDdFH-0000jk-Hy
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2005 03:24:43 -0400
Date: Fri, 9 Sep 2005 09:24:16 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kaigai Kohei <kaigai@ak.jp.nec.com>
Message-ID: <20050909072416.GA19251@wohnheim.fh-wedel.de>
References: <430AF95F.1050704@ak.jp.nec.com>
	<20050823124649.GB30853@wohnheim.fh-wedel.de>
	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
	<430C429B.6040500@ak.jp.nec.com> <431E772B.9090004@ak.jp.nec.com>
	<20050908194915.GG20668@wohnheim.fh-wedel.de>
	<43210C7A.60109@ak.jp.nec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43210C7A.60109@ak.jp.nec.com>
Cc: James Morris <jmorris@redhat.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Stephen Smalley <sds@tycho.nsa.gov>,
	Ma Yun <sx_yunma@hotmail.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 9 September 2005 13:15:54 +0900, Kaigai Kohei wrote:
> Thanks for reviewing in spite of so long patch.
> 
> > Sounds good.
> >
> > It appears as if your patch or something based on it will win.  So
> > let's have a look...
> >
> > I notice that you make a couple of mistakes by copying them from
> > existing jffs2 code.  You are excused for that, no doubt.  But I still
> > don't want copies of old mistakes to go in, just because we have a bad
> > example.
> 
> Is this using uint32_t, xattr scanning code and so on ?

Yes.

> > Review is just partial.  It's late enough already and I need to get
> > some sleep.
> 
> Please take a rest slowly on the weekend.
> I'll modify my patch during this period. ;-)

Thanks.

> >> struct jffs2_full_dirent *jffs2_alloc_full_dirent(int namesize)
> >>@@ -169,6 +195,7 @@ struct jffs2_raw_node_ref *jffs2_alloc_r
> >> 	struct jffs2_raw_node_ref *ret;
> >> 	ret = kmem_cache_alloc(raw_node_ref_slab, GFP_KERNEL);
> >> 	JFFS2_DBG_MEMALLOC("%p\n", ret);
> >>+	memset(ret, 0, sizeof(*ret));	/* to guarantee owner==NULL */
> >
> >
> > This could be optimized a little by using the constructor/destructor
> > stuff in slabs.  Not too important.
> 
> I'll prepare a tiny and obvious constructor for jffs2_raw_node_ref.
> NULL is set in raw->owner by default is important, the method of setting
> is not so, I think.

Right.  One of the least important issues I had.

> >>@@ -205,3 +232,35 @@ void jffs2_free_inode_cache(struct jffs2
> >> 	JFFS2_DBG_MEMALLOC("%p\n", x);
> >> 	kmem_cache_free(inode_cache_slab, x);
> >> }
> >>+
> >>+#ifdef CONFIG_JFFS2_XATTR
> >>+
> >>+struct jffs2_xattr_cache *jffs2_alloc_xattr_cache(void)
> >>+{
> >>+	struct jffs2_xattr_cache *xc;
> >
> >                           ^^^^^^
> > The name doesn't make sense.  You're referring to a single object, not
> > the complete cache.  Quite confusing.
> >
> >
> >>+	xc = kmem_cache_alloc(xattr_cache_slab, GFP_KERNEL);
> >
> >                                          ^^^^^
> > This is the cache.  A slab is just part of the cache.  So please
> > rename the two.
> 
> For example, how about the following names ?
> "jffs2_xattr_datum" as an alternative of jffs2_xattr_cache.
> "xattr_datum_cache" as an alternative of xattr_cache_slab.
> 
> In this case, "xc" defined as jffs2_xattr_cache structure
> should be renamed to "xd" defined as jffs2_xattr_datum.

Would be fine.

> >>diff -rpNU3 mtd-0829/fs/jffs2/nodelist.h 
> mtd-0829.xattr/fs/jffs2/nodelist.h
> >>--- mtd-0829/fs/jffs2/nodelist.h	2005-08-17 18:00:12.000000000 -0400
> >>+++ mtd-0829.xattr/fs/jffs2/nodelist.h	2005-09-06 
> 10:28:53.000000000 -0400
> >>@@ -20,6 +20,7 @@
> >> #include <linux/jffs2.h>
> >> #include <linux/jffs2_fs_sb.h>
> >> #include <linux/jffs2_fs_i.h>
> >>+#include <linux/jffs2_fs_x.h>
> >
> >
> > I p a l n.
> >
> > I prefer a longer name.  jffs2_fs_xattr.h would be fine.
> > jffs2_xattr.h would also, the "_fs" is more redundant that "attr".
> 
> OK, I'll rename "jffs2_fs_x.h" to "jffs2_xattr.h" and deploy it under
> "fs/jffs2" as David says.

Can you rename it to xattr.h instead?  The prefix has lost its meaning
in fs/jffs2/.

> >> #ifdef __ECOS
> >> #include "os-ecos.h"
> >>@@ -80,6 +81,7 @@ struct jffs2_raw_node_ref
> >> 	struct jffs2_raw_node_ref *next_phys;
> >> 	uint32_t flash_offset;
> >> 	uint32_t __totlen; /* This may die; use ref_totlen(c, jeb, ) below */
> >>+	void *owner;
> >
> >
> > This grows a node reference from 16/24 bytes to 20/32 bytes for 32/64
> > bit architectures.  I'm not entirely happy about that, but don't a
> > better solution either.
> 
> Indeed, it's involved the growing of object size.
> But we must discriminate XATTR node from other non-inode node
> and indicate jffs2_xattr_cache/jffs2_xattr_ref object from this.
> I didn't have a good idea more than this.
> 
> And, I forgot to enclose the declaration of "void *owner"
> by #ifdef - #endif.

True.

Most likely this idea is stupid, but let me have a try anyway.  You
could give your xattr/xref objects an inode number - either one per
object or a special one shared for all xattr/xref objects.  That would
open a new bag of worms, but keep the size down.

Would it be possible to work with such an approach?

> > By itself, this code is not too bad.  But it add a little more crap to
> > a function that is aching for a rewrite already.  Not sure.
> 
> Hmm,,, I wrote the above part of codes with referring to existing code.
> If the policy is shown, I'll follow it. How should I do ?

In a perfect world, you should send a cleanup patch to break
jffs2_scan_eraseblock() into several smaller functions.  Have the
xattr patch depend on the cleanup.  I might still have an old patch
that I could send you for inspiration.

> >>+
> >>+	nlen = JFFS2_XATTR_NAMELEN(je32_to_cpu(rx->length));
> >>+	vlen = JFFS2_XATTR_VALUELEN(je32_to_cpu(rx->length));
> >
> >
> > Types don't match.  nlen and vlen should become u32.
> 
> Is it enought for "int"?  JFFS2_XATTR_NAMELEN has 12-bit length, and
> JFFS2_XATTR_VALUELEN has 20-bit length.

Makes sense.  But endianness conversions between je32 and int (which
can be anything from 8-64 bit signed/unsigned per c standard) should
be avoided.

> > Btw, I agree with Linus.  u32 is _much_ nicer than uint32_t, not to
> > speak of the uint32_fast_t insanity.
> 
> Is is necessary to correct the part where other uint32_t used.

Not really.  Without the above ("should become u32") I wouldn't even
have mentioned it.  Really minor.

> >>+	xc = jffs2_find_xattr_cache_xid(c, je32_to_cpu(rx->xid));
> >>+	if (xc) {
> >>+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Duplicate XID 
> Found"
> >>+		       " on node at 0x%08x XID=%d Later one ignored\n", ofs, 
> xc->xid);
> >>+		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
> >>+		return 0;
> >>+	}
> >
> >
> > How do you deal with xattr reference counting and lifetime?
> 
> When xc->xlist is empty, jffs2_xattr_cache type object will be released.
> jffs2_xattr_ref type object is chained to xc->xlist.
> list_empty(xc->xlist) means nobady refers this XATTR.

...at which time you also remove the xattr from medium, I assume.  Ok.

Next question: How do you remove the xattr from medium?  How is it
garbage collected?

> >>+	xtype = jffs2_xattr_prefix_to_xtype(rx->data, nlen);
> >>+	if (JFFS2_XATTRTYPE_INVALID==xtype) {
> >>+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Unsupported 
> xattr type"
> >>+		       " on node at 0x%08x\n", ofs);
> >>+		USED_SPACE(PAD(je32_to_cpu(rx->totlen)));
> >>+		return 0;
> >>+	}
> >
> >
> > Why is it required that JFFS2 knows the type of the xattr?
> 
> Hmm,,, I added this member to discriminate the prefix of xattr
> without strncmp(). But it might be a bit ugly design.

Then why is it required that JFFS2 knows the prefix?

> >>+static inline int jffs2_scan_xref_node_helper(struct jffs2_sb_info *c,
> >>+			struct jffs2_xattr_ref *new, struct jffs2_xattr_ref 
> *old)
> >>+{
> >>+	/* (uint32_t)new->xc == (uint32_t)old->xc has been made sure. */
> >>+	if ((uint32_t)new->ic == (uint32_t)old->ic) {
> >
> >
> > Why the casts?  How can this be safe on 64bit machines?
> 
> This function is called before jffs2_build_xattr_cache() while FS-mounting.
> In this implementation, xid (uint32 value) is stored in jffs2_xattr_ref->xc
> before jffs2_build_xattr_cache(), and ino (uint32 value) is stored in
> jffs2_xattr_ref->ic.
> 
> After calling jffs2_build_xattr_cache(), xc and ic is used as a pointer
> which indicate to jffs2_xattr_cache/jffs2_inode_cache.

Ok.

> It might be bad manner, but is the following implementation preferable ?

Yes.  And you can use unnamed unions, just remove the "x" and "i".

> struct jffs2_xattr_ref {
>         uint32_t seqno;
>         struct list_head ilist;
>         struct list_head xlist;
>         union {
>                 struct jffs2_xattr_cache *xc;
>                 uint32_t xid;
>         } x;
>         union {
>                 struct jffs2_inode_cache *ic;
>                 uint32_t ino;
>         } i;
>         struct jffs2_raw_node_ref *node;
> };
> 
> 
> >>+static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct 
> jffs2_eraseblock *jeb,
> >>+				struct jffs2_raw_xref *rr, uint32_t ofs)
> >>+{
> >>+	struct jffs2_raw_node_ref *raw;
> 
>              - snip -
> 
> >>+	ref->seqno = je32_to_cpu(rr->seqno);
> >>+	if (ref->seqno > c->highest_seqno)
> >>+		c->highest_seqno = ref->seqno;
> >>+	ref->ic = (void *)je32_to_cpu(rr->ino);
> >>+	ref->xc = (void *)je32_to_cpu(rr->xid);
> >
> >
> > WTF?!?
> >
> > You read a je32 from flash and use that as a pointer?!?
> >
> > Please tell me I'm wrong.
> 
> If we use above emample, we can write it as follows:
> 
>     ref->i.ino = je32_to_cpu(rr->ino);
>     ref->x.xid = je32_to_cpu(rr->xid);

	ret->ino = je32_to_cpu(rr->ino);
	...

> In jffs2_build_xattr_cache(), we find up the jffs2_inode_cache and
> jffs2_xattr_cache by using ino/xid as a key. Then the correct pointers
> are stored in ref->ic and ref->xc after jffs2_build_xattr_cache().
> 
> Is it the situation to use union ?

Yes.  Makes more sense now.  Sorry about the tone.

Still, you can take it as an indication that your reuse-old-fields
trick is not obvious to new readers.  A comment explaining this would
be useful.  Maybe you already have it further down, in the part I
didn't review yet.

Good stuff.

Jörn

-- 
All art is but imitation of nature.
-- Lucius Annaeus Seneca

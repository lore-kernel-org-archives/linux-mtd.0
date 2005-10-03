Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMRWB-0007VX-UN
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 10:43:02 -0400
Date: Mon, 3 Oct 2005 16:42:16 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20051003144216.GF4639@wohnheim.fh-wedel.de>
References: <BAY17-F15F41E3E64959C3F1054D0E8800@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F15F41E3E64959C3F1054D0E8800@phx.gbl>
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 4)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 3 October 2005 21:40:07 +0800, zhao forrest wrote:
>
> >> diff -auNrp mtd_9_28/fs/jffs2/fs.c mtd_9_28_EBH/fs/jffs2/fs.c
> >> --- mtd_9_28/fs/jffs2/fs.c	2005-09-28 10:51:57.000000000 +0800
> >> +++ mtd_9_28_EBH/fs/jffs2/fs.c	2005-09-28 11:51:53.000000000 +0800
> >> @@ -476,6 +476,7 @@ int jffs2_do_fill_super(struct super_blo
> >>  	}
> >>
> >>  	c->cleanmarker_size = sizeof(struct jffs2_unknown_node);
> >> +	c->ebh_size = PAD(sizeof(struct jffs2_raw_ebh));
> >
> >Remove the PAD.  Instead you should make sure that PAD(sizeof(struct
> >jffs2_raw_ebh)) and sizeof(struct jffs2_raw_ebh) are equal.
> >
> >If they aren't, you have some other problem anyway.
> 
> I don't see a problem here, could you explain what kind of
> problem I will have??

You have a structure without proper alignment.  That would be ok for a
single field in the struct - the last - but it is much easier to make
the rule a bit stricter and require that the struct must be a multiple
of 4 or 8 bytes.

And once you've done that, there simply is no need for the PAD
anymore.  Less complicated.

> >> @@ -196,8 +197,14 @@ struct jffs2_eraseblock
> >>  	struct jffs2_raw_node_ref *last_node;
> >>
> >>  	struct jffs2_raw_node_ref *gc_node;	/* Next node to be garbage 
> collected */
> >> +
> >> +	uint32_t erase_count;
> >>  };
> >>
> >> +#define SET_EBFLAGS_HAS_EBH(jeb) (jeb->flags |= 1)
> >> +#define CLR_EBFLAGS_HAS_EBH(jeb) (jeb->flags &= ~1)
> >> +#define EBFLAGS_HAS_EBH(jeb) ((jeb->flags & 1) == 1)
> >
> >SET_EBFLAGS_HAS_EBH and CLR_EBFLAGS_HAS_EBH don't make sense.
> >EBFLAGS_SET_EBH does.
> Sorry. I can't understand why EBFLAGS_SET_EBH make sense.
> This flag is used to indicate whether an erase block has the
> eraseblock header. From EBFLAGS_SET_EBH code reader can't
> associate it with "_has_ eraseblock header".
> I think the flag's name is has_ebh instead of ebh.

Ok, I see.  Terms like "HAS" or "IS" are commonly used for
truth-returning functions/macros.  Hence, they should be avoided
elsewhere.  For flags, most people seem to use

FOO_HAS_BAR
FOO_SET_BAR
FOO_CLEAR_BAR

or some variants thereof.

> >> diff -auNrp mtd_9_28/fs/jffs2/nodemgmt.c 
> mtd_9_28_EBH/fs/jffs2/nodemgmt.c
> >> --- mtd_9_28/fs/jffs2/nodemgmt.c	2005-09-28 10:51:57.000000000 +0800
> >> +++ mtd_9_28_EBH/fs/jffs2/nodemgmt.c	2005-09-28 
> >13:42:53.000000000 
> +0800
> >> @@ -342,7 +342,10 @@ static int jffs2_do_reserve_space(struct
> >>
> >>  		jeb = c->nextblock;
> >>
> >> -		if (jeb->free_size != c->sector_size - c->cleanmarker_size) {
> >> +		if ((!EBFLAGS_HAS_EBH(jeb) && jeb->free_size != 
> >c->sector_size - 
> c->cleanmarker_size) ||
> >> +		    (EBFLAGS_HAS_EBH(jeb) && c->ebh_size && jeb->free_size 
> >!= 
> c->sector_size - ref_totlen(c, jeb, jeb->first_node)) ||
> >> +		    (EBFLAGS_HAS_EBH(jeb) && !c->ebh_size && jeb->free_size 
> >!= 
> c->sector_size))
> >> +		{
> >
> >This is too complicated.  What are you trying to do?
> I don't think it too complicated. It's only the extension of original
> condition judgement. The aim is that if free_size is not the expected
> size, then goto restart......

It was too complicated for me to understand quickly.  When something
like this happens, there are usually two options:
1. You fucked up and this thing is actually wrong.  Go and fix it.
2. Condition is essentially correct.  Create small function with a
   name like "action_foo_required", which returns 1 if you need to do
   foo, else 0.  The condition is a simple function call then, which
   should be obviously correct.
   The function itself can be easily expanded into many smaller
   conditions:
	if (this)
		return 1;
	if (that)
		return 0;
	if (other)
		return 1;
	return 0;
   Now each of the smaller conditions is simple to verify and can be
   commented if it isn't simple to verify.

Jörn

-- 
And spam is a useful source of entropy for /dev/random too!
-- Jasmine Strong

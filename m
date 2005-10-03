Received: from bay17-f15.bay17.hotmail.com ([64.4.43.65] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EMQY6-0006Vz-Pg
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 09:40:23 -0400
Message-ID: <BAY17-F15F41E3E64959C3F1054D0E8800@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Date: Mon, 03 Oct 2005 21:40:07 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
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

> > -
> > +
> > +struct jffs2_raw_ebh ebh = {
> > +	.magic =        cpu_to_je16(JFFS2_MAGIC_BITMASK),
> > +	.nodetype =     cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
> > +	.totlen =       cpu_to_je32(sizeof(struct jffs2_raw_ebh)),
> > +	.reserved =     0,
> > +	.compat_fset =  JFFS2_EBH_COMPAT_FSET,
> > +	.incompat_fset = JFFS2_EBH_INCOMPAT_FSET,
> > +	.rocompat_fset = JFFS2_EBH_ROCOMPAT_FSET,
> > +	.data_crc =     cpu_to_je32(0)
> > +};
>
>I don't like this.  A global variable (without locking, it appears),
>not declared as static and with a 3-letter name.
>
>You could use it as a prototype, but even that seems a bit too much
>for 5 constant fields.  And as long as the struct jffs2_raw_ebh is
>small enough, you can just allocate it on the stack.
>
Artem asked me to remove allocation on the stack, so who should I 
listen to? This really made me very very confused :(


>
> > @@ -351,7 +364,7 @@ fail:
> >
> >  static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct 
jffs2_eraseblock *jeb)
> >  {
> > -	struct jffs2_raw_node_ref *marker_ref = NULL;
> > +	struct jffs2_raw_node_ref *ebh_ref = NULL;
> >  	size_t retlen;
> >  	int ret;
> >  	uint32_t bad_offset;
> > @@ -362,16 +375,14 @@ static void jffs2_mark_erased_block(stru
> >  	}
> >
> >  	/* Write the erase complete marker */
> > -	D1(printk(KERN_DEBUG "Writing erased marker to block at 0x%08x\n", 
jeb->offset));
> > +	D1(printk(KERN_DEBUG "Writing eraseblock header to block at 
0x%08x\n", jeb->offset));
> >  	bad_offset = jeb->offset;
> >
> >  	/* Cleanmarker in oob area or no cleanmarker at all ? */
> > -	if (jffs2_cleanmarker_oob(c) || c->cleanmarker_size == 0) {
> > +	if (jffs2_cleanmarker_oob(c)) {
>
>What was (c->cleanmarker_size == 0) used for?
For the flash that don't need a clean marker.


> > diff -auNrp mtd_9_28/fs/jffs2/fs.c mtd_9_28_EBH/fs/jffs2/fs.c
> > --- mtd_9_28/fs/jffs2/fs.c	2005-09-28 10:51:57.000000000 +0800
> > +++ mtd_9_28_EBH/fs/jffs2/fs.c	2005-09-28 11:51:53.000000000 +0800
> > @@ -476,6 +476,7 @@ int jffs2_do_fill_super(struct super_blo
> >  	}
> >
> >  	c->cleanmarker_size = sizeof(struct jffs2_unknown_node);
> > +	c->ebh_size = PAD(sizeof(struct jffs2_raw_ebh));
>
>Remove the PAD.  Instead you should make sure that PAD(sizeof(struct
>jffs2_raw_ebh)) and sizeof(struct jffs2_raw_ebh) are equal.
>
>If they aren't, you have some other problem anyway.

I don't see a problem here, could you explain what kind of
problem I will have??

> > @@ -196,8 +197,14 @@ struct jffs2_eraseblock
> >  	struct jffs2_raw_node_ref *last_node;
> >
> >  	struct jffs2_raw_node_ref *gc_node;	/* Next node to be garbage 
collected */
> > +
> > +	uint32_t erase_count;
> >  };
> >
> > +#define SET_EBFLAGS_HAS_EBH(jeb) (jeb->flags |= 1)
> > +#define CLR_EBFLAGS_HAS_EBH(jeb) (jeb->flags &= ~1)
> > +#define EBFLAGS_HAS_EBH(jeb) ((jeb->flags & 1) == 1)
>
>SET_EBFLAGS_HAS_EBH and CLR_EBFLAGS_HAS_EBH don't make sense.
>EBFLAGS_SET_EBH does.
Sorry. I can't understand why EBFLAGS_SET_EBH make sense.
This flag is used to indicate whether an erase block has the
eraseblock header. From EBFLAGS_SET_EBH code reader can't
associate it with "_has_ eraseblock header".
I think the flag's name is has_ebh instead of ebh.

>
> > diff -auNrp mtd_9_28/fs/jffs2/nodemgmt.c 
mtd_9_28_EBH/fs/jffs2/nodemgmt.c
> > --- mtd_9_28/fs/jffs2/nodemgmt.c	2005-09-28 10:51:57.000000000 +0800
> > +++ mtd_9_28_EBH/fs/jffs2/nodemgmt.c	2005-09-28 13:42:53.000000000 
+0800
> > @@ -342,7 +342,10 @@ static int jffs2_do_reserve_space(struct
> >
> >  		jeb = c->nextblock;
> >
> > -		if (jeb->free_size != c->sector_size - c->cleanmarker_size) {
> > +		if ((!EBFLAGS_HAS_EBH(jeb) && jeb->free_size != c->sector_size - 
c->cleanmarker_size) ||
> > +		    (EBFLAGS_HAS_EBH(jeb) && c->ebh_size && jeb->free_size != 
c->sector_size - ref_totlen(c, jeb, jeb->first_node)) ||
> > +		    (EBFLAGS_HAS_EBH(jeb) && !c->ebh_size && jeb->free_size != 
c->sector_size))
> > +		{
>
>This is too complicated.  What are you trying to do?
I don't think it too complicated. It's only the extension of original
condition judgement. The aim is that if free_size is not the expected
size, then goto restart......


>
> >  			printk(KERN_WARNING "Eep. Block 0x%08x taken from free_list had 
free_size of 0x%08x!!\n", jeb->offset, jeb->free_size);
> >  			goto restart;
> >  		}
> > +struct jffs2_raw_ebh
> > +{
> > +	jint16_t magic;
> > +	jint16_t nodetype; /* == JFFS2_NODETYPE_ERASEBLOCK_HEADER */
> > +	jint32_t totlen;
>
> > +	jint32_t hdr_crc;
> > +	uint8_t  reserved; /* reserved for future use and alignment */
> > +	uint8_t  compat_fset;
> > +	uint8_t  incompat_fset;
> > +	uint8_t  rocompat_fset;
>
> > +	jint32_t erase_count; /* the erase count of this erase block */
> > +	jint32_t node_crc;
> > +	jint32_t data_crc;
>
>You don't need three crc fields.  Move node_crc up just below hdr_crc
>and calculate the crc over the complete header.  If it is later
>extended, you know the length from totlen, so you can still check the
>complete crc, even if you don't understand the fields below.
>
OK

Thanks,
Forrest

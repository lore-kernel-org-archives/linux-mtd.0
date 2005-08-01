Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dzb7n-0003Kp-Tn
	for linux-mtd@lists.infradead.org; Mon, 01 Aug 2005 10:18:55 -0400
Date: Mon, 1 Aug 2005 16:18:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050801141841.GD32464@wohnheim.fh-wedel.de>
References: <42E5E816.5090500@inf.u-szeged.hu>
	<20050726074440.GB15903@wohnheim.fh-wedel.de>
	<42E5ECE5.4010901@inf.u-szeged.hu>
	<20050726093215.GD15903@wohnheim.fh-wedel.de>
	<20050726100330.GF15903@wohnheim.fh-wedel.de>
	<42EDF04C.1010108@inf.u-szeged.hu>
	<20050801095645.GA32464@wohnheim.fh-wedel.de>
	<42EDF470.4060208@inf.u-szeged.hu>
	<20050801104343.GB32464@wohnheim.fh-wedel.de>
	<42EE2B78.70500@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42EE2B78.70500@inf.u-szeged.hu>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 1 August 2005 16:02:32 +0200, Ferenc Havasi wrote:
> Jörn Engel wrote:
> 
> >> 	D1(printk(KERN_DEBUG "Going to GC REF_PRISTINE node at 0x%08x\n", ref_offset(raw)));
> >> 
> >>@@ -513,8 +514,9 @@ static int jffs2_garbage_collect_pristin
> >> 	/* Ask for a small amount of space (or the totlen if smaller) because we
> >> 	   don't want to force wastage of the end of a block if splitting would
> >> 	   work. */
> >>-	ret = jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN, 
> >>-					      rawlen), &phys_ofs, &alloclen);
> >>+	ret = jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct jffs2_raw_inode) +
> >>+				JFFS2_MIN_DATA_LEN, rawlen), &phys_ofs, &alloclen, rawlen);
> >>+				/* this is not optimal yet */
> >
> >Can you add some more explanation to the comment?
> >
> OK, we will.
> 
> The reason of "this is not optimal" is the following: for
> jffs2_reserve_space_gc() we have to specify an argument called sumsize.
> It is the summary size of the requested node. It needs it, because it is
> necessary to fit not only the node but also its summary representation
> into the erase block. In all other cases we know exactly the summary
> size of all nodes except in this case, so we made an upper-estimation here.

Makes sense.

> >> 	if (ret)
> >> 		return ret;
> >> 
> >>@@ -594,7 +596,10 @@ static int jffs2_garbage_collect_pristin
> >> 	nraw->__totlen = rawlen;
> >> 	nraw->next_phys = NULL;
> >> 
> >>-	ret = jffs2_flash_write(c, phys_ofs, rawlen, &retlen, (char *)node);
> >>+	vecs[0].iov_base = (unsigned char *) node;
> >>+	vecs[0].iov_len = rawlen;
> >>+
> >>+	ret = jffs2_flash_writev(c, vecs, 1, phys_ofs, &retlen, 0);
> >
> >Why this change?  If it's required, it might make sense to split it
> >out into a preparatory patch.  But my gut feeling is that dropping
> >this part would be better.
> >
> Jffs2_flash_write() simply write directly the data onto the flash, and
> does not collect the summary information. Jffs2_flash_writev() does.

Then why can't you just re-implement jffs2_flash_write() using
Jffs2_flash_writev()?  That way, you keep the strange one-element
array logic confined in a small and simple function.  Here, we have an
already large and complicated one getting larger and more complicated.

Ok, maybe I'm missing something, so please tell me.

> >>+#ifdef CONFIG_JFFS2_SUMMARY
> >>+
> >>+/* Called with alloc sem _and_ erase_completion_lock */
> >>+static int jffs2_do_reserve_space_sum(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
> >>+{
> >>
> >[...]
> >  
> >
> >>+#else
> >>+
> >>+/* Called with alloc sem _and_ erase_completion_lock */
> >>+static int jffs2_do_reserve_space_normal(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
> >>+{
> >
> >It doesn't take too much creativity to combine this and the above
> >#ifdef into a single one.  That will still be ugly, but it's a step in
> >the right direction.
> >
> In the previous version it was combined, but we afraid of that it is
> hard to see what exectly happen. But we can tranform it back.

Hmm.  Either way, I'm not happy yet.  What I'd like to see is a patch
containing three types of changes:
o condition new code in fs/jffs2/summary.c,
o unconditional changes in existing source files and
o no-too-ugly #ifdefs in headers.

Nothing else.  I guess the converged variant is a better basis to work
towards that goal, but I could be wrong.  This one clearly needs more
thinking.

Jörn

-- 
Simplicity is prerequisite for reliability.
-- Edsger W. Dijkstra

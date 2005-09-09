Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDrYM-0003jI-QJ
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2005 18:41:14 -0400
Date: Sat, 10 Sep 2005 00:40:57 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050909224057.GC5358@wohnheim.fh-wedel.de>
References: <20050909073302.GB19251@wohnheim.fh-wedel.de>
	<BAY17-F31EF04DBBF374276A00682E8980@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F31EF04DBBF374276A00682E8980@phx.gbl>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]enhanced wear-leveling algorithm based on erase count
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 9 September 2005 17:17:10 +0800, zhao forrest wrote:
> >
> >I had the same idea:
> >
> >static int pick_used_block(void)
> >{
> >	static atomic_t seqno = 99;
> >
> >	if ((index_of_highest_filled_bucket - index_of_lowest_filled_bucket) 
> >	< 2)
> >		return 0;
> >
> >	/* it is time to pick a used block - just not too often */
> >	atomic_inc(seqno);
> >	if (atomic_read(seqno) != 0)
> >		return 0;
> >
> >	/* first pick after mount and every 100th pick afterwards */
> >	return 1;
> >}
> 
> But it'll pick a block from used_block_hash_table only with 1% possibility.
> Do you think this 1% possibility is too small? How about 10% or 20%?

1% should be good enough.  That's about what we use now, after all.

We need to make sure that static blocks that never accumulate much
garbage and thus never get GC'd otherwise get shaken up once in a
while.  After such a shakeup, they get filled with other data.  Data
that is obsoleting faster, so the erase block in question will
naturally get reused again.

In the worst case, the filesystem has 5 blocks to accumulate garbage
(the spare ones) and everything else static.  That means, each of the
5 blocks will get erased 20 times until a static block gets mixed into
the bunch and one of the dynamic blocks turns static.  More than good
enough, .1% would still be plenty.

What you could do to improve things further is seperate data between
probably-static and probably-dynamic.  Then have two erase blocks to
write into, one for static data, one for dynamic.  Always pick the
highest erase count free block for static data - it will likely not
get reused for a while.  Whenever picking a used block, fill it with
dynamic data.

Jörn

-- 
"[One] doesn't need to know [...] how to cause a headache in order
to take an aspirin."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001

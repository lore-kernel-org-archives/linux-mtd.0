Received: from bay17-f31.bay17.hotmail.com ([64.4.43.81] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EDf0g-0008UC-Pq
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2005 10:17:28 +0100
Message-ID: <BAY17-F31EF04DBBF374276A00682E8980@phx.gbl>
In-Reply-To: <20050909073302.GB19251@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Date: Fri, 09 Sep 2005 17:17:10 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
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


> >
> > You are quite right! I decide to use following condition judgement:
> >
> > if (((max_erase_count - average_erase_count)*2 > WL_DELTA) ||
> > ((index_of_highest_filled_bucket - index_of_lowest_filled_bucket) > 1))
> > //althought we don't know the exact minimum erase count, here we do
> > //know that maximum_erase_count - minimum_erase_count has execeeded
> > // WL_DELTA.
> > {
> >    get_block_from_used_hash_table();
> > }
> >
> > This way it can avoid the above case you mentioned.
>
>Would it be enough to use ((index_of_highest_filled_bucket -
>index_of_lowest_filled_bucket) > 1) alone?

yes, I'll not use average erase count any more.

> >
> > This way we can avoid the storm and in the meantime adjust WL. It's
> > true that at this time the user request(create, write, delete) will
> > progress slower than usual. But at this time point, we have to slightly
> > prefer WL because the erase_count gap between erase blocks has became
> > too large.
>
>I had the same idea:
>
>static int pick_used_block(void)
>{
>	static atomic_t seqno = 99;
>
>	if ((index_of_highest_filled_bucket - index_of_lowest_filled_bucket) < 2)
>		return 0;
>
>	/* it is time to pick a used block - just not too often */
>	atomic_inc(seqno);
>	if (atomic_read(seqno) != 0)
>		return 0;
>
>	/* first pick after mount and every 100th pick afterwards */
>	return 1;
>}
>

But it'll pick a block from used_block_hash_table only with 1% possibility.
Do you think this 1% possibility is too small? How about 10% or 20%?


Thanks,
Forrest

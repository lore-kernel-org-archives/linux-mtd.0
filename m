Received: from bay17-f19.bay17.hotmail.com ([64.4.43.69] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EDajv-0007CJ-MD
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2005 00:43:55 -0400
Message-ID: <BAY17-F1901E7830CCC07E43A8E42E8980@phx.gbl>
In-Reply-To: <20050908182110.GB20668@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Date: Fri, 09 Sep 2005 12:23:18 +0800
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

>
> > 5 Here we use (max_erase_count - average_erase_count) instead
> > of (max_erase_count - min_erase_count), because min_erase_count
> > can't be got by O(1) algorithm. So I choose average_erase_count
> > for approximation.
>
>This could be a problem.  If 990 out of 1000 erase blocks are
>constantly reused and 10 stay stale, when will the delta exceed the
>threshold?  In this scenario, your threshold is effectively increased
>100x.
>
>You could use an estimate based on the lowest filled bucket instead.

You are quite right! I decide to use following condition judgement:

if (((max_erase_count - average_erase_count)*2 > WL_DELTA) ||
((index_of_highest_filled_bucket - index_of_lowest_filled_bucket) > 1))
//althought we don't know the exact minimum erase count, here we do
//know that maximum_erase_count - minimum_erase_count has execeeded
// WL_DELTA.
{
    get_block_from_used_hash_table();
}

This way it can avoid the above case you mentioned.

>
>What concerns me is the danger of a "reuse block" storm.  Picking a
>block from the used_blocks array is quite a latency hit.  If we do
>this 10x in a row without picking a block from the free_blocks array,
>people will complain and send bug reports.  Let's see...
>
>Most of the time, you pick free blocks.  So max_erase_count will
>constantly grow and grow faster than average_erase_count.  When the
>first block hits some magic value, you start picking used blocks
>instead.  Doing so will leave max_erase_count unchanged and slightly
>increase average_erase_count.  But the increase is only fractional and
>doesn't change your condition until the fractions add up to 1.  We
>have a storm.
>
>In this form, the algorithm is not acceptable.

Yes, this is really a problem. I want to improve the algorithm by
invoking get_block_from_used_hash_table() by 50% possibility and using
old WL algorithm by 50% possibility when condition meets.

The psudo code may look like this:

static char flag = 1;

if ((((max_erase_count - average_erase_count)*2 > WL_DELTA) ||
((index_of_highest_filled_bucket - index_of_lowest_filled_bucket) > 1))
&& flag) {
    get_block_from_used_hash_table();
    flag = 0;
}else {
    old_WL_algorithm();
    flag = 1;
}

This way we can avoid the storm and in the meantime adjust WL. It's
true that at this time the user request(create, write, delete) will 
progress slower than usual. But at this time point, we have to slightly
prefer WL because the erase_count gap between erase blocks has became
too large.

Thanks,
Forrest

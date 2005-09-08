Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDR1U-0008Ew-Ke
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2005 14:21:28 -0400
Date: Thu, 8 Sep 2005 20:21:10 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050908182110.GB20668@wohnheim.fh-wedel.de>
References: <BAY17-F13C3FB40D78E426C2B3A95E8A70@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F13C3FB40D78E426C2B3A95E8A70@phx.gbl>
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

On Tue, 6 September 2005 18:13:33 +0800, zhao forrest wrote:
> 
> This is the patch for enhanced wear-leveling algorithm, which is
> based on previous erase_count_tracking patch. So please apply
> "erase_count_tracking" patch before applying this patch.
> 
> I'd give my appreciation to Gleixner and Artem. They gave me many
> inspiration and insightful ideas about the design of this patch.
> 
> The following is a brief description of this patch.
> 
> * The problem to be resolved by this patch
> The current wear spread is of random nature. On filesystems with
> unchanged files the wear almost never touches blocks which
> contain solely unchanged data. This patch will try to limit the
> gap between max_erase_count and min_erase_count within WL_DELTA.

Sane.

> * Data structure
> two hash tables are defined and added to struct jffs2_sb_info:
> struct jffs2_blocks_bucket used_blocks[HASH_SIZE];
> struct jffs2_blocks_bucket free_blocks[HASH_SIZE];
> In current patch, WL_DELTA is 1024, HASH_SIZE is 512.

Weird.

Since you limit the gap to WL_DELTA, 510 of your 512 buckets will be
completely empty.  But then again, it's not that much memory spent and
it keeps the code fairly simple.

> * Operation
> 1 The blocks, that are added to dirty, very_dirty and clean list,
> are also added to used_blocks[HASH_SIZE]; the blocks, that are
> added to free list, are also added to free_blocks[HASH_SIZE].
> The index in hash table is got by shifting the erase count
> 9 times right. And put the block at the end of the hash entry
> list.
> 
> 2 When a free_block is needed, it's got from the entry list of
> free_blocks[HASH_SIZE]. Sure, we should choose one from lowest
> entry list.
> 
> 3 when (max_erase_count - average_erase_count)*2 > WL_DELTA,
> a block is got from the entry list of used_blocks[HASH_SIZE].
> Sure, we should choose one from lowest entry list.

Sane.

> 4 when (max_erase_count - average_erase_count)*2 <= WL_DELTA,
> the current wear-leveling algorithm is used.

Without the randomness effect, I assume.

> 5 Here we use (max_erase_count - average_erase_count) instead
> of (max_erase_count - min_erase_count), because min_erase_count
> can't be got by O(1) algorithm. So I choose average_erase_count
> for approximation.

This could be a problem.  If 990 out of 1000 erase blocks are
constantly reused and 10 stay stale, when will the delta exceed the
threshold?  In this scenario, your threshold is effectively increased
100x.

You could use an estimate based on the lowest filled bucket instead.

> >From the above description, we know that this is only an
> evolutional instead of revolutional change to current WL
> algorithm. So the rationale is same as the current WL: prefer
> performance and adjust WL when necessary.

Sane.

What concerns me is the danger of a "reuse block" storm.  Picking a
block from the used_blocks array is quite a latency hit.  If we do
this 10x in a row without picking a block from the free_blocks array,
people will complain and send bug reports.  Let's see...

Most of the time, you pick free blocks.  So max_erase_count will
constantly grow and grow faster than average_erase_count.  When the
first block hits some magic value, you start picking used blocks
instead.  Doing so will leave max_erase_count unchanged and slightly
increase average_erase_count.  But the increase is only fractional and
doesn't change your condition until the fractions add up to 1.  We
have a storm.

In this form, the algorithm is not acceptable.

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein

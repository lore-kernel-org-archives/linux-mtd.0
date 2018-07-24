Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhsGb-0005gA-9z
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2018 08:01:58 +0000
Message-ID: <1532419290.469.452.camel@linux.intel.com>
Subject: Re: UBIFS question: Power-cuts after ubifs_leb_unmap()
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
To: Richard Weinberger <richard@nod.at>, Adrian Hunter
 <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org
Date: Tue, 24 Jul 2018 11:01:30 +0300
In-Reply-To: <1756392.9dNXh6ho7o@blindfold>
References: <1756392.9dNXh6ho7o@blindfold>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I looked at this quickly and talked to Adrian. I cannot solve this
for you but here are some thoughts.

On Mon, 2018-07-09 at 12:11 +0200, Richard Weinberger wrote:
> Artem, Adrian,
> 
> While playing with a new UBI/UBIFS test framework I managed to hit
> this error, 
> with lprops self-checks enabled:
> 
> [ 2412.268964] UBIFS error (ubi0:0 pid 708): scan_check_cb: bad
> accounting of 
> LEB 11: free 0, dirty 118072 flags 0x1, should be free 126976, dirty
> 0

So it has 126976 - 118072 = 8904 of used space.

> LEB 11 is unmapped but LPT still thinks that some data is used,
> lp->free + lp >dirty < leb-size.

And the problem is this used space. We think that most probably the bug
is in replay and these 9804 bytes should have been marked as dirty
during replay, but they were not. If they were marked as dirty, we
probably would not have problem.

It is unlikely this is a bug in GC. The recovery path is the most
tricky thing, and recovery happens in slightly different order, and if
we were expecting a but, we'd suspect the recovery replay.

> Even without lprobs self-checks, the same filesystem will later hit
> this 
> assertion in ubifs_garbage_collect_leb():
> 
> ubifs_assert(!list_empty(&sleb->nodes));
> 
> The assert makes sure that the LEB actually contains nodes.
> ubifs_garbage_collect_leb() handles the special case lp->free + lp-
> >dirty == 
> c->leb_size.
> But not lp->free + lp->dirty < leb-size.

> Now I'm not sure where to fix that, maybe you can remember some
> design 
> decisions.
> 1. Shall we massage ubifs_garbage_collect_leb() to deal with this
> special case 
> too?

lp->free + lp->dirty < leb-size means there is used data, and we GC by
moving. So this is not a special case.

> 2. Is it already a bug when this case happens?

I do not think so.

> From reviewing the code, I think the said situation can arise when we
> face 
> power-cut
> in ubifs_garbage_collect_leb():
> 
> if (snod->type == UBIFS_IDX_NODE) {
> 	...
> } else {
> 	...
> 

OK, we are here. This means that lprops in memory belives this LEB has
no used data, only dirt and free space. It can be recycled.

Now, if we have power cut right here, next time we'll go to recovery
replay. If the replay is correct, we'll end up with same lprops in
memory, and we'll recycle the LEB anyway.

> 	err = ubifs_change_one_lp(c, lnum, c->leb_size, 0, 0, 0, 0);

We change lprops in memory.

> 
> 	...
> 
> 	err = ubifs_leb_unmap(c, lnum);
> 
> 	// POWER CUT
> }
> 
> We mark the LEB as free and unmap it.
> ubifs_change_one_lp() does not immediately write a new LPT, if we
> lose power 
> right after ubifs_leb_unmap() it can happen that the LEB already got
> erased 
> but the LPT has the old accounting information.

Yes, and during recovery we'll notice that lprops says an LEB is
freeable (has no used data), and we'll adjust lprops and probably re-
unmap the LEB (I not remember 100%).

In the error you showed - there is 8K of used, and this is the problem.

> What do you think?

1. If you believe some specific place like the one you pointed contains
a bug, then emulate a power cut in that place and try to reproduce the
bug.

2. Try to focus on recovery replay, this is the main suspect. Try to
figure out what is that used space in that LEB?

-- 
Best Regards,
Artem Bityutskiy

Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcT9S-0001op-O6
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 10:12:16 +0000
From: Richard Weinberger <richard@nod.at>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org
Subject: UBIFS question: Power-cuts after ubifs_leb_unmap()
Date: Mon, 09 Jul 2018 12:11:51 +0200
Message-ID: <1756392.9dNXh6ho7o@blindfold>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem, Adrian,

While playing with a new UBI/UBIFS test framework I managed to hit this error, 
with lprops self-checks enabled:

[ 2412.268964] UBIFS error (ubi0:0 pid 708): scan_check_cb: bad accounting of 
LEB 11: free 0, dirty 118072 flags 0x1, should be free 126976, dirty 0

LEB 11 is unmapped but LPT still thinks that some data is used,
lp->free + lp >dirty < leb-size.
Even without lprobs self-checks, the same filesystem will later hit this 
assertion in ubifs_garbage_collect_leb():

ubifs_assert(!list_empty(&sleb->nodes));

The assert makes sure that the LEB actually contains nodes.
ubifs_garbage_collect_leb() handles the special case lp->free + lp->dirty == 
c->leb_size.
But not lp->free + lp->dirty < leb-size.

Now I'm not sure where to fix that, maybe you can remember some design 
decisions.
1. Shall we massage ubifs_garbage_collect_leb() to deal with this special case 
too?
2. Is it already a bug when this case happens?

>From reviewing the code, I think the said situation can arise when we face 
power-cut
in ubifs_garbage_collect_leb():

if (snod->type == UBIFS_IDX_NODE) {
	...
} else {
	...

	err = ubifs_change_one_lp(c, lnum, c->leb_size, 0, 0, 0, 0);

	...

	err = ubifs_leb_unmap(c, lnum);

	// POWER CUT
}

We mark the LEB as free and unmap it.
ubifs_change_one_lp() does not immediately write a new LPT, if we lose power 
right after ubifs_leb_unmap() it can happen that the LEB already got erased 
but the LPT has the old accounting information.
UBIFS seems to expect such situations only for
lp->free + lp->dirty == c->leb_size

What do you think?

Thanks,
//richard

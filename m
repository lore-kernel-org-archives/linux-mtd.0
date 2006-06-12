Subject: Re: JFFS2/xattr problems.
From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <448D3752.3090605@ak.jp.nec.com>
References: <1148150486.3875.251.camel@pmac.infradead.org>
	<44704CA9.8010604@ak.jp.nec.com>  <448CCEC8.2080903@ak.jp.nec.com>
	<1150099418.11159.44.camel@shinybook.infradead.org>
	<448D3752.3090605@ak.jp.nec.com>
Content-Type: text/plain
Date: Mon, 12 Jun 2006 10:53:15 +0100
Message-Id: <1150105995.8184.17.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-06-12 at 18:43 +0900, KaiGai Kohei wrote:
> In my opinion, a xattr across multiple nodes isn't neccesary.
> What do you think?

I'd be happier if it worked -- some of us have plans to abuse XATTR
support by building a simple database on it... :)

But as long as the failure mode is _graceful_, I suppose we can live
without it for now, if ext3 is also limited to 4KiB.

I'm looking through your handling of deletion now... I'm not sure that
we _need_ the physical deletion node for xdata, do we? Those can go away
just because there are no xrefs which link to them, just like our inodes
do?

Also, the physical deletion node for xrefs is only needed when the xattr
is deleted _without_ the inode being deleted. When the inode goes away,
again the xref becomes obsolete all by itself, right?

Finally, we need to be careful about garbage collection of deletion
nodes. Remember that the deletion node might be garbage-collected
_before_ the older node which it is deleting. So you must decide whether
to write the deletion node out again, when you are garbage collecting
it.

See the horrid mess we make of 'deletion dirents'.

-- 
dwmw2

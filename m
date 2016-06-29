Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bI6Vx-0004QT-Es
 for linux-mtd@lists.infradead.org; Wed, 29 Jun 2016 03:50:13 +0000
Message-ID: <1467172188.2456.64.camel@gmail.com>
Subject: Re: [PATCH v2] UBI: only read necessary size when reading the VID
 header
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Brian Norris <computersforpeace@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com, Richard Weinberger <richard@nod.at>
Date: Wed, 29 Jun 2016 06:49:48 +0300
In-Reply-To: <20160628174304.GA80724@google.com>
References: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
 <1467118829.2456.40.camel@gmail.com> <20160628174304.GA80724@google.com>
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

On Tue, 2016-06-28 at 10:43 -0700, Brian Norris wrote:
> Hi Artem,
> 
> I'll comment on the other branches of this thread, but one thing
> here:
> 
> On Tue, Jun 28, 2016 at 04:00:29PM +0300, Artem Bityutskiy wrote:
> > Therefore, unless I misunderstood this patch - it introduces a
> > regression to those old setups at least (forces MTD to use an
> > intermediate buffer rather than copy data from NAND directly to the
> > buffer supplied by UBI)
> 
> It's really a balance between speed of the flash and speed of the
> memcpy().

Sure.

>  I believe Boris may have benchmarked some of this recently,
> but I'm really inclined to believe that reading several times as much
> as
> you need from flash is much worse than doing some extra memcpy().

That's probably true.

>  So
> even if we introduce an extra memcpy(), it might still be worth it to
> save the extra wait-for-flash time.

Right.

> Intuitively, I expect that these days, the I/O time is much more
> significant than any memcpy().

All good points. Besides indeed in case of the subpage the memcpy() is
present anyway for (for unexpected reasons).

So yeah, I think the concern I rose is a non-issue and we could proceed
with Sascha's patch. Thanks!

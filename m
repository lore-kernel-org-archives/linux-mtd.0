Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHx2n-0004HQ-AU
 for linux-mtd@lists.infradead.org; Tue, 28 Jun 2016 17:43:30 +0000
Received: by mail-pf0-x244.google.com with SMTP id t190so2274343pfb.2
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2016 10:43:08 -0700 (PDT)
Date: Tue, 28 Jun 2016 10:43:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] UBI: only read necessary size when reading the VID
 header
Message-ID: <20160628174304.GA80724@google.com>
References: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
 <1467118829.2456.40.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467118829.2456.40.camel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

I'll comment on the other branches of this thread, but one thing here:

On Tue, Jun 28, 2016 at 04:00:29PM +0300, Artem Bityutskiy wrote:
> Therefore, unless I misunderstood this patch - it introduces a
> regression to those old setups at least (forces MTD to use an
> intermediate buffer rather than copy data from NAND directly to the
> buffer supplied by UBI)

It's really a balance between speed of the flash and speed of the
memcpy(). I believe Boris may have benchmarked some of this recently,
but I'm really inclined to believe that reading several times as much as
you need from flash is much worse than doing some extra memcpy(). So
even if we introduce an extra memcpy(), it might still be worth it to
save the extra wait-for-flash time.

Intuitively, I expect that these days, the I/O time is much more
significant than any memcpy().

Brian

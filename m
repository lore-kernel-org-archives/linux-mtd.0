Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBdRJ-0001D8-Bd
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 04:21:06 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb10so223085pad.9
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 21:20:43 -0700 (PDT)
Date: Mon, 19 Aug 2013 21:20:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 2/4] mtd: m25p80: make CONFIG_M25PXX_USE_FAST_READ safe
 to enable
Message-ID: <20130820042039.GE28421@norris.computersforpeace.net>
References: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
 <1376302946-11534-3-git-send-email-s.hauer@pengutronix.de>
 <20130817201702.GD11210@norris.computersforpeace.net>
 <20130819084226.GB31036@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130819084226.GB31036@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 19, 2013 at 10:42:26AM +0200, Sascha Hauer wrote:
> On Sat, Aug 17, 2013 at 01:17:02PM -0700, Brian Norris wrote:
> > On Mon, Aug 12, 2013 at 12:22:24PM +0200, Sascha Hauer wrote:
> > > This patch adds a flag to struct flash_info indicating that
> > > fast_read is not supported. This now gives the following logic
> > > when determing whether to enable fastread:
> > > 
> > > 1) enable fast_read if device node contains m25p,fast-read
> > > 2) enable fast_read unconditionally if forced in Kconfig
> > > 3) Disable fast_read if the chip does not support it
> > 
> > This logic is either unclear or incorrect.
> > 
> > > This makes enabling CONFIG_M25PXX_USE_FAST_READ a safe option
> > > since we no longer enable the fast_read option unconditionally.
> > 
> > This statement seems to contradict 2 above, depending on the reading
> > (how can 2 enable "unconditionally", yet CONFIG_..._FAST_READ "no longer
> > enable[s] ... unconditionally"?).
> > 
> > The problem I have with this description is that it is assuming that
> > 1, 2, and 3 are applied sequentially, so that later items in the
> > sequence have higher precedence. So it's describing code ordering, not
> > really logic. And statement 3 weakens the "unconditionally" of 2.
> > 
> > And to avoid simply complaining, I propose an alternative explanation:
> > 
> >   If the flash chip does not support fast_read, then disable it.
> >   Otherwise:
> >   1) enable fast_read if device node contains m25p,fast-read
> >   2) enable fast_read if forced in Kconfig
> > 
> > If we correct this description, then:
> > 
> >   Acked-by: Brian Norris <computersforpeace@gmail.com>
> > 
> > I can edit the patch and push the whole thing if this is acceptable.
> 
> Yes, that would be great. Your explanation sounds better than mine.

Can you incorporate this description and resend based on l2-mtd.git?
Your patch currently doesn't apply.

  http://git.infradead.org/l2-mtd.git

> > 
> > One related question (not required for this series): do we even need
> > Kconfig M25PXX_USE_FAST_READ any more? Are there any SPI controllers
> > that can't use FAST_READ? Or perhaps if they have a slow clock, it's
> > preferable to use normal read?
> > 
> > If there are no restrictions from the controller side, I think this
> > NO_FR flag gives enough information to determine everything at runtime,
> > not compile-time.
> 
> This M25PXX_USE_FAST_READ is a no-go for multiplatform Kernels and
> should be removed. I have no idea though how we can do this without
> risking regressions since we have no idea who intentionally disabled
> this option. Maybe we just have to find out by removing it and waiting
> for people to complain^B^B^Bsend patches.

I don't think removal would be too bad. And yes, we can just wait for
complaints :) I may send a patch after your series.

Thanks,
Brian

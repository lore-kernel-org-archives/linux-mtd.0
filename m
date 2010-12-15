Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PSgBK-0006o4-Kr
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 01:29:27 +0000
Date: Tue, 14 Dec 2010 17:29:15 -0800
From: Tony Lindgren <tony@atomide.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: [PATCH 4/7] OMAP2/3: GPMC: put sync_clk value in picoseconds
	instead of nanoseconds
Message-ID: <20101215012914.GE3190@atomide.com>
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>
	<20101213122108.20685.1920.sendpatchset@ahunter-work.research.nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20101213122108.20685.1920.sendpatchset@ahunter-work.research.nokia.com>
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Adrian Hunter <adrian.hunter@nokia.com> [101213 04:21]:
> From c52e0cdeedffb7a0f9818ad3d6296d1f51b8669d Mon Sep 17 00:00:00 2001
> From: Adrian Hunter <adrian.hunter@nokia.com>
> Date: Thu, 9 Dec 2010 10:48:27 +0200
> Subject: [PATCH 4/7] OMAP2/3: GPMC: put sync_clk value in picoseconds instead of nanoseconds
> 
> The calculations done with sync_clk are anyway in picoseconds
> and switching to picoseconds allows sync_clk values that are
> not a whole number of nanoseconds - which is sometimes the
> case.
> 
> Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
> ---
>  arch/arm/mach-omap2/gpmc-nand.c        |    2 +-
>  arch/arm/mach-omap2/gpmc-onenand.c     |   10 +++++-----
>  arch/arm/mach-omap2/gpmc.c             |   12 +++++++++++-
>  arch/arm/mach-omap2/usb-tusb6010.c     |    4 ++--
>  arch/arm/plat-omap/include/plat/gpmc.h |    9 +++++----
>  5 files changed, 24 insertions(+), 13 deletions(-)

Hmm I think I already replied to this.. But looks like not so here's
a new attempt..

This one you should send to linux-omap and linux-arm-kernel and
Cc Felipe Balbi so we can make sure the timing changes work
with tusb6010. Then we can ack it an it can go via the MTD
list.

Regards,

Tony

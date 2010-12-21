Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PUqxQ-00026a-VR
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2010 01:24:07 +0000
Date: Mon, 20 Dec 2010 17:23:52 -0800
From: Tony Lindgren <tony@atomide.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: [PATCH 4/7] OMAP2/3: GPMC: put sync_clk value in picoseconds
	instead of nanoseconds
Message-ID: <20101221012352.GI5941@atomide.com>
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

Can you please post patches 4 - 5 of this series as separate
patches and Cc linux-omap and linux-arm-kernel mailing lists?

This is assuming patches 4 - 5 do not have dependencies to
the other patches in the series..

Thanks,

Tony

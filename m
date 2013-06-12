Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ump0x-0004am-N2
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2013 17:39:20 +0000
Date: Wed, 12 Jun 2013 10:38:54 -0700
From: Tony Lindgren <tony@atomide.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v4 2/3] arm: gpmc: Low power transition support
Message-ID: <20130612173854.GP8164@atomide.com>
References: <1371034858-19984-1-git-send-email-pekon@ti.com>
 <1371034858-19984-3-git-send-email-pekon@ti.com>
 <20130612170126.GI8164@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130612170126.GI8164@atomide.com>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Tony Lindgren <tony@atomide.com> [130612 10:08]:
> * Pekon Gupta <pekon@ti.com> [130612 04:07]:
> > From: avinash philip <avinashphilip@ti.com>
> > 
> > With GPMC converted to platform driver recently, adds low power
> > transition support in driver itself.
> 
> Applying the first two patches of this series into omap-for-v3.11/gpmc.
> Not taking the MTD patch, if it has dependencies to the first two
> patches please let me know and also get an ack from Artem if you
> want me to take it.

Oops, dropping the second patch in this series as it causes the
following if only omap4 is selected for example:

arch/arm/mach-omap2/built-in.o: In function `gpmc_resume':
dss-common.c:(.text+0x9a8): undefined reference to `omap3_gpmc_restore_context'
arch/arm/mach-omap2/built-in.o: In function `gpmc_suspend':
dss-common.c:(.text+0x9c8): undefined reference to `omap3_gpmc_save_context'

Can you please take a lok and fix that?

Regards,

Tony

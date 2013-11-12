Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgN70-0006k5-Kj
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 23:11:12 +0000
Date: Tue, 12 Nov 2013 20:10:38 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 3/5] mtd: nand: omap2: Fix OMAP_BCH option dependency
Message-ID: <20131112231037.GA26497@localhost>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382696277-9063-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2AE93@DBDE04.ent.ti.com>
 <20131112204555.GA20260@localhost>
 <20131112225647.GM20061@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131112225647.GM20061@ld-irv-0074.broadcom.com>
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, "Balbi, Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 12, 2013 at 02:56:47PM -0800, Brian Norris wrote:
> On Tue, Nov 12, 2013 at 05:45:56PM -0300, Ezequiel Garcia wrote:
> > On Fri, Oct 25, 2013 at 11:26:06AM +0000, Gupta, Pekon wrote:
> > > > From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> > > > Subject: [PATCH v2 3/5] mtd: nand: omap2: Fix OMAP_BCH option
> > > > dependency
> > > > 
> > > > This option does not need to depend in MTD_NAND, for it's enclosed
> > > > under it. Also, it's wrong to make it depend in ARCH_OMAP3 only
> > > > since the controller is used in a wider range of SoCs.
> > > > 
> > > > Instead, just leave the dependency on the OMAP2 driver option.
> > > > 
> > > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > > > ---
> > > >  drivers/mtd/nand/Kconfig | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> > > > index d885298..8187466 100644
> > > > --- a/drivers/mtd/nand/Kconfig
> > > > +++ b/drivers/mtd/nand/Kconfig
> > > > @@ -95,7 +95,7 @@ config MTD_NAND_OMAP2
> > > >  	  platforms.
> > > > 
> > > >  config MTD_NAND_OMAP_BCH
> > > > -	depends on MTD_NAND && MTD_NAND_OMAP2 && ARCH_OMAP3
> > > > +	depends on MTD_NAND_OMAP2
> > > >  	tristate "Enable support for hardware BCH error correction"
> > > >  	default n
> > > >  	select BCH
> > > > --
> > > > 1.8.1.5
> > > 
> > > Acked-by: Pekon Gupta <pekon@ti.com>
> > 
> > Brian,
> > 
> > I almost forgot about this one, and I just came across the issue
> > while configuring my board.
> > 
> > I believe this one is simple enough to be pulled in for v3.14
> > (it could be in v3.13, but it's already too late).
> > 
> > Or maybe you're not taking stuff for v3.14 yet...
> 
> Thanks for the reminder. The rest of the series has been discussed
> separately or is otherwise superceded by other patch series, right?
> 

The rest of the series can be divided in two groups:

1. Trivial stuff: I'll sent re-based patches on top of v3.13-rc1
or maybe Pekon will take care of it. It's not a big deal.

2. The ONFI detection stuff: it's not trivial and it's still under
discussion in separate threads. The last work was suggested by Pekon
in his last mail, and I guess he'll post a separate patch soon.

> Applied this one patch to l2-mtd.git, branch 'next'. Thanks.

Great, thanks.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com

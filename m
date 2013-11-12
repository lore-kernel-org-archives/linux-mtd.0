Received: from mail-ie0-f179.google.com ([209.85.223.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgMtZ-0006O6-CM
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 22:57:18 +0000
Received: by mail-ie0-f179.google.com with SMTP id u16so7255144iet.24
 for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2013 14:56:51 -0800 (PST)
Date: Tue, 12 Nov 2013 14:56:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2 3/5] mtd: nand: omap2: Fix OMAP_BCH option dependency
Message-ID: <20131112225647.GM20061@ld-irv-0074.broadcom.com>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382696277-9063-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2AE93@DBDE04.ent.ti.com>
 <20131112204555.GA20260@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131112204555.GA20260@localhost>
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

On Tue, Nov 12, 2013 at 05:45:56PM -0300, Ezequiel Garcia wrote:
> On Fri, Oct 25, 2013 at 11:26:06AM +0000, Gupta, Pekon wrote:
> > > From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> > > Subject: [PATCH v2 3/5] mtd: nand: omap2: Fix OMAP_BCH option
> > > dependency
> > > 
> > > This option does not need to depend in MTD_NAND, for it's enclosed
> > > under it. Also, it's wrong to make it depend in ARCH_OMAP3 only
> > > since the controller is used in a wider range of SoCs.
> > > 
> > > Instead, just leave the dependency on the OMAP2 driver option.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > > ---
> > >  drivers/mtd/nand/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> > > index d885298..8187466 100644
> > > --- a/drivers/mtd/nand/Kconfig
> > > +++ b/drivers/mtd/nand/Kconfig
> > > @@ -95,7 +95,7 @@ config MTD_NAND_OMAP2
> > >  	  platforms.
> > > 
> > >  config MTD_NAND_OMAP_BCH
> > > -	depends on MTD_NAND && MTD_NAND_OMAP2 && ARCH_OMAP3
> > > +	depends on MTD_NAND_OMAP2
> > >  	tristate "Enable support for hardware BCH error correction"
> > >  	default n
> > >  	select BCH
> > > --
> > > 1.8.1.5
> > 
> > Acked-by: Pekon Gupta <pekon@ti.com>
> 
> Brian,
> 
> I almost forgot about this one, and I just came across the issue
> while configuring my board.
> 
> I believe this one is simple enough to be pulled in for v3.14
> (it could be in v3.13, but it's already too late).
> 
> Or maybe you're not taking stuff for v3.14 yet...

Thanks for the reminder. The rest of the series has been discussed
separately or is otherwise superceded by other patch series, right?

Applied this one patch to l2-mtd.git, branch 'next'. Thanks.

Brian

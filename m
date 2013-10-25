Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZfuG-0002XZ-A0
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 11:50:20 +0000
Date: Fri, 25 Oct 2013 08:49:55 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v2 3/5] mtd: nand: omap2: Fix OMAP_BCH option dependency
Message-ID: <20131025114954.GE2489@localhost>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382696277-9063-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2AE93@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA2AE93@DBDE04.ent.ti.com>
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 25, 2013 at 11:26:06AM +0000, Gupta, Pekon wrote:
> > From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> > Subject: [PATCH v2 3/5] mtd: nand: omap2: Fix OMAP_BCH option
> > dependency
> > 
> > This option does not need to depend in MTD_NAND, for it's enclosed
> > under it. Also, it's wrong to make it depend in ARCH_OMAP3 only
> > since the controller is used in a wider range of SoCs.
> > 
> > Instead, just leave the dependency on the OMAP2 driver option.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  drivers/mtd/nand/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> > index d885298..8187466 100644
> > --- a/drivers/mtd/nand/Kconfig
> > +++ b/drivers/mtd/nand/Kconfig
> > @@ -95,7 +95,7 @@ config MTD_NAND_OMAP2
> >  	  platforms.
> > 
> >  config MTD_NAND_OMAP_BCH
> > -	depends on MTD_NAND && MTD_NAND_OMAP2 && ARCH_OMAP3
> > +	depends on MTD_NAND_OMAP2
> >  	tristate "Enable support for hardware BCH error correction"
> >  	default n
> >  	select BCH
> > --
> > 1.8.1.5
> 
> Acked-by: Pekon Gupta <pekon@ti.com>

Thanks!

> Reported-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> 

FWIW, If I'm signing-off this commit, it's implicit that I'm the
reporter.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com

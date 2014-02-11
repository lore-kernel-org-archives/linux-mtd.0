Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDIdA-0007Gt-Rd
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 19:04:29 +0000
Received: by mail-ig0-f174.google.com with SMTP id hl1so9458093igb.1
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 11:04:08 -0800 (PST)
Date: Tue, 11 Feb 2014 11:04:04 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 15/28] Remove TI_AEMIF
Message-ID: <20140211190404.GI18440@ld-irv-0074>
References: <1391971686-9517-1-git-send-email-richard@nod.at>
 <1391971686-9517-16-git-send-email-richard@nod.at>
 <1391979242.25855.37.camel@x220>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1391979242.25855.37.camel@x220>
Cc: Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>,
 Santosh Shilimkar <santosh.shilimkar@ti.com>,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Ivan, others

On Sun, Feb 09, 2014 at 09:54:02PM +0100, Paul Bolle wrote:
> On Sun, 2014-02-09 at 19:47 +0100, Richard Weinberger wrote:
> > The symbol is an orphan, get rid of it.
> > 
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > ---
> >  drivers/mtd/nand/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> > index 90ff447..a195d57 100644
> > --- a/drivers/mtd/nand/Kconfig
> > +++ b/drivers/mtd/nand/Kconfig
> > @@ -465,7 +465,7 @@ config MTD_NAND_SH_FLCTL
> >  
> >  config MTD_NAND_DAVINCI
> >          tristate "Support NAND on DaVinci/Keystone SoC"
> > -        depends on ARCH_DAVINCI || (ARCH_KEYSTONE && TI_AEMIF)
> > +        depends on ARCH_DAVINCI || ARCH_KEYSTONE
> >          help
> >  	  Enable the driver for NAND flash chips on Texas Instruments
> >  	  DaVinci/Keystone processors.
> 
> What's strange about the current dependency is that the only aemif code
> I could find lives at arch/arm/mach-davinci/aemif.c. Is that reachable
> for code in arch/arm/mach-keystone?

It looks like I merged this code before the supporting aemif driver [1] was
merged. I think this is harmless, and so I plan to leave it as-is for
now. Or if Ivan prefers, I can drop the Keystone dependency entirely
until it is ready.

https://lkml.org/lkml/2013/11/20/283

Brian

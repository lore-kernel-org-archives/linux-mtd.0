Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NIJSL-0008Uo-4z
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 10:07:41 +0000
Subject: Re: [PATCH 0/2] OMAP: use physmap-flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tony Lindgren <tony@atomide.com>
In-Reply-To: <20091208183320.GV24013@atomide.com>
References: <20091208192111.GA32268@localhost.localdomain>
	<20091208183320.GV24013@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Dec 2009 12:07:17 +0200
Message-Id: <1260353237.19669.1258.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: 'David Woodhouse' <dwmw2@infradead.org>, linux-omap@vger.kernel.org,
	Ladislav Michl <ladis@linux-mips.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-12-08 at 10:33 -0800, Tony Lindgren wrote:
> * Ladislav Michl <Ladislav.Michl@seznam.cz> [091208 10:20]:
> > There is nothing special on omapflash driver, so it can be replaced with
> > physmap-flash. First patch in serie does exactly this and second one removes
> > drivers/mtd/maps/omap_nor.c and associated Kconfig option. I'd like to have
> > either ack or merge into mtd git tree by mtd maintainers for that second part.
> 
> Nice work! Ack from me to merge all this via the MTD tree.
> 
> Acked-by: Tony Lindgren <tony@atomide.com>
>  
> >  arch/arm/mach-omap1/flash.c                          |   33 ++
> >  arch/arm/plat-omap/include/plat/flash.h              |   16 +
> >  arch/arm/mach-omap1/Makefile                         |    2 
> >  arch/arm/mach-omap1/board-fsample.c                  |    9 
> >  arch/arm/mach-omap1/board-h2.c                       |    9 
> >  arch/arm/mach-omap1/board-h3.c                       |    9 
> >  arch/arm/mach-omap1/board-innovator.c                |    9 
> >  arch/arm/mach-omap1/board-osk.c                      |    9 
> >  arch/arm/mach-omap1/board-palmte.c                   |    9 
> >  arch/arm/mach-omap1/board-palmtt.c                   |    9 
> >  arch/arm/mach-omap1/board-palmz71.c                  |   10 
> >  arch/arm/mach-omap1/board-perseus2.c                 |    9 
> >  arch/arm/mach-omap1/board-sx1.c                      |   11 
> >  arch/arm/mach-omap1/board-voiceblue.c                |    9 
> >  arch/arm/mach-omap2/board-2430sdp.c                  |    7 
> >  arch/arm/mach-omap2/board-h4.c                       |    7 
> >  drivers/mtd/maps/Kconfig                             |    9 
> >  drivers/mtd/maps/Makefile                            |    1 
> >  drivers/mtd/maps/omap_nor.c                          |  188 -----------------
> >  19 files changed, 112 insertions(+), 253 deletions(-)

I think this should be merged via the omap tree, not mtd (CCed dwmw2).

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

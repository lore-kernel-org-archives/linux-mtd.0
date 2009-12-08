Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NI4sJ-0004v7-O1
	for linux-mtd@lists.infradead.org; Tue, 08 Dec 2009 18:33:32 +0000
Date: Tue, 8 Dec 2009 10:33:20 -0800
From: Tony Lindgren <tony@atomide.com>
To: Ladislav Michl <ladis@linux-mips.org>
Subject: Re: [PATCH 0/2] OMAP: use physmap-flash
Message-ID: <20091208183320.GV24013@atomide.com>
References: <20091208192111.GA32268@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091208192111.GA32268@localhost.localdomain>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Ladislav Michl <Ladislav.Michl@seznam.cz> [091208 10:20]:
> There is nothing special on omapflash driver, so it can be replaced with
> physmap-flash. First patch in serie does exactly this and second one removes
> drivers/mtd/maps/omap_nor.c and associated Kconfig option. I'd like to have
> either ack or merge into mtd git tree by mtd maintainers for that second part.

Nice work! Ack from me to merge all this via the MTD tree.

Acked-by: Tony Lindgren <tony@atomide.com>
 
>  arch/arm/mach-omap1/flash.c                          |   33 ++
>  arch/arm/plat-omap/include/plat/flash.h              |   16 +
>  arch/arm/mach-omap1/Makefile                         |    2 
>  arch/arm/mach-omap1/board-fsample.c                  |    9 
>  arch/arm/mach-omap1/board-h2.c                       |    9 
>  arch/arm/mach-omap1/board-h3.c                       |    9 
>  arch/arm/mach-omap1/board-innovator.c                |    9 
>  arch/arm/mach-omap1/board-osk.c                      |    9 
>  arch/arm/mach-omap1/board-palmte.c                   |    9 
>  arch/arm/mach-omap1/board-palmtt.c                   |    9 
>  arch/arm/mach-omap1/board-palmz71.c                  |   10 
>  arch/arm/mach-omap1/board-perseus2.c                 |    9 
>  arch/arm/mach-omap1/board-sx1.c                      |   11 
>  arch/arm/mach-omap1/board-voiceblue.c                |    9 
>  arch/arm/mach-omap2/board-2430sdp.c                  |    7 
>  arch/arm/mach-omap2/board-h4.c                       |    7 
>  drivers/mtd/maps/Kconfig                             |    9 
>  drivers/mtd/maps/Makefile                            |    1 
>  drivers/mtd/maps/omap_nor.c                          |  188 -----------------
>  19 files changed, 112 insertions(+), 253 deletions(-)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

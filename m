Received: from mail-yh0-x22f.google.com ([2607:f8b0:4002:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGx2Q-0000Fc-0d
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2014 20:49:38 +0000
Received: by mail-yh0-f47.google.com with SMTP id c41so2945874yho.20
 for <linux-mtd@lists.infradead.org>; Fri, 21 Feb 2014 12:49:16 -0800 (PST)
Date: Fri, 21 Feb 2014 12:49:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mtd: nand: MTD_NAND_SH_FLCTL should depend on HAS_DMA
Message-ID: <20140221204907.GA18743@ld-irv-0074>
References: <1393012474-22399-1-git-send-email-geert@linux-m68k.org>
 <8022927.N4UoME29Ho@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8022927.N4UoME29Ho@avalon>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Geert,

On Fri, Feb 21, 2014 at 09:27:27PM +0100, Laurent Pinchart wrote:
> On Friday 21 February 2014 20:54:34 Geert Uytterhoeven wrote:
> > If NO_DMA=y:
> > 
> >     drivers/built-in.o: In function `flctl_dma_fifo0_transfer':
> >     sh_flctl.c:(.text+0x210398): undefined reference to `dma_map_single'
> >     sh_flctl.c:(.text+0x2104b0): undefined reference to `dma_unmap_single'
> > 
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/mtd/nand/Kconfig |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> > index 90ff447bf043..e7786913280a 100644
> > --- a/drivers/mtd/nand/Kconfig
> > +++ b/drivers/mtd/nand/Kconfig
> > @@ -458,6 +458,7 @@ config MTD_NAND_MXC
> > 
> >  config MTD_NAND_SH_FLCTL
> >  	tristate "Support for NAND on Renesas SuperH FLCTL"
> > +	depends on HAS_DMA
> >  	depends on SUPERH || ARCH_SHMOBILE || COMPILE_TEST
> >  	help
> >  	  Several Renesas SuperH CPU has FLCTL. This option enables support

It looks like Richard beat you to this. I have a similar patch queued up
in l2-mtd.git:

commit 4c8a074b3abab5a5d77c9a19f2fa5fb9d50f9908
Author: Richard Weinberger <richard@nod.at>
Date:   Fri Jan 31 13:39:07 2014 +0100

    mtd: nand: flctl: Add dependency on HAS_IOMEM and HAS_DMA

Thanks,
Brian

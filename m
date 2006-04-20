Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FWXvW-0003XI-OD
	for linux-mtd@lists.infradead.org; Thu, 20 Apr 2006 08:06:38 -0400
Date: Thu, 20 Apr 2006 14:06:24 +0200
From: Adrian Bunk <bunk@stusta.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060420120624.GO25047@stusta.de>
References: <20060417144823.GC7429@stusta.de>
	<1145285754.13200.15.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1145285754.13200.15.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	rmk@arm.linux.org.uk
Subject: Re: [RFC: 2.6 patch] let arm use drivers/Kconfig
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 17, 2006 at 03:55:54PM +0100, David Woodhouse wrote:
> On Mon, 2006-04-17 at 16:48 +0200, Adrian Bunk wrote:
> > --- linux-2.6.17-rc1-mm2-arm/drivers/mtd/Kconfig.old    2006-04-17 14:32:35.000000000 +0200
> > +++ linux-2.6.17-rc1-mm2-arm/drivers/mtd/Kconfig        2006-04-17 15:00:57.000000000 +0200
> > @@ -1,6 +1,7 @@
> >  # $Id: Kconfig,v 1.11 2005/11/07 11:14:19 gleixner Exp $
> >  
> >  menu "Memory Technology Devices (MTD)"
> > +       depends on (ALIGNMENT_TRAP || !ARM)
> >  
> >  config MTD
> >         tristate "Memory Technology Device (MTD) support"
> 
> This dependency is incorrect. It's only one or two chip-specific drivers
> which require that the architecture correctly handle alignment traps,
> and even then it's only actually apparent when used with JFFS2 which
> actually _gives_ it an unaligned buffer occasionally. Everything else
> works fine.
> 
> Also, I don't want to see this dependency expressed in the MTD Kconfig
> file unless it's not arch-specific. Please make a generic
> BROKEN_UNALIGNED config option, and set it on all architectures which
> need it. Then propose a saner place to put the restriction instead of on
> CONFIG_MTD.

Can anyone tell me which chip-specific drivers are affected by this 
issue so that I can send a patch?

> dwmw2

TIA
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

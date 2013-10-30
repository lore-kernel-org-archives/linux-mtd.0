Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbfLP-0002MQ-IN
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 23:38:36 +0000
Received: by mail-ie0-f175.google.com with SMTP id aq17so3512446iec.20
 for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2013 16:38:12 -0700 (PDT)
Date: Wed, 30 Oct 2013 19:38:09 -0400
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 4/5] mtd: m25p80: remove M25PXX_USE_FAST_READ Kconfig
Message-ID: <20131030233809.GE20059@norris.computersforpeace.net>
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <1382583503-13748-4-git-send-email-computersforpeace@gmail.com>
 <201310271732.42518.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201310271732.42518.marex@denx.de>
Cc: sourav.poddar@ti.com, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I see I never responded to this one.

On Sun, Oct 27, 2013 at 05:32:42PM +0100, Marek Vasut wrote:
> Hi Brian,
> 
> > Remove the compile-time option for FAST_READ, since we have run-time
> > support for detecting it.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/devices/Kconfig  |  7 -------
> >  drivers/mtd/devices/m25p80.c | 11 ++++++-----
> >  2 files changed, 6 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> > index 74ab4b7..0128138 100644
> > --- a/drivers/mtd/devices/Kconfig
> > +++ b/drivers/mtd/devices/Kconfig
> > @@ -95,13 +95,6 @@ config MTD_M25P80
> >  	  if you want to specify device partitioning or to use a device which
> >  	  doesn't support the JEDEC ID instruction.
> > 
> > -config M25PXX_USE_FAST_READ
> > -	bool "Use FAST_READ OPCode allowing SPI CLK >= 50MHz"
> > -	depends on MTD_M25P80
> > -	default y
> > -	help
> > -	  This option enables FAST_READ access supported by ST M25Pxx.
> > -
> >  config MTD_SPEAR_SMI
> >  	tristate "SPEAR MTD NOR Support through SMI controller"
> >  	depends on PLAT_SPEAR
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > index 7e3ec7a..d6c5c57 100644
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -1055,13 +1055,14 @@ static int m25p_probe(struct spi_device *spi)
> >  	flash->page_size = info->page_size;
> >  	flash->mtd.writebufsize = flash->page_size;
> > 
> > -	flash->fast_read = false;
> > -	if (np && of_property_read_bool(np, "m25p,fast-read"))
> > +	if (np)
> > +		/* If we were instantiated by DT, use it */
> > +		flash->fast_read = of_property_read_bool(np, "m25p,fast-read");
> > +	else
> > +		/* If we weren't instantiated by DT, default to fast-read */
> >  		flash->fast_read = true;
> 
> We should default to FALSE , unless explicitly requested by DT, am I wrong? 
> Otherwise this might break the old chips.

I believe my patch is simply a refactoring of the existing code with the
assumption that M25PXX_USE_FAST_READ=y. (In my experience, everyone has
it set to y. Perhaps I'm wrong.)

Now, it's unclear to me what this Kconfig was used for. It's the wrong
approach for controlling fast read on a per-controller or
per-flash-device basis, as it provides a blunt hammer to disable it for
ALL systems which might use the same kernel (think multiplatform
kernels). And now we have a better alternative: the M25P_NO_FR flag for
flash which do not support fast-read.

However, if we come across SPI controllers which can't handle this, then
we might have a problem. Such a situation would really suggest that we
need to identify whether a SPI controller supports fast-read, not just
the flash device.

(Side note: IMO, given the fact that we have to have an ID table for
these flash anyway, the DT property simply provides redundant
information. In the case of the quad-read patch, we were able to
identify this early to avoid an unnecessary DT binding. But in this
case, we also have an indication of controller support for quad I/O...)

If you still object to this patch, I can drop the patch from l2-mtd.git
for now. Then Sourav will need to rebase his patch again.

Brian

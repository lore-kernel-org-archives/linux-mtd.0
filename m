Received: from [92.243.34.74] (helo=mail.osadl.at)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cdBEf-0000M4-2f
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 07:39:47 +0000
Date: Mon, 13 Feb 2017 07:39:21 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] spi-nor: provide a range for poll_timout
Message-ID: <20170213073921.GC23235@osadl.at>
References: <1486917777-23479-1-git-send-email-der.herr@hofr.at>
 <20170212225923.55d5f220@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170212225923.55d5f220@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 12, 2017 at 10:59:23PM +0100, Boris Brezillon wrote:
> +Mika
> 
> On Sun, 12 Feb 2017 17:42:57 +0100
> Nicholas Mc Guire <der.herr@hofr.at> wrote:
> 
> > The overall poll time here is INTEL_SPI_TIMEOUT * 1000 which is 
> > 5000 * 1000 - so 5seconds and it is coded as a tight loop here delay_us
> > to readl_poll_timeout() is set to 0. As this is never called in an atomic
> > context sleeping should be no issue and there is no reasons for the
> > tight-loop here.
> 
> Hm, let's wait for Mika's feedback on this one. BTW, can you please Cc
> him on you other spi-nor/intel patches and prefix your patches with the
> driver name ('mtd: spi-nor: intel: ') so that we know where the changes
> are made (without this prefix it looks like you're touching core files)?
>

will do - just saw that his email shows up in git plame which I normally also include along with what scripts/get_maintainer.pl -f shows - sorry for the ommision.

thx!
hofrat
 
> 
> > 
> > Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
> > ---
> > 
> > Problem located by experimental coccinelle script:
> > ./drivers/mtd/spi-nor/intel-spi.c:265:8-26: WARNING: usleep_range min=0 for delay INTEL_SPI_TIMEOUT * 1000
> > ./drivers/mtd/spi-nor/intel-spi.c:274:8-26: WARNING: usleep_range min=0 for delay INTEL_SPI_TIMEOUT * 1000
> > 
> > The rational for setting the delay_us here to 40 is that readx_poll_timeout()
> > will take delay_us >> 2 + 1 as min value and that should be at least 10us (see
> > Documentation/timers/timers-howto.txt). Ideally the delay would be made
> > even larger to keep the load on the hrtimer subsystem low as these delays
> > here do not seem to be critical. Someone that knows the details of this device
> > would need to check if a larger delay would be ok here.
> > 
> > Patch was compile tested with: multi_v7_defconfig (implies CONFIG_MTD_SPI_NOR=y)
> > one coccicheck finding reported and one spars finding (in separate patches)
> > 
> > Patch is against 4.10-rc6 (localversion-next is next-20170210)
> > 
> >  drivers/mtd/spi-nor/intel-spi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> > index a10f602..371bcf9 100644
> > --- a/drivers/mtd/spi-nor/intel-spi.c
> > +++ b/drivers/mtd/spi-nor/intel-spi.c
> > @@ -263,7 +263,7 @@ static int intel_spi_wait_hw_busy(struct intel_spi *ispi)
> >  	u32 val;
> >  
> >  	return readl_poll_timeout(ispi->base + HSFSTS_CTL, val,
> > -				  !(val & HSFSTS_CTL_SCIP), 0,
> > +				  !(val & HSFSTS_CTL_SCIP), 40,
> >  				  INTEL_SPI_TIMEOUT * 1000);
> >  }
> >  
> > @@ -272,7 +272,7 @@ static int intel_spi_wait_sw_busy(struct intel_spi *ispi)
> >  	u32 val;
> >  
> >  	return readl_poll_timeout(ispi->sregs + SSFSTS_CTL, val,
> > -				  !(val & SSFSTS_CTL_SCIP), 0,
> > +				  !(val & SSFSTS_CTL_SCIP), 40,
> >  				  INTEL_SPI_TIMEOUT * 1000);
> >  }
> >  
> 

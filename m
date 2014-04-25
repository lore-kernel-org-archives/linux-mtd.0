Received: from mail-bn1lp0142.outbound.protection.outlook.com
 ([207.46.163.142] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdWFF-0000QI-Sh
 for linux-mtd@lists.infradead.org; Fri, 25 Apr 2014 02:52:10 +0000
Date: Fri, 25 Apr 2014 09:54:38 +0800
From: Huang Shijie <b32955@freescale.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3] Add support for flag status register on Micron chips.
Message-ID: <20140425015437.GC24530@localhost>
References: <1398175396-7560-1-git-send-email-grmoore@altera.com>
 <1398175396-7560-2-git-send-email-grmoore@altera.com>
 <20140425013434.GA24530@localhost> <201404250442.33197.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <201404250442.33197.marex@denx.de>
Cc: ggrahammoore@gmail.com, Graham Moore <grmoore@altera.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Insop Song <insop.song@gainspeed.com>, David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 25, 2014 at 04:42:33AM +0200, Marek Vasut wrote:
> On Friday, April 25, 2014 at 03:34:36 AM, Huang Shijie wrote:
> > On Tue, Apr 22, 2014 at 09:03:16AM -0500, Graham Moore wrote:
> > > Some new Micron flash chips require reading the flag
> > > status register to determine when operations have completed.
> > > 
> > > Furthermore, chips with multi-die stacks of the 65nm 256Mb QSPI also
> > > require reading the status register before reading the flag status
> > > register.
> > > 
> > > This patch adds support for the flag status register in the n25q512ax3
> > > and n25q00 Micron QSPI flash chips.
> > > 
> > > Signed-off-by: Graham Moore <grmoore@altera.com>
> > > ---
> > > V3:
> > > Rebase to l2-mtd spinor branch.
> > > V2:
> > > Remove leading underscore in function names.
> > > Remove type cast in dev_err call and use the proper format
> > > specifier instead.
> > > ---
> > > 
> > >  drivers/mtd/spi-nor/spi-nor.c |   51
> > >  +++++++++++++++++++++++++++++++++++++++++ include/linux/mtd/spi-nor.h  
> > >  |    4 ++++
> > >  2 files changed, 55 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > > b/drivers/mtd/spi-nor/spi-nor.c index d6f44d5..24b84d8 100644
> > > --- a/drivers/mtd/spi-nor/spi-nor.c
> > > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > > @@ -48,6 +48,25 @@ static int read_sr(struct spi_nor *nor)
> > > 
> > >  }
> > >  
> > >  /*
> > > 
> > > + * Read the flag status register, returning its value in the location
> > > + * Return the status register value.
> > > + * Returns negative if error occurred.
> > > + */
> > > +static int read_fsr(struct spi_nor *nor)
> > > +{
> > > +	int ret;
> > > +	u8 val;
> > > +
> > > +	ret = nor->read_reg(nor, SPINOR_OP_RDFSR, &val, 1);
> > > +	if (ret < 0) {
> > > +		pr_err("error %d reading FSR\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return val;
> > > +}
> > > +
> > > +/*
> > > 
> > >   * Read configuration register, returning its value in the
> > >   * location. Return the configuration register value.
> > >   * Returns negative if error occured.
> > > 
> > > @@ -165,6 +184,32 @@ static int spi_nor_wait_till_ready(struct spi_nor
> > > *nor)
> > > 
> > >  	return -ETIMEDOUT;
> > >  
> > >  }
> > > 
> > > +static int spi_nor_wait_till_fsr_ready(struct spi_nor *nor)
> > > +{
> > > +	unsigned long deadline;
> > > +	int sr;
> > > +	int fsr;
> > > +
> > > +	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
> > > +
> > > +	do {
> > > +		cond_resched();
> > > +
> > > +		sr = read_sr(nor);
> > > +		if (sr < 0)
> > > +			break;
> > > +		else if (!(sr & SR_WIP)) {
> > > +			fsr = read_fsr(nor);
> > > +			if (fsr < 0)
> > > +				break;
> > > +			if (fsr & FSR_READY)
> > > +				return 0;
> > > +		}
> > > +	} while (!time_after_eq(jiffies, deadline));
> > > +
> > > +	return -ETIMEDOUT;
> > > +}
> > > +
> > > 
> > >  /*
> > >  
> > >   * Service routine to read status register until ready, or timeout
> > >   occurs. * Returns non-zero if error.
> > > 
> > > @@ -402,6 +447,7 @@ struct flash_info {
> > > 
> > >  #define	SECT_4K_PMC		0x10	/* SPINOR_OP_BE_4K_PMC works 
> uniformly */
> > >  #define	SPI_NOR_DUAL_READ	0x20    /* Flash supports Dual Read */
> > >  #define	SPI_NOR_QUAD_READ	0x40    /* Flash supports Quad Read */
> > > 
> > > +#define	USE_FSR			0x80	/* use flag status register */
> > > 
> > >  };
> > >  
> > >  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
> > > 
> > > @@ -488,6 +534,8 @@ const struct spi_device_id spi_nor_ids[] = {
> > > 
> > >  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
> > >  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
> > >  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
> > > 
> > > +	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, USE_FSR) },
> > > +	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, USE_FSR) },
> > > 
> > >  	/* PMC */
> > >  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
> > > 
> > > @@ -965,6 +1013,9 @@ int spi_nor_scan(struct spi_nor *nor, const struct
> > > spi_device_id *id,
> > > 
> > >  	else
> > >  	
> > >  		mtd->_write = spi_nor_write;
> > > 
> > > +	if (info->flags & USE_FSR)
> > > +		nor->wait_till_ready = spi_nor_wait_till_fsr_ready;
> > > +
> > 
> > the drivers may fills this hook itself, so the code should like this:
> >    --------------------------------------------------
> > 	if ((info->flags & USE_FSR) &&
> > 	       	nor->wait_till_ready == spi_nor_wait_till_fsr_ready)
> > 		nor->wait_till_ready = spi_nor_wait_till_fsr_ready;
> >    --------------------------------------------------
sorry, the code should like this:
   --------------------------------------------------
   if ((info->flags & USE_FSR) &&
          	nor->wait_till_ready == spi_nor_wait_till_ready)
   	nor->wait_till_ready = spi_nor_wait_till_fsr_ready;
  --------------------------------------------------
	  

thanks
Huang Shijie

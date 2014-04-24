From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v1 2/7] mtd: spi-nor: add DDR quad read support
Date: Thu, 24 Apr 2014 15:43:51 +0200
References: <a> <201404232145.57404.marex@denx.de>
 <20140424045332.GB29664@localhost>
In-Reply-To: <20140424045332.GB29664@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404241543.51752.marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, April 24, 2014 at 06:53:34 AM, Huang Shijie wrote:
> On Wed, Apr 23, 2014 at 09:45:57PM +0200, Marek Vasut wrote:
> > On Wednesday, April 23, 2014 at 12:16:50 PM, Huang Shijie wrote:
> > > This patch adds the DDR quad read support by the following:
> > >   [1] add SPI_NOR_DDR_QUAD read mode.
> > >   
> > >   [2] add DDR Quad read opcodes:
> > >        SPINOR_OP_READ_1_4_4_D / SPINOR_OP_READ4_1_4_4_D
> > >   
> > >   [3] add set_ddr_quad_mode() to initialize for the DDR quad read.
> > >   
> > >       Currently it only works for Spansion NOR.
> > >   
> > >   [3] set the dummy with 8 for DDR quad read.
> > >   
> > >       The m25p80.c can not support the DDR quad read, the SPI NOR
> > > 
> > > controller can set the dummy value in its driver, such as
> > > fsl-quadspi.c.
> > > 
> > > Test this patch for Spansion s25fl128s NOR flash.
> > > 
> > > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > > ---
> > > 
> > >  drivers/mtd/spi-nor/spi-nor.c |   50
> > > 
> > > +++++++++++++++++++++++++++++++++++++++- include/linux/mtd/spi-nor.h  
> > > |
> > > 
> > >  8 +++++-
> > >  2 files changed, 54 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > > b/drivers/mtd/spi-nor/spi-nor.c index 1a12f81..e2f69db 100644
> > > --- a/drivers/mtd/spi-nor/spi-nor.c
> > > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > > @@ -74,6 +74,15 @@ static int read_cr(struct spi_nor *nor)
> > > 
> > >  static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
> > >  {
> > >  
> > >  	switch (nor->flash_read) {
> > > 
> > > +	case SPI_NOR_DDR_QUAD:
> > > +		/*
> > > +		 * The m25p80.c can not support the DDR quad read.
> > > +		 * We set the dummy cycles to 8 by default. If the SPI NOR
> > > +		 * controller driver has already set it before call the
> > > +		 * spi_nor_scan(), we just keep it as it is.
> > > +		 */
> > > +		if (nor->read_dummy)
> > > +			return nor->read_dummy;
> > 
> > Can the controller set this variable to zero ?
> 
> The default value of this variable is zero.  It it meaningless to set zero.
> The DDR Quad read definitely will use a non-zero dummy.

Can you back this by some documentation please ?

I mean, I know I am a hardass here, but please understand I'd like to understand 
the decisions that are being made.

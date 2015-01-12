Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAU9Z-0005lE-WB
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 01:50:50 +0000
Date: Mon, 12 Jan 2015 09:48:27 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: fsl-quadspi: Call fsl_qspi_set_base_addr
 after nor_size is set
Message-ID: <20150112014827.GA13552@hsj.sh.intel.com>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
 <20150109202654.GX9759@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150109202654.GX9759@ld-irv-0074>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, shijie8@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 09, 2015 at 12:26:54PM -0800, Brian Norris wrote:

I planned to review this patch yesterday. But I was blocked by something.

> On Wed, Jan 07, 2015 at 08:32:06AM -0200, Fabio Estevam wrote:
> > From: Fabio Estevam <fabio.estevam@freescale.com>
> > 
> > fsl_qspi_set_base_addr() uses nor_size information, but it is called prior to
> > the initialization of nor_size.
> > 
> > Fix it by calling fsl_qspi_set_base_addr() after nor_size is configured.
> 
> This patch doesn't look correct either. But then, the original driver
> seems confusing too.
Do you have a datasheet for this controller?
The controller has two buses: bus A and bus B.
We can attach two flashes to each bus, just like

      ______
     |      |  bus A
     |      | ----->  (flash 1 and flash 2)
     |      |
     |      |  bus B     
     |      | ----->  (flash 3 and flash 4)
     |______|
           

 These four flashes are mmapped to the four contiguous memory spaces for
 this controller, assume it case 1: 
      (flash 1)  ====> [0   ~ 16M)
      (flash 2)  ====> [16M ~ 32M)
      (flash 3)  ====> [32M ~ 48M)
      (flash 4)  ====> [48M ~ 64M)

 But most of the time, we only attach one flash to each bus, so the memory space we use like 
 this, assume it the case 2:
      (flash 1)  ====> [0   ~ 16M)
      (flash 2)  ====> not exist
      (flash 3)  ====> [32M ~ 48M)
      (flash 4)  ====> not exist.


 That's why the "fsl,qspi-has-second-chip" is needed here. 
 If we remove this property,
         (1) it means case 1 if set 4 child node for the quadspi driver.
         (2) it means case 2 if set 2 child node for the quadspi driver.

 I thinks we should add the above description for the driver's document
 file. Brian, Do you think it is okay?

> 
> Huang, is this driver assuming that all flashes on this controller will
> be the same size? Or maybe I'm not understanding your MMIO layout. But I
Yes. We always attach the same size NOR to the quadspi controller.

> notice that 'nor_size' is shared between all NOR instances on this
> controller. And for that matter, I don't see any locking. Are you sure
> this driver is safe for multiple flash instances?
It is not safe now. The current quadspi driver is just a basic driver
which can pass the generic tests. I ever was planed to some locks for the
multiple flashes access. I think we still need an extra patch for the
multiple flashes case. 

> 
> > Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> > ---
> > Changes since v2:
> > - Newly introduced in this version
> > 
> >  drivers/mtd/spi-nor/fsl-quadspi.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> > index 39763b9..20cffd2 100644
> > --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> > +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> > @@ -897,9 +897,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
> >  		if (ret < 0)
> >  			goto map_failed;
> >  
> > -		/* set the chip address for READID */
> > -		fsl_qspi_set_base_addr(q, nor);
> > -
> >  		ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
> >  		if (ret)
> >  			goto map_failed;
> > @@ -917,6 +914,9 @@ static int fsl_qspi_probe(struct platform_device *pdev)
> >  			fsl_qspi_set_map_addr(q);
> >  		}
> >  
> > +		/* set the chip address for READID */
> 
> OK, so this is to get READID correct... but you're doing this after
> READID. So is this for configuring the *next* flash? I'm confused.

Yes. This patch is not correct. As Brian said, you move the
fsl_qspi_set_base_addr() after the spi_nor_scan. So the spi_nor_scan
will fail.
> 
> > +		fsl_qspi_set_base_addr(q, nor);
> > +
> >  		/*
> >  		 * The TX FIFO is 64 bytes in the Vybrid, but the Page Program
> >  		 * may writes 265 bytes per time. The write is working in the
> 
> I don't think I want to take any of these patches until I get a clearer
> picture of who/what/how you're testing these, and I get an ack from
> Huang (or someone else who is going to be the de factor / official
> maintianer of this driver, since I note that Huang is no longer with
> Freescale).
In actually, the one who will maintain this driver is blocked by some
NAND issues. Before he can take over this driver, i can help to maintain
this driver during this time gap.


thanks
Huang Shijie

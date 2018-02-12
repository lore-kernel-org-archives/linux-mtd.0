Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elDHK-0005Dw-NB
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 12:32:16 +0000
Date: Mon, 12 Feb 2018 13:31:58 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Vignesh R <vigneshr@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [RFC PATCH 4/6] spi: ti-qspi: Implement the spi_mem interface
Message-ID: <20180212133158.3032442f@bbrezillon>
In-Reply-To: <6a9eaaaf-20a6-b332-03d0-9d16e24d0b3d@ti.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-5-boris.brezillon@bootlin.com>
 <6a9eaaaf-20a6-b332-03d0-9d16e24d0b3d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 Feb 2018 17:13:55 +0530
Vignesh R <vigneshr@ti.com> wrote:

> On Tuesday 06 February 2018 04:51 AM, Boris Brezillon wrote:
> > From: Boris Brezillon <boris.brezillon@free-electrons.com>
> > 
> > The spi_mem interface is meant to replace the spi_flash_read() one.
> > Implement the ->exec_op() method so that we can smoothly get rid of the
> > old interface.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/spi/spi-ti-qspi.c | 85 +++++++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 72 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
> > index c24d9b45a27c..40cac3ef6cc9 100644
> > --- a/drivers/spi/spi-ti-qspi.c
> > +++ b/drivers/spi/spi-ti-qspi.c  
> 
> [...]
> 
> > +static const struct spi_controller_mem_ops ti_qspi_mem_ops = {
> > +	.exec_op = ti_qspi_exec_mem_op,  
> 
>        .supports_op = ti_qspi_supports_mem_op,
> 
> Its required as per spi_controller_check_ops() in Patch 1/6

->supports_op() is optional, and if it's missing, the core will do the
regular QuadSPI/DualSPI/SingleSPI check (see spi_mem_supports_op()
implementation). This being said, if you think a custom ->supports_op()
implementation is needed for this controller I can add one.

> 
> > +};
> > +
> >  static int ti_qspi_start_transfer_one(struct spi_master *master,
> >  		struct spi_message *m)
> >  {
> > @@ -673,6 +730,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
> >  	master->bits_per_word_mask = SPI_BPW_MASK(32) | SPI_BPW_MASK(16) |
> >  				     SPI_BPW_MASK(8);
> >  	master->spi_flash_read = ti_qspi_spi_flash_read;
> > +	master->mem_ops = &ti_qspi_mem_ops;
> >  
> >  	if (!of_property_read_u32(np, "num-cs", &num_cs))
> >  		master->num_chipselect = num_cs;
> > @@ -785,6 +843,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
> >  				 PTR_ERR(qspi->mmap_base));
> >  			qspi->mmap_base = NULL;
> >  			master->spi_flash_read = NULL;
> > +			master->mem_ops = NULL;
> >  		}
> >  	}
> >  	qspi->mmap_enabled = false;
> >   
> 



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

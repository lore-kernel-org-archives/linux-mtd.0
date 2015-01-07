Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8hjj-0002W6-Ee
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 03:56:48 +0000
Date: Wed, 7 Jan 2015 11:54:38 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150107035438.GA1113@shldeISGChi005.sh.intel.com>
References: <1417814086-30512-1-git-send-email-festevam@gmail.com>
 <20150106064931.GB13447@norris-Latitude-E6410>
 <20150107011242.GA30740@shldeISGChi005.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150107011242.GA30740@shldeISGChi005.sh.intel.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 shijie8@gmail.com, Frank.Li@freescale.com, Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 07, 2015 at 09:12:42AM +0800, Huang Shijie wrote:
> On Mon, Jan 05, 2015 at 10:49:31PM -0800, Brian Norris wrote:
> > Hi,
> > 
> > On Fri, Dec 05, 2014 at 07:14:46PM -0200, Fabio Estevam wrote:
> > > From: Fabio Estevam <fabio.estevam@freescale.com>
> > > 
> > > When removing the fsl-quadspi module and running 'cat /proc/mtd' afterwards,
> > > we see garbage data like:
> > > 
> > > $ rmmod  fsl-quadspi
> > > $ cat /proc/mtd
> > > dev:    size   erasesize  name
> > > mtd0: 00000000 00000000 "(null)"
> > > mtd0: 00000000 00000000 "(null)"
> > > mtd0: 00000000 00000000 "(null)"
> > > ...
> > > mtd0: a22296c6c756e28 00000000 "(null)"
> > > mtd0: a22296c6c756e28 3064746d "(null)"
> > > 
> > > The reason for this is due to the wrong mtd index used in
> > > mtd_device_unregister() in the remove function.
> > > 
> > > We need to keep the mtd index aligned with the one used in the probe function,
> > > which means we need to take into account the 'has_second_chip' property.
> > > 
> > > Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> > > ---
> > >  drivers/mtd/spi-nor/fsl-quadspi.c | 19 +++++++++++++------
> > >  1 file changed, 13 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> > > index 39763b9..4b468a9 100644
> > > --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> > > +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> > > @@ -227,6 +227,7 @@ struct fsl_qspi {
> > >  	u32 nor_num;
> > >  	u32 clk_rate;
> > >  	unsigned int chip_base_addr; /* We may support two chips. */
> > > +	bool has_second_chip;
> > >  };
> > >  
> > >  static inline int is_vybrid_qspi(struct fsl_qspi *q)
> > > @@ -783,7 +784,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
> > >  	struct spi_nor *nor;
> > >  	struct mtd_info *mtd;
> > >  	int ret, i = 0;
> > > -	bool has_second_chip = false;
> > >  	const struct of_device_id *of_id =
> > >  			of_match_device(fsl_qspi_dt_ids, &pdev->dev);
> > >  
> > > @@ -860,14 +860,14 @@ static int fsl_qspi_probe(struct platform_device *pdev)
> > >  		goto irq_failed;
> > >  
> > >  	if (of_get_property(np, "fsl,qspi-has-second-chip", NULL))
> > 
> > Huh? Why was this property even needed in the first place? It seems
> > oddly specific, without actually being very explanatory/descriptive.
> The qspi controller can connect with two SPI flashes at the same time.
> Most of the time, we only connect one flash to it.
> 
sorry, I have forgotten some information. The above comment is wrong.
The qspi controller can connect 4 SPI flashes at the same time.

thanks
Huang Shijie

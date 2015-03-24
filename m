Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaWCo-0006tp-TI
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2015 21:17:47 +0000
Received: by pdnc3 with SMTP id c3so5594001pdn.0
 for <linux-mtd@lists.infradead.org>; Tue, 24 Mar 2015 14:17:25 -0700 (PDT)
Date: Tue, 24 Mar 2015 14:17:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie.huang@intel.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Access multiple chips simultaneously
Message-ID: <20150324211722.GB2677@norris-Latitude-E6410>
References: <1421364415-13865-1-git-send-email-han.xu@freescale.com>
 <20150116004031.GB17777@hsj.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150116004031.GB17777@hsj.sh.intel.com>
Cc: shijie8@gmail.com, linux-mtd@lists.infradead.org,
 Han Xu <han.xu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 16, 2015 at 08:40:31AM +0800, Huang Shijie wrote:
> On Fri, Jan 16, 2015 at 07:26:55AM +0800, Han Xu wrote:
> > Add supports for simultaneous access to multiple chips. Need to lock
> > the mutex before any quad spi operations and unlock the mutex after
> > operations complete.
> > 
> > Signed-off-by: Han Xu <han.xu@freescale.com>
> > ---
> >  drivers/mtd/spi-nor/fsl-quadspi.c |    7 +++++++
> >  1 files changed, 7 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> > index 39763b9..7964511 100644
> > --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> > +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/mtd/mtd.h>
> >  #include <linux/mtd/partitions.h>
> >  #include <linux/mtd/spi-nor.h>
> > +#include <linux/mutex.h>
> >  
> >  /* The registers */
> >  #define QUADSPI_MCR			0x00
> > @@ -227,6 +228,7 @@ struct fsl_qspi {
> >  	u32 nor_num;
> >  	u32 clk_rate;
> >  	unsigned int chip_base_addr; /* We may support two chips. */
> > +	struct mutex lock;
> >  };
> >  
> >  static inline int is_vybrid_qspi(struct fsl_qspi *q)
> > @@ -751,6 +753,8 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
> >  	struct fsl_qspi *q = nor->priv;
> >  	int ret;
> >  
> > +	mutex_lock(&q->lock);
> > +
> >  	ret = clk_enable(q->clk_en);
> >  	if (ret)
> >  		return ret;
> > @@ -771,6 +775,7 @@ static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
> >  
> >  	clk_disable(q->clk);
> >  	clk_disable(q->clk_en);
> > +	mutex_unlock(&q->lock);
> >  }
> >  
> >  static int fsl_qspi_probe(struct platform_device *pdev)
> > @@ -862,6 +867,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
> >  	if (of_get_property(np, "fsl,qspi-has-second-chip", NULL))
> >  		has_second_chip = true;
> >  
> > +	mutex_init(&q->lock);
> > +
> >  	/* iterate the subnodes. */
> >  	for_each_available_child_of_node(dev->of_node, np) {
> >  		char modalias[40];
> > -- 
> 
> Acked-by: Huang Shijie <shijie.huang@intel.com>

This doesn't apply to the latest l2-mtd.git. Can you rebase and resend?

Brian

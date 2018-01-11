Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZcsY-0001bJ-38
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 13:26:47 +0000
Date: Thu, 11 Jan 2018 14:26:24 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>,
 <david.wolfe@nxp.com>, <han.xu@nxp.com>, <frank.li@nxp.com>
Subject: Re: [PATCH v2] mtd: fsl-quadspi: Distinguish the mtd device names
Message-ID: <20180111142624.0373d343@bbrezillon>
In-Reply-To: <20180111142506.13a05281@bbrezillon>
References: <1515676504-11510-1-git-send-email-fabio.estevam@nxp.com>
 <20180111142506.13a05281@bbrezillon>
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

On Thu, 11 Jan 2018 14:25:06 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Thu, 11 Jan 2018 11:15:04 -0200
> Fabio Estevam <fabio.estevam@nxp.com> wrote:
> 
> > Currently on a imx6sx-sdb board, which has two SPI NOR chips connected
> > to QSPI2 the following output from /proc/mtd is seen:
> > 
> > # cat /proc/mtd 
> > dev:    size   erasesize  name
> > mtd0: 01000000 00010000 "21e4000.qspi"
> > mtd1: 01000000 00010000 "21e4000.qspi"
> > 
> > Attempts to partition them on the kernel command line result in both
> > chips with identical (and identically named) partitions, which is
> > an inconvenient behavior.
> > 
> > Assign a different mtd->name for each mtd device to avoid this problem.
> > 
> > After this change the output from /proc/mtd becomes:
> > 
> > # cat /proc/mtd 
> > dev:    size   erasesize  name
> > mtd0: 01000000 00010000 "21e4000.qspi-0"
> > mtd1: 01000000 00010000 "21e4000.qspi-1"
> > 
> > Reported-by: David Wolfe <david.wolfe@nxp.com>
> > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> > ---
> > Changes since v1:
> > - Use 'spiflash_idx' for the variable name
> > - Use the mtd->name in the format 21e4000.qspi-0
> > - Do not assing the mtd name relying on the dts ordering and use the reg
> > property instead
> > - Call devm_kasprintf() after spi_nor_set_flash_node().
> > 
> >  drivers/mtd/spi-nor/fsl-quadspi.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> > index 2901c7b..b28ad8b 100644
> > --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> > +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> > @@ -967,7 +967,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
> >  	struct resource *res;
> >  	struct spi_nor *nor;
> >  	struct mtd_info *mtd;
> > -	int ret, i = 0;
> > +	int ret, i = 0, spiflash_idx;
> >  
> >  	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
> >  	if (!q)
> > @@ -1051,6 +1051,22 @@ static int fsl_qspi_probe(struct platform_device *pdev)
> >  		spi_nor_set_flash_node(nor, np);
> >  		nor->priv = q;
> >  
> > +		ret = of_property_read_u32(np, "reg", &spiflash_idx);

Forgot to mention that the DT bindings doc should be updated
accordingly.

> > +		if (ret) {
> > +			dev_err(dev, "could not get reg property: %d\n", ret);
> > +			ret = -EINVAL;
> > +			goto mutex_failed;
> 
> Was reg already mandatory before this commit? If it's not the case,
> you're breaking backward compat.
> 
> > +		}
> 
> You can move the above block
> 
> > +
> > +		if (!mtd->name) {
> 
> here.
> 
> > +			mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s-%d",
> > +						   dev_name(dev), spiflash_idx);
> 
> By changing the name you're breaking existing users that pass
> mtdparts=21e4000.qspi:<parts> :-(.
> 
> There's no easy solution for the problem you're trying to solve, but
> maybe you can make reg optional, and if it's not present set
> mtd->name to dev_name(dev).
> And, you should complain when you have more than one child node and reg
> is missing.
> 
> > +			if (!mtd->name) {
> > +				ret = -ENOMEM;
> > +				goto mutex_failed;
> > +			}
> > +		}
> > +
> >  		/* fill the hooks */
> >  		nor->read_reg = fsl_qspi_read_reg;
> >  		nor->write_reg = fsl_qspi_write_reg;
> 

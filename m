Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRbyb-0003zc-Vy
 for linux-mtd@lists.infradead.org; Wed, 10 Sep 2014 07:06:02 +0000
Received: by mail-pa0-f41.google.com with SMTP id bj1so5929637pad.14
 for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2014 00:05:41 -0700 (PDT)
Date: Wed, 10 Sep 2014 00:05:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie.huang@intel.com>
Subject: Re: [PATCH 7/8] mtd: spi-nor: factor out write_enable() for erase
 commands
Message-ID: <20140910070537.GC5732@norris-Latitude-E6410>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-8-git-send-email-computersforpeace@gmail.com>
 <20140809105232.GA1571@localhost.localdomain>
 <20140811184818.GY3711@ld-irv-0074>
 <20140812005912.GA1850@shldeISGChi005.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140812005912.GA1850@shldeISGChi005.sh.intel.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 zajec5@gmail.com, Huang Shijie <shijie8@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Tue, Aug 12, 2014 at 08:59:12AM +0800, Huang Shijie wrote:
> On Mon, Aug 11, 2014 at 11:48:18AM -0700, Brian Norris wrote:
> > On Sat, Aug 09, 2014 at 06:52:34PM +0800, Huang Shijie wrote:
> > > On Wed, Aug 06, 2014 at 06:17:01PM -0700, Brian Norris wrote:
> > > > diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> > > > index 9c13622a0c7a..07fbfb0a7738 100644
> > > > --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> > > > +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> > > > @@ -738,11 +738,6 @@ static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
> > > >  	dev_dbg(nor->dev, "%dKiB at 0x%08x:0x%08x\n",
> > > >  		nor->mtd->erasesize / 1024, q->chip_base_addr, (u32)offs);
> > > >  
> > > > -	/* Send write enable, then erase commands. */
> > > > -	ret = nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0, 0);
> > > > -	if (ret)
> > > > -		return ret;
> > > > -
> > > This write-enable is used for per-sector-erase, not for the whole chip
> > > erase.
> > > 
> > > So if you really want to remove this code, you should add an extra write-enable
> > > in the spi_nor_erase.
> > 
> > I don't understand your comment.
> > 
> > Before this patch, there is a write-enable command in:
> >  * m25p80.c, per-sector erase
> >  * fsl-quadspi, per-sector erase
> >  * spi-nor.c, whole-chip erase
> > 
> > With this patch, I am factoring all of these out into spi_nor_erase().
> > 
> > What is the problem?
> Hi Brian:
>    For the spi_nor_erase(), the patch should like this:
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index c130bf7..26c48bc 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -324,6 +324,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  
>  	/* whole-chip erase? */
>  	if (len == mtd->size) {
> +		write_enable(nor);
>  		if (erase_chip(nor)) {
>  			ret = -EIO;
>  			goto erase_err;
> @@ -337,6 +338,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	/* "sector"-at-a-time erase */
>  	} else {
>  		while (len) {
> +			write_enable(nor);
>  			if (nor->erase(nor, addr)) {
>  				ret = -EIO;
>  				goto erase_err;
> 

How is your patch any different than mine? Mine has the exact same code,
except it covers both paths by putting the write_enable() outside the
conditional entirely.

Brian

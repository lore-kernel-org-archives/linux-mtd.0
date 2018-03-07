Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1etW8K-0003Gf-RX
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 10:17:51 +0000
Date: Wed, 7 Mar 2018 11:17:01 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 linux-mtd@lists.infradead.org, oss@buserror.net,
 computersforpeace@gmail.com, leoyang.li@nxp.com
Subject: Re: [PATCH] driver: mtd: ifc: increase eccstat array size for ver
 >= 2.0.0
Message-ID: <20180307111701.0ebdfff3@bbrezillon>
In-Reply-To: <20180307104634.50c8a28a@xps13>
References: <20180307091656.16378-1-prabhakar.kushwaha@nxp.com>
 <20180307104634.50c8a28a@xps13>
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

On Wed, 7 Mar 2018 10:46:34 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Prabhakar,
> 
> On Wed,  7 Mar 2018 14:46:56 +0530, Prabhakar Kushwaha
> <prabhakar.kushwaha@nxp.com> wrote:
> 
> > Number of ECC status registers i.e. (ECCSTATx) has been increased
> > in IFC version 2.0.0 due to increase in SRAM size.
> > 
> > Fix the resulting eccstat array overflow.
> > 
> > Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>  
> 
> Prefix should be "mtd: rawnand: fsl_ifc: ". It used to be "nand"
> instead of "rawnand" but "raw NAND" drivers are moved into a separate
> subfolder to make clear separations between families, and the prefix
> should follow.

And you miss the Fixes and Cc-stable tags.

> 
> > ---
> >  drivers/mtd/nand/fsl_ifc_nand.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> > index 4872a7ba6503..612f0990fa90 100644
> > --- a/drivers/mtd/nand/fsl_ifc_nand.c
> > +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> > @@ -193,7 +193,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
> >  	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
> >  	struct fsl_ifc_nand_ctrl *nctrl = ifc_nand_ctrl;
> >  	struct fsl_ifc_runtime __iomem *ifc = ctrl->rregs;
> > -	u32 eccstat[4];
> > +	u32 eccstat[8];
> >  	int i;
> >  
> >  	/* set the chip select for NAND Transaction */
> > @@ -237,8 +237,14 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
> >  		else
> >  			eccstat_regs = ifc->ifc_nand.v1_nand_eccstat;
> >  
> > -		for (i = sector / 4; i <= sector_end / 4; i++)
> > +		for (i = sector / 4; i <= sector_end / 4; i++) {
> > +			if (i >= ARRAY_SIZE(eccstat)) {
> > +				dev_err(priv->dev, "%s: eccstat small for %d\n",
> > +					__func__, i);
> > +				return;
> > +			}  
> 
> I suppose this check is here to prevent possible silent overflows
> due to further enlargements of the number of ECC status registers, but
> I don't think this is the right place to do so.
> 
> Actually, the only function in which this array is used is
> check_read_ecc() and it does nothing else than looking at one register
> in the array at a time. I am pretty sure this function could be
> reworked a bit to get rid of the array and use a single "u32 eccstat;".

I totally agree with that.


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

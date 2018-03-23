Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezHVB-000442-SA
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 07:52:44 +0000
Date: Fri, 23 Mar 2018 08:52:27 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jagdish Gediya <jagdish.gediya@nxp.com>
Cc: boris.brezillon@free-electrons.com, stable@vger.kernel.org,
 leoyang.li@nxp.com, oss@buserror.net, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
Subject: Re: [PATCH][v4] mtd: rawnand: fsl_ifc: Fix eccstat array overflow
 for IFC ver >= 2.0.0
Message-ID: <20180323085227.0e959a3d@bbrezillon>
In-Reply-To: <20180321095535.4e2fdc25@bbrezillon>
References: <1521591713-12805-1-git-send-email-jagdish.gediya@nxp.com>
 <20180321095535.4e2fdc25@bbrezillon>
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

On Wed, 21 Mar 2018 09:55:35 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Wed, 21 Mar 2018 05:51:46 +0530
> Jagdish Gediya <jagdish.gediya@nxp.com> wrote:
> 
> > Number of ECC status registers i.e. (ECCSTATx) has been increased in IFC
> > version 2.0.0 due to increase in SRAM size. This is causing eccstat
> > array to over flow.
> > 
> > So, replace eccstat array with u32 variable to make it fail-safe and
> > independent of number of ECC status registers or SRAM size.
> > 
> > Fixes: bccb06c353af ("mtd: nand: ifc: update bufnum mask for ver >= 2.0.0")
> > Cc: stable@vger.kernel.org # 3.18+
> > Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> > Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
> > ---
> > Changes for v2: Incorporated comments from Miquel Raynal and Boris Brezillon 
> >         - Updated patch subject
> >         - Remove usage of eccstat array
> >         - Added Cc: stable@vger.kernel.org 
> > 
> > Changes for v3: Incorporated comments from Boris Brezillon
> >         - Added fixes tag
> > 
> > Changes for v4: Incorporated comments from Boris Brezillon
> > 
> >  drivers/mtd/nand/fsl_ifc_nand.c | 23 ++++++++++-------------
> >  1 file changed, 10 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> > index 4872a7b..9a01309 100644
> > --- a/drivers/mtd/nand/fsl_ifc_nand.c
> > +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> > @@ -173,14 +173,9 @@ static void set_addr(struct mtd_info *mtd, int column, int page_addr, int oob)
> >  
> >  /* returns nonzero if entire page is blank */
> >  static int check_read_ecc(struct mtd_info *mtd, struct fsl_ifc_ctrl *ctrl,
> > -			  u32 *eccstat, unsigned int bufnum)
> > +			  u32 eccstat, unsigned int bufnum)
> >  {
> > -	u32 reg = eccstat[bufnum / 4];
> > -	int errors;
> > -
> > -	errors = (reg >> ((3 - bufnum % 4) * 8)) & 15;
> > -
> > -	return errors;
> > +	return  (eccstat >> ((3 - bufnum % 4) * 8)) & 15;
> >  }
> >  
> >  /*
> > @@ -193,7 +188,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
> >  	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
> >  	struct fsl_ifc_nand_ctrl *nctrl = ifc_nand_ctrl;
> >  	struct fsl_ifc_runtime __iomem *ifc = ctrl->rregs;
> > -	u32 eccstat[4];
> > +	u32 eccstat;
> >  	int i;
> >  
> >  	/* set the chip select for NAND Transaction */
> > @@ -228,8 +223,8 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
> >  	if (nctrl->eccread) {
> >  		int errors;
> >  		int bufnum = nctrl->page & priv->bufnum_mask;
> > -		int sector = bufnum * chip->ecc.steps;
> > -		int sector_end = sector + chip->ecc.steps - 1;
> > +		int sector_start = bufnum * chip->ecc.steps;
> > +		int sector_end = sector_start + chip->ecc.steps - 1;
> >  		__be32 *eccstat_regs;
> >  
> >  		if (ctrl->version >= FSL_IFC_VERSION_2_0_0)
> > @@ -237,10 +232,12 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
> >  		else
> >  			eccstat_regs = ifc->ifc_nand.v1_nand_eccstat;
> >  
> > -		for (i = sector / 4; i <= sector_end / 4; i++)
> > -			eccstat[i] = ifc_in32(&eccstat_regs[i]);
> > +		eccstat = ifc_in32(&eccstat_regs[sector_start / 4]);
> > +
> > +		for (i = sector_start; i <= sector_end; i++) {
> > +			if (!(i % 4))
> > +				eccstat = ifc_in32(&eccstat_regs[i / 4]);  
> 
> So now you're reading eccstat_regs[sector_start / 4] twice if
> sector_start is aligned on 4. Why don't you want the test I proposed
> in my last review?
> 
> 			if (i != sector_start && !(i % 4))
>

Applied with this adjustment.

Thanks,

Boris
 
> >  
> > -		for (i = sector; i <= sector_end; i++) {
> >  			errors = check_read_ecc(mtd, ctrl, eccstat, i);
> >  
> >  			if (errors == 15) {  
> 
> 
> 



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

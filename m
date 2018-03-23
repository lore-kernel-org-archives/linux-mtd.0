Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezHSP-0001r4-5a
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 07:50:15 +0000
Date: Fri, 23 Mar 2018 08:49:32 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jagdish Gediya <jagdish.gediya@nxp.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "oss@buserror.net" <oss@buserror.net>, Leo Li <leoyang.li@nxp.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: Re: [PATCH][v5] mtd: rawnand: fsl_ifc: Fix eccstat array overflow
 for IFC ver >= 2.0.0
Message-ID: <20180323084932.67848138@bbrezillon>
In-Reply-To: <HE1PR0402MB27787356BB94AB5D0C69153C90A80@HE1PR0402MB2778.eurprd04.prod.outlook.com>
References: <1521669973-10450-1-git-send-email-jagdish.gediya@nxp.com>
 <HE1PR0402MB27787356BB94AB5D0C69153C90A80@HE1PR0402MB2778.eurprd04.prod.outlook.com>
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

On Fri, 23 Mar 2018 05:04:15 +0000
Jagdish Gediya <jagdish.gediya@nxp.com> wrote:

> Hi Boris,
> 
> > -----Original Message-----
> > From: Jagdish Gediya
> > Sent: Thursday, March 22, 2018 3:36 AM
> > To: linux-mtd@lists.infradead.org
> > Cc: boris.brezillon@free-electrons.com; computersforpeace@gmail.com;
> > oss@buserror.net; Leo Li <leoyang.li@nxp.com>; Jagdish Gediya
> > <jagdish.gediya@nxp.com>; stable@vger.kernel.org; Prabhakar Kushwaha
> > <prabhakar.kushwaha@nxp.com>
> > Subject: [PATCH][v5] mtd: rawnand: fsl_ifc: Fix eccstat array overflow for IFC
> > ver >= 2.0.0
> > 
> > Number of ECC status registers i.e. (ECCSTATx) has been increased in IFC
> > version 2.0.0 due to increase in SRAM size. This is causing eccstat array to over
> > flow.
> > 
> > So, replace eccstat array with u32 variable to make it fail-safe and independent
> > of number of ECC status registers or SRAM size.
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
> > Changes for v5: Incorporated comments from Boris Brezillon  
> 
> I am seeing this patch[v5]'s state as superseded @ https://patchwork.ozlabs.org/project/linux-mtd/list/?series=&submitter=73665&state=9&q=&archive=&delegate= , May I know the reason?

Because I applied v4 (+ the modification I suggested) before you sent
v5.

I just pushed the mtd/fixes branch [1] and I'm planning to send a fixes
PR to Linus later today.

Regards,

Boris

[1]http://git.infradead.org/linux-mtd.git/shortlog/refs/heads/master

> > 
> >  drivers/mtd/nand/fsl_ifc_nand.c | 23 ++++++++++-------------
> >  1 file changed, 10 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> > index 4872a7b..f0b4ecd 100644
> > --- a/drivers/mtd/nand/fsl_ifc_nand.c
> > +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> > @@ -173,14 +173,9 @@ static void set_addr(struct mtd_info *mtd, int
> > column, int page_addr, int oob)
> > 
> >  /* returns nonzero if entire page is blank */  static int check_read_ecc(struct
> > mtd_info *mtd, struct fsl_ifc_ctrl *ctrl,
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
> > @@ -193,7 +188,7 @@ static void fsl_ifc_run_command(struct mtd_info
> > *mtd)
> >  	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
> >  	struct fsl_ifc_nand_ctrl *nctrl = ifc_nand_ctrl;
> >  	struct fsl_ifc_runtime __iomem *ifc = ctrl->rregs;
> > -	u32 eccstat[4];
> > +	u32 eccstat;
> >  	int i;
> > 
> >  	/* set the chip select for NAND Transaction */ @@ -228,8 +223,8 @@
> > static void fsl_ifc_run_command(struct mtd_info *mtd)
> >  	if (nctrl->eccread) {
> >  		int errors;
> >  		int bufnum = nctrl->page & priv->bufnum_mask;
> > -		int sector = bufnum * chip->ecc.steps;
> > -		int sector_end = sector + chip->ecc.steps - 1;
> > +		int sector_start = bufnum * chip->ecc.steps;
> > +		int sector_end = sector_start + chip->ecc.steps - 1;
> >  		__be32 *eccstat_regs;
> > 
> >  		if (ctrl->version >= FSL_IFC_VERSION_2_0_0) @@ -237,10
> > +232,12 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
> >  		else
> >  			eccstat_regs = ifc->ifc_nand.v1_nand_eccstat;
> > 
> > -		for (i = sector / 4; i <= sector_end / 4; i++)
> > -			eccstat[i] = ifc_in32(&eccstat_regs[i]);
> > +		eccstat = ifc_in32(&eccstat_regs[sector_start / 4]);
> > +
> > +		for (i = sector_start; i <= sector_end; i++) {
> > +			if ((i != sector_start) && !(i % 4))
> > +				eccstat = ifc_in32(&eccstat_regs[i / 4]);
> > 
> > -		for (i = sector; i <= sector_end; i++) {
> >  			errors = check_read_ecc(mtd, ctrl, eccstat, i);
> > 
> >  			if (errors == 15) {
> > --
> > 1.9.1  
> 
> Thanks,
> Jagdish



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

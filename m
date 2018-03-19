Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exseF-0002Iy-6C
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 11:08:17 +0000
Date: Mon, 19 Mar 2018 12:07:52 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jagdish Gediya <jagdish.gediya@nxp.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, oss@buserror.net, leoyang.li@nxp.com,
 stable@vger.kernel.org, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: Re: [PATCH][v2] mtd: rawnand: fsl_ifc: Fix eccstat array overflow
 for IFC ver >= 2.0.0
Message-ID: <20180319120752.3d503e2e@bbrezillon>
In-Reply-To: <1521495578-14860-1-git-send-email-jagdish.gediya@nxp.com>
References: <1521495578-14860-1-git-send-email-jagdish.gediya@nxp.com>
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

Hi Jagdish,

On Tue, 20 Mar 2018 03:09:38 +0530
Jagdish Gediya <jagdish.gediya@nxp.com> wrote:

> Number of ECC status registers i.e. (ECCSTATx) has been increased in IFC
> version 2.0.0 due to increase in SRAM size. This is causing eccstat
> array to over flow.
> 
> So, replace eccstat array with u32 variable to make it fail-safe and
> independent of number of ECC status registers or SRAM size.
> 
> Cc: stable@vger.kernel.org

Can you add a Fixes tag here?

> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
> ---
> Changes for v2: Incorporated comments from Miquel Raynal and Boris Brezillon 
> 	- Updated patch subject
> 	- Remove usage of eccstat array
> 	- Added Cc: stable@vger.kernel.org 
> 
>  drivers/mtd/nand/fsl_ifc_nand.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index 4872a7b..d9ce398 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -173,14 +173,9 @@ static void set_addr(struct mtd_info *mtd, int column, int page_addr, int oob)
>  
>  /* returns nonzero if entire page is blank */
>  static int check_read_ecc(struct mtd_info *mtd, struct fsl_ifc_ctrl *ctrl,
> -			  u32 *eccstat, unsigned int bufnum)
> +			  u32 eccstat, unsigned int bufnum)
>  {
> -	u32 reg = eccstat[bufnum / 4];
> -	int errors;
> -
> -	errors = (reg >> ((3 - bufnum % 4) * 8)) & 15;
> -
> -	return errors;
> +	return  (eccstat >> ((3 - bufnum % 4) * 8)) & 15;
>  }
>  
>  /*
> @@ -193,7 +188,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
>  	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
>  	struct fsl_ifc_nand_ctrl *nctrl = ifc_nand_ctrl;
>  	struct fsl_ifc_runtime __iomem *ifc = ctrl->rregs;
> -	u32 eccstat[4];
> +	u32 eccstat;
>  	int i;
>  
>  	/* set the chip select for NAND Transaction */
> @@ -237,10 +232,18 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
>  		else
>  			eccstat_regs = ifc->ifc_nand.v1_nand_eccstat;
>  
> -		for (i = sector / 4; i <= sector_end / 4; i++)
> -			eccstat[i] = ifc_in32(&eccstat_regs[i]);
> +		eccstat = 0;
>  
>  		for (i = sector; i <= sector_end; i++) {
> +
> +			/*
> +			 * if page size and sector size both are 512B then
> +			 * sector may not be multiple of 4 but sector and
> +			 * sector_end will be same.
> +			 */

I don't understand this comment.

> +			if ((i % 4 == 0) || (sector == sector_end))

How about:

			/*
			 * sector is not necessarily aligned on 4 and
			 * we need to read the eccstat in this case,
			 * hence the i == sector test.
			 */
			if (i == sector || !(i % 4))

> +				eccstat = ifc_in32(&eccstat_regs[i / 4]);
> +
>  			errors = check_read_ecc(mtd, ctrl, eccstat, i);
>  
>  			if (errors == 15) {

Regards,

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exseZ-0002Og-OQ
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 11:08:42 +0000
Date: Mon, 19 Mar 2018 12:08:13 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jagdish Gediya <jagdish.gediya@nxp.com>
Cc: linux-mtd@lists.infradead.org, oss@buserror.net,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 leoyang.li@nxp.com, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fsl_ifc: Fix nand waitfunc return value
Message-ID: <20180319120813.27819c38@bbrezillon>
In-Reply-To: <1521497112-31770-1-git-send-email-jagdish.gediya@nxp.com>
References: <1521497112-31770-1-git-send-email-jagdish.gediya@nxp.com>
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

On Tue, 20 Mar 2018 03:35:12 +0530
Jagdish Gediya <jagdish.gediya@nxp.com> wrote:

> As per the IFC hardware manual, Most significant 2 bytes in
> nand_fsr register are the outcome of NAND READ STATUS command.
> 
> So status value need to be shifted and aligned as per the nand
> framework requirement.
> 
> Cc: stable@vger.kernel.org

Fixes tag please.

> Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
> Reviewed-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  drivers/mtd/nand/fsl_ifc_nand.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index d9ce398..951dd89 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -643,12 +643,13 @@ static int fsl_ifc_wait(struct mtd_info *mtd, struct nand_chip *chip)
>  	fsl_ifc_run_command(mtd);
>  
>  	nand_fsr = ifc_in32(&ifc->ifc_nand.nand_fsr);
> -
> +	nand_fsr >>= 16;
> +	nand_fsr = (nand_fsr >> 8) | (nand_fsr << 8);
>  	/*
>  	 * The chip always seems to report that it is
>  	 * write-protected, even when it is not.
>  	 */
> -	return nand_fsr | NAND_STATUS_WP;
> +	return (nand_fsr & 0xff) | NAND_STATUS_WP;
>  }
>  
>  /*



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

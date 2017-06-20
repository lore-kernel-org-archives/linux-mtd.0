Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dNDSc-0002fy-2e
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 07:20:27 +0000
Date: Tue, 20 Jun 2017 09:19:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: <linux-mtd@lists.infradead.org>, oss@buserror.net,
 computersforpeace@gmail.com, dedekind1@gmail.com
Subject: Re: [PATCH] driver: mtd: ifc: Initialize SRAM for all version >= 1.0
Message-ID: <20170620091952.5cadf878@bbrezillon>
In-Reply-To: <1497005841-7750-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1497005841-7750-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

Hi Prabhakar,

Please Cc me next time you submit a NAND related change.

On Fri, 9 Jun 2017 16:27:21 +0530
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> All IFC version >= 1.0 use 28nm technology for SRAM. Here SRAM has
> a requirement to initialize before any read operation performed for
> avoiding ECC Error.
> 
> So update condition check to initialize SRAM for all IFC version >= 1.0.0

Applied after changing the subject prefix to "mtd: nand: ifc".

Thanks,

Boris

> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  drivers/mtd/nand/fsl_ifc_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index d1570f5..eca269d 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -904,7 +904,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
>  		chip->ecc.algo = NAND_ECC_HAMMING;
>  	}
>  
> -	if (ctrl->version == FSL_IFC_VERSION_1_1_0)
> +	if (ctrl->version >= FSL_IFC_VERSION_1_1_0)
>  		fsl_ifc_sram_init(priv);
>  
>  	return 0;

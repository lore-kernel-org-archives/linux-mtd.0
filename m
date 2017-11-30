Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKWX7-0004oR-Hx
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 21:38:15 +0000
Date: Thu, 30 Nov 2017 22:37:51 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: <linux-mtd@lists.infradead.org>, oss@buserror.net,
 computersforpeace@gmail.com, Jagdish Gediya <jagdish.gediya@nxp.com>,
 dedekind1@gmail.com
Subject: Re: [PATCH][v2] mtd: nand: ifc: update bufnum mask for ver >= 2.0.0
Message-ID: <20171130223751.78f586bd@bbrezillon>
In-Reply-To: <1511436871-15346-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1511436871-15346-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

On Thu, 23 Nov 2017 17:04:31 +0530
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> From: Jagdish Gediya <jagdish.gediya@nxp.com>
> 
> Bufnum mask is used to calculate page position in the internal SRAM.
> 
> As IFC version 2.0.0 has 16KB of internal SRAM as compared to older
> versions which had 8KB. Hence bufnum mask needs to be updated.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
> Changes for v2: Incorporated review comments from Boris Brezillon
> http://patchwork.ozlabs.org/patch/773799/
> 
>  drivers/mtd/nand/fsl_ifc_nand.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index 9e03bac..bbdd68a5 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -916,6 +916,13 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
>  	if (ctrl->version >= FSL_IFC_VERSION_1_1_0)
>  		fsl_ifc_sram_init(priv);
>  
> +	/*
> +	 * As IFC version 2.0.0 has 16KB of internal SRAM as compared to older
> +	 * versions which had 8KB. Hence bufnum mask needs to be updated.
> +	 */
> +	if (ctrl->version >= FSL_IFC_VERSION_2_0_0)
> +		priv->bufnum_mask = (priv->bufnum_mask * 2) + 1;
> +
>  	return 0;
>  }
>  

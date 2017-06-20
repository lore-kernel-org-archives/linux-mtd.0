Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dNDUE-0004Hw-VI
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 07:22:09 +0000
Date: Tue, 20 Jun 2017 09:21:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: <linux-mtd@lists.infradead.org>, oss@buserror.net,
 computersforpeace@gmail.com, dedekind1@gmail.com
Subject: Re: [PATCH] driver: mtd: ifc: update bufnum mask for ver >= 2.0.0
Message-ID: <20170620092135.1a584928@bbrezillon>
In-Reply-To: <1497005857-7796-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1497005857-7796-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

Hi,

Subject prefix should be "mtd: nand: ifc".

On Fri, 9 Jun 2017 16:27:37 +0530
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> Bufnum mask is used to calculate page position in the internal SRAM.
> 
> As IFC version 2.0.0 has 16KB of internal SRAM as compared to older
> versions which had 8KB. Hence bufnum mask needs to be updated.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  drivers/mtd/nand/fsl_ifc_nand.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index eca269d..785e9ee 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -907,6 +907,9 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
>  	if (ctrl->version >= FSL_IFC_VERSION_1_1_0)
>  		fsl_ifc_sram_init(priv);
>  

Can you add a comment explaining why this is done (just put the content
of the commit message here).

> +	if (ctrl->version >= FSL_IFC_VERSION_2_0_0)
> +		priv->bufnum_mask = (priv->bufnum_mask * 2) + 1;
> +
>  	return 0;
>  }
>  

Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fD5cB-0004WU-Rq
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2018 10:01:06 +0000
Date: Mon, 30 Apr 2018 12:00:46 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jane Wan <Jane.Wan@nokia.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, ties.bos@nokia.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Fix FSL NAND driver to read all ONFI parameter pages
Message-ID: <20180430120046.3c87db2a@bbrezillon>
In-Reply-To: <1524788396-32380-2-git-send-email-Jane.Wan@nokia.com>
References: <1524788396-32380-1-git-send-email-Jane.Wan@nokia.com>
 <1524788396-32380-2-git-send-email-Jane.Wan@nokia.com>
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

Hi Jane,

On Thu, 26 Apr 2018 17:19:55 -0700
Jane Wan <Jane.Wan@nokia.com> wrote:

> Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
> ---
>  drivers/mtd/nand/fsl_ifc_nand.c |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index ca36b35..a3cf6ca 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -413,6 +413,7 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
>  	struct fsl_ifc_mtd *priv = chip->priv;
>  	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
>  	struct fsl_ifc_runtime __iomem *ifc = ctrl->rregs;
> +	int len;
>  
>  	/* clear the read buffer */
>  	ifc_nand_ctrl->read_bytes = 0;
> @@ -462,11 +463,12 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
>  		ifc_out32(column, &ifc->ifc_nand.row3);
>  
>  		/*
> -		 * although currently it's 8 bytes for READID, we always read
> -		 * the maximum 256 bytes(for PARAM)
> +		 * For READID, read 8 bytes that are currently used.
> +		 * For PARAM, read all 3 copies of 256-bytes pages.
>  		 */
> -		ifc_out32(256, &ifc->ifc_nand.nand_fbcr);
> -		ifc_nand_ctrl->read_bytes = 256;
> +		len = (command == NAND_CMD_PARAM) ? (3 * 256) : 8;
> +		ifc_out32(len, &ifc->ifc_nand.nand_fbcr);
> +		ifc_nand_ctrl->read_bytes = len;

This driver really calls for a clean rework to transition to
->exec_op(). Guessing the amount of data to be read from ->cmdfunc() is
broken and your patch series just shows how broken this is. What next?
What if some NANDs have 4 or more copies of the param page?

I'm still undecided whether I want to apply this patch. I guess having
some guarantees that someone will actually work on implementing
->exec_op() in a near future would help me take this decision.

Regards,

Boris

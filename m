Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eY7pO-0001TE-HS
 for linux-mtd@lists.infradead.org; Sun, 07 Jan 2018 10:05:20 +0000
Date: Sun, 7 Jan 2018 11:04:59 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, architt@codeaurora.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH 1/2] mtd: qcom_nandc: Add a NULL check for devm_kasprintf()
Message-ID: <20180107110459.01beed46@bbrezillon>
In-Reply-To: <1515182576-2704-1-git-send-email-festevam@gmail.com>
References: <1515182576-2704-1-git-send-email-festevam@gmail.com>
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

On Fri,  5 Jan 2018 18:02:55 -0200
Fabio Estevam <festevam@gmail.com> wrote:

> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> devm_kasprintf() may fail, so we should better add a NULL check
> and propagate an error on failure.

Applied (also fixed the subject prefix).

Thanks,

Boris

> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 245d0f3..3fe2ff8 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -2639,6 +2639,8 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
>  
>  	nand_set_flash_node(chip, dn);
>  	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "qcom_nand.%d", host->cs);
> +	if (!mtd->name)
> +		return -ENOMEM;
>  	mtd->owner = THIS_MODULE;
>  	mtd->dev.parent = dev;
>  

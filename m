Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZOUK-0004Ix-Og
 for linux-mtd@lists.infradead.org; Wed, 10 Jan 2018 22:04:50 +0000
Date: Wed, 10 Jan 2018 23:04:26 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <han.xu@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, Fabio Estevam
 <fabio.estevam@nxp.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand: gpmi: Release DMA channels on failure
Message-ID: <20180110230426.59e9f001@bbrezillon>
In-Reply-To: <VI1PR0401MB2221AF8D517BDDC52F5B550497110@VI1PR0401MB2221.eurprd04.prod.outlook.com>
References: <1514484420-19344-1-git-send-email-festevam@gmail.com>
 <VI1PR0401MB2221AF8D517BDDC52F5B550497110@VI1PR0401MB2221.eurprd04.prod.outlook.com>
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

Hi Han,

On Wed, 10 Jan 2018 21:50:41 +0000
Han Xu <han.xu@nxp.com> wrote:

> ________________________________________
> From: Fabio Estevam <festevam@gmail.com>
> Sent: Thursday, December 28, 2017 12:07 PM
> To: boris.brezillon@free-electrons.com
> Cc: Han Xu; linux-mtd@lists.infradead.org; Fabio Estevam
> Subject: [PATCH] mtd: nand: gpmi: Release DMA channels on failure
> 
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> release_dma_channels() should be called in the case of error in
> gpmi_init() or bch_set_geometry(), because acquire_dma_channels() has
> been called previously.
> 
> Handle the error cases correctly.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 2ef8979..acfa5f5 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -2137,20 +2137,25 @@ static int gpmi_pm_resume(struct device *dev)
>         ret = gpmi_init(this);
>         if (ret) {
>                 dev_err(this->dev, "Error setting GPMI : %d\n", ret);
> -               return ret;
> +               goto release_dma_channels;
>         }
> 
>         /* re-init the BCH registers */
>         ret = bch_set_geometry(this);
>         if (ret) {
>                 dev_err(this->dev, "Error setting BCH : %d\n", ret);
> -               return ret;
> +               goto release_dma_channels;
>         }
> 
>         /* re-init others */
>         gpmi_extra_init(this);
> 
>         return 0;
> +
> +release_dma_channels:
> +       release_dma_channels(this);
> +       return ret;
> +
>  }
>  #endif /* CONFIG_PM_SLEEP */
> 
> Acked-by: Han Xu <han.xu@nxp.com>

Did you read my comment on v2 of this patch?

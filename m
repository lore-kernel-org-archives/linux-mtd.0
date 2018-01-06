Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eXlK2-0004DP-Eh
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 10:03:28 +0000
Date: Sat, 6 Jan 2018 11:03:04 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, han.xu@nxp.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: nand: gpmi: Release DMA channels on failure
Message-ID: <20180106110304.6bf8df65@bbrezillon>
In-Reply-To: <1514485078-19762-1-git-send-email-festevam@gmail.com>
References: <1514485078-19762-1-git-send-email-festevam@gmail.com>
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

On Thu, 28 Dec 2017 16:17:58 -0200
Fabio Estevam <festevam@gmail.com> wrote:

> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> release_dma_channels() should be called in the case of error in
> gpmi_init() or bch_set_geometry(), because acquire_dma_channels() has
> been called previously.

I'm really not sure this is a good idea. According to [1], the error
code returned by PM hooks is not taken into account, and the device
will be considered as functional by the system even if
->suspend() returns an error. This means, next time we enter suspend,
gpmi_pm_suspend() will be called which will lead to an unbalanced
release_dma_channels()/acquire_dma_channels().

> 
> Handle the error cases correctly.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v1:
> - Remove extra blank line
> 
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 2ef8979..db0d924 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -2137,20 +2137,24 @@ static int gpmi_pm_resume(struct device *dev)
>  	ret = gpmi_init(this);
>  	if (ret) {
>  		dev_err(this->dev, "Error setting GPMI : %d\n", ret);
> -		return ret;
> +		goto release_dma_channels;
>  	}
>  
>  	/* re-init the BCH registers */
>  	ret = bch_set_geometry(this);
>  	if (ret) {
>  		dev_err(this->dev, "Error setting BCH : %d\n", ret);
> -		return ret;
> +		goto release_dma_channels;
>  	}
>  
>  	/* re-init others */
>  	gpmi_extra_init(this);
>  
>  	return 0;
> +
> +release_dma_channels:
> +	release_dma_channels(this);
> +	return ret;
>  }
>  #endif /* CONFIG_PM_SLEEP */
>  

[1]https://elixir.free-electrons.com/linux/v4.15-rc6/source/include/linux/pm.h#L262

Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYI6A-0004at-HO
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2018 21:35:36 +0000
Date: Wed, 27 Jun 2018 23:35:12 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: David Woodhouse <dwmw2@infradead.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: rawnand: mxc: remove __init qualifier from
 mxcnd_probe_dt
Message-ID: <20180627233512.44e820fe@bbrezillon>
In-Reply-To: <1530132464-8210-1-git-send-email-martin@kaiser.cx>
References: <1529679025-5735-1-git-send-email-martin@kaiser.cx>
 <1530132464-8210-1-git-send-email-martin@kaiser.cx>
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

On Wed, 27 Jun 2018 22:47:44 +0200
Martin Kaiser <martin@kaiser.cx> wrote:

> Using the sysfs unbind, bind nodes, mxcnd_probe and mxcnd_probe_dt can
> potentially be called at any time. After the __init functions are cleaned,
> mxcnd_probe_dt is no longer available. Calling it anyway causes a crash.
> 
> mxcnd_probe used to be marked as __init, this was removed years ago.
> Remove the __init qualifier from from mxcnd_probe_dt as well.
> 
> Fixes: 06f255106923 ("mtd: remove use of __devinit")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
> changes in v3
>    - show the first 12 characters of the SHA-1 ID in the Fixes: tag
> 
> changes in v2
>    - rephrased the commit message
>    - added a Fixes: tag
> 
>  drivers/mtd/nand/raw/mxc_nand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
> index 26cef218bb43..90cfb5e730aa 100644
> --- a/drivers/mtd/nand/raw/mxc_nand.c
> +++ b/drivers/mtd/nand/raw/mxc_nand.c
> @@ -1686,7 +1686,7 @@ static const struct of_device_id mxcnd_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mxcnd_dt_ids);
>  
> -static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
> +static int mxcnd_probe_dt(struct mxc_nand_host *host)
>  {
>  	struct device_node *np = host->dev->of_node;
>  	const struct of_device_id *of_id =
> @@ -1700,7 +1700,7 @@ static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
>  	return 0;
>  }
>  #else
> -static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
> +static int mxcnd_probe_dt(struct mxc_nand_host *host)
>  {
>  	return 1;
>  }

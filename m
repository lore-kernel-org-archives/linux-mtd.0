Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbgqA-0002LS-VK
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 06:37:08 +0000
Date: Sat, 7 Jul 2018 08:36:55 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Cc: miquel.raynal@bootlin.com, robert.jarzmik@free.fr, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 3/3] mtd: rawnand: marvell: set reg_clk to NULL if it
 can't be obtained
Message-ID: <20180707083655.2aa7aff6@bbrezillon>
In-Reply-To: <20180707062852.26261-3-daniel@zonque.org>
References: <20180707062852.26261-1-daniel@zonque.org>
 <20180707062852.26261-3-daniel@zonque.org>
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

On Sat,  7 Jul 2018 08:28:52 +0200
Daniel Mack <daniel@zonque.org> wrote:

> Don't keep an error-pointer around in the private struct. If this optional
> clock can't be obtained, simply set the pointer to NULL instead so we can
> use clk_prepare_enable() on it without further checks,
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index e72070fe8af9..9246c3ea6ebc 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -2752,15 +2752,19 @@ static int marvell_nfc_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	nfc->reg_clk = devm_clk_get(&pdev->dev, "reg");
> -	if (PTR_ERR(nfc->reg_clk) != -ENOENT) {
> -		if (!IS_ERR(nfc->reg_clk)) {
> -			ret = clk_prepare_enable(nfc->reg_clk);
> -			if (ret)
> -				goto unprepare_core_clk;
> -		} else {
> +	if (IS_ERR(nfc->reg_clk)) {
> +		if (PTR_ERR(nfc->reg_clk) != -ENOENT) {
>  			ret = PTR_ERR(nfc->reg_clk);
>  			goto unprepare_core_clk;
>  		}
> +
> +		nfc->reg_clk = NULL;
> +	}
> +
> +	if (nfc->reg_clk) {
> +		ret = clk_prepare_enable(nfc->reg_clk);
> +		if (ret)
> +			goto unprepare_core_clk;

No need to check nfc->reg_clk value here:

	ret = clk_prepare_enable(nfc->reg_clk);
	if (ret)
		goto unprepare_core_clk;


>  	}
>  
>  	marvell_nfc_disable_int(nfc, NDCR_ALL_INT);
> @@ -2843,11 +2847,9 @@ static int __maybe_unused marvell_nfc_resume(struct device *dev)
>  	if (ret < 0)
>  		return ret;
>  
> -	if (!IS_ERR(nfc->reg_clk)) {
> -		ret = clk_prepare_enable(nfc->reg_clk);
> -		if (ret < 0)
> -			return ret;
> -	}
> +	ret = clk_prepare_enable(nfc->reg_clk);
> +	if (ret < 0)
> +		return ret;
>  
>  	/*
>  	 * Reset nfc->selected_chip so the next command will cause the timing

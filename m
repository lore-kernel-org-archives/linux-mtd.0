Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1coRBy-0005UT-Qk
 for linux-mtd@lists.infradead.org; Thu, 16 Mar 2017 08:55:33 +0000
Date: Thu, 16 Mar 2017 09:55:09 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/14] mtd: nand: sunxi: simplify optional reset
 handling
Message-ID: <20170316095509.5e8ec986@bbrezillon>
In-Reply-To: <20170315113147.28366-1-p.zabel@pengutronix.de>
References: <20170315113147.28366-1-p.zabel@pengutronix.de>
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

On Wed, 15 Mar 2017 12:31:47 +0100
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> As of commit bb475230b8e5 ("reset: make optional functions really
> optional"), the reset framework API calls use NULL pointers to describe
> optional, non-present reset controls.
> 
> This allows to return errors from devm_reset_control_get_optional and to
> call reset_control_(de)assert unconditionally.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/nand/sunxi_nand.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index 0eeeb8b889ea8..9afc182cbd4e8 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -2212,16 +2212,15 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>  		goto out_ahb_clk_unprepare;
>  
>  	nfc->reset = devm_reset_control_get_optional(dev, "ahb");
> -	if (!IS_ERR(nfc->reset)) {
> -		ret = reset_control_deassert(nfc->reset);
> -		if (ret) {
> -			dev_err(dev, "reset err %d\n", ret);
> -			goto out_mod_clk_unprepare;
> -		}
> -	} else if (PTR_ERR(nfc->reset) != -ENOENT) {
> +	if (IS_ERR(nfc->reset)) {
>  		ret = PTR_ERR(nfc->reset);
>  		goto out_mod_clk_unprepare;
>  	}
> +	ret = reset_control_deassert(nfc->reset);
> +	if (ret) {
> +		dev_err(dev, "reset err %d\n", ret);
> +		goto out_mod_clk_unprepare;
> +	}
>  
>  	ret = sunxi_nfc_rst(nfc);
>  	if (ret)
> @@ -2262,8 +2261,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>  	if (nfc->dmac)
>  		dma_release_channel(nfc->dmac);
>  out_ahb_reset_reassert:
> -	if (!IS_ERR(nfc->reset))
> -		reset_control_assert(nfc->reset);
> +	reset_control_assert(nfc->reset);
>  out_mod_clk_unprepare:
>  	clk_disable_unprepare(nfc->mod_clk);
>  out_ahb_clk_unprepare:
> @@ -2278,8 +2276,7 @@ static int sunxi_nfc_remove(struct platform_device *pdev)
>  
>  	sunxi_nand_chips_cleanup(nfc);
>  
> -	if (!IS_ERR(nfc->reset))
> -		reset_control_assert(nfc->reset);
> +	reset_control_assert(nfc->reset);
>  
>  	if (nfc->dmac)
>  		dma_release_channel(nfc->dmac);

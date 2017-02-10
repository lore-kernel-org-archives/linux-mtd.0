Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccCs4-0003Nt-DQ
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 15:12:27 +0000
Received: by mail-wr0-x244.google.com with SMTP id i10so15452596wrb.0
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2017 07:12:03 -0800 (PST)
Subject: Re: [PATCH] mtd: nand: gpio: make nCE GPIO optional
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170210140110.87903682E7@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d506cb49-5145-a529-2ce9-fd71ed7f715b@gmail.com>
Date: Fri, 10 Feb 2017 16:12:01 +0100
MIME-Version: 1.0
In-Reply-To: <20170210140110.87903682E7@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/10/2017 03:01 PM, Christophe Leroy wrote:
> On some hardware,

Can you be more specific or is that confidential ? Anyway, that's just
my curiosity, what hardware is done like that.

> the nCE signal is wired to the ChipSelect associated
> to bus address of the NAND, so it is automatically driven during the
> memory access and it is not managed by a GPIO.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

but please wait for the NAND experts ...

> ---
>  drivers/mtd/nand/gpio.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
> index 0d24857..85294f1 100644
> --- a/drivers/mtd/nand/gpio.c
> +++ b/drivers/mtd/nand/gpio.c
> @@ -78,7 +78,9 @@ static void gpio_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>  	gpio_nand_dosync(gpiomtd);
>  
>  	if (ctrl & NAND_CTRL_CHANGE) {
> -		gpio_set_value(gpiomtd->plat.gpio_nce, !(ctrl & NAND_NCE));
> +		if (gpio_is_valid(gpiomtd->plat.gpio_nce))
> +			gpio_set_value(gpiomtd->plat.gpio_nce,
> +				       !(ctrl & NAND_NCE));
>  		gpio_set_value(gpiomtd->plat.gpio_cle, !!(ctrl & NAND_CLE));
>  		gpio_set_value(gpiomtd->plat.gpio_ale, !!(ctrl & NAND_ALE));
>  		gpio_nand_dosync(gpiomtd);
> @@ -201,7 +203,8 @@ static int gpio_nand_remove(struct platform_device *pdev)
>  
>  	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
>  		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
> -	gpio_set_value(gpiomtd->plat.gpio_nce, 1);
> +	if (gpio_is_valid(gpiomtd->plat.gpio_nce))
> +		gpio_set_value(gpiomtd->plat.gpio_nce, 1);
>  
>  	return 0;
>  }
> @@ -239,10 +242,13 @@ static int gpio_nand_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
> -	if (ret)
> -		return ret;
> -	gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
> +	if (gpio_is_valid(gpiomtd->plat.gpio_nce)) {
> +		ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce,
> +					"NAND NCE");
> +		if (ret)
> +			return ret;
> +		gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
> +	}
>  
>  	if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
>  		ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nwp,
> 


-- 
Best regards,
Marek Vasut

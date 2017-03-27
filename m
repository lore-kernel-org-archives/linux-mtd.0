Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csZFa-00021q-SC
 for linux-mtd@lists.infradead.org; Mon, 27 Mar 2017 18:20:20 +0000
Date: Mon, 27 Mar 2017 20:19:49 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Simon Baatz <gmbnomis@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 jason@lakedaemon.net, andrew@lunn.ch, dan.carpenter@oracle.com
Subject: Re: [PATCH v2 1/2] mtd: nand: orion: fix clk handling
Message-ID: <20170327181949.isafnqsnxkzed5nv@pengutronix.de>
References: <20170327180208.13414-1-gmbnomis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170327180208.13414-1-gmbnomis@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

> @@ -145,15 +151,13 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  	if (board->dev_ready)
>  		nc->dev_ready = board->dev_ready;
>  
> -	platform_set_drvdata(pdev, mtd);
> +	platform_set_drvdata(pdev, info);
>  
>  	/* Not all platforms can gate the clock, so it is not
>  	   an error if the clock does not exists. */
> -	clk = clk_get(&pdev->dev, NULL);
> -	if (!IS_ERR(clk)) {
> -		clk_prepare_enable(clk);
> -		clk_put(clk);
> -	}
> +	info->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (!IS_ERR(info->clk))
> +		clk_prepare_enable(info->clk);

you could to the following here instead:

	info->clk = devm_clk_get(&pdev->dev, NULL);
	if (IS_ERR(info->clk))
		/*
		 * We ignore all errors here, that's wrong but only for
		 * one commit.
		 */
		info->clk = NULL;

	ret = clk_prepare_enable(info->clk);
	if (ret) ...

>  	ret = nand_scan(mtd, 1);
>  	if (ret)
> @@ -169,26 +173,22 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  	return 0;
>  
>  no_dev:
> -	if (!IS_ERR(clk)) {
> -		clk_disable_unprepare(clk);
> -		clk_put(clk);
> -	}
> +	if (!IS_ERR(info->clk))
> +		clk_disable_unprepare(info->clk);

this simplifies to

	clk_disable_unprepare(info->clk);

then.

>  
>  	return ret;
>  }
>  
>  static int orion_nand_remove(struct platform_device *pdev)
>  {
> -	struct mtd_info *mtd = platform_get_drvdata(pdev);
> -	struct clk *clk;
> +	struct orion_nand_info *info = platform_get_drvdata(pdev);
> +	struct nand_chip *chip = &info->chip;
> +	struct mtd_info *mtd = nand_to_mtd(chip);
>  
>  	nand_release(mtd);
>  
> -	clk = clk_get(&pdev->dev, NULL);
> -	if (!IS_ERR(clk)) {
> -		clk_disable_unprepare(clk);
> -		clk_put(clk);
> -	}
> +	if (!IS_ERR(info->clk))
> +		clk_disable_unprepare(info->clk);

ditto.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

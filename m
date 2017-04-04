Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvKkR-00076R-6E
 for linux-mtd@lists.infradead.org; Tue, 04 Apr 2017 09:27:36 +0000
Received: by mail-wr0-x243.google.com with SMTP id w43so40460469wrb.1
 for <linux-mtd@lists.infradead.org>; Tue, 04 Apr 2017 02:27:13 -0700 (PDT)
Subject: Re: [patch] mtd: nand: Fix a couple error codes
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Wenyou Yang <wenyou.yang@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20170404081545.GA25533@mwanda>
Cc: Josh Wu <rainyfeeling@outlook.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <88d42f4b-e5fd-f2b2-c1e3-8d77b18e93d8@gmail.com>
Date: Tue, 4 Apr 2017 11:27:02 +0200
MIME-Version: 1.0
In-Reply-To: <20170404081545.GA25533@mwanda>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/04/2017 10:15 AM, Dan Carpenter wrote:
> We accidentally return 1 on error instead of proper error codes.
> 
> Fixes: 07b23e3db9ed ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Nice, thanks!

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> 
> diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
> index 27301603f394..b8d17a024dbd 100644
> --- a/drivers/mtd/nand/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/atmel/nand-controller.c
> @@ -1686,7 +1686,7 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
>  	nc->smc = syscon_node_to_regmap(np);
>  	of_node_put(np);
>  	if (IS_ERR(nc->smc)) {
> -		ret = IS_ERR(nc->smc);
> +		ret = PTR_ERR(nc->smc);
>  		dev_err(dev, "Could not get SMC regmap (err = %d)\n", ret);
>  		return ret;
>  	}
> @@ -1719,7 +1719,7 @@ atmel_smc_nand_controller_init(struct atmel_smc_nand_controller *nc)
>  	nc->matrix = syscon_node_to_regmap(np);
>  	of_node_put(np);
>  	if (IS_ERR(nc->matrix)) {
> -		ret = IS_ERR(nc->matrix);
> +		ret = PTR_ERR(nc->matrix);
>  		dev_err(dev, "Could not get Matrix regmap (err = %d)\n", ret);
>  		return ret;
>  	}
> 


-- 
Best regards,
Marek Vasut

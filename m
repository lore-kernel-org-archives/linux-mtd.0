Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cxDuS-0006NY-Kr
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 14:33:48 +0000
Date: Sun, 9 Apr 2017 16:33:22 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [patch] mtd: nand: Fix a couple error codes
Message-ID: <20170409163322.3da06acd@bbrezillon>
In-Reply-To: <20170404081545.GA25533@mwanda>
References: <20170404081545.GA25533@mwanda>
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

Hi Dan,

On Tue, 4 Apr 2017 11:15:46 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We accidentally return 1 on error instead of proper error codes.

These bugs have not reached Linus' tree yet and I'll have to force push
my nand/next branch because of regressions introduced by other patches
(not related to the Atmel NAND driver rework). Do you mind if I squash
the changes in the original commit?

Thanks,

Boris

> 
> Fixes: 07b23e3db9ed ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
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

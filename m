Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhHIE-0004k3-D0
 for linux-mtd@lists.infradead.org; Mon, 14 Aug 2017 15:30:39 +0000
Subject: Re: [PATCH] mtd: spi-nor: aspeed: set 4B setting for all chips
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <1501663911-26532-1-git-send-email-clg@kaod.org>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <42e4f852-5a94-8c21-fe78-08ec494a1a50@wedev4u.fr>
Date: Mon, 14 Aug 2017 17:28:05 +0200
MIME-Version: 1.0
In-Reply-To: <1501663911-26532-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 02/08/2017 à 10:51, Cédric Le Goater a écrit :
> The driver made the wrong assumption that the 4B setting was
> autodetected for all chips of the AST2500 FMC flash controller. This
> is only the case for the CS0.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index 23622bf62b6b..1b76fe14a435 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -794,19 +794,18 @@ static void aspeed_smc_chip_set_type(struct aspeed_smc_chip *chip, int type)
>  }
>  
>  /*
> - * The AST2500 FMC flash controller should be strapped by hardware, or
> - * autodetected, but the AST2500 SPI flash needs to be set.
> + * The first chip of the AST2500 FMC flash controller is strapped by
> + * hardware, or autodetected, but other chips need to be set. Enforce
> + * the 4B setting for all chips.
>   */
>  static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
>  {
>  	struct aspeed_smc_controller *controller = chip->controller;
>  	u32 reg;
>  
> -	if (chip->controller->info == &spi_2500_info) {
> -		reg = readl(controller->regs + CE_CONTROL_REG);
> -		reg |= 1 << chip->cs;
> -		writel(reg, controller->regs + CE_CONTROL_REG);
> -	}
> +	reg = readl(controller->regs + CE_CONTROL_REG);
> +	reg |= 1 << chip->cs;
> +	writel(reg, controller->regs + CE_CONTROL_REG);
>  }
>  
>  /*
> 

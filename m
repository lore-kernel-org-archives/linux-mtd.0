Received: from mail-wm0-f66.google.com ([74.125.82.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUGyU-0002QB-Lp
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2017 17:58:17 +0000
Received: by mail-wm0-f66.google.com with SMTP id r126so657695wmr.3
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2017 09:57:53 -0800 (PST)
Subject: Re: [PATCH] mtd: aspeed: fix compile warning in
 aspeed_smc_read_from_ahb()
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1484817198-22477-1-git-send-email-clg@kaod.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a5b9d933-95db-2cb6-fb70-40bc21dd7298@gmail.com>
Date: Thu, 19 Jan 2017 18:21:54 +0100
MIME-Version: 1.0
In-Reply-To: <1484817198-22477-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/19/2017 10:13 AM, Cédric Le Goater wrote:
> The first argument of ioread32_rep() and ioread8_rep is not
> const. Change aspeed_smc_read_from_ahb() prototype to fix compile
> warning :
> 
>    drivers/mtd/spi-nor/aspeed-smc.c: In function 'aspeed_smc_read_from_ahb':
>    drivers/mtd/spi-nor/aspeed-smc.c:212:16: warning: passing argument 1 of 'ioread32_rep' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>       ioread32_rep(src, buf, len >> 2);
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

In this case it's IMO OK:

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index 6bb4c7d1788c..7c86099450be 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -222,8 +222,7 @@ struct aspeed_smc_controller {
>   * the memory buffer pointer and count via explicit code. The final updates
>   * to len are optimistically suppressed.
>   */
> -static int aspeed_smc_read_from_ahb(void *buf, const void __iomem *src,
> -				    size_t len)
> +static int aspeed_smc_read_from_ahb(void *buf, void __iomem *src, size_t len)
>  {
>  	size_t offset = 0;
>  
> 


-- 
Best regards,
Marek Vasut

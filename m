Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwCun-0008Vx-J3
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 19:17:55 +0000
Received: by mail-wr0-x243.google.com with SMTP id t20so14089425wra.2
 for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2017 12:17:32 -0700 (PDT)
Subject: Re: [PATCH 01/10] mtd: spi-nor: aspeed: fix the AST2400 SMC window
 size
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-2-git-send-email-clg@kaod.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1031c587-4d69-d8a0-921a-40886fbb1575@gmail.com>
Date: Thu, 6 Apr 2017 21:17:30 +0200
MIME-Version: 1.0
In-Reply-To: <1491497808-25487-2-git-send-email-clg@kaod.org>
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

On 04/06/2017 06:56 PM, Cédric Le Goater wrote:
> The window of the Aspeed AST2400 SMC Controller to map chips on the
> AHB Bus has a 256MB size. 64MB is the default size for the first chip
> select and not the full window range: [ 0x20000000 - 0x2FFFFFFF ].
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index 56051d30f000..aa2c647c8507 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -48,7 +48,7 @@ static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip);
>  static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
>  
>  static const struct aspeed_smc_info fmc_2400_info = {
> -	.maxsize = 64 * 1024 * 1024,
> +	.maxsize = 256 * 1024 * 1024,

How does the second part of reg property in DT relate to this ?
DT binding example has it set to 0x02000000 = 32 MiB ...

>  	.nce = 5,
>  	.hastype = true,
>  	.we0 = 16,
> 


-- 
Best regards,
Marek Vasut

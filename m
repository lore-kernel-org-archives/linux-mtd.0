Received: from 4.mo5.mail-out.ovh.net ([178.33.111.247])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqOxb-0008BY-3x
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2018 20:33:37 +0000
Received: from player695.ha.ovh.net (unknown [10.109.143.109])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id E1DE61D6C1E
 for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2018 22:33:14 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.17 2/2] mtd: spi-nor: fix spi register address
 for AST2400
To: Alexander Soldatov <a.soldatov@yadro.com>, linux-mtd@lists.infradead.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: stable@vger.kernel.org
References: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
 <1534416055-23939-2-git-send-email-a.soldatov@yadro.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d9dc3b66-d965-42bf-2ebe-8689d615ef41@kaod.org>
Date: Thu, 16 Aug 2018 22:33:07 +0200
MIME-Version: 1.0
In-Reply-To: <1534416055-23939-2-git-send-email-a.soldatov@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/16/2018 12:40 PM, Alexander Soldatov wrote:
> According to AST2400 datasheet v1.4 the SPI Flash Read Timing
> Setting register is at offset 0x14. There is no register at
> offset 0x94 (unlike FMC controller and AST2500).

The setting of the read timing register is not in mainline yet, 
so the patch won't apply. I will merge the fix in my patchset.



Thanks,

C. 


> 
> Cc: stable@vger.kernel.org
> Fixes: aad58eba7209 ("mtd: spi-nor: aspeed: optimize read mode")
> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index c9cd20f199d9..9ddf24b042f1 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -71,7 +71,7 @@ static const struct aspeed_smc_info spi_2400_info = {
>  	.hastype = false,
>  	.we0 = 0,
>  	.ctl0 = 0x04,
> -	.timing = 0x94,
> +	.timing = 0x14,
>  	.set_4b = aspeed_smc_chip_set_4b_spi_2400,
>  	.optimize_read = aspeed_smc_optimize_read,
>  };
> 

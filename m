Received: from nasmtp02.atmel.com ([204.2.163.16] helo=SJOEDG01.corp.atmel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCQK2-0006CM-UW
 for linux-mtd@lists.infradead.org; Wed, 30 Jul 2014 09:37:23 +0000
Message-ID: <53D8BC92.4050907@atmel.com>
Date: Wed, 30 Jul 2014 17:36:18 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Raphael Poggi <poggi.raph@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: atmel_nand: increase chip_delay
References: <1406640447-9080-1-git-send-email-poggi.raph@gmail.com>
In-Reply-To: <1406640447-9080-1-git-send-email-poggi.raph@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Raphael

On 7/29/2014 9:27 PM, Raphael Poggi wrote:
> Some nand with 8k page size like Micron MT29F32G08ABAAAWP need more than 20us.
>
> Signed-off-by: Raphaël Poggi <poggi.raph@gmail.com>
> ---
>   drivers/mtd/nand/atmel_nand.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index e321c56..77bd877 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -2099,7 +2099,7 @@ static int atmel_nand_probe(struct platform_device *pdev)
>   	}
>   
>   	nand_chip->ecc.mode = host->board.ecc_mode;
> -	nand_chip->chip_delay = 20;		/* 20us command delay time */
> +	nand_chip->chip_delay = 40;		/* 40us command delay time */
>   
>   	if (host->board.bus_width_16)	/* 16-bit bus width */
>   		nand_chip->options |= NAND_BUSWIDTH_16;

I just post a patch [1] days ago which does almost the same thing to 
support 4k-page nand flash.
personally I am fine with your patch.

Brain, you only need to take care this patch. And drop my patch [1].

[1] http://patchwork.ozlabs.org/patch/372406/

Thanks.
Best Regards,
Josh Wu

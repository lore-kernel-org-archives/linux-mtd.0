Received: from eusmtp01.atmel.com ([212.144.249.242])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwRMF-0004Lk-Cj
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 06:57:20 +0000
Message-ID: <52BD24A7.4010200@atmel.com>
Date: Fri, 27 Dec 2013 14:56:39 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Jingoo Han <jg1.han@samsung.com>, 'Brian Norris'
 <computersforpeace@gmail.com>
Subject: Re: [PATCH V2 1/4] mtd: atmel_nand: use dev_err() instead of printk()
References: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
 <009c01cf01ea$e48f10f0$adad32d0$%han@samsung.com>
In-Reply-To: <009c01cf01ea$e48f10f0$adad32d0$%han@samsung.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/26/2013 11:30 AM, Jingoo Han wrote:
> Use dev_err() instead of printk() to provide a better message
> to userspace.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
Acked-by: Josh Wu <josh.wu@atmel.com>

Best Regards,
Josh Wu
> ---
> Change since v1
> - Remove the site-specific OOM messages.
>
>   drivers/mtd/nand/atmel_nand.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index e633c44..c36e9b8 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -2060,14 +2060,14 @@ static int atmel_nand_probe(struct platform_device *pdev)
>   		}
>   
>   		if (gpio_get_value(host->board.det_pin)) {
> -			printk(KERN_INFO "No SmartMedia card inserted.\n");
> +			dev_info(&pdev->dev, "No SmartMedia card inserted.\n");
>   			res = -ENXIO;
>   			goto err_no_card;
>   		}
>   	}
>   
>   	if (host->board.on_flash_bbt || on_flash_bbt) {
> -		printk(KERN_INFO "atmel_nand: Use On Flash BBT\n");
> +		dev_info(&pdev->dev, "Use On Flash BBT\n");
>   		nand_chip->bbt_options |= NAND_BBT_USE_FLASH;
>   	}
>   

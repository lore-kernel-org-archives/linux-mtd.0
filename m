Received: from eusmtp01.atmel.com ([212.144.249.242])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwRL9-0004Jc-Qt
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 06:56:12 +0000
Message-ID: <52BD247D.5010102@atmel.com>
Date: Fri, 27 Dec 2013 14:55:57 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Jingoo Han <jg1.han@samsung.com>, 'Brian Norris'
 <computersforpeace@gmail.com>
Subject: Re: [PATCH 01/23] mtd: atmel_nand: Remove unnecessary OOM messages
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
 <008301cf01e6$9a679820$cf36c860$%han@samsung.com>
In-Reply-To: <008301cf01e6$9a679820$cf36c860$%han@samsung.com>
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

On 12/26/2013 11:00 AM, Jingoo Han wrote:
> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
Acked-by: Josh Wu <josh.wu@atmel.com>

Best Regards,
Josh Wu
> ---
>   drivers/mtd/nand/atmel_nand.c |    4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 59f08c4..e633c44 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -1961,10 +1961,8 @@ static int atmel_nand_probe(struct platform_device *pdev)
>   
>   	/* Allocate memory for the device structure (and zero it) */
>   	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
> -	if (!host) {
> -		printk(KERN_ERR "atmel_nand: failed to allocate device structure.\n");
> +	if (!host)
>   		return -ENOMEM;
> -	}
>   
>   	res = platform_driver_register(&atmel_nand_nfc_driver);
>   	if (res)

Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uxbw1-0007Xc-0K
 for linux-mtd@lists.infradead.org; Fri, 12 Jul 2013 11:54:50 +0000
From: Marek Vasut <marex@denx.de>
To: wangyuhang <wangyuhang2014@gmail.com>
Subject: Re: [PATCH v2] M25p80 little bugs
Date: Fri, 12 Jul 2013 13:49:15 +0200
References: <wangyuhang2014@gmail.com>
 <1373610834-5240-1-git-send-email-wangyuhang2014@gmail.com>
In-Reply-To: <1373610834-5240-1-git-send-email-wangyuhang2014@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201307121349.15208.marex@denx.de>
Cc: artem.bityutskiy@linux.intel.com, wfp5p@virginia.edu, swarren@nvidia.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear wangyuhang,

> Hi, Marek
> 
> Really sorry for the previous deformed patch.
> And you are right, using devm_kzalloc looks better.
> I have resended the patch, please help me review.
> Thanks.

Now just fix the commit message and you're done, thanks! ;-)

> Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c |   13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 5b6b072..70f3c54 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -955,15 +955,9 @@ static int m25p_probe(struct spi_device *spi)
>  		}
>  	}
> 
> -	flash = kzalloc(sizeof *flash, GFP_KERNEL);
> +	flash = devm_kzalloc(&spi->dev, sizeof *flash, GFP_KERNEL);
>  	if (!flash)
>  		return -ENOMEM;
> -	flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 : 0),
> -					GFP_KERNEL);
> -	if (!flash->command) {
> -		kfree(flash);
> -		return -ENOMEM;
> -	}
> 
>  	flash->spi = spi;
>  	mutex_init(&flash->lock);
> @@ -1032,6 +1026,11 @@ static int m25p_probe(struct spi_device *spi)
>  	flash->fast_read = true;
>  #endif
> 
> +	flash->command = devm_kzalloc(&spi->dev,
> +		MAX_CMD_SIZE + (flash->fast_read ? 1 : 0), GFP_KERNEL);
> +	if (!flash->command)
> +		return -ENOMEM;
> +
>  	if (info->addr_width)
>  		flash->addr_width = info->addr_width;
>  	else {

Best regards,
Marek Vasut

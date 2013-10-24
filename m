Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZGnC-0002E8-7d
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 09:01:23 +0000
Message-ID: <5268E1C2.3030202@ti.com>
Date: Thu, 24 Oct 2013 14:30:50 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/5] mtd: m25p80: fix allocation size
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 24 October 2013 08:28 AM, Brian Norris wrote:
> This patch fixes two memory errors:
>
> 1. During a probe failure (in mtd_device_parse_register?) the command
>     buffer would not be freed.
>
> 2. The command buffer's size is determined based on the 'fast_read'
>     boolean, but the assignment of fast_read is made after this
>     allocation. Thus, the buffer may be allocated "too small".
>
> To fix the first, just switch to the devres version of kzalloc.
>
> To fix the second, increase MAX_CMD_SIZE unconditionally. It's not worth
> saving a byte to fiddle around with the conditions here.
>
> This problem was reported by Yuhang Wang a while back.
>
> Signed-off-by: Brian Norris<computersforpeace@gmail.com>
> Reported-by: Yuhang Wang<wangyuhang2014@gmail.com>
> Cc:<stable@vger.kernel.org>
Reviewed-by: Sourav Poddar <sourav.poddar@ti.com>
> ---
>   drivers/mtd/devices/m25p80.c | 20 +++++++-------------
>   1 file changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 8d6c87be..63a95ac 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -78,7 +78,7 @@
>
>   /* Define max times to check status register before we give up. */
>   #define	MAX_READY_WAIT_JIFFIES	(40 * HZ)	/* M25P16 specs 40s max chip erase */
> -#define	MAX_CMD_SIZE		5
> +#define	MAX_CMD_SIZE		6
>
>   #define JEDEC_MFR(_jedec_id)	((_jedec_id)>>  16)
>
> @@ -996,15 +996,13 @@ static int m25p_probe(struct spi_device *spi)
>   		}
>   	}
>
> -	flash = kzalloc(sizeof *flash, GFP_KERNEL);
> +	flash = devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
>   	if (!flash)
>   		return -ENOMEM;
> -	flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 : 0),
> -					GFP_KERNEL);
> -	if (!flash->command) {
> -		kfree(flash);
> +
> +	flash->command = devm_kzalloc(&spi->dev, MAX_CMD_SIZE, GFP_KERNEL);
> +	if (!flash->command)
>   		return -ENOMEM;
> -	}
>
>   	flash->spi = spi;
>   	mutex_init(&flash->lock);
> @@ -1137,14 +1135,10 @@ static int m25p_probe(struct spi_device *spi)
>   static int m25p_remove(struct spi_device *spi)
>   {
>   	struct m25p	*flash = spi_get_drvdata(spi);
> -	int		status;
>
>   	/* Clean up MTD stuff. */
> -	status = mtd_device_unregister(&flash->mtd);
> -	if (status == 0) {
> -		kfree(flash->command);
> -		kfree(flash);
> -	}
> +	mtd_device_unregister(&flash->mtd);
> +
>   	return 0;
>   }
>

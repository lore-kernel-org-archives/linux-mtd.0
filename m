Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUhpG-0004Y2-Sy
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2017 22:38:32 +0000
Subject: Re: [PATCH, 1/2] mtd: m25p80: Let m25p80_read() fallback to spi
 transfer
To: Kamal Dasu <kdasu.kdev@gmail.com>, cyrille.pitchen@atmel.com,
 broonie@kernel.org
References: <1484949023-2085-1-git-send-email-kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com
From: Marek Vasut <marex@denx.de>
Message-ID: <3e1f1c8e-4a87-e186-20cb-2ba784bd58d5@denx.de>
Date: Fri, 20 Jan 2017 23:38:05 +0100
MIME-Version: 1.0
In-Reply-To: <1484949023-2085-1-git-send-email-kdasu.kdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/20/2017 10:50 PM, Kamal Dasu wrote:
> In m25p80_read() even though spi_flash_read() is supported
> by some drivers, under certain circumstances like unaligned
> buffer, address or address range limitations on certain SoCs
> let it fallback to core spi reads. Such drivers are expected
> to return -EINVAL so that the m25p80_read() uses standard
> spi transfer.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 9cf7fcd..7b7f2cc 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -155,9 +155,16 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>  		msg.data_nbits = m25p80_rx_nbits(nor);
>  
>  		ret = spi_flash_read(spi, &msg);
> -		if (ret < 0)
> +
> +		if (ret >= 0)
> +			return msg.retlen;

ret can never be > 0 , it is only 0 or negative .

> +		/*
> +		 * some spi master drivers might need to fallback to
> +		 * normal spi transfer
> +		 */
> +		if (ret != -EINVAL)
>  			return ret;

This looks really fragile and special-casing EINVAL here doesn't scale.
But still, if your controller driver is buggy, fix the driver, do not
pollute core code with workarounds. If you do support this sort of
accelerated read and it fails, it means something is seriously wrong.
If you need to invoke regular SPI reads to complete under some obscure
circumstances, do it from the driver, not here.

> -		return msg.retlen;
>  	}
>  
>  	spi_message_init(&m);
> 


-- 
Best regards,
Marek Vasut

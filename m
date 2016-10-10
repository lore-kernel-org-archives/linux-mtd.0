Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btVZZ-0003s6-5J
 for linux-mtd@lists.infradead.org; Mon, 10 Oct 2016 08:04:34 +0000
Received: by mail-lf0-x244.google.com with SMTP id p80so8623886lfp.1
 for <linux-mtd@lists.infradead.org>; Mon, 10 Oct 2016 01:04:12 -0700 (PDT)
Subject: Re: [PATCH v6, 5/8] mtd: m25p80: Let m25p80_read() fallback to spi
 transfer
To: Kamal Dasu <kdasu.kdev@gmail.com>, broonie@kernel.org,
 linux-spi@vger.kernel.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, yendapally.reddy@broadcom.com
References: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
 <1472076269-4731-6-git-send-email-kdasu.kdev@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, jon.mason@broadcom.com
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4b3b3d3e-b3f8-1d5b-65e3-0c37b6a29096@gmail.com>
Date: Mon, 10 Oct 2016 01:04:08 -0700
MIME-Version: 1.0
In-Reply-To: <1472076269-4731-6-git-send-email-kdasu.kdev@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/24/2016 03:04 PM, Kamal Dasu wrote:
> In m25p80_read() even though spi_flash_read() is supported
> by some drivers, under certain circumstances like unaligned
> buffer, address or address range limitations on certain SoCs
> let it fallback to core spi reads. Such drivers are expected
> to return -EAGAIN so that the m25p80_read() uses standard
> spi transfer.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

MTD folks, any comments on this?

> ---
>  drivers/mtd/devices/m25p80.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 9cf7fcd..77c2d2c 100644
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
> +
> +		/*
> +		 * some spi master drivers might need to fallback to
> +		 * normal spi transfer
> +		 */
> +		if (ret != -EAGAIN)
>  			return ret;
> -		return msg.retlen;
>  	}
>  
>  	spi_message_init(&m);
> 

-- 
Florian

Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUhr8-0006Hl-AB
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2017 22:40:27 +0000
Subject: Re: [PATCH, 2/2] spi: bcm-qspi: Fix return code from
 bcm_qspi_flash_read()
To: Kamal Dasu <kdasu.kdev@gmail.com>, cyrille.pitchen@atmel.com,
 broonie@kernel.org
References: <1484949023-2085-1-git-send-email-kdasu.kdev@gmail.com>
 <1484949023-2085-2-git-send-email-kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com
From: Marek Vasut <marex@denx.de>
Message-ID: <d5d69672-8114-d891-e699-8e5f0fe46164@denx.de>
Date: Fri, 20 Jan 2017 23:40:02 +0100
MIME-Version: 1.0
In-Reply-To: <1484949023-2085-2-git-send-email-kdasu.kdev@gmail.com>
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
> To properly fallback to normal mspi reads return appropriate return code to
> m25p80_read() function. Changed return code to -EINVAL from -EAGAIN to match
> what is expected by the m25p80 driver.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/spi/spi-bcm-qspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-bcm-qspi.c b/drivers/spi/spi-bcm-qspi.c
> index 14f9dea..3e37b6b 100644
> --- a/drivers/spi/spi-bcm-qspi.c
> +++ b/drivers/spi/spi-bcm-qspi.c
> @@ -919,7 +919,7 @@ static int bcm_qspi_flash_read(struct spi_device *spi,
>  
>  	if (mspi_read)
>  		/* this will make the m25p80 read to fallback to mspi read */
> -		return -EAGAIN;
> +		return -EINVAL;

This looks wrong, twice. First, why is the m25q80 driver mentioned in
this driver at all ? Second, see my comment for 1/2 , I think if the
read fails and it's because of some condition the block cannot handle,
but can recover from, the driver should deal with that.

>  	io_width = msg->data_nbits ? msg->data_nbits : SPI_NBITS_SINGLE;
>  	addrlen = msg->addr_width;
> 


-- 
Best regards,
Marek Vasut

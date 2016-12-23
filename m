Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cKRZe-0001KR-Mp
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2016 15:15:59 +0000
Subject: Re: [PATCH v2 2/3] mtd: m25p80: consider max message size in
 m25p80_read
To: Heiner Kallweit <hkallweit1@gmail.com>, Mark Brown <broonie@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <6c95366c-7fcc-ef4c-033a-f9f6e152a669@gmail.com>
 <20160816164204.GV9347@sirena.org.uk>
 <b65240ff-7e28-5ecb-0670-abfca871246b@gmail.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, MTD Maling List
 <linux-mtd@lists.infradead.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <f39fad56-f229-3bbb-7bea-3a557cf94e49@atmel.com>
Date: Fri, 23 Dec 2016 16:15:34 +0100
MIME-Version: 1.0
In-Reply-To: <b65240ff-7e28-5ecb-0670-abfca871246b@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 17/08/2016 à 21:09, Heiner Kallweit a écrit :
> Consider a message size limit when calculating the maximum amount
> of data that can be read.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

> ---
> v2:
> - use the new function spi_max_message_size
> ---
>  drivers/mtd/devices/m25p80.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 9cf7fcd..16a7df2 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -172,7 +172,8 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>  
>  	t[1].rx_buf = buf;
>  	t[1].rx_nbits = m25p80_rx_nbits(nor);
> -	t[1].len = min(len, spi_max_transfer_size(spi));
> +	t[1].len = min3(len, spi_max_transfer_size(spi),
> +			spi_max_message_size(spi) - t[0].len);
>  	spi_message_add_tail(&t[1], &m);
>  
>  	ret = spi_sync(spi, &m);
> 

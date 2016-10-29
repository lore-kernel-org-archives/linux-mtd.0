Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0XvW-0005HW-6e
 for linux-mtd@lists.infradead.org; Sat, 29 Oct 2016 18:00:19 +0000
Received: by mail-wm0-x244.google.com with SMTP id c17so12038113wmc.3
 for <linux-mtd@lists.infradead.org>; Sat, 29 Oct 2016 10:59:56 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: m25p80: consider max message size in m25p80_read
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <6c95366c-7fcc-ef4c-033a-f9f6e152a669@gmail.com>
 <20160816164204.GV9347@sirena.org.uk>
 <b65240ff-7e28-5ecb-0670-abfca871246b@gmail.com>
 <a5aad691-fb3b-39a5-943e-43068df74c44@gmail.com>
 <e2e4ecfe-b888-f335-57f6-634f5c818252@gmail.com>
 <0e38d1ed-af5c-160f-e02a-f1433c507d23@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <6f1aed1e-9467-aa94-56cb-5e9435b21ae4@gmail.com>
Date: Sat, 29 Oct 2016 19:59:09 +0200
MIME-Version: 1.0
In-Reply-To: <0e38d1ed-af5c-160f-e02a-f1433c507d23@gmail.com>
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

On 10/28/2016 07:58 AM, Heiner Kallweit wrote:
> Consider a message size limit when calculating the maximum amount
> of data that can be read.
> 
> The message size limit has been introduced with 4.9, so cc it
> to stable.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: <stable@vger.kernel.org> # 4.9.x
> ---
> v2:
> - This patch was part of a series and the other patches of the
>   series went into 4.9. It's needed to correctly support
>   reads > 64k on fsl-espi as first user of spi_max_message_size.
>   See commit 02a595d5d6e4 ("spi: fsl-espi: eliminate spi nor
>   flash read loop"). CC it to stable.  

Does this imply that we have to fix every single driver this way ?

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


-- 
Best regards,
Marek Vasut

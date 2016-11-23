Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9Ydv-0000kR-Gr
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2016 14:35:24 +0000
Subject: Re: [PATCH v3] mtd: spi-nor: fix spansion quad enable
To: =?UTF-8?Q?Jo=c3=abl_Esponde?= <joel.esponde@honeywell.com>,
 <linux-mtd@lists.infradead.org>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
 <1479901660-124876-1-git-send-email-joel.esponde@honeywell.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <1ddf0860-fb9b-6ac5-7728-4e8be5aa9932@atmel.com>
Date: Wed, 23 Nov 2016 15:35:00 +0100
MIME-Version: 1.0
In-Reply-To: <1479901660-124876-1-git-send-email-joel.esponde@honeywell.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 23/11/2016 à 12:47, Joël Esponde a écrit :
> With the S25FL127S nor flash part, each writing to the configuration
> register takes hundreds of ms. During that  time, no more accesses to
> the flash should be done (even reads).
> 
> This commit adds a wait loop after the register writing until the flash
> finishes its work.
> 
> This issue could make rootfs mounting fail when the latter was done too
> much closely to this quad enable bit setting step. And in this case, a
> driver as UBIFS may try to recover the filesystem and may broke it
> completely.
> 
> Signed-off-by: Joël Esponde <joel.esponde@honeywell.com>
Applied to git://github.com/spi-nor/linux.git

Thanks!
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165..21dde52 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1255,6 +1255,13 @@ static int spansion_quad_enable(struct spi_nor *nor)
>  		return -EINVAL;
>  	}
>  
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret) {
> +		dev_err(nor->dev,
> +			"timeout while writing configuration register\n");
> +		return ret;
> +	}
> +
>  	/* read back and check it */
>  	ret = read_cr(nor);
>  	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
> 

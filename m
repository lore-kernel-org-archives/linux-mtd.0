Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cf6sJ-0002ph-AF
 for linux-mtd@lists.infradead.org; Sat, 18 Feb 2017 15:24:40 +0000
Received: by mail-wm0-x241.google.com with SMTP id v77so7198253wmv.0
 for <linux-mtd@lists.infradead.org>; Sat, 18 Feb 2017 07:24:16 -0800 (PST)
Subject: Re: [PATCH] mtd: spi-nor: hisi: do not ignore clk_prepare_enable()
 failure
To: Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1487369297-5810-1-git-send-email-khoroshilov@ispras.ru>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <0066fec2-492a-52de-3c2e-ebce4b9f452a@gmail.com>
Date: Sat, 18 Feb 2017 16:23:35 +0100
MIME-Version: 1.0
In-Reply-To: <1487369297-5810-1-git-send-email-khoroshilov@ispras.ru>
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

On 02/17/2017 11:08 PM, Alexey Khoroshilov wrote:
> hisi_spi_nor_probe() ignores clk_prepare_enable() error code.
> The patch fixes that.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/spi-nor/hisi-sfc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
> index 20378b0d55e9..a286350627a6 100644
> --- a/drivers/mtd/spi-nor/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
> @@ -448,8 +448,11 @@ static int hisi_spi_nor_probe(struct platform_device *pdev)
>  	if (!host->buffer)
>  		return -ENOMEM;
>  
> +	ret = clk_prepare_enable(host->clk);
> +	if (ret)
> +		return ret;
> +
>  	mutex_init(&host->lock);
> -	clk_prepare_enable(host->clk);
>  	hisi_spi_nor_init(host);
>  	ret = hisi_spi_nor_register_all(host);
>  	if (ret)
> 


-- 
Best regards,
Marek Vasut

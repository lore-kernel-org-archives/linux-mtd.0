Received: from mail-pd0-f169.google.com ([209.85.192.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wccw7-0006rd-GD
 for linux-mtd@lists.infradead.org; Tue, 22 Apr 2014 15:48:44 +0000
Received: by mail-pd0-f169.google.com with SMTP id fp1so5049575pdb.28
 for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2014 08:48:18 -0700 (PDT)
Date: Tue, 22 Apr 2014 23:48:08 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] mtd: m25p80: Revive dual read support
Message-ID: <20140422154806.GA4230@localhost.localdomain>
References: <1398170732-19773-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398170732-19773-1-git-send-email-geert+renesas@glider.be>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 22, 2014 at 02:45:31PM +0200, Geert Uytterhoeven wrote:
> Commit 03e296f613affcc2671c1e86d8c25ecad867204e ("mtd: m25p80: use the SPI
> nor framework") accidentally removed support for Dual SPI read transfers.
> Add it back.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/mtd/devices/m25p80.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 1557d8f672c1..ed7e0a1bed3c 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -221,6 +221,8 @@ static int m25p_probe(struct spi_device *spi)
>  
>  	if (spi->mode & SPI_RX_QUAD)
>  		mode = SPI_NOR_QUAD;
> +	else if (spi->mode & SPI_RX_DUAL)
> +		mode = SPI_NOR_DUAL;
>  	ret = spi_nor_scan(nor, spi_get_device_id(spi), mode);
>  	if (ret)
>  		return ret;
sorry for the mistake.

Acked-by: Huang Shijie <shijie8@gmail.com>

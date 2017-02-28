Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cipX3-00008d-Ih
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 21:42:07 +0000
Subject: Re: [RFC PATCH 2/2] mtd: devices: m25p80: Enable spi-nor bounce
 buffer support
To: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170227120839.16545-1-vigneshr@ti.com>
 <20170227120839.16545-3-vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, Frode Isaksen <fisaksen@baylibre.com>,
 linux-spi@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <aa967f6a-0526-3e33-1de7-fbe7d4264f34@nod.at>
Date: Tue, 28 Feb 2017 22:41:11 +0100
MIME-Version: 1.0
In-Reply-To: <20170227120839.16545-3-vigneshr@ti.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vignesh,

Am 27.02.2017 um 13:08 schrieb Vignesh R:
> Many SPI controller drivers use DMA to read/write from m25p80 compatible
> flashes. Therefore enable bounce buffers support provided by spi-nor
> framework to take care of handling vmalloc'd buffers which may not be
> DMA'able.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
>  drivers/mtd/devices/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index c4df3b1bded0..d05acf22eadf 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -241,6 +241,7 @@ static int m25p_probe(struct spi_device *spi)
>  	else
>  		flash_name = spi->modalias;
>  
> +	nor->flags |= SNOR_F_USE_BOUNCE_BUFFER;

Isn't there a better way to detect whether a bounce buffer is needed or not?

Thanks,
//richard

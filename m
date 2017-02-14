Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cda3A-0005hz-2T
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 10:09:36 +0000
Date: Tue, 14 Feb 2017 11:09:09 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: intel: use ERR_CAST in return statement
Message-ID: <20170214110909.4338987d@bbrezillon>
In-Reply-To: <1486973661-1164-1-git-send-email-der.herr@hofr.at>
References: <1486973661-1164-1-git-send-email-der.herr@hofr.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 13 Feb 2017 09:14:21 +0100
Nicholas Mc Guire <der.herr@hofr.at> wrote:

> This fixes a sparse warning about incorrect type in retrun expression

						      ^return

and you miss a comma at the end of this sentence.

> 
> Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>

You forgot to add my ack (same comment on your other patches).

> ---
> 
> V2: fixed prefix and the truncated commit message noted by Boris Brezillon
>     <boris.brezillon@free-electrons.com> - thanks!
> 
> sparse complained about:
> drivers/mtd/spi-nor/intel-spi.c:731:28: warning: incorrect type in return expression (different address spaces)
> drivers/mtd/spi-nor/intel-spi.c:731:28:    expected struct intel_spi *
> drivers/mtd/spi-nor/intel-spi.c:731:28:    got void [noderef] <asn:2>*base
> 
> Patch was compile tested with: multi_v7_defconfig (implies CONFIG_MTD_SPI_NOR=y)
> 
> Patch is against 4.10-rc7 (localversion-next is next-20170213)
> 
>  drivers/mtd/spi-nor/intel-spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index 2956f2c..1a6de4b 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -728,7 +728,7 @@ struct intel_spi *intel_spi_probe(struct device *dev,
>  
>  	ispi->base = devm_ioremap_resource(dev, mem);
>  	if (IS_ERR(ispi->base))
> -		return ispi->base;
> +		return ERR_CAST(ispi->base);
>  
>  	ispi->dev = dev;
>  	ispi->info = info;

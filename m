Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdVIq-0007sx-SA
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 05:05:30 +0000
Received: by mail-wr0-x241.google.com with SMTP id o16so26243858wra.2
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2017 21:05:03 -0800 (PST)
Subject: Re: [PATCH] mtd: spi-nor: intel: use ERR_CAST in return statement
To: Nicholas Mc Guire <der.herr@hofr.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1486973661-1164-1-git-send-email-der.herr@hofr.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b5a20a54-70c8-c64b-bb8f-bec0702426f9@gmail.com>
Date: Tue, 14 Feb 2017 05:49:39 +0100
MIME-Version: 1.0
In-Reply-To: <1486973661-1164-1-git-send-email-der.herr@hofr.at>
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

On 02/13/2017 09:14 AM, Nicholas Mc Guire wrote:
> This fixes a sparse warning about incorrect type in retrun expression
> 
> Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
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

Was this driver even enabled with multi_v7 and MTD_SPI_NOR=y ?
Nonetheless, the patch is correct:

Acked-by: Marek Vasut <marek.vasut@gmail.com>

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
> 


-- 
Best regards,
Marek Vasut

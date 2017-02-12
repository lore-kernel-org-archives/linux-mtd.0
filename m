Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cd230-0000xC-5c
 for linux-mtd@lists.infradead.org; Sun, 12 Feb 2017 21:51:08 +0000
Date: Sun, 12 Feb 2017 22:50:44 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi-nor: use true/false for bool
Message-ID: <20170212225044.17a10ee1@bbrezillon>
In-Reply-To: <1486917811-23525-1-git-send-email-der.herr@hofr.at>
References: <1486917811-23525-1-git-send-email-der.herr@hofr.at>
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

On Sun, 12 Feb 2017 17:43:31 +0100
Nicholas Mc Guire <der.herr@hofr.at> wrote:

> writeable in struct intel_spi is a boolean and assignment should be to 
> true/false not 1/0 as recommended by boolinit.cocci.
> 
> Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> 
> make coccicheck complained with:
>  ./drivers/mtd/spi-nor/intel-spi.c:707:3-18: WARNING: Assignment of bool to 0/1
> 
> Patch was compile tested with: multi_v7_defconfig (implies CONFIG_MTD_SPI_NOR=y)
> 
> Patch is against 4.10-rc6 (localversion-next is next-20170210)
> 
>  drivers/mtd/spi-nor/intel-spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index a10f602..e43ce63 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -704,7 +704,7 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
>  		 * whole partition read-only to be on the safe side.
>  		 */
>  		if (intel_spi_is_protected(ispi, base, limit))
> -			ispi->writeable = 0;
> +			ispi->writeable = false;
>  
>  		end = (limit << 12) + 4096;
>  		if (end > part->size)

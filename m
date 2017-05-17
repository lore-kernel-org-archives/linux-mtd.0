Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dB0tZ-0005TE-Bs
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 15:29:51 +0000
Date: Wed, 17 May 2017 17:29:11 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, andrew@lunn.ch,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Message-ID: <20170517172911.5f926712@bbrezillon>
In-Reply-To: <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
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

Hi Chris,

On Wed, 17 May 2017 17:39:07 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> Setting the of_node for the mtd device allows the generic mtd code to
> setup the partitions. Additionally we must specify a non-zero erasesize
> for the partitions to be writeable.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  drivers/mtd/devices/mchp23k256.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> index 2542f5b8b63f..02c6b9dcbd3e 100644
> --- a/drivers/mtd/devices/mchp23k256.c
> +++ b/drivers/mtd/devices/mchp23k256.c
> @@ -143,6 +143,7 @@ static int mchp23k256_probe(struct spi_device *spi)
>  
>  	data = dev_get_platdata(&spi->dev);
>  
> +	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
>  	flash->mtd.dev.parent	= &spi->dev;
>  	flash->mtd.type		= MTD_RAM;
>  	flash->mtd.flags	= MTD_CAP_RAM;
> @@ -151,6 +152,10 @@ static int mchp23k256_probe(struct spi_device *spi)
>  	flash->mtd._read	= mchp23k256_read;
>  	flash->mtd._write	= mchp23k256_write;
>  
> +	flash->mtd.erasesize = PAGE_SIZE;
> +	while (flash->mtd.size & (flash->mtd.erasesize - 1))
> +		flash->mtd.erasesize >>= 1;
> +

Can we fix allocate_partition() to properly handle the
master->erasesize == 0 case instead of doing that?

Thanks,

Boris

Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFGlP-0005Mu-Oc
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 09:15:01 +0000
Date: Mon, 29 May 2017 11:14:28 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, andrew@lunn.ch,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v4 4/5] mtd: mchp23k256: add partitioning support
Message-ID: <20170529111428.6748c2e2@bbrezillon>
In-Reply-To: <20170524234916.16181-5-chris.packham@alliedtelesis.co.nz>
References: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
 <20170524234916.16181-5-chris.packham@alliedtelesis.co.nz>
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

On Thu, 25 May 2017 11:49:15 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> Setting the of_node for the mtd device allows the generic mtd code to
> setup the partitions. Additionally we must specify a non-zero erasesize
> for the partitions to be writeable.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Andrew Lunn <andrew@lunn.ch>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Changes in v2
> - collect revew/test from Andrew
> Changes in v3:
> - remove setting of erasesize
> Changes in v4:
> - none
> 
>  drivers/mtd/devices/mchp23k256.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> index 2542f5b8b63f..3e5feb454644 100644
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

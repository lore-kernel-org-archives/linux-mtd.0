Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFGkT-0004bB-3t
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 09:14:04 +0000
Date: Mon, 29 May 2017 11:13:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, andrew@lunn.ch,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v4 2/5] mtd: mchp23k256: switch to mtd_device_register()
Message-ID: <20170529111334.00cb8fbe@bbrezillon>
In-Reply-To: <20170524234916.16181-3-chris.packham@alliedtelesis.co.nz>
References: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
 <20170524234916.16181-3-chris.packham@alliedtelesis.co.nz>
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

On Thu, 25 May 2017 11:49:13 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> Use mtd_device_register() instead of mtd_device_parse_register() to
> eliminate two unused parameters.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Andrew Lunn <andrew@lunn.ch>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Changes in v2
> - collect review/test from Andrew
> Changes in v3:
> - None
> Changes in v4:
> - None
> 
>  drivers/mtd/devices/mchp23k256.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> index 9d8306a15833..2542f5b8b63f 100644
> --- a/drivers/mtd/devices/mchp23k256.c
> +++ b/drivers/mtd/devices/mchp23k256.c
> @@ -151,9 +151,8 @@ static int mchp23k256_probe(struct spi_device *spi)
>  	flash->mtd._read	= mchp23k256_read;
>  	flash->mtd._write	= mchp23k256_write;
>  
> -	err = mtd_device_parse_register(&flash->mtd, NULL, NULL,
> -					data ? data->parts : NULL,
> -					data ? data->nr_parts : 0);
> +	err = mtd_device_register(&flash->mtd, data ? data->parts : NULL,
> +				  data ? data->nr_parts : 0);
>  	if (err)
>  		return err;
>  

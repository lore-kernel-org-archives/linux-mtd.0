Received: from fllnx210.ext.ti.com ([198.47.19.17])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eTpVe-0000Ud-Up
 for linux-mtd@lists.infradead.org; Tue, 26 Dec 2017 13:43:12 +0000
Subject: Re: [PATCH 1/3] mtd: spi-nor: add optional DMA-safe bounce buffer for
 data transfer
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>, <richard@nod.at>,
 <boris.brezillon@free-electrons.com>, <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>, <broonie@kernel.org>,
 <linux@armlinux.org.uk>
CC: <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <robh@kernel.org>, <devicetree@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <radu.pirea@microchip.com>
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <fc2440c6f52877f28286d89691049e5cba10e6a7.1514087323.git.cyrille.pitchen@wedev4u.fr>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <1126731d-cbf7-8fbf-34ab-8ccf1cc8241f@ti.com>
Date: Tue, 26 Dec 2017 19:12:09 +0530
MIME-Version: 1.0
In-Reply-To: <fc2440c6f52877f28286d89691049e5cba10e6a7.1514087323.git.cyrille.pitchen@wedev4u.fr>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

Thanks for doing this series! One comment below.

On 24-Dec-17 10:06 AM, Cyrille Pitchen wrote:
[...]
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 8bafd462f0ae..59f9fbd45234 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -14,8 +14,10 @@
>  #include <linux/errno.h>
>  #include <linux/module.h>
>  #include <linux/device.h>
> +#include <linux/highmem.h>
>  #include <linux/mutex.h>
>  #include <linux/math64.h>
> +#include <linux/mm.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
>  
> @@ -1232,6 +1234,56 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ },
>  };
>  
> +static bool spi_nor_is_dma_safe(const void *buf)
> +{
> +	if (is_vmalloc_addr(buf))
> +		return false;
> +
> +#ifdef CONFIG_HIGHMEM
> +	if ((unsigned long)buf >= PKMAP_BASE &&
> +	    (unsigned long)buf < (PKMAP_BASE + (LAST_PKMAP * PAGE_SIZE)))
> +		return false;
> +#endif
> +
> +	return true;
> +}
> +

Better way would be to use virt_addr_valid():
static bool spi_nor_is_dma_safe(const void *buf)
{
	return virt_addr_valid(buf);
}

Regards
Vignesh

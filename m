Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLTGq-0006cF-Vw
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 08:03:14 +0000
Received: by mail-pa0-f51.google.com with SMTP id kq14so2303113pab.24
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 00:02:50 -0800 (PST)
Date: Thu, 6 Mar 2014 00:02:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: Re: [PATCH] mtd: m25p80: set erasesize to 1 if device doesn't need
 erase
Message-ID: <20140306080246.GW13420@norris-Latitude-E6410>
References: <1392115749-5940-1-git-send-email-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1392115749-5940-1-git-send-email-m.grzeschik@pengutronix.de>
Cc: marex@denx.de, dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michael,

On Tue, Feb 11, 2014 at 11:49:09AM +0100, Michael Grzeschik wrote:
> The driver currently set eraseblocksize to sector_size if the device has
> the SECT_4K{,_PMC} flag not set. The mtdpart layer will check the
> partitions to be bound to eraseblock size bounderies. Devices which do
> not need to be erased before use, like e.g. mrams, this will always
> trigger if the partition is smaller then the sectorsize.

Just because they don't *need* to be erased doesn't mean they aren't
erased. AFAICT only mtdblock actually checks the MTD_NO_ERASE flag.
Otherwise, it looks like UBI (for instance) will perform typical MTD
erasure. Thus, it is not safe even on these flash to have writeable (and
therefore eraseable) partitions not aligned to the true sector size
boundary. Or am I mistaken in how these mrams work?

> This patch
> fixes this by setting the eraseblocksize 1 for such devices.

I'm not sure changing the eraseblock size is a great idea anyway. This
creates incompatibilities for those who are already using the supported
device, e.g., with UBIFS.

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/mtd/devices/m25p80.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index ad1913909702..c7bdce75f574 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -1203,8 +1203,10 @@ static int m25p_probe(struct spi_device *spi)
>  		flash->mtd.erasesize = info->sector_size;
>  	}
>  
> -	if (info->flags & M25P_NO_ERASE)
> +	if (info->flags & M25P_NO_ERASE) {
>  		flash->mtd.flags |= MTD_NO_ERASE;
> +		flash->mtd.erasesize = 1;
> +	}
>  
>  	ppdata.of_node = spi->dev.of_node;
>  	flash->mtd.dev.parent = &spi->dev;

Brian

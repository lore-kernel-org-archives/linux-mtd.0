Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpZho-0003G6-77
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 08:59:28 +0000
Received: by mail-pb0-f48.google.com with SMTP id rr13so10750060pbb.7
 for <linux-mtd@lists.infradead.org>; Wed, 28 May 2014 01:59:04 -0700 (PDT)
Date: Wed, 28 May 2014 01:59:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Shengzhou Liu <Shengzhou.Liu@freescale.com>
Subject: Re: [PATCH] mtd/spi: support en25s64 device
Message-ID: <20140528085900.GC4285@norris-Latitude-E6410>
References: <1400830150-32026-1-git-send-email-Shengzhou.Liu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400830150-32026-1-git-send-email-Shengzhou.Liu@freescale.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 23, 2014 at 03:29:10PM +0800, Shengzhou Liu wrote:
> Add support for EON en25s64 spi device.
> 
> Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
> ---
>  drivers/mtd/devices/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 7eda71d..6989311 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -745,6 +745,7 @@ static const struct spi_device_id m25p_ids[] = {
>  	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
>  	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
>  	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
> +	{ "en25s64",    INFO(0x1c3817, 0, 64 * 1024,  128, 0) },
>  	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
>  
>  	/* ESMT */

Please rebase on l2-mtd.git, found in linux-next and at:

http://git.infradead.org/l2-mtd.git

Thanks,
Brian

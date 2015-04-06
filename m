Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YewTS-0000dF-9o
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2015 02:09:14 +0000
Received: by pacyx8 with SMTP id yx8so29553890pac.1
 for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2015 19:08:53 -0700 (PDT)
Date: Sun, 5 Apr 2015 19:08:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Shengzhou Liu <Shengzhou.Liu@freescale.com>
Subject: Re: [PATCH] mtd/spi: support en25s64 device
Message-ID: <20150406020844.GO2677@norris-Latitude-E6410>
References: <1427449110-24556-1-git-send-email-Shengzhou.Liu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1427449110-24556-1-git-send-email-Shengzhou.Liu@freescale.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 27, 2015 at 05:38:30PM +0800, Shengzhou Liu wrote:
> Add support for EON en25s64 spi device.
> 
> Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 0f8ec3c..f8acef7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -524,6 +524,7 @@ static const struct spi_device_id spi_nor_ids[] = {
>  	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
>  	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
>  	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
> +	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, 0) },
>  
>  	/* ESMT */
>  	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },

Fixed up the subject (to "spi-nor" not "spi") and pushed to l2-mtd.git.

Brian

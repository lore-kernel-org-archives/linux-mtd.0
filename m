Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YewUm-00026g-2b
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2015 02:10:36 +0000
Received: by pdbnk13 with SMTP id nk13so29899941pdb.0
 for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2015 19:10:11 -0700 (PDT)
Date: Sun, 5 Apr 2015 19:10:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/2] spi-nor: Add support for Winbond w25q64dw serial flash
Message-ID: <20150406021008.GP2677@norris-Latitude-E6410>
References: <1423154343-189674-1-git-send-email-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423154343-189674-1-git-send-email-mika.westerberg@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 05, 2015 at 06:39:02PM +0200, Mika Westerberg wrote:
> Add Winbond (w25q64dw) 8MB flash to the list of supported chips.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 0f8ec3c2d015..bf4966e77e84 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -657,6 +657,7 @@ static const struct spi_device_id spi_nor_ids[] = {
>  	{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
> +	{ "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },

Pushed both to l2-mtd.git.

Brian

Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm7tv-00087N-5Q
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 21:13:59 +0000
Received: by mail-pd0-f176.google.com with SMTP id ft15so1498584pdb.7
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 13:13:37 -0800 (PST)
Date: Wed, 5 Nov 2014 13:13:34 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH 1/1 RFC] mtd: spi-nor: Fix ID for Spansion s70fl01gs
Message-ID: <20141105211334.GV23619@ld-irv-0074>
References: <1411983795-6444-1-git-send-email-alexander.stein@systec-electronic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1411983795-6444-1-git-send-email-alexander.stein@systec-electronic.com>
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 29, 2014 at 11:43:15AM +0200, Alexander Stein wrote:
> The Device ID is the same as with s25fl512s as stated in datasheet:
> 6. Identification (RDID)
> The Read Identification (RDID) command outputs the one-byte manufacturer
> identification, followed by the two-byte device identification and the
> bytes for the Common Flash Interface (CFI) tables. Each die of the FL01GS
> dual die stack will have identical identification data as the FL512S die,
> with the exception of the CFI data at byte 27h, as shown in Table 6.1.
> 
> If DT is configured with 's70fl01gs' I get the following warnings (on a 3.12
> kernel, but that shouldn't matter):
> m25p80 spi32766.0: found s25fl512s, expected s70fl01gs
> m25p80 spi32766.1: found s25fl512s, expected s70fl01gs
> 
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> ---
> I am aware that there is now an ID conflict. But this is due that the
> s70fl01gs simply uses two separate chips. How to handle that?

Maybe you should just be specifying s25fl512s in your DT instead?

Are we sure there are no s70fl01gs devices which use the current ID? I
know some manufacturers are prone to doing the stupidest things you can
think of (like arbitrarily-changing IDs).

> 
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index b5ad6be..0c34968 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -551,7 +551,7 @@ const struct spi_device_id spi_nor_ids[] = {
>  	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
>  	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> -	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
> +	{ "s70fl01gs",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
>  	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },

Brian

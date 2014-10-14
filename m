Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xdvcx-00044S-Vd
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 06:30:37 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/1 RFC] mtd: spi-nor: Fix ID for Spansion s70fl01gs
Date: Tue, 14 Oct 2014 08:30:59 +0200
Message-ID: <6794036.LSxANtVA6R@ws-stein>
In-Reply-To: <1411983795-6444-1-git-send-email-alexander.stein@systec-electronic.com>
References: <1411983795-6444-1-git-send-email-alexander.stein@systec-electronic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ping?

On Monday 29 September 2014 11:43:15, Alexander Stein wrote:
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
> 

-- 
Dipl.-Inf. Alexander Stein

SYS TEC electronic GmbH
Am Windrad 2
08468 Heinsdorfergrund
Tel.: 03765 38600-1156
Fax: 03765 38600-4100
Email: alexander.stein@systec-electronic.com
Website: www.systec-electronic.com
 
Managing Director: Dipl.-Phys. Siegmar Schmidt
Commercial registry: Amtsgericht Chemnitz, HRB 28082

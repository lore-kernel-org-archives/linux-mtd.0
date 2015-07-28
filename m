Received: from mail-out.m-online.net ([212.18.0.10])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK5xK-0004w0-Nk
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 14:34:11 +0000
From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add Pm25LD020 and GD25Q41B chip ID.
Date: Tue, 28 Jul 2015 16:33:47 +0200
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, "
 =?utf-8?q?Rafa=C5=82?= =?utf-8?q?_Mi=C5=82ecki?=" <zajec5@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>, Ben Hutchings <ben@decadent.org.uk>,
 "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= \(beanhuo\)" <beanhuo@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1438073915.git.hramrach@gmail.com>
 <c9120b0590effa9ea7e60ef805782de70b5336ea.1438073915.git.hramrach@gmail.com>
In-Reply-To: <c9120b0590effa9ea7e60ef805782de70b5336ea.1438073915.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201507281633.47322.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, July 28, 2015 at 11:07:58 AM, Michal Suchanek wrote:
> First chip reads Pm25LD020 or Pm25L0020. Found on some WD HDD PCB.
> Identified as PMC Pm25LD020.
> Flash read does not return consistent data which explains why the disk
> died.
> 
> Second chip reads something like 25Q41BT. Found on Esspif ESP8266 based
> ESP-01 board. Identified as Giga Devices GD25Q41B.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index cba3bd0..e55689d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -558,6 +558,7 @@ static const struct spi_device_id spi_nor_ids[] = {
>  	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
> 
>  	/* GigaDevice */
> +	{ "gd25q41b", INFO(0xc84013, 0, 64 * 1024,  8, SECT_4K) },
>  	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "gd25lq32c", INFO(0xc86016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
> @@ -601,6 +602,7 @@ static const struct spi_device_id spi_nor_ids[] = {
>  	/* PMC */
>  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
>  	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
> +	{ "pm25ld020",   INFO(0x7f9d22, 0, 64 * 1024,    4, SECT_4K) },
>  	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64, SECT_4K) },
> 
>  	/* Spansion -- single (large) sector size only, at least

You might want to split this into two patches, but see my comment on 1/2
and please wait for Brian's confirmation there before you do anything.

Thanks!

Best regards,
Marek Vasut

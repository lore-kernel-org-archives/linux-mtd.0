Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZK5wz-000615-FT
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 14:33:50 +0000
From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add GD25LQ32C 1.8V SPI NOR flash ID
Date: Tue, 28 Jul 2015 16:33:19 +0200
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, "
 =?utf-8?q?Rafa=C5=82?= =?utf-8?q?_Mi=C5=82ecki?=" <zajec5@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>, Ben Hutchings <ben@decadent.org.uk>,
 "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= \(beanhuo\)" <beanhuo@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1438073915.git.hramrach@gmail.com>
 <cb552b89554df49d1e6a24ce45b48c9e203f3b37.1438073915.git.hramrach@gmail.com>
In-Reply-To: <cb552b89554df49d1e6a24ce45b48c9e203f3b37.1438073915.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201507281633.19407.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, July 28, 2015 at 11:07:57 AM, Michal Suchanek wrote:
> This 1.8V SPI NOR flash is found on ARM Chromebook XE303C and reads
> something like 25LQ32VIG in the middle.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d78831b..cba3bd0 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -559,6 +559,7 @@ static const struct spi_device_id spi_nor_ids[] = {
> 
>  	/* GigaDevice */
>  	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
> +	{ "gd25lq32c", INFO(0xc86016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },

Don't we have DT bindings, so we can use jedec,spi-nor prop for all
new SPI NORs without growing this table ?

Best regards,
Marek Vasut

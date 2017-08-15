Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dheLE-0007Gy-9n
 for linux-mtd@lists.infradead.org; Tue, 15 Aug 2017 16:05:18 +0000
Subject: Re: [PATCH v4] mtd: spi-nor: add support for GD25Q256
To: Andy Yan <andy.yan@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 computersforpeace@gmail.com, richard@nod.at, dwmw2@infradead.org
References: <1500977574-15915-1-git-send-email-andy.yan@rock-chips.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <fea093e4-9e62-8a36-3801-4cb81520f295@wedev4u.fr>
Date: Tue, 15 Aug 2017 18:04:48 +0200
MIME-Version: 1.0
In-Reply-To: <1500977574-15915-1-git-send-email-andy.yan@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andy,

Le 25/07/2017 à 12:12, Andy Yan a écrit :
> Add support for GD25Q256, a 32MiB SPI Nor
> flash from Gigadevice.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - add SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB

Between v3 and v4, I see that you've also changed the procedure to the
the Quad Enable bit on all Gigadevice memories with QSPI capabilities.
This is not a detail and should have been reported here.

> 
> Changes in v3:
> - rebase on top of spi-nor tree
> - add SPI_NOR_4B_OPCODES flag
> 
> Changes in v2:
> - drop one line unnecessary modification
> 
>  drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 196b52f..e4145cd 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -986,6 +986,11 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  	},
> +	{
> +		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +	},
>  
>  	/* Intel/Numonyx -- xxxs33b */
>  	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
> @@ -2365,6 +2370,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
>  				   SNOR_HWCAPS_PP_QUAD)) {
>  		switch (JEDEC_MFR(info)) {
>  		case SNOR_MFR_MACRONIX:
> +		case SNOR_MFR_GIGADEVICE:
>  			params->quad_enable = macronix_quad_enable;

Here, you've have changed the Quad Enable requirement for *all*
Gigadevice memories with Quad SPI capabilities.

However, I'm reading the GD25Q128 datasheet and it claims that the QE
bit is BIT(1) of the Status Register 2. Hence some
spansion*_quad_enable() should be used, as before your patch.

Then, still according to the datasheet, the GD25Q128 memory is compliant
with the JESD216 specification (minor 0) but neither with rev A (minor
5) nor rev B (minor 6).
So its Basic Flash Parameter Table is limited to 9 DWORDs instead of 16
DWORDs, hence doesn't provide the Quad Enable requirements. It means
that the SFDP tables would not help to select the right _quad_enable()
function by overriding the choice made by the switch() statement above.

tl;dr
This chunk would introduce a regression with some already supported
Gigadevice memories. So I reject this patch, sorry.

Best regards,

Cyrille

>  			break;
>  
> 

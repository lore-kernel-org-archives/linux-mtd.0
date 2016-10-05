Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brl4e-0008Ss-9z
 for linux-mtd@lists.infradead.org; Wed, 05 Oct 2016 12:13:25 +0000
Subject: Re: [PATCH 2/9] mtd: spi-nor: add an alternative method to support
 memory >16MiB
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
References: <cover.1475597385.git.cyrille.pitchen@atmel.com>
 <75db6c008249df8d0646ea5006648e57fea40706.1475597385.git.cyrille.pitchen@atmel.com>
CC: <marex@denx.de>, <boris.brezillon@free-electrons.com>,
 <nicolas.ferre@atmel.com>, <linux-kernel@vger.kernel.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <d35f2b66-1915-8111-9187-cdc49417f787@ti.com>
Date: Wed, 5 Oct 2016 17:42:50 +0530
MIME-Version: 1.0
In-Reply-To: <75db6c008249df8d0646ea5006648e57fea40706.1475597385.git.cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


On Tuesday 04 October 2016 10:07 PM, Cyrille Pitchen wrote:
[...]
>  static struct seq_rw_config stfsm_s25fl_write4_configs[] = {
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 5c87b2d99507..423448c1c7a8 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -75,6 +75,10 @@ struct flash_info {
>  					 * bit. Must be used with
>  					 * SPI_NOR_HAS_LOCK.
>  					 */
> +#define SPI_NOR_4B_OPCODES	BIT(10)	/*
> +					 * Use dedicated 4byte address op codes
> +					 * to support memory size above 128Mib.
> +					 */


I don't see this flag being added to any flash_info data for any m25p80
compatible flashes? Is that part of a separate series?

-- 
Regards
Vignesh

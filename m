Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vj47m-0001Oe-1S
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2013 09:31:07 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
Date: Wed, 20 Nov 2013 10:30:41 +0100
References: <1384937569-23893-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1384937569-23893-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201311201030.41222.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, sourav.poddar@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> This chip supports the quad read.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/devices/m25p80.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 7dc2c14..720899b 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -941,6 +941,7 @@ static const struct spi_device_id m25p_ids[] = {
>  	 */
>  	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
>  	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
> +	{ "s25fl128s",	INFO(0x012018, 0x4d01,  64 * 1024, 256, 
M25P80_QUAD_READ)

The entry looks correct.

Acked-by: Marek Vasut <marex@denx.de>

Thanks!

Best regards,
Marek Vasut

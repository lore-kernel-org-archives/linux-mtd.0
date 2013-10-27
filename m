Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VaTTp-00026L-PR
 for linux-mtd@lists.infradead.org; Sun, 27 Oct 2013 16:46:22 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: m25p80: add support for Macronix mx25l3255e
Date: Sun, 27 Oct 2013 17:45:59 +0100
References: <1382568003-2356-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1382568003-2356-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310271745.59262.marex@denx.de>
Cc: Peter Korsgaard <peter@korsgaard.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian Norris,

> A new 32Mbit SPI NOR flash from Macronix. Nothing special.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marex@denx.de>

Nothing special :)

Reviewed-by: Marek Vasut <marex@denx.de>

> ---
> v2: correct "Gbit" to "MBit" in patch description
> 
>  drivers/mtd/devices/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 8d6c87be..72c37f0 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -778,6 +778,7 @@ static const struct spi_device_id m25p_ids[] = {
>  	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
>  	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
>  	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, 0) },
> +	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, 0) },
>  	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },

Best regards,
Marek Vasut

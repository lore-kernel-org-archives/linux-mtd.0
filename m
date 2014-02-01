Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W9QD2-0003cJ-GG
 for linux-mtd@lists.infradead.org; Sat, 01 Feb 2014 02:21:29 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: add Macronix mx66l1g55g 1Gbit SPI flash
Date: Sat, 1 Feb 2014 02:35:27 +0100
References: <1391031826-28794-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1391031826-28794-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201402010235.27291.marex@denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, January 29, 2014 at 10:43:46 PM, Brian Norris wrote:
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 1e147a849c35..5124b649d68c 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -940,6 +940,7 @@ static const struct spi_device_id m25p_ids[] = {
>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, M25P80_QUAD_READ) },
> +	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, M25P80_QUAD_READ) },

Well it does make sense, doesn't it ? :)

Acked-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut

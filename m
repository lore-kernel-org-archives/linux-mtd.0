Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dXuzW-0001G0-79
 for linux-mtd@lists.infradead.org; Wed, 19 Jul 2017 19:50:39 +0000
Date: Wed, 19 Jul 2017 21:50:16 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org, Mika Westerberg
 <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] lpc_ich: Avoton/Rangeley uses SPI_BYT method.
Message-ID: <20170719215016.627ade1e@bbrezillon>
In-Reply-To: <20170718120145.13585-1-joakim.tjernlund@infinera.com>
References: <20170718120145.13585-1-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 18 Jul 2017 14:01:45 +0200
Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote:

> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> ---
>  drivers/mfd/lpc_ich.c | 1 +

This patch touches an MFD driver and you're Ccing the MTD mailing list,
I guess this is a mistake :-).

>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index 985135828cfc..023d88dfad0e 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich.c
> @@ -532,6 +532,7 @@ static struct lpc_ich_info lpc_chipset_info[] = {
>  		.name = "Avoton SoC",
>  		.iTCO_version = 3,
>  		.gpio_version = AVOTON_GPIO,
> +		.spi_type = INTEL_SPI_BYT,
>  	},
>  	[LPC_BAYTRAIL] = {
>  		.name = "Bay Trail SoC",

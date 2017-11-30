Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKWUJ-0002VM-Rh
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 21:35:21 +0000
Date: Thu, 30 Nov 2017 22:34:56 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>, Richard
 Weinberger <richard@nod.at>, kernel@pengutronix.de
Subject: Re: [PATCH] mtd: nand: gpmi-nand: Remove wrong Kconfig help text
Message-ID: <20171130223456.1c5c0db6@bbrezillon>
In-Reply-To: <20171117110912.24305-1-s.hauer@pengutronix.de>
References: <20171117110912.24305-1-s.hauer@pengutronix.de>
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

On Fri, 17 Nov 2017 12:09:12 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> The GPMI nand Kconfig help texts mentions that the GPMI nand driver
> might conflict with SD cards. The only conflict there might really
> be is that both controllers use the same pins, but this is resolved
> by the pincontroller setup in the device tree. In any way the GPMI
> driver can safely be enabled, the text is just wrong. Remove it.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/Kconfig | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 3f2036f31da4..8f4c288cf9f1 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -373,9 +373,7 @@ config MTD_NAND_GPMI_NAND
>  	 Enables NAND Flash support for IMX23, IMX28 or IMX6.
>  	 The GPMI controller is very powerful, with the help of BCH
>  	 module, it can do the hardware ECC. The GPMI supports several
> -	 NAND flashs at the same time. The GPMI may conflicts with other
> -	 block, such as SD card. So pay attention to it when you enable
> -	 the GPMI.
> +	 NAND flashs at the same time.
>  
>  config MTD_NAND_BRCMNAND
>  	tristate "Broadcom STB NAND controller"

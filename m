Received: from mo-p00-ob.rzone.de ([81.169.146.162])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HitAG-0005tD-LD
	for linux-mtd@lists.infradead.org; Tue, 01 May 2007 10:17:13 -0400
From: Stefan Roese <ml@stefan-roese.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [patch] generic nand driver for SoCs
Date: Tue, 1 May 2007 16:17:21 +0200
References: <46373163.7060603@gmail.com>
In-Reply-To: <46373163.7060603@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200705011617.21532.ml@stefan-roese.de>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Vitaly Wool <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 01 May 2007 14:24, Vitaly Wool wrote:
> Index: linux-2.6/drivers/mtd/nand/Kconfig
> ===================================================================
> --- linux-2.6.orig/drivers/mtd/nand/Kconfig
> +++ linux-2.6/drivers/mtd/nand/Kconfig
> @@ -277,4 +277,16 @@ config MTD_NAND_PLATFORM
>  	help
>  	  This driver enables support for common on-SoC NAND devices.
>
> +config MTD_NAND_PLATFORM
> +	tristate "Support for generic NAND driver"
> +	depends on MTD_NAND
> +	help
> +	  This driver enables support for common on-SoC NAND devices.
> +
> +config MTD_NAND_PLATFORM
> +	tristate "Support for generic NAND driver"
> +	depends on MTD_NAND
> +	help
> +	  This driver enables support for common on-SoC NAND devices.
> +

One "config MTD_NAND_PLATFORM" should be enough, don't you think? ;-)

Best regards,
Stefan

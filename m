Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cYBCG-0003dL-2X
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2017 12:36:37 +0000
Date: Mon, 30 Jan 2017 13:36:14 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-mtd@lists.infradead.org, Rob Herring <robh@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH] mtd: nand: Add OX820 NAND hardware dependency
Message-ID: <20170130133614.4e46c164@bbrezillon>
In-Reply-To: <20170109115814.022fd08f@endymion>
References: <20170109115814.022fd08f@endymion>
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

On Mon, 9 Jan 2017 11:58:14 +0100
Jean Delvare <jdelvare@suse.de> wrote:

> The oxnas NAND driver is only needed for a specific platform, do
> not propose it on other platforms unless build-testing.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: 668592492409 ("mtd: nand: Add OX820 NAND Support")
> Cc: Rob Herring <robh@kernel.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---
>  drivers/mtd/nand/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-4.10-rc2.orig/drivers/mtd/nand/Kconfig	2017-01-09 11:44:05.151733169 +0100
> +++ linux-4.10-rc2/drivers/mtd/nand/Kconfig	2017-01-09 11:44:32.431065848 +0100
> @@ -426,6 +426,7 @@ config MTD_NAND_ORION
>  
>  config MTD_NAND_OXNAS
>  	tristate "NAND Flash support for Oxford Semiconductor SoC"
> +	depends on ARCH_OXNAS || COMPILE_TEST
>  	help
>  	  This enables the NAND flash controller on Oxford Semiconductor SoCs.
>  
> 
> 

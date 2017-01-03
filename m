Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOKJn-0003Iz-3P
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 08:19:40 +0000
Date: Tue, 3 Jan 2017 09:19:15 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, john@phrozen.org, stable@vger.kernel.org
Subject: Re: [PATCH V2 1/2] mtd: nand: xway: disable module support
Message-ID: <20170103091915.50673027@bbrezillon>
In-Reply-To: <20161205211437.29489-1-hauke@hauke-m.de>
References: <20161205211437.29489-1-hauke@hauke-m.de>
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

On Mon,  5 Dec 2016 22:14:36 +0100
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> The xway_nand driver accesses the ltq_ebu_membase symbol which is not
> exported. This also should not get exported and we should handle the
> EBU interface in a better way later. This quick fix just deactivated
> support for building as module.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Applied both to nand/fixes. They should appear in one of the next -rc
(probably not -rc3 though).

Thanks,

Boris

> ---
>  drivers/mtd/nand/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 7b7a887..b254090 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -537,7 +537,7 @@ config MTD_NAND_FSMC
>  	  Flexible Static Memory Controller (FSMC)
>  
>  config MTD_NAND_XWAY
> -	tristate "Support for NAND on Lantiq XWAY SoC"
> +	bool "Support for NAND on Lantiq XWAY SoC"
>  	depends on LANTIQ && SOC_TYPE_XWAY
>  	help
>  	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is attached

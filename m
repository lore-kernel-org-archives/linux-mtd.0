Received: from mail-wj0-x22d.google.com ([2a00:1450:400c:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cNy3w-0003t8-Dk
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2017 08:33:49 +0000
Received: by mail-wj0-x22d.google.com with SMTP id c11so215240658wjx.3
 for <linux-mtd@lists.infradead.org>; Mon, 02 Jan 2017 00:33:26 -0800 (PST)
Subject: Re: [PATCH] mtd: nand: oxnas_nand: fix build errors on arch/um,
 require HAS_IOMEM
To: Randy Dunlap <rdunlap@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
References: <8a756f24-4c18-690c-b898-03ecf3d71c84@infradead.org>
Cc: kbuild test robot <fengguang.wu@intel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 user-mode-linux-devel@lists.sourceforge.net
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <271b3ede-b784-07f2-8028-19be4ea7fcbd@baylibre.com>
Date: Mon, 2 Jan 2017 09:33:27 +0100
MIME-Version: 1.0
In-Reply-To: <8a756f24-4c18-690c-b898-03ecf3d71c84@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/02/2017 03:58 AM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build errors on arch/um, which does not support HAS_IOMEM,
> while the oxnas_nand.c driver uses interfaces that are
> supplied by HAS_IOMEM.
> 
> (loadable module build:)
> ERROR: "devm_ioremap_resource" [drivers/mtd/nand/oxnas_nand.ko] undefined!
> or (built-in build:)
> drivers/built-in.o: In function `oxnas_nand_probe':
> drivers/mtd/nand/oxnas_nand.c:102: undefined reference to `devm_ioremap_resource'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc:	Jeff Dike <jdike@addtoit.com>
> Cc:	Richard Weinberger <richard@nod.at>
> Cc:	user-mode-linux-devel@lists.sourceforge.net
> Cc:	linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/nand/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- lnx-410-rc2.orig/drivers/mtd/nand/Kconfig
> +++ lnx-410-rc2/drivers/mtd/nand/Kconfig
> @@ -426,6 +426,7 @@ config MTD_NAND_ORION
>  
>  config MTD_NAND_OXNAS
>  	tristate "NAND Flash support for Oxford Semiconductor SoC"
> +	depends on HAS_IOMEM
>  	help
>  	  This enables the NAND flash controller on Oxford Semiconductor SoCs.
>  
> 

Thanks Randy,

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

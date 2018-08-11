Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1foSmN-0006rx-50
 for linux-mtd@lists.infradead.org; Sat, 11 Aug 2018 12:14:01 +0000
Date: Sat, 11 Aug 2018 14:13:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] mtd: rawnand: atmel: Add dependency on GENERIC_ALLOCATOR
Message-ID: <20180811141329.237ba017@windsurf>
In-Reply-To: <20180811104022.23446-1-boris.brezillon@bootlin.com>
References: <20180811104022.23446-1-boris.brezillon@bootlin.com>
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

Hello,

On Sat, 11 Aug 2018 12:40:22 +0200, Boris Brezillon wrote:
> The driver uses genalloc functions. Add a dependency on
> GENERIC_ALLOCATOR to prevent build errors when selected through
> COMPILE_TEST.
> 
> Fixes: 88a40e7dca00 ("mtd: rawnand: atmel: Allow selection of this driver when COMPILE_TEST=y")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index b6738ece16f1..0c3cc3e8e144 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -278,7 +278,7 @@ config MTD_NAND_CS553X
>  config MTD_NAND_ATMEL
>  	tristate "Support for NAND Flash / SmartMedia on AT91"
>  	depends on ARCH_AT91 || COMPILE_TEST
> -	depends on HAS_IOMEM
> +	depends on HAS_IOMEM && GENERIC_ALLOCATOR

I think this kind of dependency should use a "select".

$ git grep "select.*GENERIC_ALLOCATOR" | wc -l
28
$ git grep "depends.*GENERIC_ALLOCATOR" | wc -l
1

It makes sense as it is a kind of "library" of functions, there's no
reason for the user to be aware of this dependency. HAS_IOMEM is
different, because it's a property of the architecture/platform.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

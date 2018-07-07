Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbpC5-0002Vs-AW
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 15:32:19 +0000
Date: Sat, 7 Jul 2018 17:32:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, Miquel
 Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 05/27] mtd: rawnand: s3c2410: Allow selection of this
 driver when COMPILE_TEST=y
Message-ID: <20180707173203.2a9eb05f@bbrezillon>
In-Reply-To: <20180705094522.12138-6-boris.brezillon@bootlin.com>
References: <20180705094522.12138-1-boris.brezillon@bootlin.com>
 <20180705094522.12138-6-boris.brezillon@bootlin.com>
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

On Thu,  5 Jul 2018 11:45:00 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> It just makes NAND maintainers' life easier by allowing them to
> compile-test this driver without having ARCH_S3C24XX or ARCH_S3C64XX
> enabled.
> 
> We also need to add a dependency on HAS_IOMEM to make sure the driver
> compiles correctly.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index c6764992cdfc..033900c0c618 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -119,7 +119,8 @@ config MTD_NAND_AU1550
>  
>  config MTD_NAND_S3C2410
>  	tristate "NAND Flash support for Samsung S3C SoCs"
> -	depends on ARCH_S3C24XX || ARCH_S3C64XX
> +	depends on ARCH_S3C24XX || ARCH_S3C64XX || COMPILE_TEST
> +	depends on HAS_IOMEM

Looks like ia64 does not define {read,write}s{b,w,l}() IO accessors.
I'll just add a 'depends on !IA64' on both s3c2410 and orion to
address that.

>  	help
>  	  This enables the NAND flash controller on the S3C24xx and S3C64xx
>  	  SoCs

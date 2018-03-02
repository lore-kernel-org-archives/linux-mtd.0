Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ersmd-0003Pi-DO
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 22:04:09 +0000
Date: Fri, 2 Mar 2018 23:03:53 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: makes the Kconfig entry clear when it
 comes to raw NANDs
Message-ID: <20180302230353.2455c6fd@bbrezillon>
In-Reply-To: <20180302144036.3341-1-miquel.raynal@bootlin.com>
References: <20180302144036.3341-1-miquel.raynal@bootlin.com>
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

On Fri,  2 Mar 2018 15:40:36 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Files have been moved in the NAND subsystem to reflect the different
> flavors of NAND devices.
> 
> Raw NAND devices have been moved to a "raw" subdirectory to make the
> difference with OneNAND and SPI NAND for instance. So adjust the Kconfig
> entry to clarify things.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index e6b8c59f2c0d..3a592461a87e 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -11,11 +11,11 @@ config MTD_NAND_ECC_SMC
>  
>  
>  menuconfig MTD_NAND
> -	tristate "NAND Device Support"
> +	tristate "RawNAND Device Support"

Looks like a brand name when you concatenate 'Raw' and 'NAND' like that
(similar to OneNAND). Can we replace that by "Raw/Parallel NAND Device
Support"

>  	depends on MTD
>  	select MTD_NAND_ECC
>  	help
> -	  This enables support for accessing all type of NAND flash
> +	  This enables support for accessing all type of raw NAND flash
>  	  devices. For further information see
>  	  <http://www.linux-mtd.infradead.org/doc/nand.html>.
>  



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

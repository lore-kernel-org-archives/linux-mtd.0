Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y62BE-0005Lt-WA
 for linux-mtd@lists.infradead.org; Tue, 30 Dec 2014 19:10:10 +0000
Date: Tue, 30 Dec 2014 20:09:46 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH RFC v2] mtd: nand: add asm9260 NFC driver
Message-ID: <20141230200946.277c56c0@bbrezillon>
In-Reply-To: <1419962972-5845-1-git-send-email-linux@rempel-privat.de>
References: <20141217171552.27fb9ce8@bbrezillon>
 <1419962972-5845-1-git-send-email-linux@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Oleksij,

I haven't reviewed the driver code yet, but highlighted warnings
reported by checkpatch.
I'll try to give a full review soon.

On Tue, 30 Dec 2014 19:09:32 +0100
Oleksij Rempel <linux@rempel-privat.de> wrote:

> Add driver for Nand Flash Controller used on Alphascales ASM9260 chips.
> The IP core of this controller has some similarities with
> Evatronix NANDFLASH-CTRL IP (unkown revision), so probably it can be reused

WARNING: 'unkown' may be misspelled - perhaps 'unknown'?
#20: 
Evatronix NANDFLASH-CTRL IP (unkown revision), so probably it can be
reused

> by some other SoCs.
> 
> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> ---
>  drivers/mtd/nand/Kconfig        |   7 +
>  drivers/mtd/nand/Makefile       |   1 +
>  drivers/mtd/nand/asm9260_nand.c | 989 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 997 insertions(+)
>  create mode 100644 drivers/mtd/nand/asm9260_nand.c
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index dd10646..580a608 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -41,6 +41,13 @@ config MTD_SM_COMMON
>  	tristate
>  	default n
>  
> +config MTD_NAND_ASM9260
> +	tristate "NFC support for ASM9260 SoC"
> +	depends on OF
> +	default n
> +	help
> +	  Enable support for the NAND controller found on Alphascale ASM9260 SoC.
> +
>  config MTD_NAND_DENALI
>          tristate "Support Denali NAND controller"
>          depends on HAS_DMA
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 9c847e4..08d660a 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile

[...]

> +
> +static int __init asm9260_nand_cached_config(struct asm9260_nand_priv *priv)
> +{
> +	struct nand_chip *nand = &priv->nand;
> +	struct mtd_info *mtd = &priv->mtd;
> +	u32 addr_cycles, col_cycles, pages_per_block;
> +
> +	pages_per_block = mtd->erasesize / mtd->writesize;
> +	/* max 256P, min 32P */
> +	if (pages_per_block & ~(0x000001e0)) {
> +		dev_err(priv->dev, "Unsuported erasesize 0x%x\n",

WARNING: 'Unsuported' may be misspelled - perhaps 'Unsupported'?
#732: FILE: drivers/mtd/nand/asm9260_nand.c:666:
+		dev_err(priv->dev, "Unsuported erasesize 0x%x\n",

> +				mtd->erasesize);
> +		return -EINVAL;
> +	}
> +
> +	/* max 32K, min 256. */
> +	if (mtd->writesize & ~(0x0000ff00)) {
> +		dev_err(priv->dev, "Unsuported writesize 0x%x\n",

Ditto

> +				mtd->erasesize);
> +		return -EINVAL;
> +	}
> +

[...]

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id asm9260_nand_match[] = {
> +	{
> +		.compatible   = "alphascale,asm9260-nand",

WARNING: DT compatible string "alphascale,asm9260-nand" appears
un-documented -- check ./Documentation/devicetree/bindings/ #1036:
FILE: drivers/mtd/nand/asm9260_nand.c:970:
+		.compatible   = "alphascale,asm9260-nand",


Add a patch documenting the DT bindings used by your driver.


WARNING: DT compatible string vendor "alphascale" appears un-documented
-- check ./Documentation/devicetree/bindings/vendor-prefixes.txt #1036:
FILE: drivers/mtd/nand/asm9260_nand.c:970:
+		.compatible   = "alphascale,asm9260-nand",


Regards,

Boris
-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

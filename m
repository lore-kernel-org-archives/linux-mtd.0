Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y14RE-0003Y5-Cw
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 02:34:09 +0000
Received: by mail-pd0-f173.google.com with SMTP id ft15so15134089pdb.4
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 18:33:47 -0800 (PST)
Date: Tue, 16 Dec 2014 18:33:44 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 2/2] mtd: map_rom: Support UBI on ROM
Message-ID: <20141217023344.GS9759@ld-irv-0074>
References: <1683475520.65208.1411665491176.JavaMail.zimbra@xes-inc.com>
 <673100209.65720.1411665624206.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <673100209.65720.1411665624206.JavaMail.zimbra@xes-inc.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Aaron,

I see this has been sitting around way too long...

On Thu, Sep 25, 2014 at 12:20:24PM -0500, Aaron Sierra wrote:
> UBI needs to know the physical erase block size, even on read-only
> devices, since it defines the on-device layout. Use a device-tree
> provided value to support previously written UBI on read-only NOR.
> 
> UBI also needs a non-zero writebufsize, so we set it to one.

Hmm, this one is a pretty big bug IIRC (don't you get an OOPS or
BUG()?). Do you think it might be worth splitting into a separate patch
and sending to stable?

But then I'm curious: how do you get anything useful out of using UBI on
a read-only device? You don't need to (and can't) handle anything like
read disturb, and there's no write wear that needs to be leveled.

> 
> Note: This was implemented because hardware write-protected CFI
>       NOR cannot be probed for the physical erase block size.
> 
> Signed-off-by: Joe Schultz <jschultz@xes-inc.ccom>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.ccom>
> ---
>  Documentation/devicetree/bindings/mtd/mtd-physmap.txt |  5 +++++
>  drivers/mtd/chips/map_rom.c                           | 13 ++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> index 6b9f680..8ab16df 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> @@ -36,6 +36,11 @@ are defined:
>   - vendor-id : Contains the flash chip's vendor id (1 byte).
>   - device-id : Contains the flash chip's device id (1 byte).
>  
> +For ROM compatible devices (and ROM fallback from cfi-flash), the following
> +additional property is defined:
> +
> + - erase-size : The chip's physical erase block size in bytes.
> +
>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.
>  
> diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
> index 47a43cf..a831265 100644
> --- a/drivers/mtd/chips/map_rom.c
> +++ b/drivers/mtd/chips/map_rom.c
> @@ -11,6 +11,7 @@
>  #include <linux/errno.h>
>  #include <linux/slab.h>
>  #include <linux/init.h>
> +#include <linux/of.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/map.h>
>  
> @@ -28,6 +29,15 @@ static struct mtd_chip_driver maprom_chipdrv = {
>  	.module	= THIS_MODULE
>  };
>  
> +static unsigned int default_erasesize(struct map_info *map)
> +{
> +	const __be32 *erase_size = NULL;
> +#ifdef CONFIG_OF
> +	erase_size = of_get_property(map->device_node, "erase-size", NULL);
> +#endif

I think you can just drop the #ifdef and have the same effect, no?

> +	return !erase_size ? map->size : be32_to_cpu(*erase_size);
> +}
> +
>  static struct mtd_info *map_rom_probe(struct map_info *map)
>  {
>  	struct mtd_info *mtd;
> @@ -47,8 +57,9 @@ static struct mtd_info *map_rom_probe(struct map_info *map)
>  	mtd->_sync = maprom_nop;
>  	mtd->_erase = maprom_erase;
>  	mtd->flags = MTD_CAP_ROM;
> -	mtd->erasesize = map->size;
> +	mtd->erasesize = default_erasesize(map);
>  	mtd->writesize = 1;
> +	mtd->writebufsize = 1;
>  
>  	__module_get(THIS_MODULE);
>  	return mtd;

Brian

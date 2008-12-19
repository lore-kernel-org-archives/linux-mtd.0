Received: from smtp6-g19.free.fr ([212.27.42.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDcps-00019i-Kp
	for linux-mtd@lists.infradead.org; Fri, 19 Dec 2008 10:44:01 +0000
Message-ID: <494B3DF4.90306@free.fr>
Date: Fri, 19 Dec 2008 07:23:48 +0100
From: Chris Moore <moore@free.fr>
MIME-Version: 1.0
To: Marc Singer <elf@synapse.com>
Subject: Re: [PATCH] Revised the detection for broken boot-region detection.
	MACRONIX parts have a custom implementation of the fixup.
	AMD	implemtation
	restore to original version that has worked fine since	2001.
References: <20081216205650.GA13729@zealous.synapse.com>
In-Reply-To: <20081216205650.GA13729@zealous.synapse.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NACK

See also the discussion in a parallel thread.

Marc Singer a écrit :
> Signed-off-by: Marc Singer <elf@zealous.synapse.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   96 ++++++++++++++++++++++-------------
>  1 files changed, 60 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index d74ec46..4f1b445 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -136,7 +136,21 @@ static void cfi_tell_features(struct cfi_pri_amdstd *extp)
>  #endif
>  
>  #ifdef AMD_BOOTLOC_BUG
> -/* Wheee. Bring me the head of someone at AMD. */
> +/* Wheee. Bring me the head of someone at AMD,
> +   and another from Macronix...just for good measure. */
> +
> +/* Some early AMD NOR flash parts (AM29LV160D, e.g.) and much
> + * more recent and inexcusably broken Macronix parts, do not
> + * accurately report whether or not the device is top-boot or
> + * bottom-boot in the CFI PRI data.  This detail is important
> + * to correctly sort the erase region information.  So, for
> + * CFI versions < 1.1 where we do not trust the veracity of
> + * the CFI PRI data, we look for explicit manufacturer/device
> + * IDs when we know them or for the high bit of the device ID.
> + * The latter test has been working reliably since 2001 even
> + * though we don't have documentation to support this as a
> + * convention. */
> +
>  static void fixup_amd_bootblock(struct mtd_info *mtd, void* param)
>  {
>  	struct map_info *map = mtd->priv;
> @@ -148,43 +162,53 @@ static void fixup_amd_bootblock(struct mtd_info *mtd, void* param)
>  	if (((major << 8) | minor) < 0x3131) {
>  		/* CFI version 1.0 => don't trust bootloc */
>  
> +                extp->TopBottom = (cfi->id & 0x80)
> +                        ? 3 /* top-boot */
> +                        : 2 /* bottom-boot */;
> +
>  		DEBUG(MTD_DEBUG_LEVEL1,
> -			"%s: JEDEC Vendor ID is 0x%02X Device ID is 0x%02X\n",
> -			map->name, cfi->mfr, cfi->id);
> +                      "%s: CFI PRI V%c.%c has no boot block field;"
> +                      " deduced %s from Mfr/Device ID %0x/%0x\n",
> +                      map->name, major, minor,
> +                      extp->TopBottom == 2 ? "bottom" : "top",
> +                      cfi->mfr, cfi->id);
> +	}
> +}
>  
> -		/* AFAICS all 29LV400 with a bottom boot block have a device ID
> -		 * of 0x22BA in 16-bit mode and 0xBA in 8-bit mode.
> -		 * These were badly detected as they have the 0x80 bit set
> -		 * so treat them as a special case.
> -		 */
> -		if (((cfi->id == 0xBA) || (cfi->id == 0x22BA)) &&
> -
> -			/* Macronix added CFI to their 2nd generation
> -			 * MX29LV400C B/T but AFAICS no other 29LV400 (AMD,
> -			 * Fujitsu, Spansion, EON, ESI and older Macronix)
> -			 * has CFI.
> -			 *
> -			 * Therefore also check the manufacturer.
> -			 * This reduces the risk of false detection due to
> -			 * the 8-bit device ID.
> -			 */
> -			(cfi->mfr == MANUFACTURER_MACRONIX)) {
> -			DEBUG(MTD_DEBUG_LEVEL1,
> -				"%s: Macronix MX29LV400C with bottom boot block"
> -				" detected\n", map->name);
> -			extp->TopBottom = 2;	/* bottom boot */
> -		} else
> -		if (cfi->id & 0x80) {
> -			printk(KERN_WARNING "%s: JEDEC Device ID is 0x%02X. Assuming broken CFI table.\n", map->name, cfi->id);
> -			extp->TopBottom = 3;	/* top boot */
> -		} else {
> -			extp->TopBottom = 2;	/* bottom boot */
> -		}
> +static void fixup_macronix_bootblock(struct mtd_info *mtd, void* param)
> +{
> +	struct map_info *map = mtd->priv;
> +	struct cfi_private *cfi = map->fldrv_priv;
> +	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
> +	__u8 major = extp->MajorVersion;
> +	__u8 minor = extp->MinorVersion;
> +
> +	if (((major << 8) | minor) < 0x3131) {
> +		/* CFI version 1.0 => don't trust bootloc */
>  
> +                switch (cfi->id) {
> +                                /* Macronix MX29LV400CT */
>   

This comment is wrong and should be:

+                                /* Macronix MX29LV400CB */


> +                case 0x00ba:
> +                case 0x22ba:
> +                        extp->TopBottom = 2;                 /* bottom-boot */
> +                        break;
>   

These cases are unnecessary as they are covered by your default case below.

> +                        	/* Macronix MX29LV400CB */
>   

This comment is wrong and should be:

+                                /* Macronix MX29LV400CT */


> +                case 0x00b9:
> +                case 0x22b9:
> +                        extp->TopBottom = 3;                 /* top-boot */
> +                        break;
> +                default:
> +                                /* Fall back is to assume we have
> +                                 * bottom-boot. */
> +                        extp->TopBottom = 2; /* bottom-boot */
> +                        break;
> +                }
>   

This switch code is not equivalent to the original and breaks support 
for the following Macronix parts:
MX28F640C3B T
MX29LV004C  T
MX29LV800C  T
MX29LV160C  T
MX29SL800C  T
MX29SL802C  T

I would prefer something like this (untested):-

+                switch (cfi->id) {
+                                /* Macronix MX29LV400CB */
+                case 0x00ba:
+                case 0x22ba:
+                        extp->TopBottom = 2;                 /* bottom-boot */
+                        break;
+                default:
+                        extp->TopBottom = (cfi->id & 0x80)
+                                ? 3 /* top-boot */
+                                : 2 /* bottom-boot */;
+                        break;
+                }


>  		DEBUG(MTD_DEBUG_LEVEL1,
> -			"%s: AMD CFI PRI V%c.%c has no boot block field;"
> -			" deduced %s from Device ID\n", map->name, major, minor,
> -			extp->TopBottom == 2 ? "bottom" : "top");
> +                      "%s: CFI PRI V%c.%c has no boot block field;"
> +                      " deduced %s from Mfr/Device ID %0x/%0x\n",
> +                      map->name, major, minor,
> +                      extp->TopBottom == 2 ? "bottom" : "top",
> +                      cfi->mfr, cfi->id);
>  	}
>  }
>  #endif
> @@ -286,7 +310,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
>  	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
>  #ifdef AMD_BOOTLOC_BUG
>  	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
> -	{ MANUFACTURER_MACRONIX, CFI_ID_ANY, fixup_amd_bootblock, NULL },
> +	{ MANUFACTURER_MACRONIX, CFI_ID_ANY, fixup_macronix_bootblock, NULL },
>  #endif
>  	{ CFI_MFR_AMD, 0x0050, fixup_use_secsi, NULL, },
>  	{ CFI_MFR_AMD, 0x0053, fixup_use_secsi, NULL, },
>   

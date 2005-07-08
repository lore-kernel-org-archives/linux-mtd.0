Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DqyiR-0003TC-7D
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2005 15:40:55 -0400
Date: Fri, 8 Jul 2005 21:40:47 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Koen Martens <gmc@sonologic.nl>
Message-ID: <20050708194047.GB30728@wohnheim.fh-wedel.de>
References: <42CA962D.8060605@sonologic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42CA962D.8060605@sonologic.nl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] support for broken EON chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 5 July 2005 16:16:13 +0200, Koen Martens wrote:
> 
> Ok, here goes nothing. Go ahead, kill me :)

Boom, you're dead. :)

> Comments very welcome, since i don't have a clue atm about how to do this nicely. If all goes well i might have some time to add more EON chips to jedec_probe soon. The patch below is against cvs..

Patch is quite small, that's good.

> diff -Naur mtd-orig/drivers/mtd/chips/cfi_probe.c mtd/drivers/mtd/chips/cfi_probe.c
> --- mtd-orig/drivers/mtd/chips/cfi_probe.c	2004-11-16 19:19:02.000000000 +0100
> +++ mtd/drivers/mtd/chips/cfi_probe.c	2005-07-05 15:35:19.000000000 +0200
> @@ -231,7 +231,19 @@
>  	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
>  	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
>  	cfi->mfr = cfi_read_query(map, base);
> +#ifdef CONFIG_MTD_EON
> +        if(cfi->mfr==0x7f) {
> +          cfi->mfr = cfi_read_query(map, base + (0x100*ofs_factor));
> +        }
> +#endif  
>  	cfi->id = cfi_read_query(map, base + ofs_factor);    
> +#ifdef CONFIG_MTD_EON
> +        if(cfi->mfr==0x1c && (cfi->id==0xb9 || cfi->id==0xba)) {
> +          kfree(cfi->cfiq);
> +          return 0;
> +        }
> +#endif  
> +
>  
>  	/* Put it back into Read Mode */
>  	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);

This is an ugly ugly hack.  But also a nice starting point.  As you
already know from irc, I'd prefer something like:

cfi_probe   \
             >---> register_chip
jedec_probe /

But that is clearly more work and a much larger patch.  For the
moment, I'm fine with the hack.

> diff -Naur mtd-orig/drivers/mtd/chips/jedec_probe.c mtd/drivers/mtd/chips/jedec_probe.c
> --- mtd-orig/drivers/mtd/chips/jedec_probe.c	2005-03-17 21:09:51.000000000 +0100
> +++ mtd/drivers/mtd/chips/jedec_probe.c	2005-07-05 15:32:33.000000000 +0200
> @@ -38,6 +38,7 @@
>  #define MANUFACTURER_ST		0x0020
>  #define MANUFACTURER_TOSHIBA	0x0098
>  #define MANUFACTURER_WINBOND	0x00da
> +#define MANUFACTURER_EON        0x001c
>  
>  
>  /* AMD */
> @@ -166,6 +167,8 @@
>  /* Winbond */
>  #define W49V002A	0x00b0
>  
> +/* EON */
> +#define EON29LV400BB    0x22BA
>  
>  /*
>   * Unlock address sets for AMD command sets.
> @@ -1710,6 +1713,23 @@
>  			ERASEINFO(0x02000, 2),
>  			ERASEINFO(0x04000, 1),
>  		}
> +        },{
> +                .mfr_id         = MANUFACTURER_EON,     /* TomTom GO */
> +                .dev_id         = EON29LV400BB,
> +                .name           = "EON AM29LV400BB",
> +                .uaddr          = {
> +                        [1] = MTD_UADDR_0x0AAA_0x0555,  /* x16 */
> +                        [0] = MTD_UADDR_0x0555_0x02AA,  /* x8 */
> +                },
> +                .DevSize        = SIZE_512KiB,
> +                .CmdSet         = P_ID_AMD_STD,
> +                .NumEraseRegions= 4,
> +                .regions        = {
> +                        ERASEINFO(0x04000,1),
> +                        ERASEINFO(0x02000,2),
> +                        ERASEINFO(0x08000,1),
> +                        ERASEINFO(0x10000,7),
> +                }
>  	}
>  };
>  

Sane.

> @@ -1729,6 +1749,14 @@
>  	u32 ofs = cfi_build_cmd_addr(0, cfi_interleave(cfi), cfi->device_type);
>  	mask = (1 << (cfi->device_type * 8)) -1;
>  	result = map_read(map, base + ofs);
> +#ifdef CONFIG_MTD_EON
> +        if( (result.x[0] & mask) == 0x7f ) {
> +         ofs = cfi_build_cmd_addr(0x100, cfi_interleave(cfi), cfi->device_type);
> +         mask = (1 << (cfi->device_type * 8)) -1;
> +         result = map_read(map, base + ofs);
> +        }       
> +#endif          
> +
>  	return result.x[0] & mask;
>  }
>  

Second part of the hack.

> diff -Naur mtd-orig/drivers/mtd/chips/Kconfig mtd/drivers/mtd/chips/Kconfig
> --- mtd-orig/drivers/mtd/chips/Kconfig	2005-06-07 01:04:35.000000000 +0200
> +++ mtd/drivers/mtd/chips/Kconfig	2005-07-05 15:38:25.000000000 +0200
> @@ -221,6 +221,16 @@
>  	  be set to at least 1.  This can also be adjusted at driver load
>  	  time with the retry_cmd_max module parameter.
>  
> +config MTD_EON
> +        depends on MTD_CFI_AMDSTD
> +        bool "Work-arounds for broken EON chips"
> +        help
> +          This option enables workarounds for the broken chips produced
> +          by EON. Chips for which this workaround is necessary include
> +          EN29LV400AB/T and EN29LV800BB/T. If you have such a chip, and
> +          are experiencing problems (eg. incorrect CFI detection), say
> +          'Y' here. Otherwise you should probably say 'N' here.
> +
>  config MTD_CFI_STAA
>  	tristate "Support for ST (Advanced Architecture) flash chips"
>  	depends on MTD_GEN_PROBE

"default n" please.

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham

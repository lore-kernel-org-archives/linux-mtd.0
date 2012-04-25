Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN5cd-000595-NT
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 17:03:20 +0000
Date: Wed, 25 Apr 2012 10:03:14 -0700
From: Tony Lindgren <tony@atomide.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH v2] ARM: OMAP3: gpmc: add BCH ecc api and modes
Message-ID: <20120425170313.GW3739@atomide.com>
References: <1334861024-27386-1-git-send-email-ivan.djelic@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334861024-27386-1-git-send-email-ivan.djelic@parrot.com>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Few comments below.

* Ivan Djelic <ivan.djelic@parrot.com> [120419 11:49]:
> 
> diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
> index 00d5108..e3a91a1 100644
> --- a/arch/arm/mach-omap2/gpmc.c
> +++ b/arch/arm/mach-omap2/gpmc.c
> @@ -49,6 +49,7 @@
>  #define GPMC_ECC_CONTROL	0x1f8
>  #define GPMC_ECC_SIZE_CONFIG	0x1fc
>  #define GPMC_ECC1_RESULT        0x200
> +#define GPMC_ECC_BCH_RESULT_0   0x240

Can you please add a comment here saying something like:

#define GPMC_ECC_BCH_RESULT_0   0x240	/* Not available on omap2 */
  

> @@ -920,3 +921,150 @@ int gpmc_calculate_ecc(int cs, const u_char *dat, u_char *ecc_code)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(gpmc_calculate_ecc);
> +
> +#ifdef CONFIG_ARCH_OMAP3
> +
> +/**
> + * gpmc_enable_hwecc_bch - enable hardware BCH ecc functionality
> + * @cs: chip select number
> + * @mode: read/write mode
> + * @dev_width: device bus width(1 for x16, 0 for x8)
> + * @nsectors: how many 512-byte sectors to process
> + * @nerrors: how many errors to correct per sector (4 or 8)
> + */
> +int gpmc_enable_hwecc_bch(int cs, int mode, int dev_width, int nsectors,
> +			  int nerrors)
> +{
> +	unsigned int val;
> +
> +	/* check if ecc module is in use */
> +	if (gpmc_ecc_used != -EINVAL)
> +		return -EINVAL;
> +	/*
> +	 * FIXME: some OMAP3 revisions have a hardware bug which prevents
> +	 * the 4-bit BCH mode from working properly. Such revisions could be
> +	 * detected and rejected here.
> +	 */

This should then be disabled to avoid corruption. Maybe only allow it
initially on omaps that have been tested? And for omap2 it should return
error  for sure.

Or do you know the broken omap3 versions?

Also, should you first request this feature in case multiple drivers
need to share it?

Other than that, looks good to me.

Regards,

Tony

Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUsN8-00008Y-Bo
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 06:40:35 +0000
Received: by mail-pa0-f53.google.com with SMTP id ld10so9340983pab.40
 for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2014 23:40:08 -0700 (PDT)
Date: Mon, 31 Mar 2014 23:39:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v4 1/5] mtd: nand: Detect Micron flash with on-die ECC
 (aka "internal ECC") enabled.
Message-ID: <20140401063958.GA6400@brian-ubuntu>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-2-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1396308537-16013-2-git-send-email-davidm@egauge.net>
Cc: gsi@denx.de, linux-mtd@lists.infradead.org, pekon@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 31, 2014 at 05:28:53PM -0600, David Mosberger wrote:
> Signed-off-by: David Mosberger <davidm@egauge.net>
> ---
>  drivers/mtd/nand/nand_base.c |   27 ++++++++++++++++++++++++---
>  include/linux/mtd/nand.h     |    4 ++++
>  2 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 09fe1b1..f145f00 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3054,11 +3054,30 @@ static int nand_setup_read_retry_micron(struct mtd_info *mtd, int retry_mode)
>  			feature);
>  }
>  
> +static void

Does this really need to be on its own line? It doesn't match the style
of anything else.

> +nand_onfi_detect_micron_on_die_ecc(struct mtd_info *mtd,
> +				   struct nand_chip *chip)

I'm really not sure why the inconsistent style throughout nand_base on
using both an 'mtd' and a 'chip' parameter (we often assume that
'mtd->priv == chip'). If you need the mtd parameter, let's just pass it
instead of 'chip'.

> +{
> +	u8 features[ONFI_SUBFEATURE_PARAM_LEN];
> +
> +	if (chip->onfi_get_features(mtd, chip, ONFI_FEATURE_ADDR_ARRAY_OP_MODE,
> +				    features) < 0)
> +		return;
> +
> +	if (features[0] & ONFI_FEATURE_ARRAY_OP_MODE_ENABLE_ON_DIE_ECC) {
> +		/*
> +		 * If the chip has on-die ECC enabled, we kind of have
> +		 * to do the same...
> +		 */

That's not really true at all, is it? We can simply disable the on-die
ECC and use the provided spare area with a different ECC scheme, can't
we? (e.g., software BCH; or an SoC's HW ECC) In fact, I think disabling
the on-die ECC is a more reasonable default; nand_base is used by many
drivers, most of which provide their own implementations, and many of
which would not be compatible with the implementations you provide. A
system should have to "opt in" somehow to enable this, I think.

Additionally, you need a way to inform the hardware driver that you're
using on-die ECC, so they can make the appropriate choices (to disable
their HW ECC, for instance).

BTW, what driver/controller/SoC are you running this with?

> +		pr_info("Using on-die ECC\n");
> +	}
> +}
> +
>  /*
>   * Configure chip properties from Micron vendor-specific ONFI table
>   */
> -static void nand_onfi_detect_micron(struct nand_chip *chip,
> -		struct nand_onfi_params *p)
> +static void nand_onfi_detect_micron(struct mtd_info *mtd,
> +		struct nand_chip *chip, struct nand_onfi_params *p)

Ditto on mtd + chip.

>  {
>  	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
>  
> @@ -3067,6 +3086,8 @@ static void nand_onfi_detect_micron(struct nand_chip *chip,
>  
>  	chip->read_retries = micron->read_retry_options;
>  	chip->setup_read_retry = nand_setup_read_retry_micron;
> +
> +	nand_onfi_detect_micron_on_die_ecc(mtd, chip);
>  }
>  
>  /*
> @@ -3168,7 +3189,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>  	}
>  
>  	if (p->jedec_id == NAND_MFR_MICRON)
> -		nand_onfi_detect_micron(chip, p);
> +		nand_onfi_detect_micron(mtd, chip, p);
>  
>  	return 1;
>  }
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 2bd6e4e..780ab58 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -225,6 +225,10 @@ struct nand_chip;
>  /* Vendor-specific feature address (Micron) */
>  #define ONFI_FEATURE_ADDR_READ_RETRY	0x89
>  
> +/* Vendor-specific array operation mode (Micron) */
> +#define ONFI_FEATURE_ADDR_ARRAY_OP_MODE	0x90
> +#define ONFI_FEATURE_ARRAY_OP_MODE_ENABLE_ON_DIE_ECC		0x08
> +
>  /* ONFI subfeature parameters length */
>  #define ONFI_SUBFEATURE_PARAM_LEN	4
>  

Brian

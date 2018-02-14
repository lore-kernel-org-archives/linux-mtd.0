Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elsnI-0001pM-2e
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 08:52:02 +0000
Date: Wed, 14 Feb 2018 09:51:37 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH 5/6] mtd: nand: Allow vendors to declare (un)supported
 features
Message-ID: <20180214095137.6b9cd957@bbrezillon>
In-Reply-To: <20180203095544.9855-6-miquel.raynal@bootlin.com>
References: <20180203095544.9855-1-miquel.raynal@bootlin.com>
 <20180203095544.9855-6-miquel.raynal@bootlin.com>
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

On Sat,  3 Feb 2018 10:55:43 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> From: Miquel Raynal <miquel.raynal@free-electrons.com>
> 
> If SET/GET_FEATURES is available (from the parameter page), use a
> bitmap to declare what feature is actually supported.
> 
> Initialize the bitmap in the core to support timing changes (only
> feature used by the core), also add support for Micron specific features
> used in Micron initialization code (in the init routine).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c   | 11 ++++++++---
>  drivers/mtd/nand/nand_micron.c |  4 ++++
>  include/linux/mtd/rawnand.h    |  5 ++++-
>  3 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 4a879b1635b3..859d9ba2678f 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1174,7 +1174,8 @@ int nand_get_features(struct nand_chip *chip, int addr,
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  
> -	if (!chip->parameters.support_setting_features)
> +	if (!chip->parameters.support_setting_features ||
> +	    !test_bit(addr, chip->parameters.feature_list))
>  		return -ENOTSUPP;
>  
>  	return chip->onfi_get_features(mtd, chip, addr, subfeature_param);
> @@ -1195,7 +1196,8 @@ int nand_set_features(struct nand_chip *chip, int addr,
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  
> -	if (!chip->parameters.support_setting_features)
> +	if (!chip->parameters.support_setting_features ||
> +	    !test_bit(addr, chip->parameters.feature_list))
>  		return -ENOTSUPP;
>  
>  	return chip->onfi_set_features(mtd, chip, addr, subfeature_param);
> @@ -5304,8 +5306,11 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
>  	}
>  
>  	/* Save some parameters from the parameter page for future use */
> -	if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES)
> +	if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES) {
>  		chip->parameters.support_setting_features = true;
> +		bitmap_set(chip->parameters.feature_list,
> +			   ONFI_FEATURE_ADDR_TIMING_MODE, 1);
> +	}
>  	chip->parameters.t_prog = le16_to_cpu(p->t_prog);
>  	chip->parameters.t_bers = le16_to_cpu(p->t_bers);
>  	chip->parameters.t_r = le16_to_cpu(p->t_r);
> diff --git a/drivers/mtd/nand/nand_micron.c b/drivers/mtd/nand/nand_micron.c
> index eaf14885e059..3c5b884e0eae 100644
> --- a/drivers/mtd/nand/nand_micron.c
> +++ b/drivers/mtd/nand/nand_micron.c
> @@ -64,6 +64,10 @@ static int micron_nand_onfi_init(struct nand_chip *chip)
>  		chip->setup_read_retry = micron_nand_setup_read_retry;
>  	}
>  
> +	if (p->support_setting_features) {
> +		set_bit(ONFI_FEATURE_ADDR_TIMING_MODE, p->feature_list);

No need to set it again since it's already set by default.

> +		set_bit(ONFI_FEATURE_ADDR_READ_RETRY, p->feature_list);
> +	}
>  
>  	return 0;
>  }
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 6d8667bb96f4..39a38196dbac 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -21,6 +21,7 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/flashchip.h>
>  #include <linux/mtd/bbm.h>
> +#include <linux/types.h>
>  
>  struct mtd_info;
>  struct nand_flash_dev;
> @@ -235,7 +236,8 @@ struct nand_chip;
>  #define ONFI_TIMING_MODE_5		(1 << 5)
>  #define ONFI_TIMING_MODE_UNKNOWN	(1 << 6)
>  
> -/* ONFI feature address */
> +/* ONFI feature number/address */
> +#define ONFI_FEATURE_NUMBER		256
>  #define ONFI_FEATURE_ADDR_TIMING_MODE	0x1
>  
>  /* Vendor-specific feature address (Micron) */
> @@ -434,6 +436,7 @@ struct nand_parameters {
>  	char model[20];
>  	/* ONFI parameters */
>  	bool support_setting_features;
> +	DECLARE_BITMAP(feature_list, ONFI_FEATURE_NUMBER);

This is not ONFI specific. The SET/GET_FEATURES are supported by JEDEC
and also non-JEDEC/ONFI chips.

Could we move that to the generic section, or maybe declare a
nand_features struct that you could place directly in nand_chip:

struct nand_features {
	DECLARE_BITMAP(supported, ONFI_FEATURE_NUMBER);
};

BTW, are we sure that all features can both be set and retrieved? If
that's not the case, then maybe we should have a bitmap for each
operation (set and get).

>  	u16 t_prog;
>  	u16 t_bers;
>  	u16 t_r;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

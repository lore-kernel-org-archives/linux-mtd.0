Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaUvA-0001QP-Uw
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 18:50:58 +0000
Date: Wed, 16 Apr 2014 20:50:32 +0200
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v5 1/5] mtd: nand: Detect Micron flash with on-die ECC
 (aka "internal ECC") enabled.
Message-ID: <20140416185032.GJ3528@book.gsilab.sittig.org>
References: <1397504134-32178-1-git-send-email-davidm@egauge.net>
 <1397504134-32178-2-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397504134-32178-2-git-send-email-davidm@egauge.net>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org, pekon@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-04-14 at 13:35 -0600, David Mosberger wrote:
> 
> Signed-off-by: David Mosberger <davidm@egauge.net>

commit message is missing

> ---
>  drivers/mtd/nand/nand_base.c |   27 ++++++++++++++++++++++++---
>  include/linux/mtd/nand.h     |    4 ++++
>  2 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 50a6e07..7d1ec81 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3058,19 +3058,40 @@ static int nand_setup_read_retry_micron(struct mtd_info *mtd, int retry_mode)
>  			feature);
>  }
>  
> +static void nand_onfi_detect_micron_on_die_ecc(struct mtd_info *mtd)
> +{
> +	u8 features[ONFI_SUBFEATURE_PARAM_LEN];
> +	struct nand_chip *chip = mtd->priv;
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
> +		pr_info("Using on-die ECC\n");
> +	}

the comment and the code don't match -- at this point it's mere
detection, no action is taken nor is the detection result stored
nor communicated

> +}
> +
>  /*
>   * Configure chip properties from Micron vendor-specific ONFI table
>   */


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de

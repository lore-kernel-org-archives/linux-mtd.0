Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTt8I-0007NU-KT
 for linux-mtd@lists.infradead.org; Sat, 29 Mar 2014 13:17:11 +0000
Date: Sat, 29 Mar 2014 14:16:42 +0100
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [REV3] mtd: nand: Prepare for Micron on-die ECC controller
 support.
Message-ID: <20140329131642.GA2775@book.gsilab.sittig.org>
References: <1396025800-18444-1-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1396025800-18444-1-git-send-email-davidm@egauge.net>
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

a few general notes on your style of patch submission:

please check how subject lines usually are created, the above
"[REV3]" is wrong in multiple ways -- see if you can detect a
pattern in how other series are re-sent

please do provide a history of changes upon re-iteration, don't
expect others to dig up those details for you -- help those
people whom you expect to help you

it's hard to determine how this followup patch relates to the
former on-die-ECC introduction, please provide comments on how
things interact with or depend on each other when multiple sets
of patches are floating around -- is the on-die-ECC support patch
obsolete, do you want to re-start by creating infrastructure in
preparation, to add more support later?  if this is not an
iteration of the on-die-ECC support, why is it v3 then?  can you
provide this information for those of us who are not as much into
the details of your work as you are?


On Fri, 2014-03-28 at 10:56 -0600, David Mosberger wrote:
> 
> This patch adds NAND_ECC_HW_ON_DIE and all other changes to generic code.
> On-die ECC detection now has moved into nand_onfi_detect_micron().

I guess this was too quick a change with too little of
information, and should not get applied, see below

> @@ -3049,16 +3049,29 @@ static int nand_setup_read_retry_micron(struct mtd_info *mtd, int retry_mode)
>  /*
>   * Configure chip properties from Micron vendor-specific ONFI table
>   */
> -static void nand_onfi_detect_micron(struct nand_chip *chip,
> -		struct nand_onfi_params *p)
> +static void nand_onfi_detect_micron(struct mtd_info *mtd,
> +		struct nand_chip *chip, struct nand_onfi_params *p)
>  {
>  	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
> +	u8 features[ONFI_SUBFEATURE_PARAM_LEN];
>  
>  	if (le16_to_cpu(p->vendor_revision) < 1)
>  		return;
>  
>  	chip->read_retries = micron->read_retry_options;
>  	chip->setup_read_retry = nand_setup_read_retry_micron;
> +
> +	if (chip->onfi_get_features(mtd, chip, ONFI_FEATURE_ADDR_OP_MODE,
> +				    features) >= 0) {
> +		if (features[0] & ONFI_FEATURE_OP_MODE_ENABLE_ON_DIE_ECC) {
> +			/*
> +			 * If the chip has on-die ECC enabled, we kind
> +			 * of have to do the same...
> +			 */
> +			chip->ecc.mode = NAND_ECC_HW_ON_DIE;
> +			pr_info("Using on-die ECC\n");
> +		}
> +	}
>  }

ISTR that the test should not be done for a single bit, but for
the specific 0x08 data pattern, i.e. for equality of the byte

can you re-check the documentation?  this is how I read table 14

putting the new code into a separate routine and bailing out upon
unmet conditions might help to avoid a few levels of indentation

> @@ -3792,13 +3805,24 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			!(chip->bbt_options & NAND_BBT_USE_FLASH));
>  
>  	if (!(chip->options & NAND_OWN_BUFFERS)) {
> +		size_t on_die_bufsz = 0;
> +
> +		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE)
> +			on_die_bufsz = 2*(mtd->writesize + mtd->oobsize);
> +
>  		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
> -				+ mtd->oobsize * 3, GFP_KERNEL);
> +				+ mtd->oobsize * 3 + on_die_bufsz, GFP_KERNEL);
>  		if (!nbuf)
>  			return -ENOMEM;
>  		nbuf->ecccalc = (uint8_t *)(nbuf + 1);
>  		nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
>  		nbuf->databuf = nbuf->ecccode + mtd->oobsize;
> +		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE) {
> +			nbuf->chkbuf = (nbuf->databuf + mtd->writesize
> +					+ mtd->oobsize);
> +			nbuf->rawbuf = (nbuf->chkbuf + mtd->writesize
> +					+ mtd->oobsize);
> +		}
>  
>  		chip->buffers = nbuf;
>  	} else {

so the additional buffers only get allocated when upon
identification the on-die-ECC feature already is enabled?  not
when it's supported, and might get enabled at any later point in
time?

this might be OK if there is no intention to enable the
on-die-ECC feature at runtime, but only to use it when enabled by
other entities earlier in the boot progress -- though I guess the
comments and the commit message should reflect such a limitation
that applies by design

> @@ -214,6 +215,10 @@ struct nand_chip;
>  /* Vendor-specific feature address (Micron) */
>  #define ONFI_FEATURE_ADDR_READ_RETRY	0x89
>  
> +/* Vendor-specific array operation mode (Micron) */
> +#define ONFI_FEATURE_ADDR_OP_MODE	0x90
> +#define ONFI_FEATURE_OP_MODE_ENABLE_ON_DIE_ECC		0x08
> +
>  /* ONFI subfeature parameters length */
>  #define ONFI_SUBFEATURE_PARAM_LEN	4
>  

is something like "array op mode" more appropriate, in case other
things might have their individual mode of operation in the future?


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de

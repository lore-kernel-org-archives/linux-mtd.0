Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaVMO-0007GO-VP
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 19:19:07 +0000
Date: Wed, 16 Apr 2014 21:18:41 +0200
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v5 2/5] mtd: nand: Add NAND_ECC_HW_ON_DIE ECC-mode.
Message-ID: <20140416191841.GK3528@book.gsilab.sittig.org>
References: <1397504134-32178-1-git-send-email-davidm@egauge.net>
 <1397504134-32178-3-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397504134-32178-3-git-send-email-davidm@egauge.net>
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
> @@ -1262,6 +1276,59 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
>  	return max_bitflips;
>  }
>  
> +static int check_read_status_on_die(struct mtd_info *mtd, int page)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	int max_bitflips = 0;
> +	uint8_t status;
> +
> +	/* Check ECC status of page just transferred into NAND's page buffer: */
> +	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> +	status = chip->read_byte(mtd);
> +
> +	/* Switch back to data reading: */
> +	chip->cmdfunc(mtd, NAND_CMD_READMODE, -1, -1);
> +
> +	if (status & NAND_STATUS_FAIL) {
> +		/* Page has invalid ECC. */
> +		mtd->ecc_stats.failed++;
> +	} else if (status & NAND_STATUS_REWRITE) {
> +		/*
> +		 * Simple but suboptimal: any page with a single stuck
> +		 * bit will be unusable since it'll be rewritten on
> +		 * each read...
> +		 */
> +		max_bitflips = mtd->bitflip_threshold;
> +	}

should the comment mention that a simple assumption is encoded
that the maximum number of detectable errors has occured if the
chip flags that _some_ error was detected? while this pessimistic
assumption results in suboptimal behaviour for specific error
situations like stuck bits

somehow I feel that the comment "has a gap" which the reader
needs to fill in, but this might just be me

> +	return max_bitflips;
> +}
> +
> +/**
> + * nand_read_page_on_die - [INTERN] read raw page data without ecc
> + * @mtd: mtd info structure
> + * @chip: nand chip info structure
> + * @buf: buffer to store read data
> + * @oob_required: caller requires OOB data read to chip->oob_poi
> + * @page: page number to read
> + */
> +static int nand_read_page_on_die(struct mtd_info *mtd, struct nand_chip *chip,
> +				 uint8_t *buf, int oob_required, int page)
> +{
> +	uint32_t failed;
> +	int ret;
> +
> +	failed = mtd->ecc_stats.failed;
> +
> +	ret = check_read_status_on_die(mtd, page);
> +	if (ret < 0 || mtd->ecc_stats.failed != failed)
> +		return ret;

the empty line suggests that storing the previous value and
checking for changes after calling a routine which potentially
does updates are two separate actions, while it's actually all
the same logical group -- I'd suggest to remove this empty line
(here and in other locations which follow this pattern)

> +
> +	chip->read_buf(mtd, buf, mtd->writesize);
> +	if (oob_required)
> +		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +	return ret;
> +}
> +
>  /**
>   * nand_read_page_hwecc - [REPLACEABLE] hardware ECC based page read function
>   * @mtd: mtd info structure


> @@ -3072,6 +3139,7 @@ static void nand_onfi_detect_micron_on_die_ecc(struct mtd_info *mtd)
>  		 * If the chip has on-die ECC enabled, we kind of have
>  		 * to do the same...
>  		 */
> +		chip->ecc.mode = NAND_ECC_HW_ON_DIE;
>  		pr_info("Using on-die ECC\n");
>  	}
>  }

this is the place where the comment "becomes correct", because
the code follows the chip's status; please make sure that each
patch is consistent in itself, regardless of whether they are
submitted in one sequence

still a short discussion could be helpful that this is an obvious
yet simple approach, assuming that the user _wants_ to blindly
follow the chip's state; alternative approaches would be to
apply user supplied settings, or to only accept on-die-ECC if
nothing better is available by other means (you could suggest
these as future options, not that they need to get implemented
right now)

> @@ -3989,6 +4057,26 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		ecc->strength = ecc->bytes * 8 / fls(8 * ecc->size);
>  		break;
>  
> +	case NAND_ECC_HW_ON_DIE:
> +		/*
> +		 * nand_bbt.c by default puts the BBT marker at
> +		 * offset 8 in OOB, which is used for ECC (see
> +		 * nand_oob_64_on_die).
> +		 * Fixed by not using OOB for BBT marker.
> +		 */
> +		chip->bbt_options |= NAND_BBT_NO_OOB;
> +		chip->ecc.layout = &nand_oob_64_on_die;
> +		chip->ecc.read_page = nand_read_page_on_die;
> +		chip->ecc.write_page = nand_write_page_raw;
> +		chip->ecc.read_oob = nand_read_oob_std;
> +		chip->ecc.read_page_raw = nand_read_page_raw;
> +		chip->ecc.write_page_raw = nand_write_page_raw;
> +		chip->ecc.write_oob = nand_write_oob_std;
> +		chip->ecc.size = 512;
> +		chip->ecc.bytes = 8;
> +		chip->ecc.strength = 4;
> +		break;
> +
>  	case NAND_ECC_NONE:
>  		pr_warn("NAND_ECC_NONE selected by board driver. "
>  			   "This is not recommended!\n");

former feedback suggested that the OOB layout might depend on the
specific chip, the ECC size/bytes/strength parameters might
depend on chips as well -- can these get looked up in or derived
from other identification data that is available from the chip?

this implementation assumes specific settings for the initial
chip that motivated development of the feature, at least a big
red warning might be due


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de

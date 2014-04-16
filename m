Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaVqP-0006PN-Jl
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 19:50:07 +0000
Date: Wed, 16 Apr 2014 21:49:40 +0200
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v5 5/5] mtd: nand: Improve bitflip detection for on-die
 ECC scheme.
Message-ID: <20140416194940.GN3528@book.gsilab.sittig.org>
References: <1397504134-32178-1-git-send-email-davidm@egauge.net>
 <1397504134-32178-6-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397504134-32178-6-git-send-email-davidm@egauge.net>
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
> @@ -1276,6 +1276,64 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
>  	return max_bitflips;
>  }
>  
> +static int set_on_die_ecc(struct mtd_info *mtd, int on)
> +{
> +	u8 data[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
> +	struct nand_chip *chip = mtd->priv;
> +
> +	if (on)
> +		data[0] = ONFI_FEATURE_ARRAY_OP_MODE_ENABLE_ON_DIE_ECC;
> +
> +	return chip->onfi_set_features(mtd, chip,
> +				       ONFI_FEATURE_ADDR_ARRAY_OP_MODE, data);
> +}

I'd suggest to extend this, and check whether this operation
actually did enable the wanted mode (the ONFI set feature request
is a prerequisite but need not be sufficient, you might want to
re-get the feature and test for success)

> +
> +static int check_for_bitflips(struct mtd_info *mtd, int page)
> +{
> +	int flips = 0, max_bitflips = 0, i, j, read_size;

it's been elsewhere too, but here it really bothers me that the
"initial" value and subsequent access to variables is spread so
far across the code -- can you put seeding and updating those
variables closer together, such that their logical correspondence
is better reflected in the implementation?  this would save
mental resources on the reader's / maintainer's side and free
them for more demanding tasks

> +	uint8_t *chkbuf, *rawbuf, *chkoob, *rawoob;
> +	struct nand_chip *chip = mtd->priv;
> +	uint32_t *eccpos;
> +
> +	chkbuf = chip->buffers->chkbuf;
> +	rawbuf = chip->buffers->rawbuf;
> +	read_size = mtd->writesize + mtd->oobsize;
> +
> +	/* Read entire page w/OOB area with on-die ECC on: */
> +	chip->read_buf(mtd, chkbuf, read_size);

has this very variant (potentially fixed up data) not already
been read in an immediately preceeding step in the logic?  would
an explicit comment about the context or preconditions of this
routine help?

> +
> +	/* Re-read page with on-die ECC off: */
> +	set_on_die_ecc(mtd, 0);
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> +	chip->read_buf(mtd, rawbuf, read_size);
> +	set_on_die_ecc(mtd, 1);

these calls ignore the return code of a routine which may fail

> +
> +	chkoob = chkbuf + mtd->writesize;
> +	rawoob = rawbuf + mtd->writesize;
> +	eccpos = chip->ecc.layout->eccpos;
> +	for (i = 0; i < chip->ecc.steps; ++i) {
> +		/* Count bit flips in the actual data area: */
> +		flips = 0;
> +		for (j = 0; j < chip->ecc.size; ++j)
> +			flips += hweight8(chkbuf[j] ^ rawbuf[j]);
> +		/* Count bit flips in the ECC bytes: */
> +		for (j = 0; j < chip->ecc.bytes; ++j) {
> +			flips += hweight8(chkoob[*eccpos] ^ rawoob[*eccpos]);
> +			++eccpos;
> +		}
> +		if (flips > 0)
> +			mtd->ecc_stats.corrected += flips;
> +		max_bitflips = max_t(int, max_bitflips, flips);
> +		chkbuf += chip->ecc.size;
> +		rawbuf += chip->ecc.size;
> +	}
> +
> +	/* Re-issue the READ command for the actual data read that follows.  */
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);

former review feedback suggested looking into whether the
on-die-ECC support could better match what happens for the other
ECC methods:  reading array data first, checking and potentially
fixing up ECC afterwards

it's understood that this specific chip requires fetching the
status byte with the "summary" ECC error flags between filling
the chip's caches and fetching the cached data, still processing
this information might be moved to some "post processing"
routine, instead of being done in the middle of data
communication

> +
> +	return max_bitflips;
> +}
> +
>  static int check_read_status_on_die(struct mtd_info *mtd, int page)
>  {
>  	struct nand_chip *chip = mtd->priv;
> @@ -1294,11 +1352,12 @@ static int check_read_status_on_die(struct mtd_info *mtd, int page)
>  		mtd->ecc_stats.failed++;
>  	} else if (status & NAND_STATUS_REWRITE) {
>  		/*
> -		 * Simple but suboptimal: any page with a single stuck
> -		 * bit will be unusable since it'll be rewritten on
> -		 * each read...
> +		 * Micron on-die ECC doesn't report the number of
> +		 * bitflips, so we have to count them ourself to see
> +		 * if the error rate is too high.  This is
> +		 * particularly important for pages with stuck bits.
>  		 */
> -		max_bitflips = mtd->bitflip_threshold;
> +		max_bitflips = check_for_bitflips(mtd, page);
>  	}
>  	return max_bitflips;
>  }


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de

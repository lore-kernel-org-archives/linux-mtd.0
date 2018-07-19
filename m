Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fg4Em-00086b-7l
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 08:24:38 +0000
Date: Thu, 19 Jul 2018 10:24:24 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Cc: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: nand: toshiba: Add support for ->exec_op()
Message-ID: <20180719102424.30ffa07e@bbrezillon>
In-Reply-To: <1531986827-18743-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
References: <1531986827-18743-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
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

On Thu, 19 Jul 2018 16:53:47 +0900
KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:

> This patch is a patch to support TOSHIBA MEMORY CORPORATION BENAND
> memory devices.  This use vendor specific command
> (TOSHIBA_NAND_CMD_ECC_STATUS) to know the exact bitflips.  However, I
> could not test this patch because I do not have a platform that
> supports chip-> exec_op.  Therefore, I post this patch as RFC.
> 
> As soon as I get a platform that supports chip-> exec_op, I would like
> to test and re-post.
> 
> Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
> ---
>  drivers/mtd/nand/raw/nand_toshiba.c | 76
> +++++++++++++++++++++++++++++-------- 1 file changed, 61
> insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_toshiba.c
> b/drivers/mtd/nand/raw/nand_toshiba.c index 6cec923..12218cd 100644
> --- a/drivers/mtd/nand/raw/nand_toshiba.c
> +++ b/drivers/mtd/nand/raw/nand_toshiba.c
> @@ -17,28 +17,74 @@
>  
>  #include <linux/mtd/rawnand.h>
>  
> +/* ECC Status Read Command for BENAND */
> +#define TOSHIBA_NAND_CMD_ECC_STATUS_READ	0x7A
> +
> +/* ECC Status Mask for BENAND */
> +#define TOSHIBA_NAND_ECC_STATUS_MASK	0x0F
> +
>  /* Recommended to rewrite for BENAND */
>  #define TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED	BIT(3)
>  
> +static int toshiba_nand_benand_read_eccstatus_op(struct nand_chip
> *chip,
> +						 u8 *buf)
> +{
> +	u8 *ecc_status = buf;
> +

How about letting this function return -ENOTSUPP when ->exec_op() is
not implemented?

	if (!chip->exec_op)
		return -ENOTSUPP;

> +	const struct nand_sdr_timings *sdr =
> +		nand_get_sdr_timings(&chip->data_interface);
> +	struct nand_op_instr instrs[] = {
> +		NAND_OP_CMD(TOSHIBA_NAND_CMD_ECC_STATUS_READ,
> +			    PSEC_TO_NSEC(sdr->tADL_min)),
> +		NAND_OP_8BIT_DATA_IN(chip->ecc.steps, ecc_status, 0),
> +	};
> +	struct nand_operation op = NAND_OPERATION(instrs);
> +
> +	/* Drop the DATA_IN instruction if chip->ecc.steps is set to
> 0. */
> +	if (!chip->ecc.steps)

Can this really happen? I hope not.

> +		op.ninstrs--;
> +
> +	return nand_exec_op(chip, &op);
> +}
> +
>  static int toshiba_nand_benand_eccstatus(struct mtd_info *mtd,
>  					 struct nand_chip *chip)
>  {
> -	int ret;
> +	int ret, i;
>  	unsigned int max_bitflips = 0;
> -	u8 status;
> -
> -	/* Check Status */
> -	ret = nand_status_op(chip, &status);
> -	if (ret)
> -		return ret;
> -
> -	if (status & NAND_STATUS_FAIL) {
> -		/* uncorrected */
> -		mtd->ecc_stats.failed++;
> -	} else if (status & TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED)
> {
> -		/* corrected */
> -		max_bitflips = mtd->bitflip_threshold;
> -		mtd->ecc_stats.corrected += max_bitflips;
> +	u8 status, bitflips, ecc_status[8];
> +
> +	if (chip->exec_op) {
> +		/* Check ECC Status */
> +		ret = toshiba_nand_benand_read_eccstatus_op(chip,
> ecc_status);
> +		if (ret)
> +			return ret;
> +
> +		for (i = 0; i < chip->ecc.steps; i++) {
> +			bitflips = (ecc_status[i] &
> +				    TOSHIBA_NAND_ECC_STATUS_MASK);

Unneeded parens.

> +			if (bitflips == 0x0F) {

Please define a macro for the UNCORRECTABLE (0xf) value.

> +				mtd->ecc_stats.failed++;
> +			} else {
> +				mtd->ecc_stats.corrected += bitflips;
> +				max_bitflips = max_t(unsigned int,
> +						     max_bitflips,
> bitflips);

Declare bitflips as an unsigned int, so that you can use max() instead
of max_t().

> +			}
> +		}
> +	} else {
> +		/* Check Status */
> +		ret = nand_status_op(chip, &status);
> +		if (ret)
> +			return ret;
> +
> +		if (status & NAND_STATUS_FAIL) {
> +			/* uncorrected */
> +			mtd->ecc_stats.failed++;
> +		} else if (status &
> TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED) {
> +			/* corrected */
> +			max_bitflips = mtd->bitflip_threshold;
> +			mtd->ecc_stats.corrected += max_bitflips;
> +		}
>  	}

If you go for the "toshiba_nand_benand_read_eccstatus_op() returns
-ENOTSUPP solution", you could replace the above section by:

	ret = toshiba_nand_benand_read_eccstatus_op(chip, ecc_status);
	if (!ret) {
		u8 ecc_status[8];
		unsigned int i;

		for (i = 0; i < chip->ecc.steps; i++) {
			bitflips = ecc_status[i] & TOSHIBA_NAND_ECC_STATUS_MASK;
			if (bitflips == TOSHIBA_NAND_ECC_STATUS_UNCORR) {
				mtd->ecc_stats.failed++;
			} else {
				mtd->ecc_stats.corrected += bitflips;
				max_bitflips = max(max_bitflips,bitflips);
			}
		}

		return max_bitflips;
	}

	/*
	 * Fallback to regular status check if
	 * toshiba_nand_benand_read_eccstatus_op() failed.
	 */
	ret = nand_status_op(chip, &status);
	if (ret)
		return ret;

	if (status & NAND_STATUS_FAIL) {
		/* uncorrected */
		mtd->ecc_stats.failed++;
	} else if (status & TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED) {
		/* corrected */
		max_bitflips = mtd->bitflip_threshold;
		mtd->ecc_stats.corrected += max_bitflips;
	}
 
 	return max_bitflips;
}

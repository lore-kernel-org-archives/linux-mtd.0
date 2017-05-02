Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5TNq-0000pr-Ub
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 08:42:13 +0000
Date: Tue, 2 May 2017 10:41:39 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/3][v2] mtd/nand: add ooblayout for old hamming layout
Message-ID: <20170502104139.179d7652@bbrezillon>
In-Reply-To: <20170502081323.3138-2-lynxis@fe80.eu>
References: <20170313074641.28b383e7@bbrezillon>
 <20170502081323.3138-1-lynxis@fe80.eu>
 <20170502081323.3138-2-lynxis@fe80.eu>
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

On Tue,  2 May 2017 10:13:21 +0200
Alexander Couzens <lynxis@fe80.eu> wrote:

> The old 1bit hamming layout requires the ecc data to be exact at
> predefined offsets.

"
The old 1-bit hamming layout requires ECC data to be placed at a
fixed offset, and not necessarily at the end of the OOB area.
"

> This can not changed because old installations
> would break.

"
Add this old layout back in order to fix legacy setup.
"

> 
> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>

You should probably add Fixes and Cc:stable tags.

> ---
>  drivers/mtd/nand/nand_base.c | 71 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/nand.h     |  1 +
>  2 files changed, 72 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index b0524f8accb6..daf3df157885 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -139,6 +139,77 @@ const struct mtd_ooblayout_ops nand_ooblayout_lp_ops = {
>  };
>  EXPORT_SYMBOL_GPL(nand_ooblayout_lp_ops);
>  
> +/* support the old large page layout for Hamming 1 bit where the ECC start at
> + * a defined offset.

Please use regular comment style:

/*
 * <content>
 */

s/support/Support/

BTW, I'm not sure I understand this sentence. How about

"
Support the old "large page" layout used for 1-bit Hamming ECC where ECC
are placed at a fixed offset.
"

> Should only used by old devices to compatible with old
> + * layout. Use nand_ooblayout_lp_ops if possible.
> + */
> +static int nand_ooblayout_ecc_lp_hamming(struct mtd_info *mtd, int section,
> +				 struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	switch (mtd->oobsize) {
> +	case 64:
> +		oobregion->offset = 40;
> +		break;
> +	case 128:
> +		oobregion->offset = 80;
> +		break;
> +	default:
> +		return -ERANGE;

Hm, can you return -EINVAL instead?

> +	}
> +
> +	oobregion->length = ecc->total;
> +	if (oobregion->offset + oobregion->length > mtd->oobsize)
> +		return -ERANGE;
> +
> +	return 0;
> +}
> +
> +static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +	int ecc_offset = 0;
> +
> +	if (section < 0 || section > 1)
> +		return -ERANGE;
> +
> +	switch (mtd->oobsize) {
> +	case 64:
> +		ecc_offset = 40;
> +		break;
> +	case 128:
> +		ecc_offset = 80;
> +		break;
> +	default:
> +		return -ERANGE;

Ditto.

> +	}
> +
> +	if (section == 0) {
> +		/* return the space before the ecc */

Not sure this comment is needed, it's pretty obvious that this section
is placed before the ECC bytes (and after the BBM).

> +		oobregion->offset = 2;
> +		oobregion->length = ecc_offset - 2;
> +	} else { /* section == 1 */

Drop this comment.

> +		/* return free space after ecc */

Ditto.

> +		oobregion->offset = ecc_offset + ecc->total;
> +		oobregion->length = mtd->oobsize - oobregion->offset;
> +	}
> +
> +	return 0;
> +}
> +
> +const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
> +	.ecc = nand_ooblayout_ecc_lp_hamming,
> +	.free = nand_ooblayout_free_lp_hamming,
> +};
> +EXPORT_SYMBOL_GPL(nand_ooblayout_lp_hamming_ops);
> +
>  static int check_offs_len(struct mtd_info *mtd,
>  					loff_t ofs, uint64_t len)
>  {
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 9591e0fbe5bd..da33933950a5 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -914,6 +914,7 @@ struct nand_chip {
>  
>  extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
>  extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
> +extern const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops;
>  
>  static inline void nand_set_flash_node(struct nand_chip *chip,
>  				       struct device_node *np)

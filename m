Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5WWi-0001c8-7D
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 12:03:36 +0000
Date: Tue, 2 May 2017 14:03:00 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Couzens <lynxis@fe80.eu>, Brian Norris
 <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Stable <stable@vger.kernel.org>
Subject: Re: [PATCH][v3] mtd: nand: add ooblayout for old hamming layout
Message-ID: <20170502140300.33ac055d@bbrezillon>
In-Reply-To: <20170502101900.5066-1-lynxis@fe80.eu>
References: <20170502081323.3138-1-lynxis@fe80.eu>
 <20170502101900.5066-1-lynxis@fe80.eu>
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

+Brian

On Tue,  2 May 2017 12:19:00 +0200
Alexander Couzens <lynxis@fe80.eu> wrote:

> The old 1-bit hamming layout requires ECC data to be placed at a
> fixed offset, and not necessarily at the end of the OOB area.
> Add this old layout back in order to fix legacy setups.
> 
> Fixes: 41b207a70d3a ("mtd: nand: implement the default mtd_ooblayout_ops")
> CC: Stable <stable@vger.kernel.org>
> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Brian, maybe you can consider taking this patch directly in
l2-mtd/master before preparing your PR to Linus (if you're happy with
the patch of course). Otherwise, I'll take it into my tree and send a
fixes PR after 4.12-rc1 is out.

> ---

Alexander, just for the record, you should put your changelog here.

>  drivers/mtd/nand/nand_base.c | 70 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index b0524f8accb6..44c0faf84426 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -139,6 +139,74 @@ const struct mtd_ooblayout_ops nand_ooblayout_lp_ops = {
>  };
>  EXPORT_SYMBOL_GPL(nand_ooblayout_lp_ops);
>  
> +/*
> + * Support the old "large page" layout used for 1-bit Hamming ECC where ECC
> + * are placed at a fixed offset.
> + */
> +static int nand_ooblayout_ecc_lp_hamming(struct mtd_info *mtd, int section,
> +					 struct mtd_oob_region *oobregion)
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
> +		return -EINVAL;
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
> +					  struct mtd_oob_region *oobregion)
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
> +		return -EINVAL;
> +	}
> +
> +	if (section == 0) {
> +		oobregion->offset = 2;
> +		oobregion->length = ecc_offset - 2;
> +	} else {
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
> +
>  static int check_offs_len(struct mtd_info *mtd,
>  					loff_t ofs, uint64_t len)
>  {
> @@ -4653,7 +4721,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			break;
>  		case 64:
>  		case 128:
> -			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_hamming_ops);
>  			break;
>  		default:
>  			WARN(1, "No oob scheme defined for oobsize %d\n",

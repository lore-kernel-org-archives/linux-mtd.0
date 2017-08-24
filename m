Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dkyBV-0001vO-Pr
 for linux-mtd@lists.infradead.org; Thu, 24 Aug 2017 19:53:00 +0000
Date: Thu, 24 Aug 2017 21:52:22 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4] mtd: nand: Add OOB layout without ECC bytes
Message-ID: <20170824215222.1af8b752@bbrezillon>
In-Reply-To: <20170824083538.3009-1-miquel.raynal@free-electrons.com>
References: <20170824083538.3009-1-miquel.raynal@free-electrons.com>
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

On Thu, 24 Aug 2017 10:35:38 +0200
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Add layout functions for large pages with mainly free bytes
> plus reserved space for Bad Block Markers. This may be useful for
> configurations that does set ECC_NONE. Specific chips that use
> on-die ECC feature, ie. the TOSHIBA BENAND (Built-in ECC NAND),
> might also take advantage of it: the ECC bytes are stored in an
> isolated area inaccessible by the driver and thus the OOB layout must
> only reserve space for bad block markers.
> 
> Bad block markers position was extracted from the existing OOB layouts
> by assigning as free all the bytes marked as ECC.
> 
> Normally, if NAND_ECC_NONE is chosen, the MTD user can use the whole OOB
> area (except the bytes reserved for the bad block markers) to store
> private data, but the NAND framework has been using the same OOB layout
> (the one reserving ECC bytes) no matter whether ECC is enabled or not.
> In order to not break existing MTD users which may rely on this layout
> to work properly, we keep things unchanged and only use the 'no_ecc'
> layouts for previously unsupported configurations.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c5221795a1e8..ef40866d3435 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -109,6 +109,22 @@ const struct mtd_ooblayout_ops nand_ooblayout_sp_ops = {
>  };
>  EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
>  
> +static int nand_ooblayout_free_lp_no_ecc(struct mtd_info *mtd, int section,
> +					   struct mtd_oob_region *oobregion)
> +{
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->offset = 2;
> +	oobregion->length = mtd->oobsize - oobregion->offset;
> +
> +	return 0;
> +}
> +
> +const struct mtd_ooblayout_ops nand_ooblayout_lp_no_ecc_ops = {
> +	.free = nand_ooblayout_free_lp_no_ecc,
> +};
> +
>  static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
>  				 struct mtd_oob_region *oobregion)
>  {
> @@ -4649,6 +4665,19 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_hamming_ops);
>  			break;
>  		default:
> +			/*
> +			 * Expose the whole OOB area to users if ECC_NONE
> +			 * is passed. We could do that for all kind of
> +			 * ->oobsize, but we must keep the old large/small
> +			 * page with ECC layout when ->oobsize <= 128 for
> +			 * compatibility reasons.
> +			 */
> +			if (ecc->mode == NAND_ECC_NONE) {
> +				mtd_set_ooblayout(mtd,
> +						&nand_ooblayout_lp_no_ecc_ops);

Sorry again for not noticing that earlier but it seems
nand_ooblayout_lp_no_ecc_ops is not needed. Indeed, when ecc->bytes = 0
(which is the case when ecc->mode = NAND_ECC_NONE)
nand_ooblayout_lp_ops already exposes all OOB bytes as free. You can
just re-use nand_ooblayout_lp_ops here. The only thing you might want
to do is patch nand_ooblayout_ecc_lp() to return -ERANGE when
ecc->total is 0 so that the MTD user does not end up with a 0 length
OOB region.

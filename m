Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dvKqw-0007z4-4S
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 10:06:36 +0000
Date: Fri, 22 Sep 2017 12:06:10 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v5] mtd: nand: Use standard large page OOB layout when
 using NAND_ECC_NONE
Message-ID: <20170922120610.0700434a@bbrezillon>
In-Reply-To: <20170826151915.28400-1-miquel.raynal@free-electrons.com>
References: <20170826151915.28400-1-miquel.raynal@free-electrons.com>
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

On Sat, 26 Aug 2017 17:19:15 +0200
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Use the core's large page OOB layout functions when not reserving any
> space for ECC bytes in the OOB layout. Fix ->nand_ooblayout_ecc_lp()
> to return -ERANGE instead of a zero length in this case.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c5221795a1e8..39894c3f0fd5 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -115,7 +115,7 @@ static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
>  
> -	if (section)
> +	if (section || !ecc->total)
>  		return -ERANGE;
>  
>  	oobregion->length = ecc->total;
> @@ -4649,6 +4649,19 @@ int nand_scan_tail(struct mtd_info *mtd)
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
> +						&nand_ooblayout_lp_ops);
> +				break;
> +			}
> +
>  			WARN(1, "No oob scheme defined for oobsize %d\n",
>  				mtd->oobsize);
>  			ret = -EINVAL;

Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cnJl3-0006Xu-RP
 for linux-mtd@lists.infradead.org; Mon, 13 Mar 2017 06:47:08 +0000
Date: Mon, 13 Mar 2017 07:46:41 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] nand_base: fix regression on nand with 64/128 oob size
Message-ID: <20170313074641.28b383e7@bbrezillon>
In-Reply-To: <20170312200232.19269-1-lynxis@fe80.eu>
References: <20170312200232.19269-1-lynxis@fe80.eu>
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

Hi Alexander,

On Sun, 12 Mar 2017 21:02:32 +0100
Alexander Couzens <lynxis@fe80.eu> wrote:

> 41b207a70d3a

When you refer to a commit, please put the commit description as well:

41b207a70d3a ("mtd: nand: implement the default mtd_ooblayout_ops")

> accidently changed the oob layout for nand when ECC doesn't use
> the full available ecc reserved data.

Oh crap! I didn't notice that when switching to the ooblayout approach.

> This only affects controllers which use the default large page ops
> nand_ooblayout_ecc_lp.
> 
> E.g. for davinci:
> - nand has 2048 byte page, 64 byte oob
> - 3 byte ecc every 512 byte using 1bit hw ecc
> - requires 12 byte of oob space for ecc
> - old layout reserved 24 byte based on 64 byte oob
> 
> Old layout started using byte from offset 40 while new layout
> uses the last X bytes so it fits into the end of oob.
> Meaning in this example the old layout uses byte 40-51, while
> the new layout use byte 52-63.
> 
> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>

Fixes + Cc-stable tags please.

> ---
>  drivers/mtd/nand/nand_base.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index b0524f8accb6..ba88345fd334 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -112,8 +112,25 @@ static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
>  	if (section)
>  		return -ERANGE;
>  
> +	/* to be compatible with previous layouts
> +	 * 64 byte oob must have ecc data at byte 40,
> +	 * 128 byte oob must have ecc data at byte 80 */
> +	switch (mtd->oobsize) {
> +	case 64:
> +		oobregion->offset = 40;
> +		break;
> +	case 128:
> +		oobregion->offset = 80;
> +		break;
> +	default:
> +		oobregion->offset = mtd->oobsize - oobregion->length;
> +		break;
> +	}
> +
>  	oobregion->length = ecc->total;
> -	oobregion->offset = mtd->oobsize - oobregion->length;
> +	if (oobregion->offset + oobregion->length > mtd->oobsize) {
> +		return -ERANGE;
> +	}

By doing that you break new users of the standard large page layout
which expect all ECC bytes to be placed at the end of the OOB region.
In all cases except the one you're fixing (Hamming in 1bit/512bytes) we
want the ECC start offset to be calculated based on the actual number
of ECC bytes, and not the max number of ECC bytes considering the
strongest case.

I'd recommend that you add a new layout for Hamming ECC in the 64 or 128
OOB bytes situation to fix the problem.

Thanks,

Boris

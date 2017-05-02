Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5TUz-0005FH-Ne
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 08:49:35 +0000
Date: Tue, 2 May 2017 10:49:02 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/3][v2] nand_base: use nand_ooblayout_lp_hamming_ops
 for 1bit hamming as default
Message-ID: <20170502104902.2060d733@bbrezillon>
In-Reply-To: <20170502081323.3138-3-lynxis@fe80.eu>
References: <20170313074641.28b383e7@bbrezillon>
 <20170502081323.3138-1-lynxis@fe80.eu>
 <20170502081323.3138-3-lynxis@fe80.eu>
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

On Tue,  2 May 2017 10:13:22 +0200
Alexander Couzens <lynxis@fe80.eu> wrote:

> commit 41b207a70d3a ("mtd: nand: implement the default mtd_ooblayout_ops")
> uses a different ooblayout for platforms which doesn't set the
> layout by itself. Use for 1bit hamming the old layout.

Please merge patch 1 and 2 so that we end up with a
simple/self-contained patch that can be backported to stable kernels.

> 
> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> ---
>  drivers/mtd/nand/nand_base.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index daf3df157885..6a9e99377181 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4724,7 +4724,11 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			break;
>  		case 64:
>  		case 128:
> -			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +			if (ecc->algo == NAND_ECC_HAMMING && ecc->strength == 1)
> +				mtd_set_ooblayout(mtd,
> +						&nand_ooblayout_lp_hamming_ops);
> +			else
> +				mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);

Why not unconditionally setting it to nand_ooblayout_lp_hamming_ops to
restore the initial behavior. If one wants to use the new "large page"
layout he can still explicitly assign it (which is a good practice
anyway).

>  			break;
>  		default:
>  			WARN(1, "No oob scheme defined for oobsize %d\n",

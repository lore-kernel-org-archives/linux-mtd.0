Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dALm4-0003Dv-Eq
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 19:35:22 +0000
Date: Mon, 15 May 2017 21:34:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: nand: davinci: set ECC algorithm explicitly for HW
 based ECC
Message-ID: <20170515213459.360e7582@bbrezillon>
In-Reply-To: <20170502094736.9671-1-lynxis@fe80.eu>
References: <20170502094736.9671-1-lynxis@fe80.eu>
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

On Tue,  2 May 2017 11:47:36 +0200
Alexander Couzens <lynxis@fe80.eu> wrote:

> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>

Applied to nand/next

> ---
>  drivers/mtd/nand/davinci_nand.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index 27fa8b87cd5f..f658948ec7e3 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -760,11 +760,14 @@ static int nand_davinci_probe(struct platform_device *pdev)
>  			info->chip.ecc.hwctl = nand_davinci_hwctl_4bit;
>  			info->chip.ecc.bytes = 10;
>  			info->chip.ecc.options = NAND_ECC_GENERIC_ERASED_CHECK;
> +			info->chip.ecc.algo = NAND_ECC_BCH;
>  		} else {
> +			/* 1bit ecc hamming */
>  			info->chip.ecc.calculate = nand_davinci_calculate_1bit;
>  			info->chip.ecc.correct = nand_davinci_correct_1bit;
>  			info->chip.ecc.hwctl = nand_davinci_hwctl_1bit;
>  			info->chip.ecc.bytes = 3;
> +			info->chip.ecc.algo = NAND_ECC_HAMMING;
>  		}
>  		info->chip.ecc.size = 512;
>  		info->chip.ecc.strength = pdata->ecc_bits;

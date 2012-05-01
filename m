Received: from mms2.broadcom.com ([216.31.210.18])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPIQI-0005Ed-Sr
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 19:07:44 +0000
Message-ID: <4FA03472.4030309@broadcom.com>
Date: Tue, 1 May 2012 12:07:30 -0700
From: "Jiandong Zheng" <jdzheng@broadcom.com>
MIME-Version: 1.0
To: "Mike Dunn" <mikedunn@newsguy.com>
Subject: Re: [PATCH 2/7] mtd: nand: fix incorrect ecc strength values
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-3-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1335295105-7981-3-git-send-email-mikedunn@newsguy.com>
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-mtd@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/24/2012 12:18 PM, Mike Dunn wrote:
> This fixes a couple of ecc strength values for which I earlier made conservative
> guesses, but whose correct values were later determined [1] (thanks Ivan).  Also
> sets strength for fsl_ifc_nand, which was merged to mainline after the original
> patch that set the strength for all drivers.
>
> [1] http://lists.infradead.org/pipermail/linux-mtd/2012-March/040325.html
>
> Signed-off-by: Mike Dunn<mikedunn@newsguy.com>
> ---
>   drivers/mtd/nand/bcm_umi_nand.c |    7 +------
>   drivers/mtd/nand/fsl_ifc_nand.c |    1 +
>   drivers/mtd/nand/jz4740_nand.c  |    6 +-----
>   3 files changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
> index 6908cdd..7134adf 100644
> --- a/drivers/mtd/nand/bcm_umi_nand.c
> +++ b/drivers/mtd/nand/bcm_umi_nand.c
> @@ -476,12 +476,7 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
>   		this->badblock_pattern =&largepage_bbt;
>   	}
>
> -	/*
> -	 * FIXME: ecc strength value of 6 bits per 512 bytes of data is a
> -	 * conservative guess, given 13 ecc bytes and using bch alg.
> -	 * (Assume Galois field order m=15 to allow a margin of error.)
> -	 */
> -	this->ecc.strength = 6;
> +	this->ecc.strength = 8;
>
>   #endif
>
>
Acked-by: Jiandong Zheng <jdzheng@broadcom.com>

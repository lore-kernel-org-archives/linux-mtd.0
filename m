Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fDoxc-0004Tx-92
 for linux-mtd@lists.infradead.org; Wed, 02 May 2018 10:26:09 +0000
Date: Wed, 2 May 2018 12:25:45 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jane Wan <Jane.Wan@nokia.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, ties.bos@nokia.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Use bit-wise majority to recover the contents of
 ONFI parameter
Message-ID: <20180502122545.6bd28c3b@bbrezillon>
In-Reply-To: <1524788396-32380-3-git-send-email-Jane.Wan@nokia.com>
References: <1524788396-32380-1-git-send-email-Jane.Wan@nokia.com>
 <1524788396-32380-3-git-send-email-Jane.Wan@nokia.com>
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

Hi Jane,

On Thu, 26 Apr 2018 17:19:56 -0700
Jane Wan <Jane.Wan@nokia.com> wrote:

> Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
> ---
>  drivers/mtd/nand/nand_base.c |   35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c2e1232..161b523 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3153,8 +3153,10 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>  					int *busw)
>  {
>  	struct nand_onfi_params *p = &chip->onfi_params;
> -	int i, j;
> -	int val;
> +	int i, j, k, len, val;
> +	uint8_t copy[3][256], v8;
> +
> +	len = (sizeof(*p) > 256) ? 256 : sizeof(*p);
>  
>  	/* Try ONFI for unknown chip or LP */
>  	chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
> @@ -3170,11 +3172,36 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>  				le16_to_cpu(p->crc)) {
>  			break;
>  		}
> +		pr_err("CRC of parameter page %d is not valid\n", i);
> +		for (j = 0; j < len; j++)
> +			copy[i][j] = ((uint8_t *)p)[j];
>  	}
>  
>  	if (i == 3) {
> -		pr_err("Could not find valid ONFI parameter page; aborting\n");
> -		return 0;
> +		pr_err("Could not find valid ONFI parameter page\n");
> +		pr_info("Recover ONFI parameters with bit-wise majority\n");
> +		for (j = 0; j < len; j++) {
> +			if (copy[0][j] == copy[1][j] ||
> +			    copy[0][j] == copy[2][j]) {
> +				((uint8_t *)p)[j] = copy[0][j];
> +			} else if (copy[1][j] == copy[2][j]) {
> +				((uint8_t *)p)[j] = copy[1][j];
> +			} else {
> +				((uint8_t *)p)[j] = 0;
> +				for (k = 0; k < 8; k++) {
> +					v8 = (copy[0][j] >> k) & 0x1;
> +					v8 += (copy[1][j] >> k) & 0x1;
> +					v8 += (copy[2][j] >> k) & 0x1;
> +					if (v8 > 1)
> +						((uint8_t *)p)[j] |= (1 << k);
> +				}
> +			}
> +		}

I'd like this bit-wise majority algorithm to be generic and moved to
nand_base.c, because we might want to do the same in the core and make
it work for any number of repetitions of the PARAM page.

> +		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) !=
> +		    le16_to_cpu(p->crc)) {
> +			pr_err("ONFI parameter recovery failed, aborting\n");
> +			return 0;
> +		}
>  	}
>  
>  	/* Check version */

Thanks,

Boris

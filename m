Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGoT0-0003T6-RQ
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 13:49:35 +0000
Date: Wed, 6 Jan 2016 14:49:12 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, fransklaver@gmail.com,
 Peter Pan <peterpandong@micron.com>, beanhuo@micron.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 karlzhang@micron.com
Subject: Re: [PATCH v2 06/12] mtd: nand_bbt: use erase() and is_bad_bbm()
 hook in BBT
Message-ID: <20160106144912.3f7c5475@bbrezillon>
In-Reply-To: <1450159178-29895-7-git-send-email-peterpandong@micron.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
 <1450159178-29895-7-git-send-email-peterpandong@micron.com>
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

On Tue, 15 Dec 2015 05:59:32 +0000
Peter Pan <peterpansjtu@gmail.com> wrote:

> From: Brian Norris <computersforpeace@gmail.com>
> 
> Since NAND already create its nand_bbt struct, we can use erase()
> hook instead of call nand_erase_nand() directly. Also, we can use
> is_bad_bbm() to avoid passing badblock_pattern to BBT.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> [Peter: remove @buf in create_bbt()]
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/nand_bbt.c | 138 ++++----------------------------------------
>  1 file changed, 12 insertions(+), 126 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index f256be1..a5c8ab5 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -122,23 +122,6 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
>  }

[...]

>  /**
>   * create_bbt - [GENERIC] Create a bad block table by scanning the device
>   * @mtd: MTD device structure
> - * @buf: temporary buffer
> - * @bd: descriptor for the good/bad block search pattern
>   * @chip: create the table for a specific chip, -1 read all chips; applies only
>   *        if NAND_BBT_PERCHIP option is set
>   *
>   * Create a bad block table by scanning the device for the given good/bad block
>   * identify pattern.
>   */
> -static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
> -	struct nand_bbt_descr *bd, int chip)
> +static int create_bbt(struct mtd_info *mtd, int chip)
>  {
>  	struct nand_chip *this = mtd_to_nand(mtd);
> -	int i, numblocks, numpages;
> -	int startblock;
> +	int i, startblock, numblocks;
>  	loff_t from;
>  
>  	pr_info("Scanning device for bad blocks\n");
>  
> -	if (bd->options & NAND_BBT_SCAN2NDPAGE)
> -		numpages = 2;
> -	else
> -		numpages = 1;
> -
>  	if (chip == -1) {
>  		numblocks = mtd->size >> this->bbt_erase_shift;
>  		startblock = 0;
> @@ -482,15 +425,10 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
>  		from = (loff_t)startblock << this->bbt_erase_shift;
>  	}
>  
> -	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
> -		from += mtd->erasesize - (mtd->writesize * numpages);
> -
>  	for (i = startblock; i < numblocks; i++) {
>  		int ret;
>  
> -		BUG_ON(bd->options & NAND_BBT_NO_OOB);
> -
> -		ret = scan_block_fast(mtd, bd, from, buf, numpages);
> +		ret = this->nand_bbt->is_bad_bbm(mtd, from);

Same comment as for the previous patch: I think it would be safer to
create a wrapper function to do that.

>  		if (ret < 0)
>  			return ret;
>  
> @@ -619,7 +557,6 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>  		     int chipsel)
>  {
>  	struct nand_chip *this = mtd_to_nand(mtd);
> -	struct erase_info einfo;
>  	int i, res, chip = 0;
>  	int bits, startblock, dir, page, offs, numblocks, sft, sftmsk;
>  	int nrchips, pageoffs, ooboffs;
> @@ -782,11 +719,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>  			buf[offs + (i >> sft)] &= ~(msk[dat] << sftcnt);
>  		}
>  
> -		memset(&einfo, 0, sizeof(einfo));
> -		einfo.mtd = mtd;
> -		einfo.addr = to;
> -		einfo.len = 1 << this->bbt_erase_shift;
> -		res = nand_erase_nand(mtd, &einfo, 1);
> +		res = this->nand_bbt->erase(mtd, to);

Ditto.





-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

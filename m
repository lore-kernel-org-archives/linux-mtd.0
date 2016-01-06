Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGqaz-0005L3-1M
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 16:05:57 +0000
Date: Wed, 6 Jan 2016 17:05:32 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: computersforpeace@gmail.com, linux-arm-msm@vger.kernel.org,
 cernekee@gmail.com, sboyd@codeaurora.org, linux-mtd@lists.infradead.org,
 dehrenberg@google.com, andy.gross@linaro.org
Subject: Re: [PATCH v5 1/3] mtd: nand: don't select chip in nand_chip's
 block_bad op
Message-ID: <20160106170532.12e48ce9@bbrezillon>
In-Reply-To: <1451971501-18160-2-git-send-email-architt@codeaurora.org>
References: <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1451971501-18160-1-git-send-email-architt@codeaurora.org>
 <1451971501-18160-2-git-send-email-architt@codeaurora.org>
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

On Tue,  5 Jan 2016 10:54:59 +0530
Archit Taneja <architt@codeaurora.org> wrote:

> One of the arguments passed to struct nand_chip's block_bad op is
> 'getchip', which, if true, is supposed to get and select the nand device,
> and later unselect and release the device.
> 
> This op is intended to be replaceable by drivers. The drivers shouldn't
> be responsible for selecting/unselecting chip. Like other ops, the chip
> should already be selected before the block_bad op is called.
> 
> Remove the getchip argument from the block_bad op and move the chip
> selection to nand_block_checkbad (the only user of chip->block_bad).
> Modify nand_block_bad (the default function for the op) such that
> it doesn't select the chip.

I would go even further and move the chip selection into
nand_block_isbad(), who is the only caller that requires this chip
selection.

> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  drivers/mtd/nand/nand_base.c | 41 +++++++++++++++++++++++------------------
>  include/linux/mtd/nand.h     |  2 +-
>  2 files changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 928081b..42aa441 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -317,9 +317,9 @@ static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
>   *
>   * Check, if the block is bad.
>   */
> -static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
> +static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
>  {
> -	int page, chipnr, res = 0, i = 0;
> +	int page, res = 0, i = 0;
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	u16 bad;
>  
> @@ -328,15 +328,6 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
>  
>  	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
>  
> -	if (getchip) {
> -		chipnr = (int)(ofs >> chip->chip_shift);
> -
> -		nand_get_device(mtd, FL_READING);
> -
> -		/* Select the NAND device */
> -		chip->select_chip(mtd, chipnr);
> -	}
> -
>  	do {
>  		if (chip->options & NAND_BUSWIDTH_16) {
>  			chip->cmdfunc(mtd, NAND_CMD_READOOB,
> @@ -361,11 +352,6 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
>  		i++;
>  	} while (!res && i < 2 && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE));
>  
> -	if (getchip) {
> -		chip->select_chip(mtd, -1);
> -		nand_release_device(mtd);
> -	}
> -
>  	return res;
>  }
>  
> @@ -514,8 +500,27 @@ static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int getchip,
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  
> -	if (!chip->bbt)
> -		return chip->block_bad(mtd, ofs, getchip);
> +	if (!chip->bbt) {
> +		int ret;
> +
> +		if (getchip) {
> +			int chipnr = (int)(ofs >> chip->chip_shift);
> +
> +			nand_get_device(mtd, FL_READING);
> +
> +			/* Select the NAND device */
> +			chip->select_chip(mtd, chipnr);
> +		}
> +
> +		ret = chip->block_bad(mtd, ofs);
> +
> +		if (getchip) {
> +			chip->select_chip(mtd, -1);
> +			nand_release_device(mtd);
> +		}
> +
> +		return ret;
> +	}
>  
>  	/* Return info from the table */
>  	return nand_isbad_bbt(mtd, ofs, allowbbt);
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 3e92be1..c15818e 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -650,7 +650,7 @@ struct nand_chip {
>  	void (*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
>  	void (*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
>  	void (*select_chip)(struct mtd_info *mtd, int chip);
> -	int (*block_bad)(struct mtd_info *mtd, loff_t ofs, int getchip);
> +	int (*block_bad)(struct mtd_info *mtd, loff_t ofs);
>  	int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
>  	void (*cmd_ctrl)(struct mtd_info *mtd, int dat, unsigned int ctrl);
>  	int (*dev_ready)(struct mtd_info *mtd);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

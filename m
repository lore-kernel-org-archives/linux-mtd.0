Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUJ3A-0000xC-LD
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 18:34:25 +0000
Received: by pabzx8 with SMTP id zx8so41373713pab.1
 for <linux-mtd@lists.infradead.org>; Tue, 25 Aug 2015 11:34:03 -0700 (PDT)
Date: Tue, 25 Aug 2015 11:34:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Xander Huff <xander.huff@ni.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, jeff.westfahl@ni.com,
 jaeden.amero@ni.com, joshc@ni.com, Ben Shelton <ben.shelton@ni.com>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Subject: Re: [RESEND RESEND RESEND PATCH v2] mtd: nand_bbt: scan for next
 free bbt block if writing bbt fails
Message-ID: <20150825183400.GH81844@google.com>
References: <1439330122-41912-1-git-send-email-xander.huff@ni.com>
 <1440524966-29627-1-git-send-email-xander.huff@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440524966-29627-1-git-send-email-xander.huff@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Bean, who is looking at refactoring this driver. Perhaps he can review
this.

On Tue, Aug 25, 2015 at 12:49:26PM -0500, Xander Huff wrote:
> From: Ben Shelton <ben.shelton@ni.com>
> 
> If erasing or writing the BBT fails, we should mark the current BBT
> block as bad and use the BBT descriptor to scan for the next available
> unused block in the BBT. We should only return a failure if there isn't
> any space left.
> 
> Based on original code implemented by Jeff Westfahl
> <jeff.westfahl@ni.com>.
> 
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> Reviewed-by: Jaeden Amero <jaeden.amero@ni.com>
> Suggested-by: Jeff Westfahl <jeff.westfahl@ni.com>
> Signed-off-by: Xander Huff <xander.huff@ni.com>
> ---
> This v2 patch is in reply to comments from Brian Norris on 7/22/13. See
> the following links for context:
> http://lists.infradead.org/pipermail/linux-mtd/2013-July/047596.html
> http://patchwork.ozlabs.org/patch/244324/

Wow, a blast from the past...

> ---
>  drivers/mtd/nand/nand_base.c |  4 ++++
>  drivers/mtd/nand/nand_bbt.c  | 34 ++++++++++++++++++++++++++++++++--
>  include/linux/mtd/nand.h     |  7 +++++++
>  3 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ceb68ca..48299dc 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2761,6 +2761,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>  		pr_debug("%s: device is write protected!\n",
>  				__func__);
>  		instr->state = MTD_ERASE_FAILED;
> +		instr->priv = NAND_ERASE_WRITE_PROTECTED;

I'm pretty sure this is an illegal overloading of the 'priv' field.
Notice how ioctl(MEMERASE64) uses this field in mtdchard.c. So I suspect
you've broken char access to /dev/mtdX. Try 'flash_erase' from
mtd-utils, for instance.

>  		goto erase_exit;
>  	}
>  
> @@ -2776,6 +2777,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>  			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
>  				    __func__, page);
>  			instr->state = MTD_ERASE_FAILED;
> +			instr->priv = NAND_ERASE_BAD_BLOCK;
>  			goto erase_exit;
>  		}
>  
> @@ -2802,6 +2804,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>  			pr_debug("%s: failed erase, page 0x%08x\n",
>  					__func__, page);
>  			instr->state = MTD_ERASE_FAILED;
> +			instr->priv = NAND_ERASE_BLOCK_ERASE_FAILED;
>  			instr->fail_addr =
>  				((loff_t)page << chip->page_shift);
>  			goto erase_exit;
> @@ -2819,6 +2822,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>  		}
>  	}
>  	instr->state = MTD_ERASE_DONE;
> +	instr->priv = NAND_ERASE_OK;
>  
>  erase_exit:
>  
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 63a1a36..09f9e62 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -662,6 +662,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>  			page = td->pages[chip];
>  			goto write;
>  		}
> +next:
>  
>  		/*
>  		 * Automatic placement of the bad block table. Search direction
> @@ -787,13 +788,42 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>  		einfo.addr = to;
>  		einfo.len = 1 << this->bbt_erase_shift;
>  		res = nand_erase_nand(mtd, &einfo, 1);
> -		if (res < 0)
> +		if (res == -EIO && einfo.state == MTD_ERASE_FAILED
> +		    && einfo.priv == NAND_ERASE_BLOCK_ERASE_FAILED) {

Do you actually need that last condition? What's wrong with the first
two?

> +			/* This block is bad. Mark it as such and see if
> +			 * there's another block available in the BBT area. */
> +			int block = page >>
> +				(this->bbt_erase_shift - this->page_shift);
> +			pr_info("nand_bbt: failed to erase block %d when writing BBT\n",
> +				block);
> +			bbt_mark_entry(this, block, BBT_BLOCK_WORN);
> +
> +			res = this->block_markbad(mtd, block);
> +			if (res)
> +				pr_warn("nand_bbt: error %d while marking block %d bad\n",
> +					res, block);
> +			goto next;
> +		} else if (res < 0)
>  			goto outerr;
>  
>  		res = scan_write_bbt(mtd, to, len, buf,
>  				td->options & NAND_BBT_NO_OOB ? NULL :
>  				&buf[len]);
> -		if (res < 0)
> +		if (res == -EIO) {
> +			/* This block is bad. Mark it as such and see if
> +			 * there's another block available in the BBT area. */
> +			int block = page >>
> +				(this->bbt_erase_shift - this->page_shift);
> +			pr_info("nand_bbt: failed to erase block %d when writing BBT\n",
> +				block);
> +			bbt_mark_entry(this, block, BBT_BLOCK_WORN);
> +
> +			res = this->block_markbad(mtd, block);
> +			if (res)
> +				pr_warn("nand_bbt: error %d while marking block %d bad\n",
> +					res, block);
> +			goto next;
> +		} else if (res < 0)
>  			goto outerr;
>  
>  		pr_info("Bad block table written to 0x%012llx, version 0x%02X\n",
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 272f429..86e11f6 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -1030,4 +1030,11 @@ struct nand_sdr_timings {
>  
>  /* get timing characteristics from ONFI timing mode. */
>  const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode);
> +
> +/* reasons for erase failures */
> +#define NAND_ERASE_OK			0
> +#define NAND_ERASE_WRITE_PROTECTED	1
> +#define NAND_ERASE_BAD_BLOCK		2
> +#define NAND_ERASE_BLOCK_ERASE_FAILED	3

Why exactly do you need these statuses? I thought the existing error
codes were sufficient..

> +
>  #endif /* __LINUX_MTD_NAND_H */

Brian

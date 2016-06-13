Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCY99-0007tO-Nj
 for linux-mtd@lists.infradead.org; Mon, 13 Jun 2016 20:07:44 +0000
Date: Mon, 13 Jun 2016 22:07:21 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [V3, 1/2] mtd: brcmnand: Add check for erased page bitflips
Message-ID: <20160613220721.65924b60@bbrezillon>
In-Reply-To: <1465507075-9447-1-git-send-email-kdasu.kdev@gmail.com>
References: <1465507075-9447-1-git-send-email-kdasu.kdev@gmail.com>
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

On Thu,  9 Jun 2016 17:17:54 -0400
Kamal Dasu <kdasu.kdev@gmail.com> wrote:

> Check for erased page bitflips in a page. And if well within
> threshold return data as all 0xff. Apply sw check for controller
> version < 7.2. Controller vesion >= 7.2 has hw support.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Applied both.

Thanks,

Boris

> ---
> V3 changes
>  Return the max bitflips from a sector within a page
> V2 changes 
>  Added use of nand_check_erased_ecc_chunk
>  Restrict change to older controller < 7.2
> ---
> 
>  drivers/mtd/nand/brcmnand/brcmnand.c | 62 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index b76ad7c..7ee9617 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1545,6 +1545,56 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
>  	return ret;
>  }
>  
> +/*
> + * Check a page to see if it is erased (w/ bitflips) after an uncorrectable ECC
> + * error
> + *
> + * Because the HW ECC signals an ECC error if an erase paged has even a single
> + * bitflip, we must check each ECC error to see if it is actually an erased
> + * page with bitflips, not a truly corrupted page.
> + *
> + * On a real error, return a negative error code (-EBADMSG for ECC error), and
> + * buf will contain raw data.
> + * Otherwise, buf gets filled with 0xffs and return the maximum number of
> + * bitflips-per-ECC-sector to the caller.
> + *
> + */
> +static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
> +		  struct nand_chip *chip, void *buf, u64 addr)
> +{
> +	int i, sas;
> +	void *oob = chip->oob_poi;
> +	int bitflips = 0;
> +	int page = addr >> chip->page_shift;
> +	int ret;
> +
> +	if (!buf) {
> +		buf = chip->buffers->databuf;
> +		/* Invalidate page cache */
> +		chip->pagebuf = -1;
> +	}
> +
> +	sas = mtd->oobsize / chip->ecc.steps;
> +
> +	/* read without ecc for verification */
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> +	ret = chip->ecc.read_page_raw(mtd, chip, buf, true, page);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
> +		ret = nand_check_erased_ecc_chunk(buf, chip->ecc.size,
> +						  oob, sas, NULL, 0,
> +						  chip->ecc.strength);
> +		if (ret < 0)
> +			return ret;
> +
> +		bitflips = max(bitflips, ret);
> +	}
> +
> +	return bitflips;
> +}
> +
>  static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
>  			 u64 addr, unsigned int trans, u32 *buf, u8 *oob)
>  {
> @@ -1575,6 +1625,18 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
>  	}
>  
>  	if (mtd_is_eccerr(err)) {
> +		/*
> +		 * Controller version 7.2 has hw encoder to detect erased page
> +		 * bitflips, apply sw verification for older controllers only
> +		 */
> +		if (ctrl->nand_version < 0x0702) {
> +			err = brcmstb_nand_verify_erased_page(mtd, chip, buf,
> +							      addr);
> +			/* erased page bitflips corrected */
> +			if (err > 0)
> +				return err;
> +		}
> +
>  		dev_dbg(ctrl->dev, "uncorrectable error at 0x%llx\n",
>  			(unsigned long long)err_addr);
>  		mtd->ecc_stats.failed++;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

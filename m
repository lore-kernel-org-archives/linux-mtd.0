Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7ImR-0003kL-Hh
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 08:42:36 +0000
Date: Mon, 30 May 2016 10:42:13 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH 1/2] mtd: brcmnand: Add check for erased page bitflips
Message-ID: <20160530104213.79ff4a28@bbrezillon>
In-Reply-To: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
References: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
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

Hi Kamal,

On Fri, 29 Apr 2016 16:21:24 -0400
Kamal Dasu <kdasu.kdev@gmail.com> wrote:

> Check for erased page bitflips in a page. And if well within
> threshold return data as all 0xff.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 83 +++++++++++++++++++++++++++++++++---
>  1 file changed, 78 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index e052839..29a9abd 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1490,6 +1490,64 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
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
> + * Otherwise, fill buf with 0xff and return the maximum number of
> + * bitflips-per-ECC-sector to the caller.
> + *
> + */
> +static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
> +		  struct nand_chip *chip, void *buf, u64 addr)
> +{
> +	int i, sas, oob_nbits, data_nbits;
> +	void *oob = chip->oob_poi;
> +	unsigned int max_bitflips = 0;
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
> +	oob_nbits = sas << 3;
> +	data_nbits = chip->ecc.size << 3;
> +
> +	/* read without ecc for verification */
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> +	ret = chip->ecc.read_page_raw(mtd, chip, buf, true, page);

Do you really need to read the whole page in raw mode? Usually, only
reading the OOB sections is enough.

> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
> +		unsigned int bitflips = 0;
> +
> +		bitflips += oob_nbits - bitmap_weight(oob, oob_nbits);
> +		bitflips += data_nbits - bitmap_weight(buf, data_nbits);
> +
> +		buf += chip->ecc.size;
> +		addr += chip->ecc.size;

You seem to duplicate nand_check_erased_ecc_chunk() here. Do you have a
good reason for doing that?

Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

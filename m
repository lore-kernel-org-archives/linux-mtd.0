Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1duvv8-0003CM-Dw
 for linux-mtd@lists.infradead.org; Thu, 21 Sep 2017 07:29:17 +0000
Date: Thu, 21 Sep 2017 09:28:49 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2] mtd: nand: Add support for Toshiba BENAND
 (Built-in ECC NAND)
Message-ID: <20170921092849.6f1ba4b8@bbrezillon>
In-Reply-To: <1505971922-4994-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
References: <1505971922-4994-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
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

On Thu, 21 Sep 2017 14:32:02 +0900
KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:

> This patch enables support for Toshiba BENAND.
> The current implementation does not support vondor specific command

					       ^ vendor

> TOSHIBA_NAND_CMD_ECC_STATUS. I would like to add the command, when
> the exec_op() [1] infrastructure is implemented.

It's not a good idea to reference a branch that is likely to disappear
in a commit message. Just say that you can't properly support the
TOSHIBA_NAND_CMD_ECC_STATUS operation right and that it might be
addressed in the future.

> 
> [1] https://github.com/bbrezillon/linux/commits/nand/exec_op1
> 
> Changelog[v2]:
>     Rewrite to adapt the mtd "separate vendor specific code from
>     core" cleanup process that based on comments from the following
>     discussion.
>     http://patchwork.ozlabs.org/patch/767191/

I know it's different for each subsystem, but for MTD, we don't put
changelogs in the commit message.

> 
> Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
> ---

Move the changelog here.

>  drivers/mtd/nand/nand_toshiba.c | 100 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/nand_toshiba.c
> index 57df857..7a99bbe 100644
> --- a/drivers/mtd/nand/nand_toshiba.c
> +++ b/drivers/mtd/nand/nand_toshiba.c
> @@ -17,6 +17,72 @@
>  
>  #include <linux/mtd/rawnand.h>
>  
> +/* ECC Status Read Command for BENAND */
> +#define TOSHIBA_NAND_CMD_ECC_STATUS	0x7A
> +
> +/* Recommended to rewrite for BENAND */
> +#define TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED	BIT(3)
> +
> +static int toshiba_nand_benand_status_chk(struct mtd_info *mtd,
> +					  struct nand_chip *chip)
> +{
> +	unsigned int max_bitflips = 0;
> +	u8 status;
> +
> +	/* Check Read Status */
> +	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> +	status = chip->read_byte(mtd);
> +
> +	/*
> +	 * TOSHIBA_NAND_CMD_ECC_STATUS is vendor specific command.
> +	 * We will rewrite this code, after the ->exec_op() infrastructure
> +	 * is implemented

Missing period at the end of your sentence. And again, I would not name
the future stuff here. Just say that currently you have no way to send
arbitrary sequences of CMD+ADDR+DATA cycles and thus cannot support this
custom TOSHIBA_NAND_CMD_ECC_STATUS operation. 

> +	 * Now, we set max_bitflips mtd->bitflip_threshold.

	   For now,

> +	 */
> +	if (status & NAND_STATUS_FAIL) {
> +		/* uncorrectable */
> +		mtd->ecc_stats.failed++;
> +	} else if (status & TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED) {
> +		/* correctable */
> +		max_bitflips = mtd->bitflip_threshold;
> +		mtd->ecc_stats.corrected += max_bitflips;
> +	}

Is this working correctly when you read more than one ECC chunk? The
ECC step size is 512 bytes and the page is bigger than that, which means
you have more than one ECC chunk per page. What happens to the
NAND_STATUS_FAIL flag if the first chunk is uncorrectable but
following ones are correctable (or do not contain bitflips at all)? 

> +
> +	return max_bitflips;
> +}
> +
> +static int
> +toshiba_nand_read_page_benand(struct mtd_info *mtd,
> +			      struct nand_chip *chip, uint8_t *buf,
> +			      int oob_required, int page)
> +{
> +	unsigned int max_bitflips = 0;
> +
> +	chip->ecc.read_page_raw(mtd, chip, buf, oob_required, page);

Call nand_read_page_raw() directly.

> +	max_bitflips = toshiba_nand_benand_status_chk(mtd, chip);

	return toshiba_nand_benand_status_chk(mtd, chip);

> +
> +	return max_bitflips;
> +}
> +
> +static int
> +toshiba_nand_read_subpage_benand(struct mtd_info *mtd,
> +				 struct nand_chip *chip, uint32_t data_offs,
> +				 uint32_t readlen, uint8_t *bufpoi, int page)
> +{
> +	uint8_t *p;
> +	unsigned int max_bitflips = 0;
> +
> +	if (data_offs != 0)
> +		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_offs, -1);
> +
> +	p = bufpoi + data_offs;
> +	chip->read_buf(mtd, p, readlen);
> +
> +	max_bitflips = toshiba_nand_benand_status_chk(mtd, chip);

	return toshiba_nand_benand_status_chk(mtd, chip);

> +
> +	return max_bitflips;
> +}
> +
>  static void toshiba_nand_decode_id(struct nand_chip *chip)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> @@ -39,9 +105,43 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
>  
>  static int toshiba_nand_init(struct nand_chip *chip)
>  {
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +
>  	if (nand_is_slc(chip))
>  		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
>  
> +	if (nand_is_slc(chip) && (chip->id.data[4] & 0x80)) {
> +		/* BENAND */
> +
> +		/*
> +		 * We can't disable the internal ECC engine, the user
> +		 * has to use on-die ECC, there is no alternative.
> +		 */
> +		if (chip->ecc.mode != NAND_ECC_ON_DIE) {
> +			pr_err("On-die ECC should be selected.\n");
> +			return -EINVAL;
> +		}

According to your previous explanation that's not exactly true. Since
ECC bytes are stored in a separate area, the user can decide to use
another mode without trouble. Just skip the BENAND initialization when
mode != NAND_ECC_ON_DIE and we should be good, or am I missing something?

> +
> +		/*
> +		 * On BENAND, all OOB reginon can be used by user (driver).

			      the entire OOB region can be used by the
		   MTD user.

I'd drop the '(driver)' part since it's not really clear what the
driver is. If you're talking about the NAND controller driver then it's
wrong (at least most of the time), the real users of free OOB bytes are
upper layers (like JFFS2).

> +		 * The calculated ECC bytes are stored into other isolated
> +		 * area which is ubable to access from user.

			which is not accessible to users.

> +		 * This is why chip->ecc.bytes = 0.
> +		 */
> +		chip->ecc.bytes = 0;
> +		chip->ecc.size = 512;
> +		chip->ecc.strength = 8;
> +		chip->ecc.read_page = toshiba_nand_read_page_benand;
> +		chip->ecc.read_subpage = toshiba_nand_read_subpage_benand;
> +		chip->ecc.write_page = nand_write_page_raw;
> +		chip->ecc.read_page_raw = nand_read_page_raw;
> +		chip->ecc.write_page_raw = nand_write_page_raw;
> +
> +		chip->options |= NAND_SUBPAGE_READ;
> +
> +		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);

Can you please move this code block in a separate toshiba_benand_init()
function in order to keep the toshiba_nand_init() small/readable.

> +	}
> +
>  	return 0;
>  }
>  

Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTMJP-0004NX-1n
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 07:37:09 +0000
Date: Sun, 2 Dec 2018 08:29:18 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Bean Huo
 (beanhuo)" <beanhuo@micron.com>
Subject: Re: [PATCH RFC] mtd: rawnand: Cure MICRON NAND partial erase issue
Message-ID: <20181202082918.3b5f303a@bbrezillon>
In-Reply-To: <alpine.DEB.2.21.1811292207570.1657@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1811292207570.1657@nanos.tec.linutronix.de>
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

+Bean,

Hi Thomas,

First of all, I'd like to thank you for sharing this patch. I'm
pretty sure this will save days of painful debug sessions to a lot of
people.

On Thu, 29 Nov 2018 22:12:50 +0100 (CET)
Thomas Gleixner <tglx@linutronix.de> wrote:

> On some Micron NAND chips block erase fails occasionaly despite the chip
> claiming that it succeeded. The flash block seems to be not completely
> erased and subsequent usage of the block results in hard to decode and very
> subtle failures or corruption.
> 
> The exact reason is unknown, but experimentation has shown that it is only
> happening when erasing an erase block which is partially written. Partially
> written erase blocks are not uncommon with UBI/UBIFS.  Note, that this does
> not always happen. It's a rare and random, but eventually fatal failure.
> 
> For now, just blindly write 6 pages to 0. Again experimentation has shown
> that it's not sufficient to write pages at the beginning of the erase
> block. There need to be pages written in the second half of the erase block
> as well. So write 3 pages before and past the middle of the block.
> 
> Less than 6 pages might be sufficient, but it might even be necessary to
> write more pages to make sure that it's completely cured. Two pages still
> failed, but the 6 held up in a stress test scenario.
> 
> This should be optimized by keeping track of writes, but that needs proper
> information about the issue.
> 
> As it's just observation and experimentation based, it's probably wise to
> hold off on this until there is proper clarification about the root cause
> of the problem. The patch is for reference so others can avoid to decode
> this again, but there is no guarantee that it actually fixes the issue
> completely.

I agree. I Cc-ed Bean from Micron. Maybe he can provide more
information on this issue.

> 
> Therefore:
> 
> Not-yet-signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> 
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> 
> ---
> 
> P.S.: This was debugged on an older kernel version (sigh) and ported
>       forward without actual testing on mainline. My MTD foo is a bit
>       rusty, so I won't be surprised if there are better ways to do that.

Let's first wait for Bean's feedback before discussing implementation
details. BTW, do you remember the part number(s) of the flash(es)
impacted by this problem in your case?

Thanks,

Boris

> 
> ---
>  drivers/mtd/nand/raw/nand_base.c   |   89 +++++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/raw/nand_micron.c |    6 ++
>  include/linux/mtd/rawnand.h        |    3 +
>  3 files changed, 98 insertions(+)
> 
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4122,6 +4122,91 @@ static int nand_erase(struct mtd_info *m
>  	return nand_erase_nand(mtd_to_nand(mtd), instr, 0);
>  }
>  
> +static bool page_empty(char *buf, int len)
> +{
> +	unsigned int *p = (unsigned int *) buf;
> +	int i;
> +
> +	for (i = 0; i < len >> 2; i++, p++) {
> +		if (*p != UINT_MAX)
> +			return false;
> +	}
> +	return true;
> +}
> +
> +#define NAND_ERASE_QUIRK_PAGES		6
> +
> +/**
> + * nand_erase_quirk - [INTERN] Work around partial erase issues
> + * @chip:	NAND chip object
> + * @page:	Eraseblock base page number
> + *
> + * On some Micron NAND chips block erase fails occasionaly despite the chip
> + * claiming that it succeeded. The flash block seems to be not completely
> + * erased and subsequent usage of the block results in hard to decode and
> + * very subtle failures or corruption.
> + *
> + * The exact reason is unknown, but experimentation has shown that it is
> + * only happening when erasing an erase block which is only partially
> + * written. Partially written erase blocks are not uncommon with UBI/UBIFS.
> + * Note, that this does not always happen. It's a rare and random, but
> + * eventually fatal failure.
> + *
> + * For now, just blindly write 6 pages to 0. Again experimentation has
> + * shown that it's not sufficient to write pages at the beginning of the
> + * erase block. There need to be pages written in the second half of the
> + * erase block as well. So write 3 pages before and past the middle of the
> + * block.
> + *
> + * Less than 6 pages might be sufficient, but it might even be necessary to
> + * write more pages to make sure that it's completely cured. 2 pages still
> + * failed, but the 6 held up in a stress test scenario.
> + *
> + * FIXME: This should be optimized by keeping track of writes, but that
> + * needs proper information about the issue.
> + */
> +static int nand_erase_quirk(struct mtd_info *mtd, int page)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	unsigned int i, offs;
> +	u8 *buf;
> +
> +	if (!(chip->options & NAND_ERASE_QUIRK))
> +		return 0;
> +
> +	buf = kmalloc(mtd->writesize, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	/* Start at (pages_per_block / 2) - 3 */
> +	offs = 1 << (chip->phys_erase_shift - chip->page_shift);
> +	offs = (offs >> 1) - (NAND_ERASE_QUIRK_PAGES / 2);
> +	page = page + offs;
> +
> +	for (i = 0; i < NAND_ERASE_QUIRK_PAGES; i++, page++ ) {
> +		struct mtd_oob_ops ops = {
> +			.datbuf	= buf,
> +			.len	= mtd->writesize,
> +		};
> +
> +		/*
> +		 * Read the page back and check whether it is completely
> +		 * empty.
> +		 */
> +		nand_do_read_ops(mtd, page << chip->page_shift, &ops);
> +		if (page_empty(buf, mtd->writesize))
> +			continue;
> +		memset(buf, 0, mtd->writesize);
> +		/*
> +		 * Fill page with zeros. Ignore write failure as there
> +		 * is no way to recover here.
> +		 */
> +		nand_do_write_ops(mtd, page << chip->page_shift, &ops);
> +	}
> +	kfree(buf);
> +	return 0;
> +}
> +
>  /**
>   * nand_erase_nand - [INTERN] erase block(s)
>   * @chip: NAND chip object
> @@ -4186,6 +4271,10 @@ int nand_erase_nand(struct nand_chip *ch
>  		    (page + pages_per_block))
>  			chip->pagebuf = -1;
>  
> +		ret = nand_erase_quirk(mtd, page);
> +		if (ret)
> +			goto erase_exit;
> +
>  		if (chip->legacy.erase)
>  			status = chip->legacy.erase(chip,
>  						    page & chip->pagemask);
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -447,6 +447,12 @@ static int micron_nand_init(struct nand_
>  	if (ret)
>  		goto err_free_manuf_data;
>  
> +	/*
> +	 * FIXME: Mark all Micron flash with the ERASE QUIRK bit for now as
> +	 * it is unclear which flash types are affected/
> +	 */
> +	chip->options |= NAND_ERASE_QUIRK;
> +
>  	if (mtd->writesize == 2048)
>  		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
>  
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -163,6 +163,9 @@ enum nand_ecc_algo {
>  /* Device needs 3rd row address cycle */
>  #define NAND_ROW_ADDR_3		0x00004000
>  
> +/* Device requires erase quirk */
> +#define NAND_ERASE_QUIRK	0x00008000
> +
>  /* Options valid for Samsung large page devices */
>  #define NAND_SAMSUNG_LP_OPTIONS NAND_CACHEPRG
>  

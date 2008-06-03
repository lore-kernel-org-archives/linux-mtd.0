Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3aqw-0003jO-7y
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 18:03:22 +0000
Date: Tue, 3 Jun 2008 20:03:12 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 3/3] NAND multiple plane feature
Message-ID: <20080603180312.GD1224@logfs.org>
References: <alpine.LFD.1.10.0805281410030.23606@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.1.10.0805281410030.23606@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, dwmw2@infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 May 2008 14:42:48 +0100, Alexey Korolev wrote:
>
> +static int nand_read_operations(struct mtd_info *mtd, struct nand_chip *chip,
> +				      const uint8_t *buf, loff_t offt, int len, int sndcmd, int raw)
> +{
> +	int i = 0;
> +	int ret, phys_page;
> +	int page = (int)(offt >> chip->page_shift) & chip->pagemask;
> +	int block_mask = (1 << (chip->erase_shift - chip->page_shift)) - 1;
> +	int col, bytes, start_block, page_num;
> +	uint8_t *datbuf, *oobbuf;
> +
> +	/* starting erase block at first plane */
> +	start_block = (page & ~block_mask) * chip->numplanes;
> +	page_num = page & block_mask;
> +	while (i < chip->numplanes) {
> +		datbuf = (uint8_t *)(buf + chip->page_phys_size * i);
> +		oobbuf = chip->oob_poi + chip->oob_phys_size * i;
> +		col = (int)(offt & (mtd->writesize - 1));

Does the explicit cast make any difference?

> +		/* calculate column for current plane */
> +		col = (int)(col & (chip->page_phys_size - 1));
> +		bytes = min(chip->page_phys_size - col, len);
> +
> +		phys_page = start_block + page_num + (block_mask + 1) * i;
> +		if (likely(sndcmd)) {
> +			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, phys_page);
> +			if (chip->numplanes == 1)
> +				sndcmd = 0;
> +		}
> +		/* Now read the page into the buffer */
> +		if (unlikely(raw))
> +			ret = chip->ecc.read_page_raw(mtd, chip, datbuf, oobbuf);
> +		else
> +			ret = chip->ecc.read_page(mtd, chip, datbuf, oobbuf);
> +
> +		offt += bytes;
> +		len -= bytes;
> +		i++;

Looks like this could be a standard for loop as well.

And I am a bit surprised that you don't break out of the loop if bytes
ever becomes zero.  Is there a reason or did you just forget?

> +
> +		if (ret)
> +			break;
> +
> +		if (!(chip->options & NAND_NO_READRDY)) {
> +			if (!chip->dev_ready)
> +				udelay(chip->chip_delay);
> +			else
> +				nand_wait_ready(mtd);
> +			}

Wrong indentation.

> -			if (likely(sndcmd)) {
> -				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> -				sndcmd = 0;
> -			}
> -
> -			/* Now read the page into the buffer */
> -			if (unlikely(ops->mode == MTD_OOB_RAW))
> -				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi);
> -			else
> -				ret = chip->ecc.read_page(mtd, chip, bufpoi);
> -			if (ret < 0)
> -				break;
> +			nand_read_operations(mtd, chip, bufpoi, from, bytes, sndcmd, (ops->mode == MTD_OOB_RAW));

I like this part.  Actually making our monster-functions shorter is
always a good thing.

> -					int toread = min(oobreadlen,
> -						chip->ecc.layout->oobavail);
> +					int toread = min(oobreadlen, chip->ecc.layout->oobavail);

Please don't reformat the code.  Or if you do, send that as a seperate
patch, either the first or the last in the series.  Makes the review a
lot easier if I don't have to double-check every time. :)

>  					if (toread) {
> -						oob = nand_transfer_oob(chip,
> -							oob, ops, toread);
> +						oob = nand_transfer_oob(chip, oob, ops, toread);
>  						oobreadlen -= toread;
>  					}
>  				} else
> -					buf = nand_transfer_oob(chip,
> -						buf, ops, mtd->oobsize);
> +					buf = nand_transfer_oob(chip, buf, ops, mtd->oobsize);

Same here.  And dito for the newline-removals somewhere above.

> -static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
> +static int nand_write_operations(struct mtd_info *mtd, struct nand_chip *chip,
>  			   const uint8_t *buf, int page, int cached, int raw)
>  {
> +	int i = 0;
>  	int status;
> +	int block_mask = (1 << (chip->erase_shift - chip->page_shift)) - 1;
> +	int start_block = (page & ~block_mask) * chip->numplanes;
> +	int page_num = page & block_mask;
> +
> +	/* calculate physycal page at first plane */
> +	while (i < chip->numplanes) {
> +		page = start_block + page_num + (block_mask + 1) * i;
> +		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
> +
> +		if (unlikely(raw))
> +			chip->ecc.write_page_raw(mtd, chip, buf + chip->page_phys_size * i,
> +									chip->oob_poi + chip->oob_phys_size * i);
> +		else
> +			chip->ecc.write_page(mtd, chip, buf + chip->page_phys_size * i,
> +									chip->oob_poi + chip->oob_phys_size * i);
> +		i++;

Even here I'd prefer a for loop and use "i - 1" in the condition below.

> +		if (i < chip->numplanes) {
> +			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG_MP, -1, -1);
> +			if (!chip->dev_ready)
> +				udelay(chip->chip_delay);
> +			else
> +				nand_wait_ready(mtd);

This occurs for the second time.  And each time it was new code added by
you.  Looks like you should move it into some helper function, along
with a few lines of explanations why it is needed.

Jörn

-- 
There are three principal ways to lose money: wine, women, and engineers.
While the first two are more pleasant, the third is by far the more certain.
-- Baron Rothschild

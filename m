Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqAu3-000336-Mm
	for linux-mtd@lists.infradead.org; Tue, 13 Jun 2006 16:34:05 +0100
Subject: Re: [PATCH] NAND: fix reading/writing OOB for syndrome
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <20060613190146.f0e5f2b8.vwool@ru.mvista.com>
References: <20060613190146.f0e5f2b8.vwool@ru.mvista.com>
Content-Type: text/plain
Date: Tue, 13 Jun 2006 17:34:55 +0200
Message-Id: <1150212895.5257.342.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-13 at 19:01 +0400, Vitaly Wool wrote:
> +/**
> + * nand_read_oob_syndrome - [REPLACABLE] OOB data read function for HW ECC
> + * 					 with syndromes
> + * @mtd:	mtd info structure
> + * @chip:	nand chip info structure
> + * @buf:	buffer to store read data
> + * @offs:	offset to start reading from
> + * @length:	length of the OOB data to read
> + * @page:	page number to read
> + */
> +static void nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
> +				   uint8_t *buf, int offs, int length,
> +				   int page)
> +{
> +	int portion = mtd->oobsize / chip->ecc.steps;
> +	uint8_t *bufpoi = buf;
> +	int i;
> +
> +	/*
> +	 * We presume here that the chip driver is capable of
> +	 * emulating NAND_CMD_READOOB properly
> +	 */

???? You want to read in the data area of the FLASH !

> +	for (i = 0; i < chip->ecc.steps; i++) {
> +		if (offs) {
> +			while (portion < offs) {
> +				offs -= portion;
> +				i++;

		if (offs >= portion) {
			offs -= portion;
			continue;
		}

> +		}
> +		chip->read_buf(mtd, bufpoi, portion - offs);
> +		bufpoi += portion - offs;
> +		offs = 0;
> +		chip->cmdfunc(mtd, NAND_CMD_READOOB, (i + 1) * portion, page);

		CMD_READOOB is simply wrong 

Also it ignores the prepad and postpad parts.



> +	}
> +}
> +
> +/**
> + * nand_write_oob_raw - [REPLACABLE] the most common OOB data write function
> + * @mtd:	mtd info structure
> + * @chip:	nand chip info structure
> + * @buf:	buffer where to write data from
> + * @offs:	offset to start writing from
> + * @length:	length of the OOB data to write
> + * @page:	page number to write
> + */
> +static void nand_write_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
> +			       const uint8_t *buf, int offs, int length,
> +			       int page)
> +{
> +	chip->write_buf(mtd, buf, length);
> +}
> +static void (*nand_write_oob_swecc) (struct mtd_info *mtd,
> +				     struct nand_chip *chip,
> +				     const uint8_t *buf, int offs, int length,
> +				     int page) = nand_write_oob_raw;
> +static void (*nand_write_oob_hwecc) (struct mtd_info *mtd,
> +				     struct nand_chip *chip,
> +				     const uint8_t *buf, int offs, int length,
> +				     int page) = nand_write_oob_raw;
> +
> +/**
> + * nand_write_oob_syndrome - [REPLACABLE] OOB data write function for HW ECC
> + * 					  with syndrome
> + * @mtd:	mtd info structure
> + * @chip:	nand chip info structure
> + * @buf:	buffer where to write data from
> + * @offs:	offset to start writing from
> + * @length:	length of the OOB data to write
> + * @page:	page number to write
> + */
> +static void nand_write_oob_syndrome(struct mtd_info *mtd,
> +				    struct nand_chip *chip, const uint8_t *buf,
> +				    int offs, int length, int page)
> +{
> +	int portion = mtd->oobsize / chip->ecc.steps;
> +	int eccsize = chip->ecc.size;
> +	const uint8_t *bufpoi = buf;
> +	int i, len;
> +
> +	for (i = 0; i < chip->ecc.steps; i++) {
> +		if (offs < portion) {
> +			int status;
> +			chip->cmdfunc(mtd, NAND_CMD_SEQIN,
> +				      eccsize + i * (eccsize + portion) + offs,
> +				      page);
> +			len = min_t(int, length, portion - offs);
> +			chip->write_buf(mtd, bufpoi, len);
> +			bufpoi += len;
> +			length -= len;
> +			offs = 0;
> +
> +			if (i < chip->ecc.steps - 1) {
> +				chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +				status = chip->waitfunc(mtd, chip, FL_WRITING);
> +
> +				/* See if device thinks it succeeded */
> +				if (status & NAND_STATUS_FAIL)
> +					DEBUG(MTD_DEBUG_LEVEL0, "%s: "
> +					      "Failed write, page 0x%08x\n",
> +					      __FUNCTION__, page);
> +			}
> +		} else
> +			offs -= portion;
> +	}
> +}
> +

What about the prepad and postpad parts ?

> +/**
>   * nand_do_read_oob - [Intern] NAND read out-of-band
>   * @mtd:	MTD device structure
>   * @from:	offset to read from
> @@ -1127,7 +1254,7 @@ static int nand_do_read_oob(struct mtd_i
>  			sndcmd = 0;
>  		}
>  
> -		chip->read_buf(mtd, bufpoi, bytes);
> +		chip->ecc.read_oob(mtd, chip, bufpoi, col, bytes, page);
>  
>  		if (unlikely(!direct))
>  			buf = nand_transfer_oob(chip, buf, ops);

The direct part should go away and done inside the read functions.

> @@ -1598,13 +1726,15 @@ static int nand_do_write_oob(struct mtd_
>  		nand_fill_oob(chip, ops->oobbuf, ops);
>  		chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize,
>  			      page & chip->pagemask);

You put it unconditionally into oob area !!!

> -		chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> +		chip->ecc.write_oob(mtd, chip, chip->oob_poi, 0, mtd->oobsize,
> +				    page & chip->pagemask);
>  		memset(chip->oob_poi, 0xff, mtd->oobsize);
>  	} else {
>  		chip->cmdfunc(mtd, NAND_CMD_SEQIN,
>  			      mtd->writesize + ops->ooboffs,
>  			      page & chip->pagemask);

Same here !

> -		chip->write_buf(mtd, ops->oobbuf, ops->len);
> +		chip->ecc.write_oob(mtd, chip, ops->oobbuf, ops->ooboffs,
> +				    ops->len, page & chip->pagemask);
>  	}
>  

	tglx
	

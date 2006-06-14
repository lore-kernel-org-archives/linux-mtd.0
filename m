Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqYTM-00044R-Nh
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 17:44:08 +0100
Subject: Re: [PATCH] NAND: fix reading/writing OOB for syndrome: next iteration
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <20060614194520.ee6c500f.vwool@ru.mvista.com>
References: <20060614194520.ee6c500f.vwool@ru.mvista.com>
Content-Type: text/plain
Date: Wed, 14 Jun 2006 18:44:40 +0200
Message-Id: <1150303481.5257.460.camel@localhost.localdomain>
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

On Wed, 2006-06-14 at 19:45 +0400, Vitaly Wool wrote:
> Hi Thomas,
> 
> please see the new version inlined.
> Notable is that you can't optimize write_oob() parameters as you've proposed im #mtd because buf, offs and length are not always taken from ops.
> I've tested this version for syndrome and for software-based ecc and it seemed to work well with both (given that flash_eraseall -j won't work now anyway due to the OOB corruption we've discussed before).

Grrr. Fix you mail client. 

> Index: linux-2.6/drivers/mtd/nand/nand_base.c
> ===================================================================
> --- linux-2.6.orig/drivers/mtd/nand/nand_base.c
> +++ linux-2.6/drivers/mtd/nand/nand_base.c
> @@ -1084,6 +1084,166 @@ static int nand_read(struct mtd_info *mt
>  }
>  
>  /**
> + * nand_read_oob_raw - [REPLACABLE] the most common OOB data read function
> + * @mtd:	mtd info structure
> + * @chip:	nand chip info structure
> + * @buf:	buffer to store read data
> + * @offs:	offset to start writing from
> + * @length:	length of the OOB data to read
> + * @page:	page number to read
> + * @sndcmd:	pointer to the flag whether to issue read command or not
> + */
> +static void nand_read_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
> +			      uint8_t *buf, int offs, int length, int page,
> +			      int *sndcmd)
> +{
> +	if (*sndcmd) {

*smdcmd ?

s/void nand_.../int nand.../

> +		chip->cmdfunc(mtd, NAND_CMD_READOOB, offs, page);
> +		*sndcmd = 0;
> +	}
> +	chip->read_buf(mtd, buf, length);
> +}
> +static void (*nand_read_oob_swecc) (struct mtd_info *mtd,
> +				    struct nand_chip *chip, uint8_t *buf,
> +				    int offs, int length, int page,
> +				    int *sndcmd) =
> +    &nand_read_oob_raw;

What is this for ? We can put nand_read_oob_raw into the chip->ecc.xxx
pointer directly

> +static void (*nand_read_oob_hwecc) (struct mtd_info *mtd,
> +				    struct nand_chip *chip, uint8_t *buf,
> +				    int offs, int length, int page,
> +				    int *sndcmd) =
> +    &nand_read_oob_raw;
> +

Same here

> +/**
> + * nand_read_oob_syndrome - [REPLACABLE] OOB data read function for HW ECC
> + * 					 with syndromes
> + * @mtd:	mtd info structure
> + * @chip:	nand chip info structure
> + * @buf:	buffer to store read data
> + * @offs:	offset to start reading from
> + * @length:	length of the OOB data to read
> + * @page:	page number to read
> + * @sndcmd:	pointer to the flag whether to issue read command or not
> + */
> +static void nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
> +				   uint8_t *buf, int offs, int length,
> +				   int page, int *sndcmd)
> +{
> +	int portion = chip->ecc.bytes + chip->ecc.prepad + chip->ecc.postpad;
> +	uint8_t *bufpoi = buf;
> +	int i, toread;
> +
> +	for (i = 0; i < chip->ecc.steps; i++) {
> +		if (offs) {
> +			while (portion < offs) {
> +				offs -= portion;
> +				i++;
> +			}
> +		}

That breaks, if portion is < oobsize / ecc.steps and the offset is in
the last area. I gave you a hint for the correct code before.

> +		chip->cmdfunc(mtd, NAND_CMD_READ0,
> +				(i + 1) * chip->ecc.size + i * portion + offs,
> +				page);

We should use the random in command for the second read, as it is faster

> +		toread = min_t(int, length, portion - offs);
> +		chip->read_buf(mtd, bufpoi, toread);
> +		bufpoi += toread;
> +		length -= toread;
> +		offs = 0;
> +	}
> +	if (length > 0)
> +		chip->read_buf(mtd, bufpoi, length);

When offset is far enough off, you need to reposition the flash
pointer. 

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
> +static int nand_write_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
> +			       const uint8_t *buf, int offs, int length,
> +			       int page)
> +{
> +	int status = 0;
> +
> +	chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize + offs,
> +			page & chip->pagemask);
> +	chip->write_buf(mtd, buf, length);
> +	/* Send command to program the OOB data */
> +	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +
> +	status = chip->waitfunc(mtd, chip, FL_WRITING);
> +
> +	/* See if device thinks it succeeded */
> +	if (status & NAND_STATUS_FAIL)
> +		DEBUG(MTD_DEBUG_LEVEL0, "nand_write_oob: "
> +		      "Failed write, page 0x%08x\n", page);
> +
> +	return status;
> +}
> +static int (*nand_write_oob_swecc) (struct mtd_info *mtd,
> +				    struct nand_chip *chip,
> +				    const uint8_t *buf, int offs, int length,
> +				    int page) = nand_write_oob_raw;
> +static int (*nand_write_oob_hwecc) (struct mtd_info *mtd,
> +				    struct nand_chip *chip,
> +				    const uint8_t *buf, int offs, int length,
> +				    int page) = nand_write_oob_raw;

See above

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
> +static int nand_write_oob_syndrome(struct mtd_info *mtd,
> +				   struct nand_chip *chip, const uint8_t *buf,
> +				   int offs, int length, int page)
> +{
> +	int portion = chip->ecc.bytes + chip->ecc.prepad + chip->ecc.postpad;
> +	int eccsize = chip->ecc.size;
> +	const uint8_t *bufpoi = buf;
> +	int i, len, status = 0, sndcmd = 0;
> +
> +	chip->cmdfunc(mtd, NAND_CMD_SEQIN,
> +		      eccsize + offs,
> +		      page);

One line please.

> +	for (i = 0; i < chip->ecc.steps; i++) {
> +		if (offs < portion) {


		if (offs >= portion) {
			offs -= portion;
			continue;	
		}

		......
> +			if (sndcmd)
> +				chip->cmdfunc(mtd, NAND_CMD_RNDIN,
> +				      eccsize + i * (eccsize + portion) + offs,
> +				      -1);

Move the calculation into a seperate line please
				pos = .....;
				chip->...(...., pos, -1);

> +			else
> +				sndcmd = 1;
> +			len = min_t(int, length, portion - offs);
> +			chip->write_buf(mtd, bufpoi, len);
> +			bufpoi += len;
> +			length -= len;
> +			offs = 0;
> +		} else
> +			offs -= portion;
> +	}
> +	if (length > 0)
> +		chip->write_buf(mtd, bufpoi, length);

Needs seperate positioning depending on offset and layout

> +	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +	status = chip->waitfunc(mtd, chip, FL_WRITING);
> +
> +	/* See if device thinks it succeeded */
> +	if (status & NAND_STATUS_FAIL)
> +		DEBUG(MTD_DEBUG_LEVEL0, "%s: Failed write, page 0x%08x\n",
> +		      __FUNCTION__, page);
> +
> +	return status & NAND_STATUS_FAIL ? -EIO : 0;

Why is the pageprog command and the status wait in every implementation
and not in the calling code ?

> +}
> +
> +/**
>   * nand_do_read_oob - [Intern] NAND read out-of-band
>   * @mtd:	MTD device structure
>   * @from:	offset to read from
> @@ -1122,12 +1283,8 @@ static int nand_do_read_oob(struct mtd_i
>  		bytes = direct ? ops->ooblen : mtd->oobsize;
>  		bufpoi = direct ? buf : chip->buffers.oobrbuf;
>  
> -		if (likely(sndcmd)) {
> -			chip->cmdfunc(mtd, NAND_CMD_READOOB, col, page);
> -			sndcmd = 0;
> -		}
> -
> -		chip->read_buf(mtd, bufpoi, bytes);
> +		chip->ecc.read_oob(mtd, chip, bufpoi, col,
> +				  bytes, page, &sndcmd);
>  		if (unlikely(!direct))
>  			buf = nand_transfer_oob(chip, buf, ops);

Maybe we should get rid of that direct stuff and just read oobsize into
the buffer and transfer it afterwards. Would make the code simpler and
the number of arguments smaller:

	sndcmd = ecc.read_oob(mtd, page, sndcmd);

So we read the full oob into chip->buffers.oobrbuf and transfer it to
the callers buffer then.

> @@ -1596,28 +1753,16 @@ static int nand_do_write_oob(struct mtd_
>  		chip->oob_poi = chip->buffers.oobwbuf;
>  		memset(chip->oob_poi, 0xff, mtd->oobsize);
>  		nand_fill_oob(chip, ops->oobbuf, ops);
> -		chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize,
> -			      page & chip->pagemask);
> -		chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> +		status = chip->ecc.write_oob(mtd, chip, chip->oob_poi, 0,
> +				mtd->oobsize, page & chip->pagemask);
>  		memset(chip->oob_poi, 0xff, mtd->oobsize);
> -	} else {
> -		chip->cmdfunc(mtd, NAND_CMD_SEQIN,
> -			      mtd->writesize + ops->ooboffs,
> -			      page & chip->pagemask);
> -		chip->write_buf(mtd, ops->oobbuf, ops->len);
> -	}
> -
> -	/* Send command to program the OOB data */
> -	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +	} else
> +		status = chip->ecc.write_oob(mtd, chip, ops->oobbuf,
> +				ops->ooboffs, ops->len, page & chip->pagemask);

Maybe we should think about the direct comment in read_oob here too. Not
sure though.

	tglx

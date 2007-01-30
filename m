From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <45BA1A9D.60301@nokia.com> <45BA21E6.60301@nokia.com>
	<000101c7436b$14370420$c7a3580a@swcenter.sec.samsung.co.kr>
	<45BDACBA.2080503@nokia.com> <45BE1480.1060506@nokia.com>
Subject: RE: [PATCH] [MTD] OneNAND: Add support
	for	auto-placementofout-of-band data
Date: Tue, 30 Jan 2007 15:08:11 +0900
Message-ID: <003701c74435$0b1f61f0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <45BE1480.1060506@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

Now I tested it and it works well, 
It looks good except some minor error condition handling and type mismatch.
(see below)

Another interest things are nand is not passed in this test program. :)

/ # cat /proc/mtd
dev:    size   erasesize  name
mtd6: 00800000 00002000 "NAND simulator partition"
/ # insmod /mtd-utils/oobtest.ko dev=6
Using /mtd-utils/oobtest.ko

============================================================================
====
oobtest: dev = 6
oobtest: oob available per page = 8
oobtest: Test 1 of 5
oobtest: erasing
oobtest: erased 0
oobtest: erased 256
oobtest: erased 512
oobtest: erased 768
oobtest: erased 1024
oobtest: writing
oobtest: written 0
oobtest: written 256
oobtest: written 512
oobtest: written 768
oobtest: written 1024
oobtest: verifying
oobtest: verified 0
oobtest: verified 256
oobtest: verified 512
oobtest: verified 768
oobtest: verified 1024
oobtest: Test 2 of 5
oobtest: erasing
oobtest: erased 0
oobtest: erased 256
oobtest: erased 512
oobtest: erased 768
oobtest: erased 1024
oobtest: writing
oobtest: error: writeoob failed at 0x00000000
oobtest: error -22 occurred
============================================================================
====

Thank you,
Kyungmin Park


> @@ -787,20 +787,65 @@ static int onenand_read(struct mtd_info  }
>  
>  /**
> + * onenand_transfer_auto_oob - [Internal] oob auto-placement transfer
> + * @param mtd		MTD device structure
> + * @param buf		destination address
> + * @param column	oob offset to read from
> + * @param thislen	oob length to read
> + */
> +static int onenand_transfer_auto_oob(struct mtd_info *mtd, 
> uint8_t *buf, int column,
> +				int *thislen)
> +{
> +	struct onenand_chip *this = mtd->priv;
> +	struct nand_oobfree *free;
> +	int readcol = column;
> +	int readend = column + *thislen;
> +	int lastgap = 0, len = 0;
> +	uint8_t *oob_buf = this->page_buf + mtd->writesize;
> +
> +	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +		if (readcol >= lastgap)
> +			readcol += free->offset - lastgap;
> +		if (readend >= lastgap)
> +			readend += free->offset - lastgap;
> +		lastgap = free->offset + free->length;
> +	}
> +	if (readend > mtd->oobsize)
> +		readend = mtd->oobsize;

When this condition occurs?

> +	if (readcol < readend)
> +		this->read_bufferram(mtd, ONENAND_SPARERAM, 
> oob_buf + readcol,
> +				     readcol, readend - readcol);

ditto, what happend If readcol is grater than readend ?

> +	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +		int free_end = free->offset + free->length;
> +		if (free->offset < readend && free_end > readcol) {
> +			int st = max_t(int,free->offset,readcol);
> +			int ed = min_t(int,free_end,readend);
> +			int n = ed - st;
> +			memcpy(buf, oob_buf + st, n);
> +			len += n;
> +			buf += n;
> +		}
> +	}
> +	*thislen = len;

Why do we re-assign thislen value. In test program. it never changed.

> +	return 0;
> +}
> +

>  static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
>  			    struct mtd_oob_ops *ops)
>  {
> -	BUG_ON(ops->mode != MTD_OOB_PLACE);
> -
> +	switch (ops->mode)
> +	{

=> swich (ops->mode) {

> +	case MTD_OOB_PLACE:
> +	case MTD_OOB_AUTO:
> +		break;
> +	case MTD_OOB_RAW:
> +		return -EINVAL; /* Not implemented yet */
> +	default:
> +		return -EINVAL;
> +	}
>  	return onenand_do_read_oob(mtd, from + ops->ooboffs, 
> ops->ooblen,
> -				   &ops->oobretlen, ops->oobbuf);
> +				   &ops->oobretlen, 
> ops->oobbuf, ops->mode);
>  }
>  
> +static void onenand_fill_auto_oob(struct mtd_info *mtd, 
> u_char *oob_buf,
> +				  const u_char *buf, int 
> column, int *thislen) {

Use int return type for compatability.

> +	struct onenand_chip *this = mtd->priv;
> +	struct nand_oobfree *free;
> +	int writecol = column;
> +	int writeend = column + *thislen;
> +	int lastgap = 0, len = 0;
> +
> +	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +		if (writecol >= lastgap)
> +			writecol += free->offset - lastgap;
> +		if (writeend >= lastgap)
> +			writeend += free->offset - lastgap;
> +		lastgap = free->offset + free->length;
> +	}
> +	if (writeend > mtd->oobsize)
> +		writeend = mtd->oobsize;

It is also don't occurs if we need it use 'unlikely' macro

> +	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +		int free_end = free->offset + free->length;
> +		if (free->offset < writeend && free_end > writecol) {
> +			int st = max_t(int,free->offset,writecol);
> +			int ed = min_t(int,free_end,writeend);
> +			int n = ed - st;
> +			memcpy(oob_buf + st, buf, n);
> +			len += n;
> +			buf += n;
> +		}
> +	}
> +	*thislen = len;

add return 0;

> +}
> +
> +/**
>   * onenand_do_write_oob - [Internal] OneNAND write out-of-band
>   * @param mtd		MTD device structure
>   * @param to		offset to write to
>   * @param len		number of bytes to write
>   * @param retlen	pointer to variable to store the number 
> of written bytes
>   * @param buf		the data to write
> + * @param mode		operation mode
>   *
>   * OneNAND write out-of-band
>   */
>  static int onenand_do_write_oob(struct mtd_info *mtd, loff_t 
> to, size_t len,
> -				size_t *retlen, const u_char *buf)
> +				size_t *retlen, const u_char 
> *buf, mtd_oob_mode_t mode)
>  {
>  	struct onenand_chip *this = mtd->priv;
> -	int column, ret = 0;
> +	int column, ret = 0, oobsize;
>  	int written = 0;
>  
>  	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_oob: to = 
> 0x%08x, len = %i\n", (unsigned int) to, (int) len); @@ 
> -1081,9 +1187,23 @@ static int onenand_do_write_oob(struct m
>  	/* Initialize retlen, in case of early exit */
>  	*retlen = 0;
>  
> -	/* Do not allow writes past end of device */
> -	if (unlikely((to + len) > mtd->size)) {
> -		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: 
> Attempt write to past end of device\n");
> +	if (mode == MTD_OOB_AUTO)
> +		oobsize = this->ecclayout->oobavail;
> +	else
> +		oobsize = mtd->oobsize;
> +
> +	column = to & (mtd->oobsize - 1);
> +
> +	if (unlikely(column >= oobsize)) {
> +		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: 
> Attempted to start write outside oob\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Do not allow reads past end of device */
> +	if (unlikely(to >= mtd->size ||
> +		     len > ((mtd->size >> this->page_shift) -
> +			    (to >> this->page_shift)) * oobsize)) {
> +		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: 
> Attempted to write past 
> +end of device\n");
>  		return -EINVAL;
>  	}
>  
> @@ -1092,18 +1212,19 @@ static int onenand_do_write_oob(struct m
>  
>  	/* Loop until all data write */
>  	while (written < len) {
> -		int thislen = min_t(int, mtd->oobsize, len - written);
> +		int thislen = min_t(int, oobsize, len - written);
>  
>  		cond_resched();
>  
> -		column = to & (mtd->oobsize - 1);
> -
>  		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, 
> mtd->oobsize);
>  
>  		/* We send data to spare ram with oobsize
>  		 * to prevent byte access */
>  		memset(this->page_buf, 0xff, mtd->oobsize);
> -		memcpy(this->page_buf + column, buf, thislen);
> +		if (mode == MTD_OOB_AUTO)
> +			onenand_fill_auto_oob(mtd, 
> this->page_buf, buf, column, &thislen);
> +		else
> +			memcpy(this->page_buf + column, buf, thislen);
>  		this->write_bufferram(mtd, ONENAND_SPARERAM, 
> this->page_buf, 0, mtd->oobsize);
>  
>  		this->command(mtd, ONENAND_CMD_PROGOOB, to, 
> mtd->oobsize); @@ -1112,11 +1233,11 @@ static int 
> onenand_do_write_oob(struct m
>  
>  		ret = this->wait(mtd, FL_WRITING);
>  		if (ret) {
> -			DEBUG(MTD_DEBUG_LEVEL0, 
> "onenand_write_oob: write filaed %d\n", ret);
> +			DEBUG(MTD_DEBUG_LEVEL0, 
> "onenand_write_oob: write failed %d\n", 
> +ret);
>  			goto out;
>  		}
>  
> -		ret = onenand_verify_oob(mtd, buf, to, thislen);
> +		ret = onenand_verify_oob(mtd, this->page_buf, to);
>  		if (ret) {
>  			DEBUG(MTD_DEBUG_LEVEL0, 
> "onenand_write_oob: verify failed %d\n", ret);
>  			goto out;
> @@ -1127,8 +1248,9 @@ static int onenand_do_write_oob(struct m
>  		if (written == len)
>  			break;
>  
> -		to += thislen;
> +		to += mtd->writesize;
>  		buf += thislen;
> +		column = 0;
>  	}
>  
>  out:
> @@ -1149,10 +1271,18 @@ out:
>  static int onenand_write_oob(struct mtd_info *mtd, loff_t to,
>  			     struct mtd_oob_ops *ops)
>  {
> -	BUG_ON(ops->mode != MTD_OOB_PLACE);
> -
> +	switch (ops->mode)
> +	{
> +	case MTD_OOB_PLACE:
> +	case MTD_OOB_AUTO:
> +		break;
> +	case MTD_OOB_RAW:
> +		return -EINVAL; /* Not implemented yet */
> +	default:
> +		return -EINVAL;
> +	}
>  	return onenand_do_write_oob(mtd, to + ops->ooboffs, ops->ooblen,
> -				    &ops->oobretlen, ops->oobbuf);
> +				    &ops->oobretlen, 
> ops->oobbuf, ops->mode);
>  }
>  
>  /**
> @@ -1318,7 +1448,7 @@ static int onenand_default_block_markbad
>  
>          /* We write two bytes, so we dont have to mess with 
> 16 bit access */
>          ofs += mtd->oobsize + (bbm->badblockpos & ~0x01);
> -        return onenand_do_write_oob(mtd, ofs , 2, &retlen, buf);
> +        return onenand_do_write_oob(mtd, ofs , 2, &retlen, buf, 
> + MTD_OOB_PLACE);
>  }
>  
>  /**
> @@ -1612,7 +1742,7 @@ static int do_otp_lock(struct mtd_info *
>  	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
>  	this->wait(mtd, FL_OTPING);
>  
> -	ret = onenand_do_write_oob(mtd, from, len, retlen, buf);
> +	ret = onenand_do_write_oob(mtd, from, len, retlen, buf, 
> +MTD_OOB_PLACE);
>  
>  	/* Exit OTP access mode */
>  	this->command(mtd, ONENAND_CMD_RESET, 0, 0); @@ -2020,6 
> +2150,7 @@ static void onenand_resume(struct mtd_in
>   */
>  int onenand_scan(struct mtd_info *mtd, int maxchips)  {
> +	int i;
>  	struct onenand_chip *this = mtd->priv;
>  
>  	if (!this->read_word)
> @@ -2091,6 +2222,16 @@ int onenand_scan(struct mtd_info *mtd, i
>  	}
>  
>  	this->subpagesize = mtd->writesize >> mtd->subpage_sft;
> +
> +	/*
> +	 * The number of bytes available for a client to place data into
> +	 * the out of band area
> +	 */
> +	this->ecclayout->oobavail = 0;
> +	for (i = 0; this->ecclayout->oobfree[i].length; i++)
> +		this->ecclayout->oobavail +=
> +			this->ecclayout->oobfree[i].length;
> +
>  	mtd->ecclayout = this->ecclayout;
>  
>  	/* Fill in remaining MTD driver data */ diff --git 
> a/drivers/mtd/onenand/onenand_bbt.c 
> b/drivers/mtd/onenand/onenand_bbt.c
> index aa46b7f..acea9a1 100644
> --- a/drivers/mtd/onenand/onenand_bbt.c
> +++ b/drivers/mtd/onenand/onenand_bbt.c
> @@ -18,7 +18,7 @@ #include <linux/mtd/onenand.h>  #include 
> <linux/mtd/compatmac.h>
>  
>  extern int onenand_do_read_oob(struct mtd_info *mtd, loff_t 
> from, size_t len,
> -			       size_t *retlen, u_char *buf);
> +			       size_t *retlen, u_char *buf, 
> mtd_oob_mode_t mode);
>  
>  /**
>   * check_short_pattern - [GENERIC] check if a pattern is in 
> the buffer @@ -91,7 +91,7 @@ static int create_bbt(struct mtd_info *m
>  			/* No need to read pages fully,
>  			 * just read required OOB bytes */
>  			ret = onenand_do_read_oob(mtd, from + j 
> * mtd->writesize + bd->offs,
> -						  readlen, 
> &retlen, &buf[0]);
> +						  readlen, 
> &retlen, &buf[0], MTD_OOB_PLACE);
>  
>  			/* If it is a initial bad block, just 
> ignore it */
>  			if (ret && !(ret & ONENAND_CTRL_LOAD))
> --
> 1.4.3
> 

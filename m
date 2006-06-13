Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqB6y-0006Hm-W7
	for linux-mtd@lists.infradead.org; Tue, 13 Jun 2006 11:47:32 -0400
Date: Tue, 13 Jun 2006 19:48:14 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: tglx@linutronix.de
Subject: Re: [PATCH] NAND: fix reading/writing OOB for syndrome
Message-Id: <20060613194814.4ee01f06.vwool@ru.mvista.com>
In-Reply-To: <1150212895.5257.342.camel@localhost.localdomain>
References: <20060613190146.f0e5f2b8.vwool@ru.mvista.com>
	<1150212895.5257.342.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 Jun 2006 17:34:55 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> ???? You want to read in the data area of the FLASH !

No, it becomes a requirement to the NAND chip driver to convert NAND_CMD_READOOB to what's appropriate for the chip.
If we require the chip driver to be able to convert NAND_CMD_READOOB with offset 0, why not require it to convert it properly for other offsets?
 
> > +		chip->cmdfunc(mtd, NAND_CMD_READOOB, (i + 1) * portion, page);
> 
> 		CMD_READOOB is simply wrong 
> 
> Also it ignores the prepad and postpad parts.

See above.
I read all the OOB by portions for the (data, oob+ecc) x eccsteps layout.
I don't distinguish between spare OOB and ECC so I don't need to take prepad/postpad into account.
We'll just need another couple of funcs for syndromes that imply ( (data, ecc) x eccsteps, oob) layout.
 
> > +	for (i = 0; i < chip->ecc.steps; i++) {
> > +		if (offs < portion) {
> > +			int status;
> > +			chip->cmdfunc(mtd, NAND_CMD_SEQIN,
> > +				      eccsize + i * (eccsize + portion) + offs,
> > +				      page);
> > +			len = min_t(int, length, portion - offs);
> > +			chip->write_buf(mtd, bufpoi, len);
> > +			bufpoi += len;
> > +			length -= len;
> > +			offs = 0;
> > +
> > +			if (i < chip->ecc.steps - 1) {
> > +				chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> > +				status = chip->waitfunc(mtd, chip, FL_WRITING);
> > +
> > +				/* See if device thinks it succeeded */
> > +				if (status & NAND_STATUS_FAIL)
> > +					DEBUG(MTD_DEBUG_LEVEL0, "%s: "
> > +					      "Failed write, page 0x%08x\n",
> > +					      __FUNCTION__, page);
> > +			}
> > +		} else
> > +			offs -= portion;
> > +	}
> > +}
> > +
> 
> What about the prepad and postpad parts ?

See above.
 
> > +/**
> >   * nand_do_read_oob - [Intern] NAND read out-of-band
> >   * @mtd:	MTD device structure
> >   * @from:	offset to read from
> > @@ -1127,7 +1254,7 @@ static int nand_do_read_oob(struct mtd_i
> >  			sndcmd = 0;
> >  		}
> >  
> > -		chip->read_buf(mtd, bufpoi, bytes);
> > +		chip->ecc.read_oob(mtd, chip, bufpoi, col, bytes, page);
> >  
> >  		if (unlikely(!direct))
> >  			buf = nand_transfer_oob(chip, buf, ops);
> 
> The direct part should go away and done inside the read functions.

Hmmm... Probably.

 
> > @@ -1598,13 +1726,15 @@ static int nand_do_write_oob(struct mtd_
> >  		nand_fill_oob(chip, ops->oobbuf, ops);
> >  		chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize,
> >  			      page & chip->pagemask);
> 
> You put it unconditionally into oob area !!!

Can you please elaborate what's wrong there?

> > -		chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> > +		chip->ecc.write_oob(mtd, chip, chip->oob_poi, 0, mtd->oobsize,
> > +				    page & chip->pagemask);
> >  		memset(chip->oob_poi, 0xff, mtd->oobsize);
> >  	} else {
> >  		chip->cmdfunc(mtd, NAND_CMD_SEQIN,
> >  			      mtd->writesize + ops->ooboffs,
> >  			      page & chip->pagemask);
> 
> Same here !

And there.


Vitaly

Date: Tue, 10 Jun 2008 18:33:03 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature 
In-Reply-To: <alpine.LFD.1.10.0806052116000.3235@apollo.tec.linutronix.de>
Message-ID: <alpine.LFD.1.10.0806101807220.3097@casper.infradead.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<alpine.LFD.1.10.0806052116000.3235@apollo.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, joern@logfs.org, linux-mtd@lists.infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> 
> > As NAND multiple plane architecture assumes simultaneous write/erase of
> > several pages/blocks at the same time, we have to modify page/eraseblock
> > sizes and report modified size to upper layers. In other words physical
> > erase block size/ page size != reported erase block size/ page size.
> >
> > For example if we have dual plane device we have to extend erase block
> > size and page size in 2 times. 
> 
> And why the heck do you have to do all those phys_erase_shift changes ?
> 
> mtd->erase_size is completely independent of the nand internal
> information already. All it needs is to adjust the erase_size which is
> reported to the mtd layer.
> 

erase_shift is additional variable to handle cases when we need to
operate bit-shift representation of erase size. It makes sence since it
is used often in nand_base. 
Since there are many cases when we need to have bit-shift representation
for extended erase-size we decided to keep variable responsible for
extended erase size. 

> > Also this patch keep track on bad block management. NAND datasheets
> > alows us combine only pair of neibour blocks into dual/multiple plane
> > operations. So if we have multiple plane device and one block is bad,
> > reported extended block should be considered as bad. 
> 
> Please do this in a separate patch if it's even necessary at all.
> 
> > @@ -2269,13 +2269,13 @@ static struct nand_flash_dev *nand_get_f
> >  		/* Number of planes*/
> >  		chip->numplanes = 1 << ((planeid >> 2) & 0x03);
> 
> 		planeid is magically declared and initialized, right ?
> 
In patch 1/3
> >  		/* Calc pagesize */
> > -		mtd->writesize = 1024 << (extid & 0x3);
> > +		mtd->writesize = (1024 << (extid & 0x3)) * chip->numplanes;
> >  		extid >>= 2;
> >  		/* Calc oobsize */
> >  		mtd->oobsize = (8 << (extid & 0x01)) * (mtd->writesize >> 9);
> >  		extid >>= 2;
> >  		/* Calc blocksize. Blocksize is multiples of 64KiB */
> > -		mtd->erasesize = (64 * 1024) << (extid & 0x03);
> > +		mtd->erasesize = ((64 * 1024) << (extid & 0x03)) * chip->numplanes;
> >  		extid >>= 2;
> >  		/* Get buswidth information */
> >  		busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
> > @@ -2290,6 +2290,8 @@ static struct nand_flash_dev *nand_get_f
> >  		busw = type->options & NAND_BUSWIDTH_16;
> >  	}
> >  
> > +	chip->oob_phys_size = mtd->oobsize / chip->numplanes;
> 
> What the heck initializes chip->numplanes in the else path of 
> 
>         if (!type->pagesize) {
> 
> 
Correct, it will be fixed. 
> >  int nand_scan_tail(struct mtd_info *mtd)
> >  {
> > -	int i;
> > +	int i, j;
> > +	int oobfree_len;
> 
> One line
> 
Thanks
> >  			if (p[i] != 0xff)
> > @@ -103,6 +106,10 @@ static int check_pattern(uint8_t *buf, i
> >  				return -1;
> >  		}
> >  	}
> > +	p += len - end;
> > +	plane_num++;
> > +	}
> > +	while (plane_num < this->numplanes);
> >  	return 0;
> >  }
> 
> This change is completely useless. If you have to scan a buffer double
> the size, then the code can be called twice. Create an inline function
> which does the numplanes magic and call that.
Acked. It is already discussed with Joern. Code multiplication will be
removed. 
> > @@ -501,7 +514,7 @@ static int search_bbt(struct mtd_info *m
> >  
> >  			/* Read first page */
> >  			scan_read_raw(mtd, buf, offs, mtd->writesize);
> > -			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
> > +			if (!check_pattern(mtd, buf, scanlen, mtd->writesize, td)) {
> 
> And what puts the BBT magic pattern into both erase blocks ?
>
BBT operates extended blocks, no need to put pattern into each of both blocks.

Thanks,
Alexey

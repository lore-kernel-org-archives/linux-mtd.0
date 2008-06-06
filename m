Date: Fri, 6 Jun 2008 11:08:02 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
In-Reply-To: <alpine.LFD.1.10.0806052110560.3235@apollo.tec.linutronix.de>
Message-ID: <alpine.LFD.1.10.0806061043300.18675@pentafluge.infradead.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<20080603174244.GC1224@logfs.org>
	<alpine.LFD.1.10.0806051724560.16300@pentafluge.infradead.org>
	<alpine.LFD.1.10.0806052110560.3235@apollo.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>,
	dwmw2@infradead.org, vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> On Thu, 5 Jun 2008, Alexey Korolev wrote:
> > > > -	if (!chip->write_page)
> > > > -		chip->write_page = nand_write_page;
> > > > -
> > > 
> > > Why is this removed?
> > >
> > Oh. May be it would be better to make stand alone patch in order to
> > clean up NAND subsystem. Using chip->write_page is redundend here. It
> > is set once it is set for write procedure only. There is no chip read
> > page call like that. IMHO it is better to use static call here. Please
> > let me know if you are agree with this. 
> 
> No, it's definitely not better to use a static call here. Cared to look
> at the existing drivers, whether one provides it's own function ?
> 
> drivers/mtd/nand/cafe_nand.c:	cafe->nand.write_page = cafe_nand_write_page;
>
It make sence to remove because of:
1. nand_chip structure looks ugly with that function. It contains write_page but it does not contain read_page.
2. existence of such redefinition is redundend. There is definetely no need to redefine it. 

The only reasignment of write_page call in whole nand subsystem exists in cafe driver. 
But the purpose of this reasigment looks rather unclear.
Try to find at least one line difference between cafe_nand_write_page and nand_write_page. I wonder how this code get included ?

Thanks,
Alexey


-------
static int cafe_nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
				const uint8_t *buf, int page, int cached, int raw)
{
	int status;

	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);

	if (unlikely(raw))
		chip->ecc.write_page_raw(mtd, chip, buf);
	else
		chip->ecc.write_page(mtd, chip, buf);

	/*
	 * Cached progamming disabled for now, Not sure if its worth the
	 * trouble. The speed gain is not very impressive. (2.3->2.6Mib/s)
	 */
	cached = 0;

	if (!cached || !(chip->options & NAND_CACHEPRG)) {

		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
		status = chip->waitfunc(mtd, chip);
		/*
		 * See if operation failed and additional status checks are
		 * available
		 */
		if ((status & NAND_STATUS_FAIL) && (chip->errstat))
			status = chip->errstat(mtd, chip, FL_WRITING, status,
					       page);

		if (status & NAND_STATUS_FAIL)
			return -EIO;
	} else {
		chip->cmdfunc(mtd, NAND_CMD_CACHEDPROG, -1, -1);
		status = chip->waitfunc(mtd, chip);
	}

#ifdef CONFIG_MTD_NAND_VERIFY_WRITE
	/* Send command to read back the data */
	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);

	if (chip->verify_buf(mtd, buf, mtd->writesize))
		return -EIO;
#endif
	return 0;
}
------

static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
			   const uint8_t *buf, int page, int cached, int raw)
{
	int status;

	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);

	if (unlikely(raw))
		chip->ecc.write_page_raw(mtd, chip, buf);
	else
		chip->ecc.write_page(mtd, chip, buf);

	/*
	 * Cached progamming disabled for now, Not sure if its worth the
	 * trouble. The speed gain is not very impressive. (2.3->2.6Mib/s)
	 */
	cached = 0;

	if (!cached || !(chip->options & NAND_CACHEPRG)) {

		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
		status = chip->waitfunc(mtd, chip);
		/*
		 * See if operation failed and additional status checks are
		 * available
		 */
		if ((status & NAND_STATUS_FAIL) && (chip->errstat))
			status = chip->errstat(mtd, chip, FL_WRITING, status,
					       page);

		if (status & NAND_STATUS_FAIL)
			return -EIO;
	} else {
		chip->cmdfunc(mtd, NAND_CMD_CACHEDPROG, -1, -1);
		status = chip->waitfunc(mtd, chip);
	}

#ifdef CONFIG_MTD_NAND_VERIFY_WRITE
	/* Send command to read back the data */
	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);

	if (chip->verify_buf(mtd, buf, mtd->writesize))
		return -EIO;
#endif
	return 0;
}

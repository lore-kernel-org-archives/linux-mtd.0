Date: Tue, 10 Jun 2008 18:54:16 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC/PATCH 3/3] NAND multiple plane feature 
In-Reply-To: <alpine.LFD.1.10.0806052203520.3235@apollo.tec.linutronix.de>
Message-ID: <alpine.LFD.1.10.0806101834050.3097@casper.infradead.org>
References: <alpine.LFD.1.10.0805281410030.23606@pentafluge.infradead.org>
	<alpine.LFD.1.10.0806052203520.3235@apollo.tec.linutronix.de>
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


> > + * @oobbuf:	buffer to store read oob
> >   */
> >  static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> > -			      uint8_t *buf)
> > +			      uint8_t *buf, uint8_t *oobbuf)
> 
> Why is this change necessary ?
>
We must specify what part of reported extended oobbuf we should fill in
low level functions.
> > +					int toread = min(oobreadlen, chip->ecc.layout->oobavail);
> 
>   what's the effective change ?
>
Thanks, we missed it.  
> > +	int start_block = (page & ~block_mask) * chip->numplanes;
> > +	int page_num = page & block_mask;
> > +
> > +	while (i < chip->numplanes) {
> 
>   for (i = 0; .....
>
TBD  
> > +			if (!chip->dev_ready)
> > +				udelay(chip->chip_delay);
> > +			else
> > +				nand_wait_ready(mtd);
> > +		} else
> > +			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> > +	}
> >  	status = chip->waitfunc(mtd, chip);
> 
> Sigh. There is one call site for this and there we can do the whole
> numplanes hackery in 5 lines of code and extend the function with a
> parameter which command to use. Which also allows those driver which
> have their own function to utilize the multiplane features.
>
Did not understand the question. Please clarify. 

> >  					    int page,
> > @@ -362,7 +363,6 @@ struct nand_buffers {
> >   * @priv:		[OPTIONAL] pointer to private chip date
> >   * @errstat:		[OPTIONAL] hardware specific function to perform additional error status checks
> >   *			(determine if errors are correctable)
> > - * @write_page:		[REPLACEABLE] High-level page write function
> >   */
> >  
> >  struct nand_chip {
> > @@ -385,8 +385,6 @@ struct nand_chip {
> >  	void		(*erase_cmd)(struct mtd_info *mtd, int page);
> >  	int		(*scan_bbt)(struct mtd_info *mtd);
> >  	int		(*errstat)(struct mtd_info *mtd, struct nand_chip *this, int state, int status, int page);
> > -	int		(*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
> > -				      const uint8_t *buf, int page, int cached, int raw);
> >  
> >  	int		chip_delay;
> >  	unsigned int	options;> 
> 
> The whole multiplane stuff needs to be done at the highest possible
> level of the nand driver and not pushed down into the low level
> functions, which access the hardware.
>
Multi-plane feature is not the completely the same as combination of several chips into
one package. This is low level feature of new NAND devices which have own commands to access
hardware. If I would place it at very top level, layout will be broken.

Thanks,
Alexey

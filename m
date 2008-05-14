Date: Wed, 14 May 2008 18:34:21 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
In-Reply-To: <20080501202523.GA17828@logfs.org>
Message-ID: <Pine.LNX.4.64.0805141814300.5183@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
	<20080501202523.GA17828@logfs.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> >  /**
> > + * nand_read_subpage - [REPLACABLE] software ecc based sub-page read function
> > + * @mtd:	mtd info structure
> > + * @chip:	nand chip info structure
> > + * @dataofs	offset of requested data within the page 
> > + * @readlen	data length 
> > + * @buf:	buffer to store read data
> > + */
> > +static int nand_read_subpage(struct mtd_info * mtd,struct nand_chip *chip, uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi)
>                                                  ^   ^^
> A linebreak would help.  The indicated space should move five bytes to
> the right.  And there are a few similar stylistic things below.  If you
> feed this through checkpatch.pl, you should find them all.
> 
> buf and bufpoi should be the same name (I personally would prefer buf).
> And you should document that the buffer has to be bigger than readlen.
> There is just a single caller, but such a counter-intuitive detail can
> easily cause bugs some years from now.
>
Oops. You are right. Wrong styling will be fixed. Thanks.
> > +{
> > +	int start_step, end_step, num_steps;
> > +	uint32_t *eccpos = chip->ecc.layout->eccpos;
> > +	uint8_t *p;
> > +	int data_col_addr, i, gaps = 0;
> > +	int datafrag_len, eccfrag_len, aligned_len, aligned_pos;
> > +	int busw = (chip->options & NAND_BUSWIDTH_16) ? 2 : 1;
> > +	
> > +	/* Column address wihin the page aligned to ECC size (256bytes). */
> 
> within
> 
> > +	start_step = data_offs / chip->ecc.size;
> > +	end_step = (data_offs + readlen - 1) / chip->ecc.size;
> 
> Divisions are fairly expensive computations.  Can they be replaced by
> shifts?
> 
I've thought about it. In current desing we assume that ecc.size may
vary. So substitution division  with shift will be related to extension
of the structures. 
If it make sence to do it, it should be done in separate patch. As it is
another thing. 


Alexey

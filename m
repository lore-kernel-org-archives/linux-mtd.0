Date: Thu, 5 Jun 2008 17:58:14 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
In-Reply-To: <20080603174244.GC1224@logfs.org>
Message-ID: <alpine.LFD.1.10.0806051724560.16300@pentafluge.infradead.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<20080603174244.GC1224@logfs.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
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

> > -	if (!chip->write_page)
> > -		chip->write_page = nand_write_page;
> > -
> 
> Why is this removed?
>
Oh. May be it would be better to make stand alone patch in order to
clean up NAND subsystem. Using chip->write_page is redundend here. It
is set once it is set for write procedure only. There is no chip read
page call like that. IMHO it is better to use static call here. Please
let me know if you are agree with this. 
> > @@ -2593,6 +2594,21 @@ int nand_scan_tail(struct mtd_info *mtd)
> >  
> >  	/* propagate ecc.layout to mtd_info */
> >  	mtd->ecclayout = chip->ecc.layout;
> > +	if (chip->numplanes > 1) {
> > +			;
> > +		for (oobfree_len = 0; chip->ecc.layout->oobfree[oobfree_len].length; oobfree_len++)
> 
> Empty loop body.  And the header doesn't seem to have a side-effect
> either.  If it does, it can sure use a comment.
This is a very short way to calculate oobfree_len. It increases counter
until chip->ecc.layout->oobfree[_oobfree_len_].length is not 0. Comment
will be added.
> > +		i = 0;
> > +		while (i < chip->numplanes) {
> 
> 		for (i = 0; i < chip->numplanes; i++) ?
>
Oh thanks. I missed this substitution in code clean up. Will be fixed. 
> > +			for (j = 0; j < oobfree_len ; j++) {
> > +				chip->ecc.layout->oobfree[j + i * oobfree_len].length = chip->ecc.layout->oobfree[j].length;
> > +				chip->ecc.layout->oobfree[j + i * oobfree_len].offset = chip->ecc.layout->oobfree[j].offset + chip->oob_phys_size * i;
> 
> Even if I sound like Andrew Morton, what is the meaning of i and j?
> Maybe rename the variable so future readers don't ask that question?
> Add a helper variable for chip->ecc.layout->oobfree and I might even be
> able to understand what this code does. ;)
> 
Making code human readible is a hard task. It seems we need to do some
more work here. I'll send out a possible variant for this. 
> >  */
> > -static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
> > +static int check_pattern(struct mtd_info *mtd, uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
> >  {
> >  	int i, end = 0;
> > +	struct nand_chip *this = mtd->priv;
> > +	int plane_num = 0;
> >  	uint8_t *p = buf;
> >  
> > -	end = paglen + td->offs;
> > +	do {
> > +	end = this->page_phys_size + td->offs;
> 
> The loop wants indentation.
> 
Acked. 

> >  	if (td->options & NAND_BBT_SCANEMPTY) {
> >  		for (i = 0; i < end; i++) {
> >  			if (p[i] != 0xff)
> > @@ -103,6 +106,10 @@ static int check_pattern(uint8_t *buf, i
> >  				return -1;
> >  		}
> >  	}
> > +	p += len - end;
> > +	plane_num++;
> > +	}
> > +	while (plane_num < this->numplanes);
> 
> 	} while (plane_num < this->numplanes);
> 
> > -		if (p[td->offs + i] != td->pattern[i])
> > +		if (p[this->oob_phys_size * plane_num + td->offs + i] != td->pattern[i])
> 
> This is beyond me.  Without context I have no clue what it does.  And
> even with context it is hard work to figure it out.  Not good.
> 
> My first thought was to move the calculation of
> "p[this->oob_phys_size * plane_num + td->offs + i]" to an inline
> function.  But I doubt whether that is much better.  Ideas?
> 
I think it would be better to add some new variables to make it more
clear. We will post a possible resolution for this hard place. 
> >  			return -1;
> >  	}
> 
> > -#define NAND_MAX_OOBSIZE	64
> > -#define NAND_MAX_PAGESIZE	2048
> > +#define NAND_MAX_OOBSIZE	128
> > +#define NAND_MAX_PAGESIZE	4096
> 
> Are there chips with four planes around already?
>
No. AFAIK there are plans only for those chips. I don't know how soon
they will appear, may be next year.


Thanks,
Alexey 

Received: from smtp127.sbc.mail.sp1.yahoo.com ([69.147.65.186])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LcB7w-0004hP-KJ
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 04:12:11 +0000
From: David Brownell <david-b@pacbell.net>
To: Thiago Galesi <thiagogalesi@gmail.com>
Subject: Re: [patch/RESEND 2.6.29-rc3-git] NAND: davinci_nand driver
Date: Tue, 24 Feb 2009 20:12:06 -0800
References: <200902241509.54649.david-b@pacbell.net>
	<82ecf08e0902241755y5a7be725gb84116433b7d3be2@mail.gmail.com>
In-Reply-To: <82ecf08e0902241755y5a7be725gb84116433b7d3be2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200902242012.06447.david-b@pacbell.net>
Cc: DaVinci <davinci-linux-open-source@linux.davincidsp.com>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 24 February 2009, Thiago Galesi wrote:
> OK a couple of things
>  +
> > +
> > +#ifdef CONFIG_MTD_PARTITIONS
> > +static inline int mtd_has_partitions(void) { return 1; }
> > +#else
> > +static inline int mtd_has_partitions(void) { return 0; }
> > +#endif
> > +
> > +#ifdef CONFIG_MTD_CMDLINE_PARTS
> > +static inline int mtd_has_cmdlinepart(void) { return 1; }
> > +#else
> > +static inline int mtd_has_cmdlinepart(void) { return 0; }
> > +#endif
> 
> I'm not sure stylewise this is the best way. Even though #ifdefs stays
> outside of functions, this is a case where maybe it's better to put it
> inside or rething the need / usage for these functions.

My preference would be to have those functions live in the
MTD headers.

Needing #ifdefs in the body of probe() is *extremely* error
prone.  Having function versions makes it harder to commit
a lot of the common errors I've seen, like having some mix
of options gratuitously break compiles because of missing
code fragments or variable declarations.  It also makes it
easier to see when code is obviously doing the wrong thing.

Note that #ifdefs-in-functions is contrary to standard
kernel coding practices.  It persists in the MTD code
mostly due to legacy drivers, from what I can tell, which
do so because ... there's been no better option, such as
having those functions.


> > +static int nand_davinci_calculate_1bit(struct mtd_info *mtd,
> > +                                     const u_char *dat, u_char *ecc_code)
> 
> (and others)
> 
> My beef here is the use of u_char. This is really not a standart C
> type or a standart Linux type (u8/u32 etc), so we should aim for those
> (yes, I hate typing unsigned blah blah blah) but you can use u8 for
> that.

I too would like to see <linux/mtd/*.h> use u8/u32/etc.  But
in this case, it's just doing what the MTD framework does.
If I used u8/u32/etc the usual feedback would be "do what
all the other drivers do", "match the interface decls", etc.


> > +static void nand_davinci_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
> > +{
> > +       struct nand_chip *chip = mtd->priv;
> > +
> > +       if ((0x03 & ((unsigned)buf)) == 0 && (0x03 & len) == 0)
> > +               ioread32_rep(chip->IO_ADDR_R, buf, len >> 2);
> > +       else if ((0x01 & ((unsigned)buf)) == 0 && (0x01 & len) == 0)
> 
> What are those 0x03 and 0x01 (and other places as well), you'll have
> to spell out those, preferably using defines.

The "0x03" is "low two bits", "0x01" is "low one bit", etc.
Those functions can't be used except when memory address
is "naturally" aligned, and the data length likewise.

You might have an argument if you suggested a comment were
appropriate ... but those are very common idioms, used all
over the kernel without #defines that I've ever seen.  Did
you have suggestions for pre-existing symbols to use?

- Dave

Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeIZ4-0008JM-MY
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2015 08:04:40 +0000
Date: Tue, 22 Sep 2015 10:04:13 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>
Subject: Re: [RESEND PATCH v3 4/5] mtd: nand: make 'erased check' optional
Message-ID: <20150922100413.1c5e8710@bbrezillon>
In-Reply-To: <20150921233021.GH31505@google.com>
References: <1441296222-14989-1-git-send-email-boris.brezillon@free-electrons.com>
 <1441296222-14989-5-git-send-email-boris.brezillon@free-electrons.com>
 <20150921233021.GH31505@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, 21 Sep 2015 16:30:21 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Thu, Sep 03, 2015 at 06:03:41PM +0200, Boris Brezillon wrote:
> > Some ECC controllers do not need the extra 'erased check' done by the core.
> > Make it optional by creating a new NAND_ECC_DISABLE_ERASED_CHECK flag.
> > 
> > Reed-Solomon ECC engines are guaranteed to generate ff ECC bytes when the
> > page in empty and are thus able to fix bitflips in erased pages.
> > 
> > The software BCH implementation is also generating ff ECC bytes for empty
> > pages, and is thus able to fix bitflips in erased pages too.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 20 ++++++++++++++++----
> >  drivers/mtd/nand/r852.c      |  1 +
> >  drivers/mtd/nand/tmio_nand.c |  1 +
> >  drivers/mtd/nand/txx9ndfmc.c |  1 +
> >  include/linux/mtd/nand.h     |  8 ++++++++
> >  5 files changed, 27 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 9a109a5..3be312d 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -1419,7 +1419,8 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
> >  
> >  		stat = chip->ecc.correct(mtd, p,
> >  			&chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
> > -		if (stat == -EBADMSG) {
> > +		if (stat == -EBADMSG &&
> > +		    !(chip->ecc.options & NAND_ECC_DISABLE_ERASED_CHECK)) {
> >  			/* check for empty pages with bitflips */
> >  			stat = nand_check_erased_ecc_chunk(p, chip->ecc.size,
> >  						&chip->buffers->ecccode[i],
> > @@ -1477,7 +1478,8 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
> >  		int stat;
> >  
> >  		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
> > -		if (stat == -EBADMSG) {
> > +		if (stat == -EBADMSG &&
> > +		    !(chip->ecc.options & NAND_ECC_DISABLE_ERASED_CHECK)) {
> >  			/* check for empty pages with bitflips */
> >  			stat = nand_check_erased_ecc_chunk(p, eccsize,
> >  						&ecc_code[i], eccbytes,
> > @@ -1537,7 +1539,8 @@ static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
> >  		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
> >  
> >  		stat = chip->ecc.correct(mtd, p, &ecc_code[i], NULL);
> > -		if (stat == -EBADMSG) {
> > +		if (stat == -EBADMSG &&
> > +		    !(chip->ecc.options & NAND_ECC_DISABLE_ERASED_CHECK)) {
> >  			/* check for empty pages with bitflips */
> >  			stat = nand_check_erased_ecc_chunk(p, eccsize,
> >  						&ecc_code[i], eccbytes,
> > @@ -1600,7 +1603,8 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
> >  			oob += chip->ecc.postpad;
> >  		}
> >  
> > -		if (stat == -EBADMSG) {
> > +		if (stat == -EBADMSG &&
> > +		    !(chip->ecc.options & NAND_ECC_DISABLE_ERASED_CHECK)) {
> >  			/* check for empty pages with bitflips */
> >  			stat = nand_check_erased_ecc_chunk(p, chip->ecc.size,
> >  							   oob - eccstepsize,
> > @@ -4300,6 +4304,14 @@ int nand_scan_tail(struct mtd_info *mtd)
> >  		ecc->write_oob_raw = ecc->write_oob;
> >  
> >  	/*
> > +	 * The software implementation does not need the the erased check
> > +	 * since they already generate ff pattern for an erased page.
> > +	 */
> > +	if (ecc->correct == nand_bch_correct_data ||
> > +	    ecc->correct == nand_correct_data)
> > +		ecc->options |= NAND_ECC_DISABLE_ERASED_CHECK;
> > +
> > +	/*
> >  	 * The number of bytes available for a client to place data into
> >  	 * the out of band area.
> >  	 */
> > diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
> > index c9ad7a0..b82e4d9 100644
> > --- a/drivers/mtd/nand/r852.c
> > +++ b/drivers/mtd/nand/r852.c
> > @@ -876,6 +876,7 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
> >  	chip->ecc.hwctl = r852_ecc_hwctl;
> >  	chip->ecc.calculate = r852_ecc_calculate;
> >  	chip->ecc.correct = r852_ecc_correct;
> > +	chip->ecc.options |= NAND_ECC_DISABLE_ERASED_CHECK;
> 
> Maybe a comment here as to why? (e.g., something about hamming?)

Yep, I'll add a comment explaining why we put this flag.

[...]

> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > index 19d43b1..88956ab 100644
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h
> > @@ -128,6 +128,13 @@ typedef enum {
> >  #define NAND_ECC_WRITE		1
> >  /* Enable Hardware ECC before syndrome is read back from flash */
> >  #define NAND_ECC_READSYN	2
> > +/*
> > + * Disable NAND 'page erased' check. In any case, this check is only done when
> > + * ecc.correct() returns -EBADMSG.
> > + * Set this flag if your implementation is able to fix bitflips in erased
> > + * pages.
> > + */
> > +#define NAND_ECC_DISABLE_ERASED_CHECK	BIT(1)
> 
> Any good reason you start at BIT(1) instead of BIT(0)?

Nope. I'll fix that too.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

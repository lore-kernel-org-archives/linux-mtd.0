Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAwYK-0003tH-AP
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 10:51:38 +0000
Date: Wed, 17 May 2017 12:51:12 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 Wenyou Yang <wenyou.yang@microchip.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "Marek
 Vasut" <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: Wait for PAGEPROG to finish in drivers
 setting NAND_ECC_CUSTOM_PAGE_ACCESS
Message-ID: <20170517125112.4a8113eb@bbrezillon>
In-Reply-To: <633b8440-2961-e84a-edde-5a5afb9f0f52@sigmadesigns.com>
References: <1494952069-3914-1-git-send-email-boris.brezillon@free-electrons.com>
 <633b8440-2961-e84a-edde-5a5afb9f0f52@sigmadesigns.com>
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

On Wed, 17 May 2017 12:41:01 +0200
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> On 16/05/2017 18:27, Boris Brezillon wrote:
> 
> > Drivers setting NAND_ECC_CUSTOM_PAGE_ACCESS are supposed to handle the
> > full read/write page sequence, and waiting for a page to actually be
> > programmed is part of this write-page sequence.
> > This is also what is done in ->write_oob_xxx() hooks, so let's do that in  
> > ->write_page_xxx() as well to make it consistent.  
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/nand/atmel/nand-controller.c |  6 +++++-
> >  drivers/mtd/nand/nand_base.c             | 10 ++++++----
> >  drivers/mtd/nand/nand_micron.c           | 10 ++++++++--
> >  drivers/mtd/nand/tango_nand.c            | 13 ++++++++++++-
> >  4 files changed, 31 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 8dafd2a54e11..08ff98c47e1f 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -2574,11 +2574,13 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
> >  	if (status < 0)
> >  		return status;
> >  
> > -	if (nand_standard_page_accessors(&chip->ecc))
> > +	if (nand_standard_page_accessors(&chip->ecc)) {
> >  		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> > -	status = chip->waitfunc(mtd, chip);
> > -	if (status & NAND_STATUS_FAIL)
> > -		return -EIO;
> > +
> > +		status = chip->waitfunc(mtd, chip);
> > +		if (status & NAND_STATUS_FAIL)
> > +			return -EIO;
> > +	}  
> 
> AFAIU, the wait operation used to be unconditional;
> but it is now skipped for CUSTOM accessors. OK.

Yep.

> 
> 
> > diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> > index a2150b15d4c1..8498fa36e533 100644
> > --- a/drivers/mtd/nand/tango_nand.c
> > +++ b/drivers/mtd/nand/tango_nand.c
> > @@ -295,7 +295,7 @@ static int tango_write_page(struct mtd_info *mtd, struct nand_chip *chip,
> >  			    const u8 *buf, int oob_required, int page)
> >  {
> >  	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
> > -	int err, len = mtd->writesize;
> > +	int err, status, len = mtd->writesize;
> >  
> >  	/* Calling tango_write_oob() would send PAGEPROG twice */
> >  	if (oob_required)
> > @@ -306,6 +306,10 @@ static int tango_write_page(struct mtd_info *mtd, struct nand_chip *chip,
> >  	if (err)
> >  		return err;
> >  
> > +	status = chip->waitfunc(mtd, chip);
> > +	if (status & NAND_STATUS_FAIL)
> > +		return -EIO;
> > +
> >  	return 0;
> >  }  
> 
> When I introduced the custom_accessors flag, I missed the removal
> of this wait operation. The tango NFC is supposed to take care of
> everything, from start to finish.
> 
> I applied the following patch:
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2675,6 +2675,9 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>         if (status < 0)
>                 return status;
>  
> +       if (!nand_standard_page_accessors(&chip->ecc))
> +               return 0;
> +
> 
> And ran mtd_speedtest. No measurable change.
> mtd_stresstest did not detect any issues.

Okay. I think I'll keep the patch as is to avoid introducing extra
functional changes.
You can then send a patch removing the extra chip->waitfunc() from
tango_write_page() and explain why this is unneeded in your commit
message. Would that work for you?

> 
> > @@ -423,9 +427,16 @@ static int tango_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> >  static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> >  				const u8 *buf, int oob_required, int page)
> >  {
> > +	int status;
> > +
> >  	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0, page);
> >  	raw_write(chip, buf, chip->oob_poi);
> >  	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> > +
> > +	status = chip->waitfunc(mtd, chip);
> > +	if (status & NAND_STATUS_FAIL)
> > +		return -EIO;
> > +
> >  	return 0;
> >  }  
> 
> This one would still be required, since we're going behind the NFC's back.
> Should we test NAND_STATUS_FAIL in tango_write_oob() too?

Yes, you should.

> It might not matter, since you plan to change it to nand_prog_page_end_op()
> ultimately.

Well, I don't know when this will land, so we'd better fix it now and
mark it for stable backport.

Regards,

Boris

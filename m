Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGOdy-0004jg-Bq
 for linux-mtd@lists.infradead.org; Thu, 20 Feb 2014 08:06:07 +0000
Received: by mail-pa0-f44.google.com with SMTP id kq14so1574642pab.31
 for <linux-mtd@lists.infradead.org>; Thu, 20 Feb 2014 00:05:43 -0800 (PST)
Date: Thu, 20 Feb 2014 00:00:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 4/5] mtd: nand: parse out the JEDEC compliant nand
Message-ID: <20140220080025.GH3500@norris-Latitude-E6410>
References: <1391839441-21006-1-git-send-email-b32955@freescale.com>
 <1391839441-21006-5-git-send-email-b32955@freescale.com>
 <20140211203224.GJ18440@ld-irv-0074>
 <20140214070853.GB22570@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140214070853.GB22570@shlinux2.ap.freescale.net>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Feb 14, 2014 at 03:08:54PM +0800, Huang Shijie wrote:
> On Tue, Feb 11, 2014 at 12:32:24PM -0800, Brian Norris wrote:
> > On Sat, Feb 08, 2014 at 02:04:00PM +0800, Huang Shijie wrote:
> > > --- a/drivers/mtd/nand/nand_base.c
> > > +++ b/drivers/mtd/nand/nand_base.c
> > > @@ -3163,6 +3163,88 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
> > >  }
> > >  
> > >  /*
> > > + * Check if the NAND chip is JEDEC compliant, returns 1 if it is, 0 otherwise.
> > > + */
> > > +static int nand_flash_detect_jedec(struct mtd_info *mtd, struct nand_chip *chip,
> > > +					int *busw)
> > > +{
> > > +	struct nand_jedec_params *p = &chip->jedec_params;
> > > +	struct jedec_ecc_info *ecc;
> > > +	int val;
> > > +	int i, j;
> > > +
> > > +	/* Try JEDEC for unknown chip or LP */
> > > +	chip->cmdfunc(mtd, NAND_CMD_READID, 0x40, -1);
> > 
> > Where did you get this READID column address? I may be misreading
> 
> I get the column from the Toshiba and Micron datasheet.
> the JEDEC really does not mention it.

OK, that's fine. It's still a bit strange the JEDEC doesn't mention it.

> > something, but I don't even find this in the JESD230A spec.
> > 
> > > +	if (chip->read_byte(mtd) != 'J' || chip->read_byte(mtd) != 'E' ||
> > > +		chip->read_byte(mtd) != 'D' || chip->read_byte(mtd) != 'E' ||
> > > +		chip->read_byte(mtd) != 'C')
> > > +		return 0;
> > > +
> > > +	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0x40, -1);
> > 
> > Same here. I don't actually find this column address in the spec. I
> ditto.
> 
> > really hope this is specified somewhere.
> > 
> > Also, now that we may have non-zero address to NAND_CMD_PARAM, do we
> > need to make this adjustment so it can be used on x16 buswidth? Perhaps this diff?
> 
> sorry, I really do not know the x16 issue :(
> 
> the gpmi is 8bit.

That's fine, I expected that. But I think that in the absence of
evidence otherwise, we should always send the address for NAND_CMD_PARAM
as if it's only on the lower 8 bits, not a x16-width column address. Can
you squash in my diff below, or else I can send it as a separate patch?

> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > index 84cca611c2fd..1b1ad3d25336 100644
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h
> > @@ -921,7 +921,7 @@ static inline bool nand_is_slc(struct nand_chip *chip)
> >   */
> >  static inline int nand_opcode_8bits(unsigned int command)
> >  {
> > -	return command == NAND_CMD_READID;
> > +	return command == NAND_CMD_READID || command == NAND_CMD_PARAM;
> >  }
> >  
> >  /* return the supported JEDEC features. */
> > 
> > > +	for (i = 0; i < 3; i++) {
> > > +		for (j = 0; j < sizeof(*p); j++)
> > > +			((uint8_t *)p)[j] = chip->read_byte(mtd);
> > > +
> > > +		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
> > > +				le16_to_cpu(p->crc))
> > > +			break;
> > > +	}
> > > +
> > > +	if (i == 3) {
> > > +		pr_err("Could not find valid JEDEC parameter page; aborting\n");
> > > +		return 0;
> > > +	}
> > > +
> > > +	/* Check version */
> > > +	val = le16_to_cpu(p->revision);
> > > +	if (val & (1 << 2))
> > > +		chip->jedec_version = 10;
> > > +	else if (val & (1 << 1))
> > > +		chip->jedec_version = 1; /* vendor specific version */
> > 
> > How did you determine that bit[1] means version 1 (or v0.1)? It's
> 
> The bit[1] is the vendor specific version. 
> Some Micron chips uses the bit[1], such as MT29F64G08CBAB.

I noticed a similar thing with my Micron datasheet.

> If we do not use the 1 for the it, do you have any suggestion
> for the vendor specific version?
> 
> 
> > unclear to me how to interpret the revision bitfield here, but it
> > appears that bit[1] is not really useful to us yet, unless we're using
> > vendor specific parameter page.
> 
> > 
> > What do we do if we see bit[1] (vendor specific parameter page) but not
> > bit[2] (parameter page revision 1.0 / standard revision 1.0)? I'm
> > thinking that we should just ignore bit[1] entirely for now, and if the
> > flash is missing bit[2], then we can't support it.
> 
> some Micron chips do use the bit[1]. i think that's why the JEDEC say:
> "supports vendor specific parameter page" for the bit[1].
> 
> We'd better keep the support for the bit[1].

OK. But we need to be careful that whatever this "vendor specific
parameter page" is, it's always compatible with the spec we're referring
to (v1.0). Otherwise, we can't rely on bit[1] to tell us anything
specific. This really seems like some sloppiness on either Micron or
JEDEC.

[snip]

Thanks,
Brian

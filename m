Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eAvCu-0000ot-1q
 for linux-mtd@lists.infradead.org; Sat, 04 Nov 2017 09:57:43 +0000
Date: Sat, 4 Nov 2017 10:57:14 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jean-Louis Thekekara <jeanlouis.thekekara@parrot.com>
Cc: <linux-mtd@lists.infradead.org>, KOBAYASHI Yoshitake
 <yoshitake.kobayashi@toshiba.co.jp>
Subject: Re: [PATCH -next] mtd: nand: Add support for Toshiba BENAND
 (Built-in ECC NAND)
Message-ID: <20171104105714.51c12f3b@bbrezillon>
In-Reply-To: <36cc0535-09c9-8bd0-8ff2-85ccab17f765@parrot.com>
References: <1495761335-20535-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <20170526182254.6a4f98c8@bbrezillon>
 <36cc0535-09c9-8bd0-8ff2-85ccab17f765@parrot.com>
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

+Kobayashi

Hi Jean-Louis,

Sorry for the late reply, I completely missed your email (try to Cc
all participants of the discussion next time, not only the MTD ML).

On Wed, 28 Jun 2017 18:45:37 +0200
Jean-Louis Thekekara <jeanlouis.thekekara@parrot.com> wrote:

> Hi Kobayashi, Boris,
> 
> I'm using a Toshiba BENAND for our next product and had to adapt the 
> original patch for our custom kernel (4.9). I was about to propose a 
> patch for linux-next until I see this update proposed by Kobayashi.
> 
> I have a few comments on it.
> 
> On 26/05/2017 18:22, boris.brezillon at free-electrons.com (Boris
> >> +config MTD_NAND_BENAND
> >> +	bool "Support for Toshiba BENAND (Built-in ECC NAND)"
> >> +	default n
> >> +	help
> >> +	  This enables support for Toshiba BENAND.
> >> +	  Toshiba BENAND is a SLC NAND solution that automatically
> >> +	  generates ECC inside NAND chip.
> >> +
> >> +config MTD_NAND_BENAND_ECC_STATUS
> >> +	bool "Enable ECC Status Read Command(0x7A)"
> >> +	depends on MTD_NAND_BENAND
> >> +	default n
> >> +	help
> >> +	  This enables support for ECC Status Read Command(0x7A) of BENAND.
> >> +	  When this enables, report the real number of bitflips.
> >> +	  In other cases, report the assumud number.
> >> +  
> > 
> > Please drop the Kconfig options. The amount of code added here is quite
> > small, and I don't think we need to compile it out. If the vendor code
> > continues to grow we'll see how we want to deal with that, but we're
> > not there yet.
> >   
> I'm interested into keeping MTD_NAND_BENAND_ECC_STATUS config for two 
> reasons:
> 
> * if disabled, this can save some extra cycles. One can decide to report 
> an arbitrary number of bitflips (= mtd->bitflip_threshold), it's fine.

I don't get why you would report a random number of bitflips in this
case.

> * some NAND controller/driver might not support this command, as you 
> stated later.

You can do that without adding an extra Kconfig option: just don't set
ecc->mode to NAND_ECC_ONDIE and you should be good.

> 
> >>   static void toshiba_nand_decode_id(struct nand_chip *chip)
> >>   {
> >>   	struct mtd_info *mtd = nand_to_mtd(chip);
> >> @@ -33,15 +124,32 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
> >>   	 */
> >>   	if (chip->id.len >= 6 && nand_is_slc(chip) &&
> >>   	    (chip->id.data[5] & 0x7) == 0x6 /* 24nm */ &&
> >> -	    !(chip->id.data[4] & 0x80) /* !BENAND */)
> >> -		mtd->oobsize = 32 * mtd->writesize >> 9;
> >> +	    (chip->id.data[4] & 0x80) /* BENAND */) {
> >> +		if (IS_ENABLED(CONFIG_MTD_NAND_BENAND))
> >> +			chip->ecc.mode = NAND_ECC_BENAND;  
> > 
> > No, you should not set that explicitly. This choice should be left to
> > the user. Now, since the internal ECC engine cannot be disabled here,
> > you should fail in toshiba_nand_init() if you are dealing with a BENAND
> > and chip->ecc.mode != NAND_ECC_ON_DIE.
> > 
> >   
> >> +	} else {
> >> +		mtd->oobsize = 32 * mtd->writesize >> 9;	/* !BENAND */
> >> +	}  
> > 
> > You're changing the ID decoding logic here.
> > 
> > It should be:
> > 
> > 	if (chip->id.len >= 6 && nand_is_slc(chip) &&
> >    	    (chip->id.data[5] & 0x7) == 0x6 /* 24nm */) {
> > 		if (chip->id.data[4] & 0x80)
> > 			chip->ecc.mode = NAND_ECC_BENAND;
> > 		else
> > 			mtd->oobsize = 32 * mtd->writesize >> 9;
> > 	}  
> >>   }
> >>  
> 
> I have a BENAND in my hands which, according to the datasheet reports 
> only 5 bytes, so we can't depend on chip->id.len >= 6 for selecting 
> NAND_ECC_BENAND. Another reason: some NAND controller don't report more 
> than 5 bytes (which is, by the way, our case).
> 

Kobayashi, can you take that into account in your next iteration?

> It could be something like:
> 
> >  if (chip->id.len >=5) {
> >     if(chip->id.data[4] & 0x80) {
> >       chip->ecc.mode = NAND_ECC_BENAND;
> >     }
> >     /*
> >      * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
> >      * 512B page. For Toshiba SLC, we decode the 5th/6th byte as
> >      * follows:
> >      * - ID byte 6, bits[2:0]: 100b -> 43nm, 101b -> 32nm,
> >      *                         110b -> 24nm
> >      * - ID byte 5, bit[7]:    1 -> BENAND, 0 -> raw SLC
> >      */
> >     else if (chip->id.len >= 6 && nand_is_slc(chip) &&
> >              (chip->id.data[5] & 0x7) == 0x6 /* 24nm */) {
> >       mtd->oobsize = 32 * mtd->writesize >> 9;
> >     }
> >   }
>     Regards,
> Jean-Louis Thekekara.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

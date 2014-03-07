Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WM0Be-00039F-Q7
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 19:12:03 +0000
Received: by mail-ie0-f181.google.com with SMTP id tp5so4533113ieb.26
 for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2014 11:11:32 -0800 (PST)
Date: Fri, 7 Mar 2014 11:11:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v7 3/6] mtd: nand: omap: ecc.correct:
 omap_elm_correct_data: fix erased-page detection for BCHx_HW ECC schemes
Message-ID: <20140307191123.GC5232@ld-irv-0074>
References: <1389942797-4632-1-git-send-email-pekon@ti.com>
 <1389942797-4632-4-git-send-email-pekon@ti.com>
 <20140211213457.GM18440@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EA6FB16@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA6FB16@DBDE04.ent.ti.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 "Balbi, Felipe" <balbi@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Wed, Feb 12, 2014 at 10:31:02AM +0000, Pekon Gupta wrote:
> >From: Brian Norris [mailto:computersforpeace@gmail.com]
> >>On Fri, Jan 17, 2014 at 12:43:14PM +0530, Pekon Gupta wrote:
> >> This patch removes dependency on any marker byte in ecc-layout, to differentiate
> >> between erased-page v/s programeed-page. Instead a page is considered erased if
> >>  (a) all(OOB)  == 0xff, .i.e., number of zero-bits in read_ecc[] == 0
> >>  (b) number of zero-bits in (Data + OOB) is less than ecc-strength
[...]
> >> @@ -1410,24 +1441,47 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
> >>  		}
> >>
> >>  		if (eccflag == 1) {
> >> -			/*
> >> -			 * Set threshold to minimum of 4, half of ecc.strength/2
> >> -			 * to allow max bit flip in byte to 4
> >> -			 */
> >> -			unsigned int threshold = min_t(unsigned int, 4,
> >> -					info->nand.ecc.strength / 2);
> >> +			bitflip_count = 0;
> >> +			/* count zero-bits in OOB region */
> >> +			err = count_zero_bits(read_ecc, eccbytes,
> >> +						 eccstrength, &bitflip_count);
> >> +			if (err) {
> >> +				/*
> >> +				 * number of zero-bits in OOB > ecc-strength
> >> +				 * either un-correctable or programmed-page
> >> +				 */
> >> +				page_is_erased = false;
> >> +			} else if (bitflip_count == 0) {
> >> +				/* OOB == all(0xff) */
> >> +				page_is_erased = true;
> >
> >This else-if is still incorrect. You cannot assume that just because the
> >OOB is all 0xff that the page is erased.
> >
> Now this part is most important, where I would like to get more clarity
> and feedback before I proceed.
> ----------------------------
> if OOB of an page is == all(0xff)
> (a) As per general NAND spec, chip->write_buf() _only_ fills the internal buffers of
>  NAND device's with information to be written. Actual write to NAND array cells
>  happen only after 'NAND_CMD_PAGEPROG' or 'NAND_CMD_CACHEDPROG' is issued.

I'm not really sure why you bring up chip->write_buf(); not all
implementations actually use this. But anyway...

>  Thus both Main-area and OOB-area are programmed simultaneously inside NAND device.
>  if there is any disruption (like power-cut) in on-going  NAND_CMD_PAGEPROG
>  cycle, then the data should be assumed to be garbage, and it may have un-stable bits.

OK. But this is not at all what we're trying to check; we are checking
*only* whether this particular page reads mostly-0xff, due to regular
bitflips on an otherwise unprogrammed page. The "assumed garbage"
conclusion is really irrelevant here.

> (b) if OOB==all(0xff) then there is _no_ ECC stored in OOB to check the read_data

I disagree. Can you guarantee that there is *no* data pattern in which
the matching ECC syndrome bytes are all 0xff?

>   Hence driver cannot distinguish between genuine data and bit-flips.
> 
> Now based on (a) & (b), it's safe to assume that:
> if (OOB == all 0xff)
> 	/* page has no-data | garbage-data*/
> Agree ?

No. But more importantly, why do you want to make this conclusion?
Aren't we *only* trying to make a decision of "is this page
mostly-0xff"?

Or more directly: you are using the above conclusion ("page has garbage
data") to then erase the buffer entirely. This is totally, 100% bogus
because the data area might have junk (partially-programmed page?) but
the OOB could be all 0xff -- and you are now lying to the upper layers,
saying the page is cleanly 0xff!!!

I believe one of the two of us has a very dire misunderstanding here.
Please help me decide which of us this is :)

> (This is where I call it page_is_erased==true, Though I could have used better
> variable name as page_has_no_valid_data = true).
> ----------------------------
> 
> And also, driver should return 'total number zero-bits in both Main-area + OOB'
> if (0 < 'total number of zero-bits in both OOB + DATA region' < mtd->bitflip_threshold)
> 	return -EUCLEAN; 
> else
> 	return -EBADMSG;
> 
> ** However there is a bug in current patch version which I just figured out.
> I don't include the number of zero-bits of Main-area, if OOB==all(0xff).
>  +			} else if (bitflip_count == 0) {
>  +				/* OOB == all(0xff) */
>  +				page_is_erased = true;
>  +  /* missing */		bitflip_count += count_zero_bits(buf, eccsize,
>  +					  		eccstrength, &bitflip_count);
> ------------------------
> 
> >> +			} else {
> >> +				/*
> >> +				 * OOB has some bits as '0' but
> >> +				 * number of zero-bits in OOB < ecc-strength.
> >> +				 * It may be erased-page with bit-flips so,
> >> +				 * further checks are needed for confirmation
> >> +				 */
> >> +				/* count zero-bits in DATA region */
> >> +				buf = &data[eccsize * i];
> >> +				err = count_zero_bits(buf, eccsize,
> >> +						 eccstrength, &bitflip_count);
> >> +				if (err) {
> >> +					/*
> >> +					 * total number of zero-bits in OOB
> >> +					 * and DATA exceeds ecc-strength
> >> +					 */
> >> +					page_is_erased = false;
> >> +				} else {
> >> +					/* number of zero-bits < ecc-strength */
> >> +					page_is_erased = true;
> >> +				}
> >> +			}
> >
> >This whole block (where you call count_zero_bits() twice) is a
> >convoluted and buggy way of just doing the following, AFAIU:
> >
> >	page_is_erased = !count_zero_bits(read_ecc, ecc->bytes,
> >				ecc->strength, &bitflip_count) &&
> >			 !count_zero_bits(&data[ecc->size * i], ecc->size,
> >			 	ecc->strength, &bitflip_count);
> >
> >You could modify that to your liking and add a comment, but it's much
> >more concise than your version, and from what I can tell, it's actually
> >correct.
> >
> Firstly, In you above statement    's/&&/||'

No. I wrote it exactly as I meant it. We need to check both the data
area and the OOB, and if either cause us to exceed the ECC strength,
then the page is not erased.

> because as per above statement, if count_zero_bits(oob) == 0, then
> my patch assumes 'page_has_no_valid_data = true'.

And that assumption is 100% wrong, AIUI.

> page_is_erased = !count_zero_bits(read_ecc, ecc->bytes,
> 				ecc->strength, &bitflip_count) ||
> 			 !count_zero_bits(&data[ecc->size * i], ecc->size,
> 			 	ecc->strength, &bitflip_count);
> 
> 
> Secondly, You are missing the that here NAND driver is relaxing the limit of
> number-of-acceptable bit-flips in an erased-page, because some MLC and 
> Toshiba SLC NANDs show bit-flips almost on every second already erased-page.

No, I'm not missing this. The MTD/NAND layers already take care of the
"number-of-acceptable bit-flips" using the mtd->bitflip_threshold
parameter.

> >> +				if (err) {
> >> +					/*
> >> +					 * total number of zero-bits in OOB
> >> +					 * and DATA exceeds ecc-strength
> >> +					 */
> >> +					page_is_erased = false;
> >> +				} else {
> >> +					/* number of zero-bits < ecc-strength */
> >> +					page_is_erased = true;
> >> +				}
> 
> In above patch I can replace ecc->strength with mtd->bitflip_threshold
> to make it more user controllable. As bitflip_threshold is configurable via
> /sys/class/mtd/mtdX/bitflip_threshold
> What is your opinion ?

The hardware driver should not be comparing with 'bitflip_threshold'.
Comparing against ecc_strength is correct, as we are simulating the
current ECC correction strength.

Brian

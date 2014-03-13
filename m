Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNyOp-0004ik-Gw
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 05:41:48 +0000
Received: by mail-pa0-f45.google.com with SMTP id kl14so612845pab.4
 for <linux-mtd@lists.infradead.org>; Wed, 12 Mar 2014 22:41:22 -0700 (PDT)
Date: Wed, 12 Mar 2014 22:41:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V4] mtd: gpmi: fix the bitflips for erased page
Message-ID: <20140313054118.GR31517@norris-Latitude-E6410>
References: <1389602838-25212-1-git-send-email-b32955@freescale.com>
 <20140308033238.GD5232@ld-irv-0074>
 <20140312072654.GA30808@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140312072654.GA30808@shlinux2.ap.freescale.net>
Cc: eliedebrauwer@gmail.com, bpringlemeir@nbsps.com,
 Vikram.Narayanan@in.bosch.com, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 12, 2014 at 03:26:57PM +0800, Huang Shijie wrote:
> On Fri, Mar 07, 2014 at 07:32:38PM -0800, Brian Norris wrote:
> > > 
> > > This patch does a check for the uncorrectable failure in the following steps:
> > > 
> > >    [0] set the threshold.
> > >        The threshold is set based on the truth:
> > >          "A single 0 bit will lead to gf_len(13 or 14) bits 0 after the BCH
> > >           do the ECC."
> > > 
> > >        For the sake of safe, we will set the threshold with half the gf_len, and
> > >        do not make it bigger the ECC strength.
> > 
> > This threshold looks wrong here.
> 
> I shrink the threshold on purpose. The ECC strength can be 40 some times.

I see. I suppose the threshold could be smaller, but I definitely
believe it should be correlated with the ECC strength, not just capped
at 6 or 7.

> I only met NAND which only has 1bit bitflips for the whole page.

Hmm, I guess I'm not really sure. I haven't personally observed high
numbers, but I believe my team has seen multiple flips.

> If i meet a NAND which may has 40bits flips,  it will make me crazy.

;)

> > >    [1] count the bitflips of the current ECC chunk, assume it is N.
> > > 
> > >    [2] if the (N <= threshold) is true, we continue to read out the page with
> > >        ECC disabled. and we count the bitflips again, assume it is N2.
> > >        (We read out the whole page, not just a chunk, this makes the check
> > >         more strictly, and make the code more simple.)
> > 
> > You can read a whole page, but the counting should not be against the
> > whole page; it should allow 'threshold' # of bitflips in each sector.
> 
> I just want to make the check more tough. :)

But there is still a big difference between a few bitflips in each
sector, vs. all of those bitflips concentrated in the same sector. The
former is probably OK, while the latter won't be.

> > >    [3] if the (N2 <= threshold) is true again, we can regard this is a erased
> > >        page. This is because a real erased page is full of 0xFF(maybe also has
> > >        several bitflips), while a page contains the 0xFF data will definitely
> > >        has many bitflips in the ECC parity areas.
> > 
> > This threshold definitely shouldn't be based on gf_len; it should be
> > based on ECC strength.
> Ditto.
> 
> > 
> > >    [4] if the [3] fails, we can regard this is a page filled with the '0xFF'
> > >        data.
> > > 
> > > Tested-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> > > Reported-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> > > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > > ---
> > > v3 --> v4:
> > > 	[1] update the mtd->ecc_stats.corrected when we detect an erased page.
> > > 	[2] add the shortcut when counting bitflips for non-ECC buffer.
> > > 	[3] add more comments about why read a whole page, but not a chunk.
> > > 
> > > ---
> > >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   58 ++++++++++++++++++++++++++++++++
> > >  1 files changed, 58 insertions(+), 0 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > > index e2f5820..6b6e707 100644
> > > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > > @@ -958,6 +958,60 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
> > >  	p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
> > >  }
> > >  
> > > +static bool gpmi_erased_check(struct gpmi_nand_data *this,
> > > +			unsigned char *data, unsigned int chunk, int page,
> > > +			unsigned int *max_bitflips)
> > > +{
> > > +	struct nand_chip *chip = &this->nand;
> > > +	struct mtd_info	*mtd = &this->mtd;
> > > +	struct bch_geometry *geo = &this->bch_geometry;
> > > +	int base = geo->ecc_chunk_size * chunk;
> > > +	unsigned int flip_bits = 0, flip_bits_noecc = 0;
> > > +	uint64_t *buf = (uint64_t *)this->data_buffer_dma;
> > > +	unsigned int threshold;
> > > +	int i;
> > > +
> > > +	threshold = geo->gf_len / 2;
> > > +	if (threshold > geo->ecc_strength)
> > > +		threshold = geo->ecc_strength;
> > > +
> > > +	/* Count bitflips */
> > > +	for (i = 0; i < geo->ecc_chunk_size; i++) {
> > > +		flip_bits += hweight8(~data[base + i]);
> > > +		if (flip_bits > threshold)
> > > +			return false;
> > > +	}
> > 
> > ^^^ This is the only part that's unique to this patch, I think, but it's
> > not really special to GPMI. And it's not correct, either. Suppose I have
> > a high ECC strength flash (20-bit correction?) but gf_len is 14. Then
> > threshold == 7. Now, if we see 10 bitflips in an erased page, we will
> > return false here, saying this page was not erased. But 10 is easily
> > within the ECC spec for this flash. That's a problem, no?
> Do you meet a NAND which has 10 bitflips?

Not that I know of (but I haven't collected much data), but it would
meet the specification, wouldn't it?

> > So this check should be based on the ECC strength. But is this a good
> > optimization in the first place? I think it could be thrown out for
> > simplicity in the generic case (e.g., in my sample pasted below).
> > 
> > > +
> > > +	/*
> > > +	 * Read out the whole page with ECC disabled, and check it again,
> > > +	 * This is more strict then just read out a chunk, and it makes
> > > +	 * the code more simple.
> > > +	 */
> > > +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> > > +	chip->read_buf(mtd, (uint8_t *)buf, mtd->writesize);
> > > +
> > > +	/* Count the bitflips for the no ECC buffer */
> > > +	for (i = 0; i < mtd->writesize / 8; i++) {

I believe I misread this loop the first time; you're not actually
checking the entire page.

Why divide by 8?

> > > +		flip_bits_noecc += hweight64(~buf[i]);
> > > +		if (flip_bits_noecc > threshold)
> > > +			return false;
> > > +	}
> > 
> > ^^^ this loop should be broken up into sectors, so that you actually
> > count max_bitflips per sector, not for the whole page.
> count the max_bitflips per sector make the code more complicated.

It's only prohibitively complex because your 'raw' layout is so much
different than your 'read with ECC' layout. If your driver conformed to
the operation of other drivers (see my comments on the other thread),
then I believe it wouldn't be too complicated.

> > > +
> > > +	/* Tell the upper layer the bitflips we corrected. */
> > > +	mtd->ecc_stats.corrected += flip_bits;
> > > +	*max_bitflips = max_t(unsigned int, *max_bitflips, flip_bits);
> > 
> > This is wrong. You don't want to use the existing *max_bitflips value
> > from the previous read (remember, you're re-reading the data). You
> > should be doing a max() over each sector in the raw page, as mentioned
> > above.
> yes, I just tell the upper layer the max_bitflips for the ECC read, not the
> raw read.

If you're at this point, then you have a mostly-0xff page anyway, and
*max_bitflips should already be 0 (since your BCH can't correct such a
page), so that's not a big deal I guess. But it still doesn't make sense
to use the old value, if you're counting the bitflips yourself.

> I will comment on your formal patch.

Thanks. The version I pasted here wasn't good anyway.

Brian

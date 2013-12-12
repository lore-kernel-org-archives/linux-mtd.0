Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqxMA-0000lt-II
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2013 03:54:35 +0000
Received: by mail-pb0-f50.google.com with SMTP id rr13so11234167pbb.23
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2013 19:54:12 -0800 (PST)
Date: Thu, 12 Dec 2013 11:47:52 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131212034749.GA1345@gmail.com>
References: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
 <1386619753-27613-3-git-send-email-computersforpeace@gmail.com>
 <20131211135451.GB1284@gmail.com>
 <20131211190313.GS27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131211190313.GS27149@ld-irv-0074.broadcom.com>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 11, 2013 at 11:03:13AM -0800, Brian Norris wrote:
> On Wed, Dec 11, 2013 at 09:54:54PM +0800, Huang Shijie wrote:
> > On Mon, Dec 09, 2013 at 12:09:12PM -0800, Brian Norris wrote:
> > > + * nand_set_read_retry - [INTERN] Set the READ RETRY mode
> > > + * @mtd: MTD device structure
> > > + * @retry_mode: the retry mode to use
> > > + *
> > > + * Some vendors supply a special command to shift the Vt threshold, to be used
> > > + * when there are too many bitflips in a page (i.e., ECC error). After setting
> > > + * a new threshold, the host should retry reading the page.
> > > + */
> > > +static int nand_set_read_retry(struct mtd_info *mtd, int retry_mode)
> > > +{
> > > +	struct nand_chip *chip = mtd->priv;
> > > +	uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
> > > +
> > This can cause a DMA warning.
> 
> ...on GPMI NAND, but not on most (any?) other drivers. Why does GPMI try
> to use DMA on *every* operation? That doesn't even make sense for a 4 or
> 5 byte transfer. Plus, we don't give a guarantee that buffers will be
> DMA-able in MTD (UBI uses vmalloc() buffers, for instance), so I'm sure
> you'll hit problems other places. I can fix this one (use
> chip->buffers->databuf instead?) but I think GPMI is a bad citizen in
> this regard, given that you have no guarantee. You need to fix MTD
> systematically if you expect this guarantee.
You do not need to change this code, if you like it.

The DMA warning only occurs when we enable the CONFIG_DMA_API_DEBUG.


> 
> (For one, nand_default_block_markbad() uses stack-allocated buffers; but
> I see that GPMI overrides this callback.)
> 
> > > +	if (retry_mode >= chip->read_retries)
> > > +		return -EINVAL;
> > > +
> > > +	if (chip->onfi_params.jedec_id == NAND_MFR_MICRON)
> > > +		return chip->onfi_set_features(mtd, chip,
> > > +				ONFI_FEATURE_ADDR_READ_RETRY, feature);
> > I suggest to add a hook such as for nand_chip{}:
> > 	chip->read_retry(..)
> > 
> > Different nand chips fill different hook.
> 
> OK, that can make sense.
> 
> > For Micron, fill it with micron_read_retry();
> > for Toshiba, fill it with a toshiab_read_retry();
> > For Hynix, fill it with hynix_read_retry().
> 
> Do you have info on Toshiba/Hynix read retry? I'd be interested to know
> what their "features" look like. Do they have a similar set of supported
> retry modes, where we have to cycle through each mode and retry? I'm
> interested in whether the nand_chip.read_retries field is useful for the
> others.

i will send you the documents when i back office.
Different nand chips use different read-retry methods. A headache to us.

The common idea between the read-retry methods is:
  "we have to cycle through each mode and retry"

So the chip.read_retries is used by others too.

I ever implemented the Micron's read-retry in my local code.
I planned to implement others, but i was intterrupted by high priority
jobs.

> 
> Also, what would a 'read_retry()' callback look like? What are its
> parameters? Right now, it's just the struct mtd_info + an incrementing
> integer, from 0 to chip->read_retries-1.

I think the parameters are good now.

> 
> > I am wondar if we should add a file for the read-retry in the
> > drivers/mtd/nand folder.
> 
> TBH, I'm not really very happy to be opening the read-retry can of
> worms. From what I hear, read-retry is just the first step down a path

it is ok to me if you do not like to create a new file, that is just a
suggestion.


After the nand chip use <19nm, afaik, all the NAND chips needs the
read-retry. We have to implement the read-retry for all of them.
The nightmare is coming.

thanks
Huang Shijie

Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC3KC-0002JV-FG
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 07:59:28 +0000
Received: by mail-pb0-f48.google.com with SMTP id ma3so111237pbc.7
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2013 00:59:06 -0700 (PDT)
Date: Wed, 21 Aug 2013 00:59:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RESEND][PATCH] mtd: chips: Add support for PMC SPI Flash chips
 in m25p80.c
Message-ID: <20130821075903.GC31788@brian-ubuntu>
References: <51E3CB64.4080107@wanadoo.fr> <20130821072729.GA31788@brian-ubuntu>
 <201308210941.38483.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201308210941.38483.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, Michel Stempin <michel.stempin@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 21, 2013 at 09:41:38AM +0200, Marek Vasut wrote:
> Dear Brian Norris,
> 
> > + Marek, since he's been reviewing (with dismay?) the increase in macro
> > flags in this driver. If there are any objections, I can amend/drop the
> > patch.
> 
> Hmmm ... this SECT_4K_PMC seems too combined to me. Why don't we use the SECT_4K 
> flag and another flag to indicate it's a PMC part? Even better, I recall you can 

Separating manufacturer from SECT_4K sounds good, but it really doesn't
buy us much. See my next comments.

> just read the chip jedec ID and determine if it's a PMC part according to that. 
> Then if it is PMC AND the SECT_4K flag is set, there is no need to add another 
> flag at all, no?

IIUC, Michel's comment applies:

  "They do not support JEDEC RDID (0x9f), and so they can only be
  detected by matching their name string with pre-configured platform
  data."

So we cannot use RDID to identify by manufacturer. In fact, this same
point screws up any attempt at manufacturer-based property detection for
non-JEDEC devices. I guess we just can't expect much from such devices.

So we would have to introduce two flags to the table: one to flag the
manufacturer and one to flag the opcode. Not necessary, IMO.

> > On Mon, Jul 15, 2013 at 12:13:56PM +0200, Michel Stempin wrote:

[...]

> > > @@ -762,6 +764,11 @@ static const struct spi_device_id m25p_ids[] = {
> > > 
> > >  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
> > >  	{ "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
> > > 
> > > +	/* PMC */
> > > +	{ "pm25lv512", INFO(0, 0, 32 * 1024, 2, SECT_4K_PMC) },
> > > +	{ "pm25lv010", INFO(0, 0, 32 * 1024, 4, SECT_4K_PMC) },

Note that only the non-JEDEC chips needed the old commands.

> > > +	{ "pm25lq032", INFO(0x7f9d46, 0, 64 * 1024,  64, SECT_4K) },
> > > +
> > > 
> > >  	/* Spansion -- single (large) sector size only, at least
> > >  	
> > >  	 * for the chips listed here (without boot sectors).
> > >  	 */
> > > 

Brian

Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZwh8-0001oa-GC
 for linux-mtd@lists.infradead.org; Tue, 15 Apr 2014 06:18:11 +0000
Date: Tue, 15 Apr 2014 13:22:39 +0800
From: Huang Shijie <b32955@freescale.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: spi-nor: read 6 bytes for the ID
Message-ID: <20140415052236.GA12237@localhost>
References: <1397470174-27856-1-git-send-email-b32955@freescale.com>
 <201404141353.07427.marex@denx.de>
 <20140414144346.GA4363@localhost.localdomain>
 <201404142023.47986.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <201404142023.47986.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 Huang Shijie <shijie8@gmail.com>, dwmw2@infradead.org, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 14, 2014 at 08:23:47PM +0200, Marek Vasut wrote:
> On Monday, April 14, 2014 at 04:44:01 PM, Huang Shijie wrote:
> > On Mon, Apr 14, 2014 at 01:53:07PM +0200, Marek Vasut wrote:
> > > > @@ -614,8 +616,23 @@ static const struct spi_device_id
> > > > *spi_nor_read_id(struct spi_nor *nor) for (tmp = 0; tmp <
> > > > ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
> > > > 
> > > >  		info = (void *)spi_nor_ids[tmp].driver_data;
> > > >  		if (info->jedec_id == jedec) {
> > > > 
> > > > -			if (info->ext_id == 0 || info->ext_id == ext_jedec)
> > > > +			if (info->ext_id == 0)
> > > > 
> > > >  				return &spi_nor_ids[tmp];
> > > > 
> > > > +
> > > > +			/* the legacy two bytes ext_id */
> > > > +			if ((info->ext_id >> 16) == 0) {
> > > > +				if (info->ext_id == ext_jedec)
> > > > +					matched = tmp;
> > > > +			} else {
> > > > +				/* check the sixth byte now */
> > > > +				ext_jedec = ext_jedec << 8 | id[5];
> > > > +				if (info->ext_id == ext_jedec)
> > > > +					return &spi_nor_ids[tmp];
> > > > +			}
> > > > +		} else {
> > > > +			/* shortcut */
> > > > +			if (matched != -1)
> > > > +				return &spi_nor_ids[matched];
> > > 
> > > I wonder if the ID-bytes wraparound cannot cause us trouble here. For
> > > example if we try to detect a SPI NOR which has 5-byte ID code, but in
> > > the table, we'd also have a SPI NOR with has a 6-byte code where the
> > > last byte of ext-jedec matches the first byte of JEDEC ID , this would
> > > actually match on the later.
> > 
> > could you give me detail example?
> > 
> > I feel sorry that i do not quit understand your meaning.
> 
> Imagine two chips with two IDs:
> Chip 1 has IDs: 0xf00b42 0x4242f0 and readID[6] returns 0x420bf0f04242
It will not return 0x420bf0f04242.

The readID[6] should be: f0, 0b, 42, 42, 42, f0.


> Chip 2 has IDs: 0xf00b42   0x42f0 and readID[6] returns 0x420bf0f04242
the readID[6] should be: f0, 0b, 42, 42, f0, XX.

 "XX" stands for the sixth byte.

The current patch can distinguish these two chips.

> This is because in the second chips' case the ID wraps around at 5 bytes. But 
> chip #1 matches the ID, so if chip #1 is earlier in the list of SPI NOR flashes, 
> we will get an incorrect detection of that chip.
> 
I guess your meaning is that the chip 2 has IDs: 0xf00b42   0x4242
and the sixth byte is 0xf0 which wraps the first byte.

Currently, only the Spansion uses the ext_id, please see the items:
 ---------------------------------------------------------------------
                 .................
	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
                 .................
 ---------------------------------------------------------------------
The s25fl128s is the first NOR chip which shares the same 5 bytes:
     the jedec_id and the ext_id.

What are you worry about is that the s25fl129p1 has the same 6th byte as
the s25fl128s. The sixth byte is the "Family ID". For s25fl128s, the sixth byte
of the ID is 0x80.  I do not have s25fl129p1, I only have its datasheet. 

Can someone have the s25fl129p1? if you have this chip, could you please
read out the sixth byte of its ID?

I think the s25fl129p1 will not have the same "Family ID" as the s25fl128s.

thanks
Huang Shijie

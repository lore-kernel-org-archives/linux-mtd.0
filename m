Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZmC2-0001rG-94
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 19:05:22 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: read 6 bytes for the ID
Date: Mon, 14 Apr 2014 20:23:47 +0200
References: <1397470174-27856-1-git-send-email-b32955@freescale.com>
 <201404141353.07427.marex@denx.de>
 <20140414144346.GA4363@localhost.localdomain>
In-Reply-To: <20140414144346.GA4363@localhost.localdomain>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404142023.47986.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, April 14, 2014 at 04:44:01 PM, Huang Shijie wrote:
> On Mon, Apr 14, 2014 at 01:53:07PM +0200, Marek Vasut wrote:
> > > @@ -614,8 +616,23 @@ static const struct spi_device_id
> > > *spi_nor_read_id(struct spi_nor *nor) for (tmp = 0; tmp <
> > > ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
> > > 
> > >  		info = (void *)spi_nor_ids[tmp].driver_data;
> > >  		if (info->jedec_id == jedec) {
> > > 
> > > -			if (info->ext_id == 0 || info->ext_id == ext_jedec)
> > > +			if (info->ext_id == 0)
> > > 
> > >  				return &spi_nor_ids[tmp];
> > > 
> > > +
> > > +			/* the legacy two bytes ext_id */
> > > +			if ((info->ext_id >> 16) == 0) {
> > > +				if (info->ext_id == ext_jedec)
> > > +					matched = tmp;
> > > +			} else {
> > > +				/* check the sixth byte now */
> > > +				ext_jedec = ext_jedec << 8 | id[5];
> > > +				if (info->ext_id == ext_jedec)
> > > +					return &spi_nor_ids[tmp];
> > > +			}
> > > +		} else {
> > > +			/* shortcut */
> > > +			if (matched != -1)
> > > +				return &spi_nor_ids[matched];
> > 
> > I wonder if the ID-bytes wraparound cannot cause us trouble here. For
> > example if we try to detect a SPI NOR which has 5-byte ID code, but in
> > the table, we'd also have a SPI NOR with has a 6-byte code where the
> > last byte of ext-jedec matches the first byte of JEDEC ID , this would
> > actually match on the later.
> 
> could you give me detail example?
> 
> I feel sorry that i do not quit understand your meaning.

Imagine two chips with two IDs:
Chip 1 has IDs: 0xf00b42 0x4242f0 and readID[6] returns 0x420bf0f04242
Chip 2 has IDs: 0xf00b42   0x42f0 and readID[6] returns 0x420bf0f04242
This is because in the second chips' case the ID wraps around at 5 bytes. But 
chip #1 matches the ID, so if chip #1 is earlier in the list of SPI NOR flashes, 
we will get an incorrect detection of that chip.

Does it make sense now please ?

Best regards,
Marek Vasut

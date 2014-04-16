Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
 helo=am1outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaFsy-0008Ep-7v
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 02:47:41 +0000
Date: Wed, 16 Apr 2014 09:52:03 +0800
From: Huang Shijie <b32955@freescale.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: spi-nor: read 6 bytes for the ID
Message-ID: <20140416015201.GA3204@localhost>
References: <1397470174-27856-1-git-send-email-b32955@freescale.com>
 <201404151535.05561.marex@denx.de>
 <20140415160402.GA2926@localhost.localdomain>
 <201404152048.50321.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <201404152048.50321.marex@denx.de>
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

On Tue, Apr 15, 2014 at 08:48:50PM +0200, Marek Vasut wrote:
> On Tuesday, April 15, 2014 at 06:04:05 PM, Huang Shijie wrote:
> > On Tue, Apr 15, 2014 at 03:35:05PM +0200, Marek Vasut wrote:
> > > On Tuesday, April 15, 2014 at 07:22:39 AM, Huang Shijie wrote:
> > > > On Mon, Apr 14, 2014 at 08:23:47PM +0200, Marek Vasut wrote:
> > > [...]
> > > 
> > > > > > > I wonder if the ID-bytes wraparound cannot cause us trouble here.
> > > > > > > For example if we try to detect a SPI NOR which has 5-byte ID
> > > > > > > code, but in the table, we'd also have a SPI NOR with has a
> > > > > > > 6-byte code where the last byte of ext-jedec matches the first
> > > > > > > byte of JEDEC ID , this would actually match on the later.
> > > > > > 
> > > > > > could you give me detail example?
> > > > > > 
> > > > > > I feel sorry that i do not quit understand your meaning.
> > > > > 
> > > > > Imagine two chips with two IDs:
> > > > > Chip 1 has IDs: 0xf00b42 0x4242f0 and readID[6] returns
> > > > > 0x420bf0f04242
> > > > 
> > > > It will not return 0x420bf0f04242.
> > > > 
> > > > The readID[6] should be: f0, 0b, 42, 42, 42, f0.
> > > > 
> > > > > Chip 2 has IDs: 0xf00b42   0x42f0 and readID[6] returns
> > > > > 0x420bf0f04242
> > > > 
> > > > the readID[6] should be: f0, 0b, 42, 42, f0, XX.
> > > > 
> > > >  "XX" stands for the sixth byte.
> > > > 
> > > > The current patch can distinguish these two chips.
> > > > 
> > > > > This is because in the second chips' case the ID wraps around at 5
> > > > > bytes. But chip #1 matches the ID, so if chip #1 is earlier in the
> > > > > list of SPI NOR flashes, we will get an incorrect detection of that
> > > > > chip.
> > > > 
> > > > I guess your meaning is that the chip 2 has IDs: 0xf00b42   0x4242
> > > > and the sixth byte is 0xf0 which wraps the first byte.
> > > 
> > > Huang, what I meant is that if you read 6 bytes of ID from a chip which
> > > wraps the READID command output on 5 bytes AND the first and last byte
> > > match in the table for some 6-byte chip, then this 6-byte chip will be
> > > used as a configuration for the different 5-byte chip.
> > 
> > Does the chip vendor so silly to produce such chips? :)
> 
> I don't quite understand the meaning of this sentence, but the approach where we 
> try heuristics doesn't scale.

If two chips share the same jedec_id, it means the two chips are produced from
the same chip vendor, such as 0x012018 means the chip is from Spansion.

If two chips share the same 5 bytes ID, the two chips definitely are produced
from the same vendor.

So my meaning is the case what are you mentioned will _not_ exit in the real world.
Spansion will not so silly.

> 
> > > This code should be future-proof, but if we keep adding such special
> > > cases, we will end up with false matches sooner or later anyway I'm

> > > afraid.
> > > 
> > > What do you say we add the READID length field into the table ?
> > 
> > If we add the length field into the table, we have to sort the table by
> > some kind of order.
> 
> Why, please elaborate.
pleas see:
http://lists.infradead.org/pipermail/linux-mtd/2013-December/050670.html

If you are interested in this issue, please give us a patch.
What I want is making the kernel can support the s25fl128s as soon as possible.

thanks
Huang Shijie
   

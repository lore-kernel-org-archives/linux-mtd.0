Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRU92-0000NN-Fj
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 16:49:25 +0000
Date: Thu, 16 Jul 2009 17:49:08 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: UBIFS Corrupt during power failure
Message-ID: <20090716164908.GI16461@shareable.org>
References: <1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<1246855913.20721.287.camel@localhost.localdomain>
	<1246862635.20721.291.camel@localhost.localdomain>
	<1246949184.20721.302.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>
	<20090715205217.GH3056@shareable.org>
	<1247728199.11353.63.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1247728199.11353.63.camel@localhost.localdomain>
Cc: Eric Holmberg <Eric_Holmberg@Trimble.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@Trimble.com>, Stefan Roese <sr@denx.de>,
	Nicolas Pitre <nico@cam.org>, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Wed, 2009-07-15 at 21:52 +0100, Jamie Lokier wrote:
> > I suspect that's quite common for NOR cells.
> > 
> > Here's a question: Does it ever happen for NAND cells?  Does the UBIFS
> > code assume that NAND erase only _ever_ converts 0 bits to 1 bits,
> > never 1 bits to 0 bits temporarily?
> 
> I'm not good in physics of those processes,

I believe it writes 0 on NOR cells to put the cells into a known
physical state first.  As you know, you can safely overwrite cells on NOR.

Then the erase changes them to a 1 state.  I suspect the erase pulse
would damage cells which are not in the known 0 state first, or might
put them into a state which isn't a proper 1, a sort of "too much
erase".

> but AFAIU during the erasure all bits are set from 0 to 1 on NAND,
> and this is a simultaneous process for all bits in the
> eraseblocks. But I cannot say for sure.

It's physically impossible for each cell to change at _exactly_ the
same speed, though they can be very close.

So if power is lost at the wrong moment, each of the cells will be in
a "half-erased" state, and some will be closer to 1 than others,
making a mixture of 0 and 1 bits in some pattern.

A chip could try to store enough residual power to finish a clean
erase when it loses external power, but I doubt if they do that.

Even if they all look like 1 bits after power failure, it's possible
that some bits are "half-erased" if the erase didn't finish, and
aren't reliable.  Does UBI notice this, and force the block to be
erased again even though it looks like all 1 bits?

-- Jamie

Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MULRL-0004be-82
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 14:08:09 +0000
Date: Fri, 24 Jul 2009 15:08:00 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: UBIFS Corrupt during power failure
Message-ID: <20090724140800.GB27755@shareable.org>
References: <7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<20090715205528.GI3056@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB703B47FCE@usw-am-xch-02.am.trimblecorp.net>
	<1247728619.11353.68.camel@localhost.localdomain>
	<4A5F938E.5070400@gcasse.net> <4A5FC5D5.9000302@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A5FC5D5.9000302@gmx.net>
Cc: Eric Holmberg <Eric_Holmberg@Trimble.com>, Gilles Casse <list@gcasse.net>,
	dedekind@infradead.org, linux-mtd@lists.infradead.org,
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

Carl-Daniel Hailfinger wrote:
> > According to a fellow electronician, Marc, offlist, it would not be safe
> > to force at 0 a bit already at 0 in flash.
> > For zeroing a byte, he recommends to write its complementary value (e.g.
> > if 0x85 is read then write 0x7A).
> 
> I've seen flash where the data sheet mentions implicit erase for each
> byte write, so writing a complementary value there might not set all
> bits to 0. That might have been NOR flash, though.

Those little serial flashes where you can write bytes individually do
that, of course.

I thought it was a standard, well-known feature of NOR-type flashes
that you could overwrite bytes to zero more of the bits, but I've not
read a standard which says so.

> If you have a data sheet or similar publication where writing the
> complementary value is recommended or mentioned, I'd appreciate a
> pointer to it. It does sound logical, but sometimes hardware is a bit odd.

I haven't head of the complementary value thing before, but I agree it
sounds logical.

-- Jamie

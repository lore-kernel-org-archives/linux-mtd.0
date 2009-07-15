Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRCfi-0003m3-7n
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 22:09:59 +0000
Date: Wed, 15 Jul 2009 23:09:42 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
Subject: Re: UBIFS Corrupt during power failure
Message-ID: <20090715220942.GQ3056@shareable.org>
References: <C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
	<1246627562.20721.190.camel@localhost.localdomain>
	<1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<20090715205528.GI3056@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB703B47FCE@usw-am-xch-02.am.trimblecorp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB703B47FCE@usw-am-xch-02.am.trimblecorp.net>
Cc: linux-mtd@lists.infradead.org, Urs Muff <urs_muff@trimble.com>,
	Stefan Roese <sr@denx.de>, Nicolas Pitre <nico@cam.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eric Holmberg wrote:
> > So I guess the right thing is to assume nothing, just that the whole
> > block may have bits flipped from 1 to 0 in an indeterminate order, and
> > then all bits flipped from 0 to 1 in an indeterminate order.
> > 
> > Or maybe the weaker assumption, that the whole block is indeterminate
> > during erase.
> 
> >From the beginning of the erase to the end is definitely an
> indeterminate state for the entire PEB.  Writing all zero's to the
> header as in Artem's fix should work in all cases excluding the
> extremely rare cases where a write of 0's is interrupted and the header
> has been changed to a valid value and in the case where an erase
> (0-to-1) transition is interrupted which results in a valid header.  The
> odds against that are huge, so I would expect the flash to wear out
> before it ever happens in real life.

I agree, with a nice strong checksum that should be rare.  With 100
millions of devices and full lifetime of each device, I don't know if
they are so rare with the checksum actually used that they'll never
happen though, or if it matters.

Anyway, the checksums have to be strong for other reasons.

It could be made virtually impossible by writing to a record on a
different PEB which says which PEB is undergoing erase and therefore
indeterminate.  Is that required for NAND in principle, since you
can't overwrite the header to zero it?

If there are NANDs which would require that, it could be a generic
part of UBI/UBIFS and strengthen the behaviour on NOR slightly,
otherwise I'm sure the header-zeroing is enough for NOR.

-- Jamie

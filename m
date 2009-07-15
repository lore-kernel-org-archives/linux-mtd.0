Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRC9f-0000Ke-C9
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 21:36:52 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Wed, 15 Jul 2009 15:36:47 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB703B47FCE@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <20090715205528.GI3056@shareable.org>
References: <C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
	<1242721105.3623.0.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
	<1246627562.20721.190.camel@localhost.localdomain>
	<1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<20090715205528.GI3056@shareable.org>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: "Jamie Lokier" <jamie@shareable.org>,
	"Artem Bityutskiy" <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
	Nicolas Pitre <nico@cam.org>, Adrian Hunter <adrian.hunter@nokia.com>,
	Urs Muff <urs_muff@trimble.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Artem Bityutskiy wrote:
> > So it indeed looks like NOR erasure includes writing zeroes from the
> > end. Unfortunately UBI/UBIFS cannot handle this correctly ATM.
>=20
> For that chip.  I wouldn't like to assume all NOR chips use the same
> erase algorithm.
>=20
> Also, remember that little problem with the 8-byte write buffer?

Yes, the configurable buffer size is still a to-do item.

>=20
> I guess it's possible that it's pre-erase-to-zero step might write
> zeros in 8-byte blocks too, or in some other size depending on how the
> hardware works.  And when it erases bytes in parallel, there's no
> guarantee about the order you'll see the bits change if it's
> interrupted by a power cycle.
>=20
> So I guess the right thing is to assume nothing, just that the whole
> block may have bits flipped from 1 to 0 in an indeterminate order, and
> then all bits flipped from 0 to 1 in an indeterminate order.
>=20
> Or maybe the weaker assumption, that the whole block is indeterminate
> during erase.

>From the beginning of the erase to the end is definitely an
indeterminate state for the entire PEB.  Writing all zero's to the
header as in Artem's fix should work in all cases excluding the
extremely rare cases where a write of 0's is interrupted and the header
has been changed to a valid value and in the case where an erase
(0-to-1) transition is interrupted which results in a valid header.  The
odds against that are huge, so I would expect the flash to wear out
before it ever happens in real life.

-Eric

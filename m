Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LuArJ-0007xp-I4
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 19:34:12 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Wed, 15 Apr 2009 13:33:15 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB70305C86F@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <20090415183806.GA8669@shareable.org>
References: <1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
	<20090415164416.GD4325@shareable.org>
	<alpine.LFD.2.00.0904151422170.6741@xanadu.home>
	<20090415183806.GA8669@shareable.org>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: "Jamie Lokier" <jamie@shareable.org>,
	"Nicolas Pitre" <nico@cam.org>
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@trimble.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> -----Original Message-----
> From: Jamie Lokier [mailto:jamie@shareable.org]=20
> Sent: Wednesday, April 15, 2009 12:38 PM
> To: Nicolas Pitre
> Cc: Eric Holmberg; Urs Muff; linux-mtd@lists.infradead.org;=20
> Adrian Hunter
> Subject: Re: UBIFS Corrupt during power failure
>=20
> Nicolas Pitre wrote:
> > On Wed, 15 Apr 2009, Jamie Lokier wrote:
> >=20
> > > Unrelated to this chip: I vaguely remember, aren't there=20
> some flash
> > > chips which can do more than one block write in parallel,=20
> or a write
> > > in parallel with an erase to a different block?
> >=20
> > Some NOR flash parts can do a write _or_ an erase in one=20
> block while=20
> > performing any amount of reads in other blocks.  At least=20
> that's what we=20
> > support.  If some parts allow for concurrent writes we=20
> currently don't=20
> > support that.
>=20
> I don't remember if it was NOR, NAND or something else, but I remember
> reading about some flash which supports 1 concurrent write and 1
> erase, and thinking "oh that's clever, it means you can do streaming
> writes or rapid fsync/database commits without long pauses=20
> for erasing".

The evolution seems to be:
 1. Allow erase / program suspend to do a read from a different PEB (the
chip I'm using supports this)
 2. Allow simultaneous read while either erasing or programming a
different PEB
 3. Allow parallel operations on different flash banks
 4. Combine NOR and NAND onto the same chip

My understanding is that the parallel operations are only valid on
different flash banks, where a flash bank could be thought of
conceptually as a separate flash chip.  I'm no flash memory expert by
any means, so I'm sure there are some other systems out there.

>=20
> Of course you can do that with two flash chips side by side :-)
>=20
> Can MTD and/or UBI join two chips to look like a single partition in
> that way and avoid pauses for erase by writing to the other part?

The CONFIG_MTD_CONCAT option will join multiple chips together into a
single MTD device, but I haven't looked into the code to see if it
allows simultaneous operations on the separate chips.

Nothing like RAID0 on flash :)

-Eric

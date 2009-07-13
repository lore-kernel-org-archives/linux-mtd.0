Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQQBU-0003gw-N1
	for linux-mtd@lists.infradead.org; Mon, 13 Jul 2009 18:23:35 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Mon, 13 Jul 2009 12:22:05 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <1246949184.20721.302.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239979018.3390.298.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
	<200905150916.54091.sr@denx.de>
	<C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
	<1242721105.3623.0.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
	<1246627562.20721.190.camel@localhost.localdomain>
	<1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<1246855913.20721.287.camel@localhost.localdomain>
	<1246862635.20721.291.camel@localhost.localdomain>
	<1246949184.20721.302.camel@localhost.loca ldomain>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: <dedekind@infradead.org>,
	"Urs Muff" <urs_muff@trimble.com>
Cc: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
	Nicolas Pitre <nico@cam.org>, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> On Mon, 2009-07-06 at 09:43 +0300, Artem Bityutskiy wrote:
> > On Mon, 2009-07-06 at 07:51 +0300, Artem Bityutskiy wrote:
> > > > [CCed Nicolas Pitre]
> > > >=20
> > > > OK, I've written a small user-space program which first=20
> fills the NOR
> > > > flash with an '0x89ABCDEF' pattern, then starts erasing=20
> it, and then
> > > > I cut the power at random point.
> > > >=20
> > > > And unfortunately the power cut results in eraseblocks=20
> which have
> > > > 0x89ABCDEF at the beginning, and all zeroes at the end.=20
> I've attached
> > > > one example.
> > > >=20
> > > > So it indeed looks like NOR erasure includes writing=20
> zeroes from the
> > > > end. Unfortunately UBI/UBIFS cannot handle this correctly ATM.
> > >=20
> > > Although I can easily fix this by writing few zeroes at=20
> the beginning of
> > > the eraseblock _before) erasing it, so that UBI will be=20
> happy. But it is
> > > still interesting whether I may just ask NOR to amend=20
> it's embedded
> > > erase algorithm.

This is exactly what I was seeing as well.  Here's a snippet from the
flash test code that I wrote that was very similar to your code:

Sector start:  0x3002 0000
Sector end:    0x3003 ffff
Data in block: aa55aa00

Interrupted during an erase cycle as 1's were being changed to 0's.

30204f60  aa55aa00 aa55aa00 aa55aa00 aa55aa00  <-- correct test pattern
30204f70  aa55aa00 aa55aa00 aa55aa00 aa55aa00
30204f80  aa55aa00 aa55aa00 aa55aa00 aa55aa00
30204f90  8254aa00 8841a000 a0408800 a8458000  <-- inbetween data
30204fa0  00000000 00000000 00000000 00000000  <-- zero's
30204fb0  00000000 00000000 00000000 00000000

I verified with Spansion that the embedded erase algorithm first clears
all 1's to 0's before erasing the bits to charge them back up to 1.

Essentially, the contents of the PEB are indeterminate between the start
and completion of an erase cycle.  The erase algorithm isn't
configurable, so we are stuck with this behavior.

> >=20
> > This patch seems to fix the UBI issues Eric and me observed=20
> (issue N2).
> > I'll test the patch for few days, but I couldn't see any=20
> problem so far.

The patch to write to the header is a great solution and I think it's
the only possible solution.  Performance should be fine, since the
4-byte write should only take about 0.5ms which is insignificant
compared to a typical PEB erase time of 700ms.

I will run 4 boards through torture tests starting tonight and let you
know later this week!  Based upon the errors that I've seen and looking
at the patch, I think that should solve the problem.

Great work guys!

-Eric

> >=20
> > From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > Subject: [PATCH] UBI: fix NOR flash recovery
> >=20
> > This commit fixes NOR flash recovery issues observed with Spansion
> > S29GL512N NOR.
> >=20
> > When NOR erases, it first fills PEBs with zeroes, then sets=20
> all bytes
> > to 0xFF. Filling with zeroes starts from the end of the=20
> PEB. And when
> > power is cut, this results in PEBs containing correct EC=20
> and VID headers
> > but corrupted with zeros at the end. This confuses UBI and=20
> it mistakinly
> > accepts these PEBs and associate them with LEBs.
> >=20
> > Fis this issue by zeroing EC and VID magics before erasing PEBs, to
> > make UBI later refuse zem.
> >=20
> > Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>=20
> Yes, it fixes the issue. The device has already survived ~1500 power
> cuts and no problems. It used to die after about 50 power cuts. I'm
> pushing this to ubi-2.6.git.
>=20
> So if Eric is still interested, he can try it when he is back from the
> holidays.
>=20

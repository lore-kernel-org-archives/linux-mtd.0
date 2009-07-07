Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MO4kM-0007a5-Ik
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 07:06:11 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Tue, 7 Jul 2009 01:05:24 -0600
Message-ID: <7207AAC68CE347458026863515A07DA113D8BE@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net><1239979018.3390.298.camel@localhost.localdomain><C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net><200905150916.54091.sr@denx.de><C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net><1242721105.3623.0.camel@localhost.localdomain><C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net><1246627562.20721.190.camel@localhost.localdomain><1246627771.20721.191.camel@localhost.localdomain><7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net><1246629940.20721.219.camel@localhost.localdomain><7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net><1246633131.20721.224.camel@localhost.localdomain><1246854654.20721.271.camel@localhost.localdomain><1246855913.20721.287.camel@localhost.localdomain><1246862635.20721.291.camel@localhost.localdomain>
	<1246949184.20721.302.camel@localhost.localdomain>
From: "Urs Muff" <urs_muff@trimble.com>
To: <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
	Nicolas Pitre <nico@cam.org>, Adrian Hunter <adrian.hunter@nokia.com>,
	Eric Holmberg <Eric_Holmberg@Trimble.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


He will be very glad to hear this!

- Urs

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind@infradead.org]
Sent: Tue 7/7/2009 12:46 AM
To: Urs Muff
Cc: Nicolas Pitre; Stefan Roese; linux-mtd@lists.infradead.org; Eric =
Holmberg; Adrian Hunter
Subject: RE: UBIFS Corrupt during power failure
=20
On Mon, 2009-07-06 at 09:43 +0300, Artem Bityutskiy wrote:
> On Mon, 2009-07-06 at 07:51 +0300, Artem Bityutskiy wrote:
> > > [CCed Nicolas Pitre]
> > >=20
> > > OK, I've written a small user-space program which first fills the =
NOR
> > > flash with an '0x89ABCDEF' pattern, then starts erasing it, and =
then
> > > I cut the power at random point.
> > >=20
> > > And unfortunately the power cut results in eraseblocks which have
> > > 0x89ABCDEF at the beginning, and all zeroes at the end. I've =
attached
> > > one example.
> > >=20
> > > So it indeed looks like NOR erasure includes writing zeroes from =
the
> > > end. Unfortunately UBI/UBIFS cannot handle this correctly ATM.
> >=20
> > Although I can easily fix this by writing few zeroes at the =
beginning of
> > the eraseblock _before) erasing it, so that UBI will be happy. But =
it is
> > still interesting whether I may just ask NOR to amend it's embedded
> > erase algorithm.
>=20
> This patch seems to fix the UBI issues Eric and me observed (issue =
N2).
> I'll test the patch for few days, but I couldn't see any problem so =
far.
>=20
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Subject: [PATCH] UBI: fix NOR flash recovery
>=20
> This commit fixes NOR flash recovery issues observed with Spansion
> S29GL512N NOR.
>=20
> When NOR erases, it first fills PEBs with zeroes, then sets all bytes
> to 0xFF. Filling with zeroes starts from the end of the PEB. And when
> power is cut, this results in PEBs containing correct EC and VID =
headers
> but corrupted with zeros at the end. This confuses UBI and it =
mistakinly
> accepts these PEBs and associate them with LEBs.
>=20
> Fis this issue by zeroing EC and VID magics before erasing PEBs, to
> make UBI later refuse zem.
>=20
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Yes, it fixes the issue. The device has already survived ~1500 power
cuts and no problems. It used to die after about 50 power cuts. I'm
pushing this to ubi-2.6.git.

So if Eric is still interested, he can try it when he is back from the
holidays.

--=20
Best regards,
Artem Bityutskiy (???????? ?????)

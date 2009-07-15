Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRC89-0000Bu-Cp
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 21:35:17 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Wed, 15 Jul 2009 15:35:09 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB703B47FC9@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <20090715205217.GH3056@shareable.org>
References: <1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<1246855913.20721.287.camel@localhost.localdomain>
	<1246862635.20721.291.camel@localhost.localdomain>
	<1246949184.20721.302.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>
	<20090715205217.GH3056@shareable.org>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
Cc: Jamie Lokier <jamie@shareable.org>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@trimble.com>, Stefan Roese <sr@denx.de>,
	Nicolas Pitre <nico@cam.org>, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > I will run 4 boards through torture tests starting tonight=20
> and let you
> > know later this week!  Based upon the errors that I've seen=20
> and looking
> > at the patch, I think that should solve the problem.
> >=20
> > Great work guys!
>=20
> Yeah :-)
>=20
> I've been holding off trying UBI on NOR.  Now it's looking=20
> more tempting :-)
>=20

Test Results - PASS
-------------------
I just finished a test run of 3 boards with a total of 8104 power cycles
during read/modify/write operations on UBIFS.  The system cuts power
randomly after mounting the UBIFS image while performing read/write file
operations on the UBIFS root file system.

I experienced 0 failures.  Typically, I was getting less than 100 cycles
before failures.

Software:
 * 2.6.27-rc9 kernel
 * UBIFS patches up to July 10
 * CFI Write buffer size limited to 8 bytes (NOR chip supports 32 bytes)
 * No power cycling during mount

Patch:
http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git?a=3Dcommit;h=3D=
201
fce21a67d74e9703127af0d6c6084003796bb

Remaining tasks:
 * Anybody:  Add support to UBI/UBIFS to allow for block-write sizes
greater than 8 bytes
 * Test with power failures during deferred recovery

Thanks for everybody's help so far!  I will hopefully get a chance to
setup the power-failures during deferred recovery this weekend.

-Eric

Received: from smtp2.crystaltech.com ([216.119.106.211])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 1916lr-0003QV-61
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 16:36:56 +0100
From: "John Burch" <jburch@vincisystems.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
	"'Kenneth Johansson'" <kenneth.johansson@etx.ericsson.se>
Date: Thu, 3 Apr 2003 10:36:54 -0500
Message-ID: <003501c2f9f6$dc7373a0$1200a8c0@JOHNB>
MIME-Version: 1.0
In-reply-to: <1049369136.14220.5.camel@passion.cambridge.redhat.com>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
cc: tglx@linutronix.de
cc: 'Mtd' <linux-mtd@lists.infradead.org>
Subject: RE: Can mtd partition span multiple devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> On Thu, 2003-04-03 at 12:15, Kenneth Johansson wrote:
> > On Thu, 2003-04-03 at 02:58, Thomas Gleixner wrote:
> > > On Thursday 03 April 2003 00:56, John Burch wrote:
> > > > I'm wondering if a single mtd partition can span more than one=20
> > > > physical flash device.  For example, if two flash=20
> devices span the=20
> > > > following address ranges, 0x0-0x3FFFFF and=20
> 0x400000-0x7FFFFF, can=20
> > > > an mtd partition be defined as follows?
> > > >
> > > > Name: spanning_partition
> > > > Size: 0x200000
> > > > Offset: 0x300000
> > > >
> > > > So this partition would span physical addresses 0x300000 -=20
> > > > 0x3FFFFF (device 1) and 0x400000 - 0x4FFFFF (device 2).
> > >=20
> > > Enable MTD concatenating support.
> > >=20
> >=20
> > You mean MTD partitioning no need for concatenating with=20
> this layout.
>=20
> Probably true -- if the two physical devices are laid out=20
> such that a single chip probe will find them together, they=20
> can be used as a single MTD device even without mtdconcat=20
> just by setting your map to cover the whole range 0->8M. You=20
> only really need mtdconcat for more complicated setups.
>=20

I'm using 2.4.17 and I don't think mtdconcat is part of that kernel
(though I may not need it anyway based on dwmw2's response).  Are the
changes since then substantial, and can 2.4.17 be patched to support the
latest mtd/jffs2 code?

Second, you imply that a single chip probe will handle multiple devices
(assuming contiguous addressing?).  Is this supported in 2.4.17 and is
it a common approach to use for multiple devices?

John

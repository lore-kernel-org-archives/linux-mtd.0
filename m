Date: Thu, 13 Jan 2005 15:22:38 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050113151724.GB18864@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501131521470.17331@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131435510.17331@phoenix.infradead.org>
	<Pine.LNX.4.58.0501131503160.17331@phoenix.infradead.org>
	<20050113151724.GB18864@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 Jan 2005, [iso-8859-1] J=F6rn Engel wrote:

> On Thu, 13 January 2005 15:05:16 +0000, Artem B. Bityuckiy wrote:
> > On Thu, 13 Jan 2005, Artem B. Bityuckiy wrote:
> >=20
> > > See the benefits:
> > > 1. We are able to use weaker then CRC32 checksums and still be good i=
n=20
> > > detecting wrong due to unclean reboot nodes.
> > > 2. We have principal ability to distingush between nodes corrupted du=
e to=20
> > > flash problems and due to unclean reboots.
> > > This is extreemly good do be able to distinguish. (JFFS2 has no such=
=20
> > > ability).=20
>=20
> Right, very nice attributes.
>=20
> > > Thoughts?
> > Hmm, only one small note, putting CRC to the end does not allow us to=
=20
> > recognize unclean reboots and flash media corruptions :-) But we still =
may=20
> > do this putting some majic bitmask to the end of nodes.
>=20
> static uint32_t jffs3_checksum(...)
> {
> =09static uint32_t ret =3D do_jffs3_checksum(...);
> =09if (ret =3D=3D 0xffffffff)
> =09=09return 0;
> =09return ret;
> }
>=20
> When reading the node, simply compare the checksum to 0xffffffff.  If
> it matches, we know that
> a) the checksum is wrong and=20
> b) it was due to incomplete write, not flash corruption.
>=20
> Adler32 has the nice property that 0xffffffff is an impossible
> checksum by design already, so the above code wouldn't be necessary.
Yes, I thought so either. But imagine due to unclean reboot the last CRC=20
was not written completely. this is the problem.
>=20
> J=F6rn
>=20
> --=20
> ...one more straw can't possibly matter...
> -- Kirby Bakken
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

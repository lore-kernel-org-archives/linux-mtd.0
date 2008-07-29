Subject: Re: 2nd problem with read_subpage() ?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <alpine.LFD.1.10.0807291045530.17391@casper.infradead.org>
References: <1217314432.3124.9.camel@sauron>
	<1217323810.3124.19.camel@sauron> <1217323872.3124.21.camel@sauron>
	<alpine.LFD.1.10.0807291045530.17391@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Tue, 29 Jul 2008 13:32:36 +0300
Message-Id: <1217327556.3124.31.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 2008-07-29 at 10:50 +0100, Alexey Korolev wrote:
> Hi Artem,
>=20
> > On Tue, 2008-07-29 at 12:30 +0300, Artem Bityutskiy wrote:
> > > On Tue, 2008-07-29 at 09:53 +0300, Artem Bityutskiy wrote:
> > > > Glance at nand_do_read_ops():
> > > >=20
> > > >=20
> > > > if (likely(sndcmd)) {
> > > >         chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> > > >         sndcmd =3D 0;
> > > > }
> > >=20
> > > Alexey,
> > >=20
> > > my investigation showed that this "random output" command is not
> > > supported by all flashes. ST-micro NANDs seems to support it
> > > (I checked 2 manuals), while Sumsung NANDs do not (checked manual
> > > for K9XXG08UXA). This means your implementation will break many
> > > systems and should be either fixed or reverted.
> >=20
> > Note, the Samsung NAND I referred is a large page device.
> >=20
> AFAIK this is a standard feature for LP NANDS. I glanced at spec for
> K9XXG08UXA - device supports subpage oprations.
>=20
> To check it I did this.=20
> Google -> K9XXG08UXA -> the first link -> open PDF page 41.=20

Ops, right, sorry for the fake alarm.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

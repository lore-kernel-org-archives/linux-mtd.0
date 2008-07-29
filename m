Subject: Re: 2nd problem with read_subpage() ?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <1217323810.3124.19.camel@sauron>
References: <1217314432.3124.9.camel@sauron> <1217323810.3124.19.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Tue, 29 Jul 2008 12:45:07 +0300
Message-Id: <1217324707.3124.29.camel@sauron>
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


On Tue, 2008-07-29 at 12:30 +0300, Artem Bityutskiy wrote:
> On Tue, 2008-07-29 at 09:53 +0300, Artem Bityutskiy wrote:
> > Glance at nand_do_read_ops():
> >=20
> >=20
> > if (likely(sndcmd)) {
> >         chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> >         sndcmd =3D 0;
> > }
>=20
> Alexey,
>=20
> my investigation showed that this "random output" command is not
> supported by all flashes. ST-micro NANDs seems to support it
> (I checked 2 manuals), while Sumsung NANDs do not (checked manual
> for K9XXG08UXA). This means your implementation will break many
> systems and should be either fixed or reverted.

I tried to implement this command in nandsim and test it with your
patch and found that there is something wring with how you use it.

What I do is dd if=3D/dev/mtd0 of=3Dfile bs=3D512 count=3D1 - just read one
sub-page. And in nandsim I see the following:

1. NAND_CMD_READ0 command, - read from eraseblock 0, column 0. This is
fine and seems to be called from nand_do_read_ops():

if (likely(sndcmd)) {
	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
        sndcmd =3D 0;
}

2. Then NAND_CMD_RNDREAD command is issued with column address
0x828, which is completely weird. It is called from nand_read_subpage():

...
if (eccpos[(start_step + num_steps) * chip->ecc.bytes] & (busw - 1))
	aligned_len++;

chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize + aligned_pos, -1);
chip->read_buf(mtd, &chip->oob_poi[aligned_pos], aligned_len);
....

I do not understand what is going on.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

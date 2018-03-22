Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ez2QG-0000cr-8y
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2018 15:46:38 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Timo Ketola <timo@exertus.fi>, linux-mtd@lists.infradead.org
Subject: Re: UBI assert failed in ubi_wl_init
Date: Thu, 22 Mar 2018 16:48:02 +0100
Message-ID: <2385502.GW1C2yTnO0@blindfold>
In-Reply-To: <a6a77fba-9df1-2dac-25a7-c0d3d9bc5b42@exertus.fi>
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <7511413.bof9RI5LLK@blindfold>
 <a6a77fba-9df1-2dac-25a7-c0d3d9bc5b42@exertus.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Timo,

Am Donnerstag, 22. M=E4rz 2018, 16:40:42 CET schrieb Timo Ketola:
> On 22.03.2018 17:05, Richard Weinberger wrote:
> > Timo,
>=20
> > Am Donnerstag, 22. M=E4rz 2018, 14:57:57 CET schrieb Timo Ketola:
> ...
>=20
> >> Here is a dump after the second boot:
> >>=20
> >> https://drive.google.com/open?id=3D1oa2lV_OB_tC-SX_c4jylnMXK6x1xhj2o
> >>=20
> >> After I dumped it I erased the whole mtd, wrote the dump back there,
> >> dumped another dump and verified that it was identical with the first
> >> one. Then I rebooted and observed that the issue was still there just =
as
> >> before.
> >=20
> > This image contains a Fastmap, but it is invalid.
> > The image has a length of 2079326208 bytes, your PEB size is 128KiB.
> > Therefore PEB count is 15864.
> > But the Fastmap references PEBs 15865, 15866 and 15867.
> >=20
> > This explains the failing assert, Fastmap talks about PEBs which are
> > unknown to UBI.
> >=20
> > Can it be that your mtd partition layout is bad/broken?
>=20
> The partition spans two chips and they both have four blocks of bad
> block tables at the end of the chips. Would that explain?

If this setup works correctly, it should work.

> I'm slightly confused though, because flash_erase reports total of eight
> blocks:
>=20
> # flash_eraseall /dev/mtd1
> Erasing 128 Kibyte @ 3bf60000 - 48% complete.
> Skipping bad block at 0x3bf80000
>=20
> Skipping bad block at 0x3bfa0000
>=20
> Skipping bad block at 0x3bfc0000
>=20
> Skipping bad block at 0x3bfe0000
> Erasing 128 Kibyte @ 7bf60000 - 99% complete.
> Skipping bad block at 0x7bf80000
>=20
> Skipping bad block at 0x7bfa0000
>=20
> Skipping bad block at 0x7bfc0000
>=20
> Skipping bad block at 0x7bfe0000
> Erasing 128 Kibyte @ 7c000000 - 100% complete.
>=20
>=20
> but, log tells only about four blocks:
>=20
> [    1.549699] Bad block table found at page 524224, version 0x01
> [    1.554241] Bad block table found at page 1048512, version 0x01
> [    1.561314] Bad block table found at page 524160, version 0x01
> [    1.565853] Bad block table found at page 1048448, version 0x01
> [    1.573232] 2 ofpart partitions found on MTD device gpmi-nand
> [    1.577688] Creating 2 MTD partitions on "gpmi-nand":
> [    1.581499] 0x000000000000-0x000004000000 : "system"
> [    1.595001] 0x000004000000-0x000080000000 : "user"

Now things get interesting.
Can it be that the number of bad blocks is not stable?
IOW sometimes 4 and sometimes 8 are reported?
This would more or less explain what you see.

=46astmap does not care about bad block itself, all it cares about the tota=
l=20
number of good blocks.

Thanks,
//richard

=2D-=20
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y

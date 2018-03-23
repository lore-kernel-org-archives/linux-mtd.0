Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezJ5Z-0002vS-7R
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 09:34:23 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Timo Ketola <timo@exertus.fi>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBI assert failed in ubi_wl_init
Date: Fri, 23 Mar 2018 10:35:40 +0100
Message-ID: <2757178.TuWGByBY2B@blindfold>
In-Reply-To: <d154d30e-af96-007f-70cb-dafbbfd294ef@exertus.fi>
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <2385502.GW1C2yTnO0@blindfold>
 <d154d30e-af96-007f-70cb-dafbbfd294ef@exertus.fi>
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

Am Freitag, 23. M=E4rz 2018, 10:26:30 CET schrieb Timo Ketola:
> On 22.03.2018 17:48, Richard Weinberger w> rote:
> > Am Donnerstag, 22. M=E4rz 2018, 16:40:42 CET schrieb Timo Ketola:
> >> I'm slightly confused though, because flash_erase reports total of eig=
ht
> >> blocks:
> >>=20
> >> # flash_eraseall /dev/mtd1
> >> Erasing 128 Kibyte @ 3bf60000 - 48% complete.
> >> Skipping bad block at 0x3bf80000
> >>=20
> >> Skipping bad block at 0x3bfa0000
> >>=20
> >> Skipping bad block at 0x3bfc0000
> >>=20
> >> Skipping bad block at 0x3bfe0000
> >> Erasing 128 Kibyte @ 7bf60000 - 99% complete.
> >> Skipping bad block at 0x7bf80000
> >>=20
> >> Skipping bad block at 0x7bfa0000
> >>=20
> >> Skipping bad block at 0x7bfc0000
> >>=20
> >> Skipping bad block at 0x7bfe0000
> >> Erasing 128 Kibyte @ 7c000000 - 100% complete.
> >>=20
> >>=20
> >> but, log tells only about four blocks:
> >>=20
> >> [    1.549699] Bad block table found at page 524224, version 0x01
> >> [    1.554241] Bad block table found at page 1048512, version 0x01
> >> [    1.561314] Bad block table found at page 524160, version 0x01
> >> [    1.565853] Bad block table found at page 1048448, version 0x01
> >> [    1.573232] 2 ofpart partitions found on MTD device gpmi-nand
> >> [    1.577688] Creating 2 MTD partitions on "gpmi-nand":
> >> [    1.581499] 0x000000000000-0x000004000000 : "system"
> >> [    1.595001] 0x000004000000-0x000080000000 : "user"
> >=20
> > Now things get interesting.
> > Can it be that the number of bad blocks is not stable?
> > IOW sometimes 4 and sometimes 8 are reported?
> > This would more or less explain what you see.
>=20
> Dumps show that the two blocks per chip are really bad block tables. The
> other two are empty. Could it be that the mtd reserves the other two for
> bbt mirrors?

This can be.

> Anyway, I configured the bbt off and now there is full 15872 good PEBs
> but the issue stays. Here is a dump after full erase ('nand scrub' from
> U-Boot), ubiformat, ubiattach, ubimkvol -m -N user and a couple of reboot=
s:
>=20
> https://drive.google.com/open?id=3D1QGUIxarow3mGXbiJYgsLzc-a_Y5oN5XS
>=20
> Is there any documents about the structure of fastmap blocks? google was
> no friend for me...

See ubi-media.h.
=20
> > Fastmap does not care about bad block itself, all it cares about the to=
tal
> > number of good blocks.
>=20
> How does it record the block references, absolute or relative to good
> blocks?
>=20
> | a | b | bad | c |
>=20
> Would it record c as block 3 (as absolute) or 2 (as third good one)?

As I said, Fastmap does not care at all. It takes the PEB numbers from UBI.
And UBI just skips bad blocks. So c will be 3.

The big difference between Fastmap and non-Fastmap is that PEB numbers are=
=20
stored on flash.
So maybe we have bug in this area.

Thanks,
//richard

=2D-=20
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y

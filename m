Received: from antispam02.maxim-ic.com ([205.153.101.183])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqKwP-0001iy-8T
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 08:12:06 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
Date: Mon, 8 Aug 2011 10:10:42 +0200
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAMjpGUc1a4NR5PWt3A5Y+jv6ihsWjUgH3iVUpNc0dsvkEzx6pw@mail.gmail.com>
	<CAN8TOE--96V6ZruB8+VvAz2kqxqMq4nc4d5=6SGsUt0eu7og0g@mail.gmail.com>
In-Reply-To: <CAN8TOE--96V6ZruB8+VvAz2kqxqMq4nc4d5=6SGsUt0eu7og0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201108081010.42161.brian.foster@maxim-ic.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 06 August 2011 02:09:04 Brian Norris wrote:
> On Thu, Aug 4, 2011 at 3:41 PM, Mike Frysinger <vapier@gentoo.org> wrote:
> > On Thu, Aug 4, 2011 at 10:46, Brian Norris wrote:
>[...]
> >> Anyway, since I don't have these types of flash readily
> >> available, I don't even use these options :) And apparently,
> >> one of the biggest contributors for mtd-utils, Mike Frysinger,
> >> doesn't use region_info either...
> >=20
> > i dont think any of the flashes (parallel nor, spi nor,
> > nand, etc...) included region_info.  that's why the func
> > print_region_info() sets up a dummy region_info struct that
> > describes the entire flash before calling print_region_map().
>=20
> I don't know much about this, but what's the feature for
> if no one uses it?

 I'm also uncertain why Flash manufacturers have
 this =E2=80=9Cfeature=E2=80=9D, but some certainly do.  Below's
 the output of =E2=80=98mtd_debug info /dev/mtd0=E2=80=99 for
 two different NOR-Flash chips (on different
 reference systems).  In both cases, =E2=80=98/dev/mtd0=E2=80=99
 is the entire chip (an important point since
 it looks like partitions of a chip always(?)
 have zero regions?):
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
# mtd_debug info /dev/mtd0    #(1) Flash from original bug report
mtd.type =3D MTD_NORFLASH
mtd.flags =3D MTD_CAP_NORFLASH
mtd.size =3D 33554432 (32M)
mtd.erasesize =3D 131072 (128K)
mtd.writesize =3D 1
mtd.oobsize =3D 0
regions =3D 1

region[0].offset =3D 0x00000000
region[0].erasesize =3D 131072 (128K)
region[0].numblocks =3D 256
region[0].regionindex =3D 0

# mtd_debug info /dev/mtd0    #(2) Different Flash on different system
mtd.type =3D MTD_NORFLASH
mtd.flags =3D MTD_CAP_NORFLASH
mtd.size =3D 4194304 (4M)
mtd.erasesize =3D 65536 (64K)
mtd.writesize =3D 1
mtd.oobsize =3D 0
regions =3D 3

region[0].offset =3D 0x00000000
region[0].erasesize =3D 8192 (8K)
region[0].numblocks =3D 8
region[0].regionindex =3D 0
region[1].offset =3D 0x00010000
region[1].erasesize =3D 65536 (64K)
region[1].numblocks =3D 62
region[1].regionindex =3D 1
region[2].offset =3D 0x003f0000
region[2].erasesize =3D 8192 (8K)
region[2].numblocks =3D 8
region[2].regionindex =3D 2
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80

 Our Linux systems are not explicitly taking
 advantage of multiple eraseblock regions.
 I do not know whether or not other software
 uses them.  (And yes, case =E2=80=98(2)=E2=80=99 really is
 only 4MiB =E2=80=94 that chip is almost useless for
 the Linux systems.... ;-\   That system also
 has a 2nd NOR-Flash (32MiB), but I don't have
 at-hand the =E2=80=98mtd_debug info=E2=80=99 for it....)


cheers!
	-blf-
=2D-=20
Brian FOSTER
Principal MTS, Software

Maxim Integrated Products (Microcontroller BU), formerly Innova Card
ZI Ath=C3=A9lia IV - Le Forum, B=C3=A2t. A
Quartier Roumagoua
13600 La Ciotat - France
Phone  : +33 (0)4 42 98 15 35
=46ax    : +33 (0)4 42 08 33 19
Email  : brian.foster@maxim-ic.com
Web    : http://www.maxim-ic.com/

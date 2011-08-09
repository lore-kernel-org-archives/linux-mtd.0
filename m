Received: from antispam01.maxim-ic.com ([205.153.101.182])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qqgjs-0006Us-QM
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 07:28:37 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
Date: Tue, 9 Aug 2011 09:27:12 +0200
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAMjpGUcTPR=EVOtfju5_S4Zu_h-rmqnCii4R0j7yFX8JTD81uA@mail.gmail.com>
	<CAN8TOE9p1v=mDUawRrnVAwDO4zz9LmXkqdNynLPCSCnBRMr9pw@mail.gmail.com>
In-Reply-To: <CAN8TOE9p1v=mDUawRrnVAwDO4zz9LmXkqdNynLPCSCnBRMr9pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201108090927.13042.brian.foster@maxim-ic.com>
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

On Tuesday 09 August 2011 01:19:11 Brian Norris wrote:
> On Fri, Aug 5, 2011 at 6:18 PM, Mike Frysinger <vapier@gentoo.org> wrote:
>[ ... ]
> > alternatively, we punt --all and just make users run `mtdinfo
> > /dev/mtd?`.  i'm fine with that too.
>=20
> I also feel like `--all' is too valuable to be killed just because
> of region_info.
>=20
> Instead, I'm a little more inclined to go for Brian Foster's
> suggestion (from another branch of this thread):
>=20
>   "Alternatively, --all only prints what it can get,
>   and --help warns there _may_ be additional data not
>   printed by --all (and to use =E2=80=98mtdinfo /dev/mtd<N>=E2=80=99)."
>=20
> Only problem I see is that this provides a little bit of
> inconsistency, where `mtdinfo --all' isn't quite all the info.
> But with an addition help message as described by Mr. Foster,
> I don't think this would be much problem.

 Thanks.  I've always presumed =E2=80=98--all=E2=80=99 means =E2=80=9Call m=
td devices=E2=80=9D,
 not =E2=80=9Call info from mtd=E2=80=9D, so this seeming-inconsistency did=
n't
 even occur to me!  If you want =E2=80=9Call info from mtd=E2=80=9D, then j=
ust
 do something like:
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
# for m in /dev/mtd[0-9]*; do mtdinfo $m; done
mtd0
Name:                           physmap-flash.0
Type:                           nor
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          256 (33554432 bytes, 32.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Additional erase regions:       0
Character device major/minor:   90:0
Bad blocks are allowed:         false
Device is writable:             true
Eraseblock region 0:  offset: 0x27f0004 size: 0xde numblocks: 0

mtdinfo: error!: "/dev/mtd1" does not correspond to any existing MTD device
mtdinfo: error!: "/dev/mtd2" does not correspond to any existing MTD device
mtdinfo: error!: "/dev/mtd3" does not correspond to any existing MTD device
mtdinfo: error!: "/dev/mtd4" does not correspond to any existing MTD device
mtdinfo: error!: "/dev/mtd5" does not correspond to any existing MTD device
mtdinfo: error!: "/dev/mtd6" does not correspond to any existing MTD device
mtdinfo: error!: "/dev/mtd7" does not correspond to any existing MTD device
#=20
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
 Simple.  I don't mind the errors shown above, so I haven't
 bothered to work out how to suppress them (without loosing
 other, presumably important, error messages).

cheers!
	-blf-
=2D-=20
Brian FOSTER
Principal MTS, Software
Maxim Integrated Products (Microcontroller BU), formerly Innova Card
Web    : http://www.maxim-ic.com/

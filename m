Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zf1CP-0006TF-1h
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 07:44:14 +0000
Date: Thu, 24 Sep 2015 09:43:39 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Karl Zhang =?UTF-8?B?5byg5Y+M6ZSj?= (karlzhang)" <karlzhang@micron.com>
Cc: Andrea Scian <rnd4@dave-tech.it>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>, Iwo Mergler
 <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, "Qi Wang =?UTF-8?B?546L6LW3?= (qiwang)"
 <qiwang@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "shuangshuo@gmail.com" <shuangshuo@gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
Message-ID: <20150924094339.006ccbb7@bbrezillon>
In-Reply-To: <D067BF0533BDBE4F821CF557AAAE78443B96AA67@NTXXIAMBX01.xacn.micron.com>
References: <20150917152240.757c9e90@bbrezillon>
 <1442503239.19983.18.camel@gmail.com>
 <20150917174642.0c983136@bbrezillon> <55FAEEB1.50401@nod.at>
 <55FBBA6E.9070203@dave-tech.it>
 <1442562845.19983.43.camel@gmail.com>
 <55FBDB8F.2040301@dave-tech.it>
 <D067BF0533BDBE4F821CF557AAAE78443B96AA67@NTXXIAMBX01.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Karl,

On Thu, 24 Sep 2015 01:57:41 +0000
Karl Zhang =E5=BC=A0=E5=8F=8C=E9=94=A3 (karlzhang) <karlzhang@micron.com> w=
rote:

> Hello
>=20
> Actually, we are working on the paired pages problem too. We have on MLC=
=20
> chips and developed a hardware power control board to simulate the real p=
ower loss cycle.
>=20
> We have many ideas to share with you.
>=20
>=20
> 1. emulating the paired-page case
> 	HW: Develop a power control daughter board to control the power supply t=
o NAND, including voltage/ramp control.
> 	SW: Add a module in NAND controller, utilize power board to shut down NA=
ND power when programming paired upper page.

Even the SW solution sounds like a HW solution to me :-).
When I say SW emulation, I mean something that doesn't require a reboot
or power-off operation.

> 	=09
>  This is easy for us to reproduce paired-page case, in order to guarantee=
 the power loss moment, we add use FPGA logic=20
> to control the power board and detect the status of NAND.

That's not so easy for me ;-).
Anyway, as I answered to Andrea, testing on real HW is definitely
necessary, but doing it while evaluating the different options is not as
efficient as emulating paired pages behavior.

>=20
>=20
> 2. EC/VID header corruption
> 	As Boris's excellent summary mentioned, "duplicate the EC header in the =
VID header", I also believe this is a good=20
> 	solution to protect EC, and we are doing this and testing on MLC.
> =09
> 	For VID header, I think skip pages will waste too many capacity, and SLC=
 mode conjugation with GC will make PE cycling higher.
>=20
> 	We are developing another solution to store VID info into other page's O=
OB area in its own block, because UBI does not=20
> 	use OOB and ECC code always not use all OOB area.=20
>=20

Hm, using the OOB area to do that is not such a good idea IMO, and I see
at least 2 reasons:

1/ You're supposing that you'll always have enough space to store the
VID info (the header is currently taking 64 bytes, even if we could
compress it by removing the padding), and this is not necessarily true
(particularly with some NAND controllers which are allowing as much
space as possible for ECC bytes).

2/ Most of the time ECC bytes are not protected (and even if some
controllers are able to protect a few of them, we're not sure to have 64
bytes of protected OOB bytes per page), which means you're writing
something that can be corrupted by bitflips. I know that the header is
protected by a CRC, but that won't help recovering the data, just let
you know when the header is corruption.
To summarize, you'll have to duplicate the VID info in all pages, and
you're not guaranteed to have a valid one (even if, the more pages you
write the less chance you have to get all of them corrupted)

Regarding the fact that you'll have to at least loose/reserve one page
to protect the VID info, I actually had another (crazy?) idea (which I
didn't expose in my previous mail, because I thought it would be a major
change in the UBI design):
How about completely getting rid of the VID header and relying on the
fastmap database (not the current one, but something close to it) + a
UBI journal logging the different changes (PEB erase, LEB map, ...).
This way we should be able to recover all the information (even the EC
ones) even after a power cut. Of course, still remains the problem of
the fastmap volume corruption.

>=20
>=20
> We are still developing and testing these solutions to protect EC and VID=
 on MLC.

Okay, let us know about the results. Also, can you share the code
publicly, or is this something you want to keep private until you have
a stable version?

> 	=09
>=20
> All the above is my limited work on paired pages, and I am open to any ne=
w suggestions and cooperation.

Thanks for sharing your ideas.

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

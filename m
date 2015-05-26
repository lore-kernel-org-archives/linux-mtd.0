Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxHaH-00083Y-03
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 16:20:05 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Johannes Bauer <weolanwaybqm@spornkuller.de>, Richard Weinberger
 <richard@nod.at>
Subject: RE: Wear-leveling peculiarities
Date: Tue, 26 May 2015 16:19:36 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7357DEC6820@NTXBOIMBX03.micron.com>
References: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>
 <55f052b8b8f65bf34b0ed9f20b4f2f07@joe.dyn.spornkuller.de>
 <CAFLxGvxQeeA8dk7DY6ZcsAm0WBch7c6gOn92gUZB138B6bfeGA@mail.gmail.com>
 <555A4D38.3070702@spornkuller.de> <555A4FFB.5040006@nod.at>
 <f0e983ad35f8be37ef51686615017016@joe.dyn.spornkuller.de>
 <5564460D.6010209@nod.at>
 <fa1a37d3deb8876079963af7ddc0ff25@joe.dyn.spornkuller.de>
In-Reply-To: <fa1a37d3deb8876079963af7ddc0ff25@joe.dyn.spornkuller.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the part is ONFI compliant you can always dump the parameter page and an=
y information you need. =20


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc

-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Johannes Bauer
Sent: Tuesday, May 26, 2015 4:14 AM
To: Richard Weinberger
Cc: linux-mtd@lists.infradead.org
Subject: Re: Wear-leveling peculiarities

Am 26.05.2015 12:08, schrieb Richard Weinberger:

> What flash is this?
> I should not start dying that early.

To be honest, I have no idea. The problem is that the CPU is stacked on top=
 of the NAND via package-on-package technlogoly. The whole component is sup=
plied by a third party (and I've just scanned their documentation, which do=
es not give any hints about the origin of the NAND). So I have no markings =
on the package (POP) and no documentation. The only thing I do have is dmes=
g:

omap2-nand driver initializing
ONFI flash detected
NAND device: Manufacturer ID: 0x20, Chip ID: 0xaa (ST Micro NAND 256MiB 1,8=
V 8-bit)

Maybe there's a way to talk to the NAND directly and get some more identifi=
cation, but I don't know how. Any hints? I'd happily provide clues.

Cheers,
Johannes

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

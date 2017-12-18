Date: Mon, 18 Dec 2017 09:25:35 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@free-electrons.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Eric Miao <eric.y.miao@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ezequiel
 Garcia <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Neta Zur
 Hershkovits <neta@marvell.com>
Subject: Re: [PATCH 00/12] Marvell NAND controller rework with ->exec_op()
Message-ID: <20171218092535.2ca1fe13@xps13>
In-Reply-To: <877etkecig.fsf@belgarion.home>
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
 <20171214070930.0b885f6d@bbrezillon>
 <877etkecig.fsf@belgarion.home>
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

Hello Robert,

On Mon, 18 Dec 2017 08:11:35 +0100
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Boris Brezillon <boris.brezillon@free-electrons.com> writes:
>=20
> >> Robert, it would be great if you could also do more testing on PXA
> >> and validate this driver. If needed, a branch ready to be tested is
> >> available at [3]. It is based on nand/next and has all the changes
> >> brought by the previously mentionned series as well as this one. =20
> >
> > Robert, do you think you'll have some time to test Miquel's branch
> > on your PXA boards? Miquel already tested on one of these boards
> > (CM-X300), but we'd like to have other testers. Also feel free to
> > review the driver if have the time.
> >
> > Thanks,
> >
> > Boris =20
>=20
> Hi Boris and Miquel,
>=20
> I have applied the whole serie to linux-next yesterday.
>=20
> A boot attempt on my zylonite with my old defconfig (with the new
> Marvell NAND config activated) yields to :
>  - this message
> [    3.136818] marvell-nfc pxa3xx-nand: could not identify the nand
> chip [    3.143874] marvell-nfc: probe of pxa3xx-nand failed with
> error -22
>  - then my board hangs
>=20
> Is there something to be done to improve the trace level so that you
> can guess what's happening ?

Thank you very much for testing this.

Could you please try this branch [1] instead of linux-next + the
patches?

Also, can you please add #define DEBUG in marvell_nand.c + nand_base.c,
it should help us figuring out what is wrong.

Thank you,
Miqu=C3=A8l

[1] https://github.com/miquelraynal/linux/tree/marvell/nand-next/nfc

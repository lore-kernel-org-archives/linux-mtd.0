Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1CrQ-0003X6-2O
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2013 09:56:56 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: support DUAL and QUAD[patch v1]
Date: Mon, 22 Jul 2013 09:56:24 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9EC9B1@DBDE04.ent.ti.com>
References: <CAHSAbzP0Nc1ahf_ra6yDuMvV998_+EGcUOGDv5ifKaagYf+NOg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E84D2@DBDE04.ent.ti.com>
 <CAHSAbzMDOWo5oBqUHqMxybuDwUjFbczYwN+85gH+rxZ9z8u2Pw@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E851E@DBDE04.ent.ti.com>
 <593AEF6C47F46446852B067021A273D6D93B49E1@MUCSE039.lantiq.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E85D0@DBDE04.ent.ti.com>
 <CAHSAbzP5jqHwCm0qhu=DiNzpP0swqWHsQ0=MnF+EKaSN22E5hg@mail.gmail.com>
 <CA+7tXihoZZhpoyvxj58c+Zi-Zy631kK5s-kDoSxPKq=ej0qyvA@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E967D@DBDE04.ent.ti.com>
 <20130722093342.GJ9858@sirena.org.uk>
In-Reply-To: <20130722093342.GJ9858@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, Trent Piepho <tpiepho@gmail.com>,
 yuhang wang <wangyuhang2014@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> > > Maybe it would make more sense to have a spi-rx-width and spi-tx-widt=
h
> > > than can be set to 1, 2, 4, etc. bits instead of a bunch of propertie=
s
> > > that are mutually exclusive?  Sooner or later someone is going to wan=
t
> > > 8 bits.
>=20
> > Then it would not remain a serial interface (Serial Peripheral Interfac=
e),
> > rather it would be more of parallel memory like interface.
> > And you would not like to use SPI controller for it, instead you would =
use
> > On-chip General Purpose External Interface controllers (like GPMC)
> > because it gives you more options to tweak and configure.
>=20
> It's still not beyoond the bounds of possibility, and of course some
> bright spark might decide to use 3 wires.  Unless it's expensive to do
> so in some way it seems better to keep the interface as generic as
> possible even if we've no expectation that some of the flexibility will
> be used.
>=20
Ok.. Agreed,  I don't have any preference here between
"rx-width , tx-width" v/s "mode".
But please make sure that whichever implementation is chosen,
it should allow dynamic changing of channel-width.

Granularity should be based on following decisions:
(a) struct spi_message: if all transfers of same message follow same
 channel width. Example: All spi_messages from MTD layer would
use Qual-SPI only (both flash-commands and data).

(b) struct spi_transfer: if each transfer of same message need to be=20
transferred at different width. 	Example: Command @ Single-SPI
 followed by Data @ Quad-SPI


with regards, pekon

From: "Gupta, Pekon" <pekon@ti.com>
To: yuhang wang <wangyuhang2014@gmail.com>, "Thomas.Betker@rohde-schwarz.com"
 <Thomas.Betker@rohde-schwarz.com>
Subject: RE: SPI: DUAL/QUAD support
Date: Fri, 5 Jul 2013 06:45:01 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E4C2E@DBDE04.ent.ti.com>
References: <CAHSAbzPNDSr_6N79fh0DTWSEg8buRRPyiw8SPodtKLPjzWXJsg@mail.gmail.com>
 <20130704130017.GA25997@sig21.net>
 <OFA0D5839D.0594EA10-ONC1257B9E.004A7347-C1257B9E.00524BA5@rohde-schwarz.com>
 <20130704154927.GE27646@sirena.org.uk>
 <OFAD729A05.8C915625-ONC1257B9E.00576B25-C1257B9E.0058477D@rohde-schwarz.com>
 <CAHSAbzOg+uHndydSC43moF7pijc67pqzB2rPnY69ynXHEzw79g@mail.gmail.com>
In-Reply-To: <CAHSAbzOg+uHndydSC43moF7pijc67pqzB2rPnY69ynXHEzw79g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Johannes Stezenbach <js@sig21.net>, Grant Likely <grant.likely@secretlab.ca>,
 Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Just as Johannes said. In my patch m25p80's changes is incomplete.
> Because my inicial aim is to add the transfer width member to tell contro=
ller
> the mode flash in. And I will attach new patch about m25p80 later.
> Also you are right. There are really series of flashes do not support dua=
l/quad
> transfer. So I don't know whether there are any standard for serial-flash=
 just
> like the CFI for parallel-flash. Personally, to make a general standard a=
nd
> a general code for serial-flash is necessary. So that we do not need to a=
dd
> special function in m25p80.c.
>=20
[Pekon]: Does below generic framework for spianand, suit your driver?
http://lists.infradead.org/pipermail/linux-mtd/2013-July/047434.html

you should be able to extend the generic spinand API for all
serial modes (SPI, Dual-SPI, Quad-SPI).
As QSPI and Dual-SPI devices should implicitly support SPI (MISO/MOSI)
So, you can do device probing using default SPI mode. And then based on
DT inputs and device support upgrade to QSPI / Dual-SPI mode.
And going forward extend it for direct memory-mapped device for XIP.


with regards, pekon

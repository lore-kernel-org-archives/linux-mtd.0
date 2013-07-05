From: "Gupta, Pekon" <pekon@ti.com>
To: Johannes Stezenbach <js@sig21.net>
Subject: RE: SPI: DUAL/QUAD support
Date: Fri, 5 Jul 2013 08:04:31 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E4C7D@DBDE04.ent.ti.com>
References: <CAHSAbzPNDSr_6N79fh0DTWSEg8buRRPyiw8SPodtKLPjzWXJsg@mail.gmail.com>
 <20130704130017.GA25997@sig21.net>
 <OFA0D5839D.0594EA10-ONC1257B9E.004A7347-C1257B9E.00524BA5@rohde-schwarz.com>
 <20130704154927.GE27646@sirena.org.uk>
 <OFAD729A05.8C915625-ONC1257B9E.00576B25-C1257B9E.0058477D@rohde-schwarz.com>
 <CAHSAbzOg+uHndydSC43moF7pijc67pqzB2rPnY69ynXHEzw79g@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E4C2E@DBDE04.ent.ti.com>
 <20130705073550.GA24258@sig21.net>
In-Reply-To: <20130705073550.GA24258@sig21.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Thomas.Betker@rohde-schwarz.com" <Thomas.Betker@rohde-schwarz.com>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, yuhang wang <wangyuhang2014@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > [Pekon]: Does below generic framework for spianand, suit your driver?
> > http://lists.infradead.org/pipermail/linux-mtd/2013-July/047434.html
> >
> > you should be able to extend the generic spinand API for all
> > serial modes (SPI, Dual-SPI, Quad-SPI).
> > As QSPI and Dual-SPI devices should implicitly support SPI (MISO/MOSI)
> > So, you can do device probing using default SPI mode. And then based on
> > DT inputs and device support upgrade to QSPI / Dual-SPI mode.
> > And going forward extend it for direct memory-mapped device for XIP.
>=20
> Not sure what you have in mind since NAND and NOR flash work very
> differently, and SPI vs. memory-mapped is also very different.
>=20
[Pekon]:  Opps.. Sorry for NAND v/s NOR confusion,
But I found generic framework for SPINAND (not in mainline) helpful
for us, so I pointed that..
I'm not sure about your end use-case, but I our QSPI controller supports
direct memory-addressable cpu-side bus-interface which can be enabled
for XIP support. So pointed out that here as-well..


> But to add to the spinand review comments two things caught
> my eye on quick glance over the code:
>=20
> > +#define mu_spi_nand_driver_version "Beagle-
> MTD_01.00_Linux2.6.33_20100507"
>=20
> seems like an unused leftover?  if the version number is
> important then maybe better put it in commit message?
>=20
> > +/bin/bash: 4: command not found
>=20
> how did this get in there?
>=20
[Pekon]: Thanks.. Sourav needs to clean this up lot more.

with regards, pekon

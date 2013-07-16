From: "Gupta, Pekon" <pekon@ti.com>
To: yuhang wang <wangyuhang2014@gmail.com>
Subject: RE: support DUAL and QUAD[patch v1]
Date: Tue, 16 Jul 2013 09:11:25 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E851E@DBDE04.ent.ti.com>
References: <CAHSAbzP0Nc1ahf_ra6yDuMvV998_+EGcUOGDv5ifKaagYf+NOg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E84D2@DBDE04.ent.ti.com>
 <CAHSAbzMDOWo5oBqUHqMxybuDwUjFbczYwN+85gH+rxZ9z8u2Pw@mail.gmail.com>
In-Reply-To: <CAHSAbzMDOWo5oBqUHqMxybuDwUjFbczYwN+85gH+rxZ9z8u2Pw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> Hi, Gupta
>=20
>=20
> > [Pekon]: Instead of adding new fields you can use existing 'mode' field=
 to
> > pass on the platform specific configurations. And if 'u8 mode' does not
> > suffice you can increase it to 'u32'.
> > #define QSPI_MODE       1 << 5; // just check which bit-fields are un-u=
sed
> > spi_board_info->mode |=3D QSPI_MODE;
> >
>=20
> well, can dual and quad be regarded as a spi mode? if so, your comment
> seems
> to be right.

Yes, Quad and Dual modes should be regarded as extension of SPI protocol.
- They follow the same basic principle of synchronous data transfer. Right =
?
- These modes are not adding any extra side-band | In-band signaling or=20
controls to modify the protocol. They are just increasing the width of
 data-channel for better throughput.

with regards, pekon

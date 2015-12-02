Date: Wed, 2 Dec 2015 09:53:40 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Hartley
 Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Imre
 Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Tony
 Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Alexander Clouter
 <alex@digriz.org.uk>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Marek
 Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net, Mikael Starvik
 <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-cris-kernel@axis.com, Josh Wu <josh.wu@atmel.com>, Wan ZongShun
 <mcuos.com@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Maxim Levitsky
 <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof
 Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, linux-sunxi@googlegroups.com, Stefan Agner
 <stefan@agner.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org
Subject: Re: [PATCH v2 17/25] mtd: nand: remove useless mtd->priv = chip
 assignments
Message-ID: <20151202095340.2f84e80f@bbrezillon>
In-Reply-To: <20151201221747.GB64635@google.com>
References: <1448967802-25796-1-git-send-email-boris.brezillon@free-electrons.com>
 <1448967802-25796-18-git-send-email-boris.brezillon@free-electrons.com>
 <20151201221747.GB64635@google.com>
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

Hi Brian,

On Tue, 1 Dec 2015 14:17:47 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> On Tue, Dec 01, 2015 at 12:03:14PM +0100, Boris Brezillon wrote:
> > mtd_to_nand() now uses the container_of() approach to transform an
> > mtd_info pointer into a nand_chip one. Drop useless mtd->priv
> > assignments from NAND controller drivers.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> > Patch generated with the following coccinelle script:
> >=20
> > ---8<----
> > virtual patch
> >=20
> > @@
> > struct mtd_info m;
> > struct mtd_info *mp;
> > struct nand_chip *c;
> > @@
> > (
> > -(m).priv =3D c;
> > |
> > -(mp)->priv =3D c;
> > |
> > -(mp)->priv =3D (void *)c;
> > )
> > ---8<----
> > ---
>=20
> ...
>=20
> > diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> > index 3f29734..ed4184c 100644
> > --- a/drivers/mtd/nand/s3c2410.c
> > +++ b/drivers/mtd/nand/s3c2410.c
> > @@ -834,7 +834,6 @@ static void s3c2410_nand_init_chip(struct s3c2410_n=
and_info *info,
> >  	chip->IO_ADDR_R =3D chip->IO_ADDR_W;
> > =20
> >  	nmtd->info	   =3D info;
> > -	mtd->priv	   =3D chip;
>=20
> After this one, we have:
>=20
> drivers/mtd/nand/s3c2410.c: In function =E2=80=98s3c2410_nand_init_chip=
=E2=80=99:
> drivers/mtd/nand/s3c2410.c:791:19: warning: unused variable =E2=80=98mtd=
=E2=80=99 [-Wunused-variable]

I fixed all the warnings/errors you pointed in patch 12 and 17 and
resent a v3 only for those patches to avoid annoying all recipients
again. Let me know if you want me to resend the whole patchset.

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

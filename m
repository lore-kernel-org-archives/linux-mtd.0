Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP9kn-0003ya-DD
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2013 11:29:05 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, "tony@atomide.com"
 <tony@atomide.com>, "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>
Subject: RE: [PATCH v6 4/4] ARM: dts: AM33xx: updated default ECC scheme in
 nand-ecc-opt
Date: Thu, 26 Sep 2013 11:28:19 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA16D3D@DBDE04.ent.ti.com>
References: <1378986619-26765-1-git-send-email-pekon@ti.com>
 <1378986619-26765-5-git-send-email-pekon@ti.com>
 <20130925191559.GF23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20130925191559.GF23337@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Mark Rutland \(mark.rutland@arm.com\)" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Stephen
 Warren <swarren@wwwdotorg.org>, "olof@lixom.net" <olof@lixom.net>, "Rob Herring
 \(robherring2@gmail.com\)" <robherring2@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Brian Norris [mailto:computersforpeace@gmail.com]
>=20
> On Thu, Sep 12, 2013 at 05:20:19PM +0530, Pekon Gupta wrote:
> > DT property values for OMAP based gpmc-nand have been updated
> > to match changes in commit:
> > 	6faf096 ARM: OMAP2+: cleaned-up DT support of various ECC
> schemes
>=20
> Whose commit ID is this? Your patch is not merged yet, so don't use a
> commit ID.
>=20
> > Refer: Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> >
> > Signed-off-by: Pekon Gupta <pekon@ti.com>
> > ---
> >  arch/arm/boot/dts/am335x-evm.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/am335x-evm.dts
> b/arch/arm/boot/dts/am335x-evm.dts
> > index e8ec875..e28a2ac 100644
> > --- a/arch/arm/boot/dts/am335x-evm.dts
> > +++ b/arch/arm/boot/dts/am335x-evm.dts
> > @@ -268,7 +268,7 @@
> >  			nand@0,0 {
> >  				reg =3D <0 0 0>; /* CS0, offset 0 */
> >  				nand-bus-width =3D <8>;
> > -				ti,nand-ecc-opt =3D "bch8";
> > +				ti,nand-ecc-scheme =3D "bch8";
> >  				gpmc,device-nand =3D "true";
> >  				gpmc,device-width =3D <1>;
> >  				gpmc,sync-clk-ps =3D <0>;
>=20
> This change should probably go in patch 1 anyway, when you break the
> ABI.
>=20
As this patch series touches three different trees..=20
(1) arch/arm/boot/dts/..  maintained by Benoit Cousson (benoit.cousson@lina=
ro.org)
(2) arch/arm/mach-omap2/.. maintained by Tony Lindgren (tony@atomide.com)
(3) driver/mtd/nand/.. maintained by Brian Norris <computersforpeace@gmail.=
com>

It was observed that there were conflicts usually during final merge,
Hence I separated out the patches.
However, if all are in sync and the series gets committed in above trees
simultaneously, then this conflicts can be avoided.
So, if Tony & Benoit are ok then I'll merge this [PATCH 4/4] in [PATCH 1/4]=
.

with regards, pekon

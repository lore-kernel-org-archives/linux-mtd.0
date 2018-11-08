Received: from mail-os2jpn01on070a.outbound.protection.outlook.com
 ([2a01:111:f400:fe9c::70a]
 helo=JPN01-OS2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKhRx-0005zy-Cz
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 10:22:15 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven
 <geert+renesas@glider.be>
CC: Richard Weinberger <richard@nod.at>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark
 Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Chris
 Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 3/4] ARM: dts: r8a77470: Add QSPI support
Date: Thu, 8 Nov 2018 10:21:49 +0000
Message-ID: <TY1PR01MB1770FA3764370E7AEA5D30C6C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1541075705-1333-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1541075705-1333-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181102114946.5tqk2lyisaey475w@verge.net.au>
In-Reply-To: <20181102114946.5tqk2lyisaey475w@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 02 November 2018 11:50
> Subject: Re: [PATCH 3/4] ARM: dts: r8a77470: Add QSPI support
>
> On Thu, Nov 01, 2018 at 12:35:04PM +0000, Fabrizio Castro wrote:
> > Add QSPI[01] support to the RZ/G1C SoC specific device tree.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a77470.dtsi | 34 +++++++++++++++++++++++++++++++++=
+
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a774=
70.dtsi
> > index e6407e5..04a8877 100644
> > --- a/arch/arm/boot/dts/r8a77470.dtsi
> > +++ b/arch/arm/boot/dts/r8a77470.dtsi
> > @@ -20,6 +20,8 @@
> >  i2c2 =3D &i2c2;
> >  i2c3 =3D &i2c3;
> >  i2c4 =3D &i2c4;
> > +spi0 =3D &qspi0;
> > +spi1 =3D &qspi1;
> >  };
>
> Geert can comment but I believe we are moving away from using aliases
> in this way and that it would be best if the above hunk was dropped
> from this patch.
>
> https://patchwork.kernel.org/patch/10644159/

Geert, what do you want me to do here?

Thanks,
Fab

>
> The rest of the patch looks fine to me.
>
> >
> >  cpus {
> > @@ -460,6 +462,38 @@
> >  status =3D "disabled";
> >  };
> >
> > +qspi0: spi@e6b10000 {
> > +compatible =3D "renesas,qspi-r8a77470", "renesas,qspi";
> > +reg =3D <0 0xe6b10000 0 0x2c>;
> > +interrupts =3D <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 918>;
> > +dmas =3D <&dmac0 0x17>, <&dmac0 0x18>,
> > +       <&dmac1 0x17>, <&dmac1 0x18>;
> > +dma-names =3D "tx", "rx", "tx", "rx";
> > +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> > +num-cs =3D <1>;
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +resets =3D <&cpg 918>;
> > +status =3D "disabled";
> > +};
> > +
> > +qspi1: spi@ee200000 {
> > +compatible =3D "renesas,qspi-r8a77470", "renesas,qspi";
> > +reg =3D <0 0xee200000 0 0x2c>;
> > +interrupts =3D <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 917>;
> > +dmas =3D <&dmac0 0xd1>, <&dmac0 0xd2>,
> > +       <&dmac1 0xd1>, <&dmac1 0xd2>;
> > +dma-names =3D "tx", "rx", "tx", "rx";
> > +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> > +num-cs =3D <1>;
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +resets =3D <&cpg 917>;
> > +status =3D "disabled";
> > +};
> > +
> >  scif0: serial@e6e60000 {
> >  compatible =3D "renesas,scif-r8a77470",
> >       "renesas,rcar-gen2-scif", "renesas,scif";
> > --
> > 2.7.4
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.

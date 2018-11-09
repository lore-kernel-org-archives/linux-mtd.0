Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL6Iv-0004Gu-66
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 12:54:29 +0000
Date: Fri, 9 Nov 2018 13:54:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Michal Simek
 <michals@xilinx.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nagasuresh12@gmail.com"
 <nagasuresh12@gmail.com>, "robh@kernel.org" <robh@kernel.org>
Subject: Re: [LINUX PATCH v12 1/3] dt-bindings: mtd: arasan: Add device tree
 binding documentation
Message-ID: <20181109135405.3b93b267@xps13>
In-Reply-To: <MWHPR02MB26235AB9959635CAA1B2B878AFC60@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20181109072857.75e86cb6@bbrezillon>
 <MWHPR02MB26235AB9959635CAA1B2B878AFC60@MWHPR02MB2623.namprd02.prod.outlook.com>
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

Hi Naga,

[...]

> > > diff --git a/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> > > b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> > > new file mode 100644
> > > index 0000000..b522daf
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> > > @@ -0,0 +1,32 @@
> > > +Arasan NAND Flash Controller with ONFI 3.1 support
> > > +
> > > +Required properties:
> > > +- compatible:		Should be "xlnx,zynqmp-nand", "arasan,nfc-v3p10"
> > > +- reg:			Memory map for module access
> > > +- interrupts:		Should contain the interrupt for the device
> > > +- clock-name:		List of input clocks - "sys", "flash"
> > > +			(See clock bindings for details)
> > > +- clocks:		Clock phandles (see clock bindings for details)
> > > +
> > > +Required properties for child node:
> > > +- nand-ecc-mode: see nand.txt =20
> >=20
> > Why is it required? Can't you fallback to HW when this prop is missing?=
 =20
> Yes, we can.
> Do you want me to update that in driver now?=20
> Looks like you have some comments in driver as well, so while addressing =
those I will update the code to fallback to HW ECC when=20
> It is missing.

Yes, please.

>=20
> > Oh, and reg is not listed in the required props. =20
> Which reg?
> I already mention this " reg:	Memory map for module access " in required =
properties.
>=20
> Thanks,
> Naga Sureshkumar Relli
> >  =20
> > > +
> > > +For NAND partition information please refer the below file
> > > +Documentation/devicetree/bindings/mtd/partition.txt
> > > +
> > > +Example:
> > > +	nfc: nand@ff100000 {
> > > +		compatible =3D "xlnx,zynqmp-nand", "arasan,nfc-v3p10";
> > > +		reg =3D <0x0 0xff100000 0x1000>;
> > > +		clock-name =3D "sys", "flash";
> > > +		clocks =3D <&misc_clk &misc_clk>;
> > > +		interrupt-parent =3D <&gic>;
> > > +		interrupts =3D <0 14 4>;
> > > +		#address-cells =3D <1>;
> > > +		#size-cells =3D <0>;
> > > +
> > > +		nand@0 {
> > > +			reg =3D <0>;

This one, for the CS line(s).

> > > +			nand-ecc-mode =3D "hw";
> > > +		};
> > > +	}; =20
>=20


Thanks,
Miqu=C3=A8l

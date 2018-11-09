Received: from mail-sn1nam02on0616.outbound.protection.outlook.com
 ([2a01:111:f400:fe44::616]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL5zX-0002lW-6p
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 12:34:29 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Michal Simek
 <michals@xilinx.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nagasuresh12@gmail.com"
 <nagasuresh12@gmail.com>, "robh@kernel.org" <robh@kernel.org>
Subject: RE: [LINUX PATCH v12 1/3] dt-bindings: mtd: arasan: Add device tree
 binding documentation
Date: Fri, 9 Nov 2018 12:33:56 +0000
Message-ID: <MWHPR02MB26235AB9959635CAA1B2B878AFC60@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20181109072857.75e86cb6@bbrezillon>
In-Reply-To: <20181109072857.75e86cb6@bbrezillon>
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

Hi Boris,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Friday, November 9, 2018 11:59 AM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: miquel.raynal@bootlin.com; richard@nod.at; dwmw2@infradead.org;
> computersforpeace@gmail.com; marek.vasut@gmail.com; Michal Simek
> <michals@xilinx.com>; linux-mtd@lists.infradead.org; linux-kernel@vger.ke=
rnel.org;
> nagasuresh12@gmail.com; robh@kernel.org
> Subject: Re: [LINUX PATCH v12 1/3] dt-bindings: mtd: arasan: Add device t=
ree binding
> documentation
>=20
> On Fri, 9 Nov 2018 10:30:39 +0530
> Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
>=20
> > This patch adds the dts binding document for arasan nand flash
> > controller
> >
> > Signed-off-by: Naga Sureshkumar Relli
> > <naga.sureshkumar.relli@xilinx.com>
> > ---
> > Changes in v12:
> >  - Removed interrupt-parent description as it is implied as suggested b=
y
> >    Rob Herring
> >  - Added missing ';' as required
> > Changes in v11:
> >  - Updated compatible description as suggested by Boris
> >  - Removed arasan-has-dma property
> > Changes in v10:
> >  - None
> > Changes in v9:
> >  - None
> > Changes in v8:
> >  - Updated compatible and clock-names as per Boris comments Changes in
> > v7:
> >  - Corrected the acronyms those should be in caps Changes in v6:
> >  - Removed num-cs property
> >  - Separated nandchip from nand controller Changes in v5:
> >  - None
> > Changes in v4:
> >  - Added num-cs property
> >  - Added clock support
> > Changes in v3:
> >  - None
> > Changes in v2:
> >  - None
> > ---
> >  .../devicetree/bindings/mtd/arasan_nand.txt        | 32 ++++++++++++++=
++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mtd/arasan_nand.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> > b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> > new file mode 100644
> > index 0000000..b522daf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> > @@ -0,0 +1,32 @@
> > +Arasan NAND Flash Controller with ONFI 3.1 support
> > +
> > +Required properties:
> > +- compatible:		Should be "xlnx,zynqmp-nand", "arasan,nfc-v3p10"
> > +- reg:			Memory map for module access
> > +- interrupts:		Should contain the interrupt for the device
> > +- clock-name:		List of input clocks - "sys", "flash"
> > +			(See clock bindings for details)
> > +- clocks:		Clock phandles (see clock bindings for details)
> > +
> > +Required properties for child node:
> > +- nand-ecc-mode: see nand.txt
>=20
> Why is it required? Can't you fallback to HW when this prop is missing?
Yes, we can.
Do you want me to update that in driver now?=20
Looks like you have some comments in driver as well, so while addressing th=
ose I will update the code to fallback to HW ECC when=20
It is missing.

> Oh, and reg is not listed in the required props.
Which reg?
I already mention this " reg:	Memory map for module access " in required pr=
operties.

Thanks,
Naga Sureshkumar Relli
>=20
> > +
> > +For NAND partition information please refer the below file
> > +Documentation/devicetree/bindings/mtd/partition.txt
> > +
> > +Example:
> > +	nfc: nand@ff100000 {
> > +		compatible =3D "xlnx,zynqmp-nand", "arasan,nfc-v3p10";
> > +		reg =3D <0x0 0xff100000 0x1000>;
> > +		clock-name =3D "sys", "flash";
> > +		clocks =3D <&misc_clk &misc_clk>;
> > +		interrupt-parent =3D <&gic>;
> > +		interrupts =3D <0 14 4>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		nand@0 {
> > +			reg =3D <0>;
> > +			nand-ecc-mode =3D "hw";
> > +		};
> > +	};

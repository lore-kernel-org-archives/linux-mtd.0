Received: from mail-by2nam01on0057.outbound.protection.outlook.com
 ([104.47.34.57] helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frzVs-0000rZ-Dj
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 05:47:34 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "kyungmin.park@samsung.com"
 <kyungmin.park@samsung.com>, "absahu@codeaurora.org" <absahu@codeaurora.org>,
 "peterpandong@micron.com" <peterpandong@micron.com>,
 "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek
 <michals@xilinx.com>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>
Subject: RE: [LINUX PATCH v10 1/2] dt-bindings: mtd: arasan: Add device tree
 binding documentation
Date: Tue, 21 Aug 2018 05:47:18 +0000
Message-ID: <MWHPR02MB2623F315C6D4C9775CDA08D8AF310@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1534511964-20342-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180820143324.61af9027@bbrezillon>
In-Reply-To: <20180820143324.61af9027@bbrezillon>
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
> Sent: Monday, August 20, 2018 6:03 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: miquel.raynal@bootlin.com; richard@nod.at; dwmw2@infradead.org;
> computersforpeace@gmail.com; marek.vasut@gmail.com; kyungmin.park@samsung=
.com;
> absahu@codeaurora.org; peterpandong@micron.com; frieder.schrempf@exceet.d=
e; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Michal Simek <mich=
als@xilinx.com>;
> nagasureshkumarrelli@gmail.com
> Subject: Re: [LINUX PATCH v10 1/2] dt-bindings: mtd: arasan: Add device t=
ree binding
> documentation
>=20
> On Fri, 17 Aug 2018 18:49:23 +0530
> Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
>=20
> > This patch adds the dts binding document for arasan nand flash
> > controller.
> >
> > Signed-off-by: Naga Sureshkumar Relli
> > <naga.sureshkumar.relli@xilinx.com>
> > ---
> > Changes in v10:
> > - None
> > Changes in v9:
> > - None
> > Changes in v8:
> > - Updated compatible and clock-names as per Boris comments Changes in
> > v7:
> > - Corrected the acronyms those should be in caps changes in v6:
> > - Removed num-cs property
> > - Separated nandchip from nand controller changes in v5:
> > - None
> > Changes in v4:
> > - Added num-cs property
> > - Added clock support
> > Changes in v3:
> > - None
> > Changes in v2:
> > - None
> > ---
> >  .../devicetree/bindings/mtd/arasan_nand.txt        | 38 ++++++++++++++=
++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mtd/arasan_nand.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> > b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> > new file mode 100644
> > index 0000000..234d7ca
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> > @@ -0,0 +1,38 @@
> > +Arasan NAND Flash Controller with ONFI 3.1 support
> > +
> > +Required properties:
> > +- compatible:		Should be "xlnx,zynqmp-nand" or "arasan,nfc-v3p10"
>=20
> In your example it's not an "or" since both are defined.
In our previous discussion (https://lore.kernel.org/patchwork/patch/748901/=
)
We decided to have compatible strings like " compatible =3D "<soc-vendor>,<=
ip-revision>", "arasan,<ip-revision>";"
So it should be either of these.
so I will write something like below
"Possible values are  "xlnx,zynqmp-nand"=20
			"arasan,nfc-v3p10"
And in example I will mention any one compatible.
Is it ok?
>=20
> > +- reg:			Memory map for module access
> > +- interrupt-parent:	Interrupt controller the interrupt is routed throu=
gh
> > +- interrupts:		Should contain the interrupt for the device
> > +- clock-name:		List of input clocks - "sys", "flash"
>=20
>      clock-names
Ok, will correct it in next version.
>=20
> > +			(See clock bindings for details)
> > +- clocks:		Clock phandles (see clock bindings for details)
> > +
> > +Optional properties:
> > +- arasan,has-mdma: Enables DMA support
>=20
> Can't you detect that based on the compatible (or thanks to a register). =
If it's something you
> choose when configuring the IP and can't detect at runtime I guess it's f=
ine.
There is no way to select DMA when configuring the IP.
But it has internal DMA and there is a register to select PIO or DMA while =
starting a transfer.
So if user really don't want DMA, then we will never set DMA in the code ba=
sed on DT property.
>=20
> > +
> > +For NAND partition information please refer the below file
> > +Documentation/devicetree/bindings/mtd/partition.txt
> > +
> > +Example:
> > +	nand0: nand@ff100000 {
> > +		compatible =3D "xlnx,zynqmp-nand", "arasan,nfc-v3p10"
> > +		reg =3D <0x0 0xff100000 0x1000>;
> > +		clock-name =3D "sys", "flash"
> > +		clocks =3D <&misc_clk &misc_clk>;
> > +		interrupt-parent =3D <&gic>;
> > +		interrupts =3D <0 14 4>;
> > +		arasan,has-mdma;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>
> > +
> > +		nand@0 {
> > +			reg =3D <0>
> > +			partition@0 {
> > +				label =3D "filesystem";
> > +				reg =3D <0x0 0x0 0x1000000>;
> > +			};
>=20
> Hm, not sure you need to define partitions in this example, but if you do=
, please define your
> partitions in a 'partitions' subnode:
>=20
> 			partitions {
> 				compatible =3D "fixed-partitions";
> 				#address-cells =3D <1>;
> 				#size-cells =3D <1>;
>=20
> 				partition@0 {
> 					reg =3D <0x0 0x1000000>;
> 					...
> 				};
> 				...
> 			};
>=20
> > +			(...)
Ok, just now I saw Documentation/devicetree/bindings/mtd/marvell-nand.txt, =
I will update it accordingly in  next version.
> > +		};
> > +	};


Thanks,
Naga Sureshkumar Relli.

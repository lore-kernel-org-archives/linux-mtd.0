Received: from mail-co1nam03on0086.outbound.protection.outlook.com
 ([104.47.40.86] helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQpXG-0003rQ-75
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 06:03:56 +0000
From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
To: Rob Herring <robh@kernel.org>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Michal Simek <michals@xilinx.com>,
 "kalluripunnaiahchoudary@gmail.com" <kalluripunnaiahchoudary@gmail.com>,
 "kpc528@gmail.com" <kpc528@gmail.com>
Subject: RE: [PATCH v7 1/2] mtd: arasan: Add device tree binding documentation
Date: Tue, 10 Jan 2017 06:03:25 +0000
Message-ID: <03CA77BA8AF6F1469AEDFBDA1322A7B76424ECD2@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1483930734-10309-1-git-send-email-punnaia@xilinx.com>
 <20170110053605.yqclykdgi3tgndnp@rob-hp-laptop>
In-Reply-To: <20170110053605.yqclykdgi3tgndnp@rob-hp-laptop>
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

Hi Rob,
   =20
   Thanks for the review.

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, January 10, 2017 11:06 AM
> To: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> Cc: dwmw2@infradead.org; computersforpeace@gmail.com;
> boris.brezillon@free-electrons.com; marek.vasut@gmail.com;
> richard@nod.at; cyrille.pitchen@atmel.com; mark.rutland@arm.com; linux-
> kernel@vger.kernel.org; linux-mtd@lists.infradead.org;
> devicetree@vger.kernel.org; Michal Simek <michals@xilinx.com>;
> kalluripunnaiahchoudary@gmail.com; kpc528@gmail.com; Punnaiah
> Choudary Kalluri <punnaia@xilinx.com>
> Subject: Re: [PATCH v7 1/2] mtd: arasan: Add device tree binding
> documentation
>=20
> On Mon, Jan 09, 2017 at 08:28:53AM +0530, Punnaiah Choudary Kalluri wrote=
:
> > This patch adds the dts binding document for arasan nand flash
> > controller.
> >
> > Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> > ---
> > Changes in v7:
> > - Corrected the acronyms those should be in caps
> > changes in v6:
> > - Removed num-cs property
> > - Separated nandchip from nand controller
> > changes in v5:
> > - None
> > Changes in v4:
> > - Added num-cs property
> > - Added clock support
> > Changes in v3:
> > - None
> > Changes in v2:
> > - None
> > ---
> >  .../devicetree/bindings/mtd/arasan_nfc.txt         | 38
> ++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> > new file mode 100644
> > index 0000000..f20adfc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> > @@ -0,0 +1,38 @@
> > +Arasan NAND Flash Controller with ONFI 3.1 support
> > +
> > +Required properties:
> > +- compatible: Should be "arasan,nfc-v3p10"
>=20
> Needs a note that it must also have an SoC specific compatible string.
>=20
  Sorry, I couldn't understand this comment. Could you elaborate it?

> > +- reg: Memory map for module access
> > +- interrupt-parent: Interrupt controller the interrupt is routed throu=
gh
> > +- interrupts: Should contain the interrupt for the device
> > +- clock-name: List of input clocks - "clk_sys", "clk_flash"
>=20
> clk_ is redundant.
>=20
 =20
 I have defined these clock names as per the controller data sheet.
 So, I feel it is fine to have them in sync with the datasheet.
  Please let me know if you still want me to change this.

Regards,
Punnaiah

> > +	      (See clock bindings for details)
> > +- clocks: Clock phandles (see clock bindings for details)
> > +
> > +Optional properties:
> > +- arasan,has-mdma: Enables DMA support
> > +
> > +For NAND partition information please refer the below file
> > +Documentation/devicetree/bindings/mtd/partition.txt
> > +
> > +Example:
> > +	nand0: nand@ff100000 {
> > +		compatible =3D "arasan,nfc-v3p10"
> > +		reg =3D <0x0 0xff100000 0x1000>;
> > +		clock-name =3D "clk_sys", "clk_flash"
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
> > +			(...)
> > +		};
> > +	};
> > --
> > 2.7.4
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html

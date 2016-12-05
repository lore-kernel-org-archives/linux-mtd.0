Received: from mail-co1nam03on0070.outbound.protection.outlook.com
 ([104.47.40.70] helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDtlh-0006Te-1y
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 13:57:22 +0000
From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michal Simek
 <michals@xilinx.com>, "kalluripunnaiahchoudary@gmail.com"
 <kalluripunnaiahchoudary@gmail.com>, "kpc528@gmail.com" <kpc528@gmail.com>
Subject: RE: [PATCH v6 1/2] mtd: arasan: Add device tree binding documentation
Date: Mon, 5 Dec 2016 13:56:51 +0000
Message-ID: <03CA77BA8AF6F1469AEDFBDA1322A7B76423EE53@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1480911066-26157-1-git-send-email-punnaia@xilinx.com>
 <74842d92-840d-a7c2-fb1b-ddab1ac2cf42@gmail.com>
 <20161205093630.650451d7@bbrezillon>
In-Reply-To: <20161205093630.650451d7@bbrezillon>
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



> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> Sent: Monday, December 05, 2016 2:07 PM
> To: Marek Vasut <marek.vasut@gmail.com>
> Cc: Punnaiah Choudary Kalluri <punnaia@xilinx.com>;
> dwmw2@infradead.org; computersforpeace@gmail.com; richard@nod.at;
> cyrille.pitchen@atmel.com; robh+dt@kernel.org; mark.rutland@arm.com;
> linux-kernel@vger.kernel.org; linux-mtd@lists.infradead.org;
> devicetree@vger.kernel.org; Michal Simek <michals@xilinx.com>;
> kalluripunnaiahchoudary@gmail.com; kpc528@gmail.com; Punnaiah
> Choudary Kalluri <punnaia@xilinx.com>
> Subject: Re: [PATCH v6 1/2] mtd: arasan: Add device tree binding
> documentation
>=20
> On Mon, 5 Dec 2016 05:25:54 +0100
> Marek Vasut <marek.vasut@gmail.com> wrote:
>=20
> > On 12/05/2016 05:11 AM, Punnaiah Choudary Kalluri wrote:
> > > This patch adds the dts binding document for arasan nand flash
> > > controller.
> > >
> > > Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > ---
> > > changes in v6:
> > > - Removed num-cs property
> > > - Separated nandchip from nand controller changes in v5:
> > > - None
> > > Changes in v4:
> > > - Added num-cs property
> > > - Added clock support
> > > Changes in v3:
> > > - None
> > > Changes in v2:
> > > - None
> > > ---
> > >  .../devicetree/bindings/mtd/arasan_nfc.txt         | 38
> ++++++++++++++++++++++
> > >  1 file changed, 38 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> > > b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> > > new file mode 100644
> > > index 0000000..dcbe7ad
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> > > @@ -0,0 +1,38 @@
> > > +Arasan Nand Flash Controller with ONFI 3.1 support
> >
> > Arasan NAND Flash ...
> >
> > > +Required properties:
> > > +- compatible: Should be "arasan,nfc-v3p10"
> >
> > This v3p10 looks like version 3 patchlevel 10, but shouldn't we have
> > some fallback option which doesn't encode IP version in the compat
> > string ?
>=20
> Not necessarily. Usually you define a generic compatible when you have
> other reliable means to detect the IP version (a version register for
> example).
> If you can't detect that at runtime, then providing only specific compati=
ble
> strings is a good solution to avoid breaking the DT ABI.

Yes. I am also thinking the same. Arasan controller doesn't have the regist=
er
to indicate the IP version number.

>=20
> >
> > Also, shouldn't quirks be handled by DT props instead of effectively
> > encoding them into the compatible string ?
>=20
> Well, from my experience, it's better to hide as much as possible behind =
the
> compatible. This way, if new quirks are needed for a specific revision, y=
ou can
> update the driver without having to change the DT.
>=20

Agree.

Regards,
Punnaiah

> >
> > > +- reg: Memory map for module access
> > > +- interrupt-parent: Interrupt controller the interrupt is routed
> > > +through
> > > +- interrupts: Should contain the interrupt for the device
> > > +- clock-name: List of input clocks - "clk_sys", "clk_flash"
> > > +	      (See clock bindings for details)
> > > +- clocks: Clock phandles (see clock bindings for details)
> > > +
> > > +Optional properties:
> > > +- arasan,has-mdma: Enables Dma support
> >
> > 'Enables DMA support' , with DMA in caps.
> >
> > > +for nand partition information please refer the below file
> >
> > For NAND ...
> >
> > > +Documentation/devicetree/bindings/mtd/partition.txt
> > > +
> > > +Example:
> > > +	nand0: nand@ff100000 {
> > > +		compatible =3D "arasan,nfc-v3p10"
> > > +		reg =3D <0x0 0xff100000 0x1000>;
> > > +		clock-name =3D "clk_sys", "clk_flash"
> > > +		clocks =3D <&misc_clk &misc_clk>;
> > > +		interrupt-parent =3D <&gic>;
> > > +		interrupts =3D <0 14 4>;
> > > +		arasan,has-mdma;
> > > +		#address-cells =3D <1>;
> > > +		#size-cells =3D <0>
> > > +
> > > +		nand@0 {
> > > +			reg =3D <0>
> > > +			partition@0 {
> > > +				label =3D "filesystem";
> > > +				reg =3D <0x0 0x0 0x1000000>;
> > > +			};
> > > +			(...)
> > > +		};
> > > +	};
> > >
> >
> >

Received: from mail-sn1nam01on0052.outbound.protection.outlook.com
 ([104.47.32.52] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fRCKq-0008Lf-GX
 for linux-mtd@lists.infradead.org; Fri, 08 Jun 2018 08:01:39 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "wmw2@infradead.org" <wmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "f.fainelli@gmail.com"
 <f.fainelli@gmail.com>, "mmayer@broadcom.com" <mmayer@broadcom.com>,
 "rogerq@ti.com" <rogerq@ti.com>, "ladis@linux-mips.org"
 <ladis@linux-mips.org>, "ada@thorsis.com" <ada@thorsis.com>,
 "honghui.zhang@mediatek.com" <honghui.zhang@mediatek.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nagasureshkumarrelli@gmail.com" <nagasureshkumarrelli@gmail.com>
Subject: RE: [LINUX PATCH v9 1/4] Devicetree: Add pl353 smc controller
 devicetree binding information
Date: Fri, 8 Jun 2018 08:01:10 +0000
Message-ID: <MWHPR02MB2623170B7B99A94EFF4C1E3AAF7B0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1528271382-21690-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1528271382-21690-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180607174203.035f187d@xps13>
 <MWHPR02MB2623AA49F71D3D24B997C682AF7B0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20180608075155.24915c89@bbrezillon>
In-Reply-To: <20180608075155.24915c89@bbrezillon>
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

Thanks for letting us know the similar stuff.
I will look into it and if any update is required, I will update as per tha=
t.

Thanks,
Naga Sureshkumar Relli

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Friday, June 8, 2018 11:22 AM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>; richard@nod.at; wmw2@infra=
dead.org;
> computersforpeace@gmail.com; marek.vasut@gmail.com; f.fainelli@gmail.com;
> mmayer@broadcom.com; rogerq@ti.com; ladis@linux-mips.org; ada@thorsis.com=
;
> honghui.zhang@mediatek.com; linux-mtd@lists.infradead.org; linux-kernel@v=
ger.kernel.org;
> nagasureshkumarrelli@gmail.com
> Subject: Re: [LINUX PATCH v9 1/4] Devicetree: Add pl353 smc controller de=
vicetree
> binding information
>=20
> On Fri, 8 Jun 2018 05:20:33 +0000
> Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
>=20
> > Hi Miquel,
> >
> > Thanks for the review.
> >
> > > -----Original Message-----
> > > From: Miquel Raynal [mailto:miquel.raynal@bootlin.com]
> > > Sent: Thursday, June 7, 2018 9:12 PM
> > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > Cc: boris.brezillon@bootlin.com; richard@nod.at; wmw2@infradead.org;
> > > computersforpeace@gmail.com; marek.vasut@gmail.com;
> > > f.fainelli@gmail.com; mmayer@broadcom.com; rogerq@ti.com;
> > > ladis@linux-mips.org; ada@thorsis.com; honghui.zhang@mediatek.com;
> > > linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org;
> > > nagasureshkumarrelli@gmail.com
> > > Subject: Re: [LINUX PATCH v9 1/4] Devicetree: Add pl353 smc
> > > controller devicetree binding information
> > >
> > > Hi Naga,
> > >
> > > On Wed, 6 Jun 2018 13:19:39 +0530, Naga Sureshkumar Relli
> > > <naga.sureshkumar.relli@xilinx.com> wrote:
> > >
> > > > Add pl353 static memory controller devicetree binding information.
> > > >
> > > > Signed-off-by: Naga Sureshkumar Relli
> > > > <naga.sureshkumar.relli@xilinx.com>
> > > > ---
> > > > Changes in v9:
> > > >  - Addressed commens given by Randy Dunlap and Miquel Raynal
> > >
> > > Can you please be more specific in your next changelog? I don't
> > > remember what I suggested a few months ago :)
> > Ok, I will update.
> >
> > >
> > > > Changes in v8:
> > > >  - None
> > > > Changes in v7:
> > > > - Corrected clocks description
> > > > - prefixed '#' for address and size cells Changes in v6:
> > > >  - None
> > > > Changes in v5:
> > > >  - Removed timing properties
> > > > Changes in v4:
> > > >  - none
> > > > Changes in v3:
> > > >  - none
> > > > Changes in v2:
> > > >  - modified timing binding info as per onfi timing parameters
> > > >  - add suffix nano second as timing unit
> > > >  - modified the clock names as per the IP spec
> > > > ---
> > > >  .../bindings/memory-controllers/pl353-smc.txt      | 53
> > > ++++++++++++++++++++++
> > > >  1 file changed, 53 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.t
> > > > xt
> > > > b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.t
> > > > xt
> > > > new file mode 100644
> > > > index 0000000..551e66b
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/memory-controllers/pl353-s
> > > > +++ mc.t
> > > > +++ xt
> > > > @@ -0,0 +1,53 @@
> > > > +Device tree bindings for ARM PL353 static memory controller
> > > > +
> > > > +PL353 static memory controller supports two kinds of memory
> > > > +interfaces.i.e NAND and SRAM/NOR interfaces.
> > > > +The actual devices are instantiated from the child nodes of pl353 =
smc node.
> > > > +
> > > > +Required properties:
> > > > +- compatible		: Should be "arm,pl353-smc-r2p1"
> > >
> > > I thing Rob prefers:
> > >
> > > - compatible: Must be one of:
> > >   * arm, pl353-smc-r2p1
> > Are you suggesting any other compatibles?
> > Or just a change from "should be to Must be one of"?
> > >
> > > > +- reg			: Controller registers map and length.
> > > > +- clock-names		: List of input clock names - "ref_clk", "aper_clk"
> > > > +			  (See clock bindings for details).
> > > > +- clocks		: Clock phandles (see clock bindings for details).
> > > > +- address-cells		: Address cells, must be 1.
> > > > +- size-cells		: Size cells. Must be 1.
> > >
> > > Please avoid padding, just this is enough:
> > >
> > > - something: And another thing.
> > Ok, I will update it.
> >
> > >
> > > > +
> > > > +Child nodes:
> > > > + For NAND the "arm,pl353-nand-r2p1" and for NOR the "cfi-flash"
> > > > +drivers are supported as child nodes.
> > > > +
> > > > +Mandatory timing properties for child nodes:
> > > > +- arm,nand-cycle-t0	: Read cycle time(t_rc).
> > > > +- arm,nand-cycle-t1	: Write cycle time(t_wc).
> > > > +- arm,nand-cycle-t2	: re_n assertion delay(t_rea).
> > > > +- arm,nand-cycle-t3	: we_n de-assertion delay(t_wp).
> > > > +- arm,nand-cycle-t4	: Status read time(t_clr)
> > > > +- arm,nand-cycle-t5	: ID read time(t_ar)
> > > > +- arm,nand-cycle-t6	: busy to re_n(t_rr)
> > >
> > > I think this has nothing to do in the DT, you should handle timings
> > > from the -
> > > >setup_data_interface() hook. If you need, you may use different
> > > >compatibles to distinguish
> > > different platform data.
> > >
> > This controller is applicable only to Zynq platform. No other platform =
will use this.
> > Basically pl353-smc.c and pl353-nand.c, both are different drivers.
> > And this data_interface hook is in nand, and to set this timings if we
> > read it from setup_data_interface(), then We need to make call from nan=
d to smc driver.
> > Let me try this.
> >
> > > > +
> > > > +for nand partition information please refer the below file
> > >
> > > s/nand/NAND/
> > I will update in next version.
> >
> > >
> > > > +Documentation/devicetree/bindings/mtd/partition.txt
> > > > +
> > > > +Example:
> > > > +	pl353smcc_0: pl353smcc@e000e000 {
> > >
> > > Why not something more explicit with the '-flash-controller' suffix?
> > Is this ok?
> > smcc: memory-controller@e000e000 {}
> >
> > >
> > > > +			compatible =3D "arm,pl353-smc-r2p1"
> > > > +			clock-names =3D "memclk", "aclk";
> > > > +			clocks =3D <&clkc 11>, <&clkc 44>;
> > > > +			reg =3D <0xe000e000 0x1000>;
> > > > +			#address-cells =3D <1>;
> > > > +			#size-cells =3D <1>;
> > > > +			ranges;
> > > > +			nand_0: nand@e1000000 {
> > > > +				compatible =3D "arm,pl353-nand-r2p1"
> > >
> > > NAND chips do not have their own compatible.
> > As I said above, SMCC controller has two interface(NAND, NOR/SRAM).
> > So to differentiate which interface is selected, we added the compatibl=
e.
> > The dts node looks below.
> > smcc: memory-controller@e000e000 {
> > 			#address-cells =3D <1>;
> > 			#size-cells =3D <1>;
> > 			clock-names =3D "memclk", "aclk";
> > 			clocks =3D <&clkc 11>, <&clkc 44>;
> > 			compatible =3D "arm,pl353-smc-r2p1";
> > 			interrupt-parent =3D <&intc>;
> > 			interrupts =3D <0 18 4>;
> > 			ranges ;
> > 			reg =3D <0xe000e000 0x1000>;
> > 			nand0: flash@e1000000 {
> > 				compatible =3D "arm,pl353-nand-r2p1";
> > 				reg =3D <0xe1000000 0x1000000>;
> > 				#address-cells =3D <0x1>;
> > 				#size-cells =3D <0x1>;
> > 			};
> > 			nor0: flash@e2000000 {
> > 				compatible =3D "cfi-flash";
> > 				reg =3D <0xe2000000 0x2000000>;
> > 				#address-cells =3D <1>;
> > 				#size-cells =3D <1>;
> > 			};
> > 		};
>=20
> This looks similar to what we have on at91 SoC with one memory controller=
 and inside this
> memory controller a dedicated logic for NAND devices. We used a represent=
ation where the
> NAND controller logic is described as a subnode of the memory controller =
and then NAND
> chips are defined under this subnode [1].
>=20
> [1]https://elixir.bootlin.com/linux/latest/source/Documentation/devicetre=
e/bindings/mtd/
> atmel-nand.txt#L84

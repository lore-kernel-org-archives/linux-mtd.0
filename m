Received: from mail-eopbgr720086.outbound.protection.outlook.com
 ([40.107.72.86] helo=NAM05-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fY8J6-0002RV-1Q
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2018 11:08:22 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>
CC: "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "mmayer@broadcom.com" <mmayer@broadcom.com>, "rogerq@ti.com" <rogerq@ti.com>,
 "ladis@linux-mips.org" <ladis@linux-mips.org>, "ada@thorsis.com"
 <ada@thorsis.com>, "honghui.zhang@mediatek.com" <honghui.zhang@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "nagasureshkumarrelli@gmail.com" <nagasureshkumarrelli@gmail.com>, Michal
 Simek <michals@xilinx.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [[LINUX PATCH v10] 1/4] Devicetree: Add pl353 smc controller
 devicetree binding information
Date: Wed, 27 Jun 2018 11:07:57 +0000
Message-ID: <MWHPR02MB262302FDE197F631EAD3D791AF480@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180624224014.125cf0bc@bbrezillon>
 <MWHPR02MB2623DE62699977CB69AE0DC9AF4A0@MWHPR02MB2623.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR02MB2623DE62699977CB69AE0DC9AF4A0@MWHPR02MB2623.namprd02.prod.outlook.com>
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
> From: Naga Sureshkumar Relli [mailto:nagasure@xilinx.com]
> Sent: Monday, June 25, 2018 2:30 PM
> To: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com;
> marek.vasut@gmail.com; f.fainelli@gmail.com; mmayer@broadcom.com; rogerq@=
ti.com;
> ladis@linux-mips.org; ada@thorsis.com; honghui.zhang@mediatek.com;
> miquel.raynal@bootlin.com; nagasureshkumarrelli@gmail.com; Michal Simek
> <michals@xilinx.com>; linux-mtd@lists.infradead.org; linux-kernel@vger.ke=
rnel.org
> Subject: RE: [[LINUX PATCH v10] 1/4] Devicetree: Add pl353 smc controller=
 devicetree
> binding information
>=20
> Hi Boris,
>=20
>=20
> > -----Original Message-----
> > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > Sent: Monday, June 25, 2018 2:10 AM
> > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > Cc: richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com;
> > marek.vasut@gmail.com; f.fainelli@gmail.com; mmayer@broadcom.com;
> > rogerq@ti.com; ladis@linux-mips.org; ada@thorsis.com;
> > honghui.zhang@mediatek.com; miquel.raynal@bootlin.com;
> > nagasureshkumarrelli@gmail.com; Michal Simek <michals@xilinx.com>;
> > linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [[LINUX PATCH v10] 1/4] Devicetree: Add pl353 smc
> > controller devicetree binding information
> >
> > Hi Naga,
> >
> > Subject prefix should be "dt-bindings: memory: " not "Devicetree: ".
> Ok, I will change it.
>=20
> >
> > On Thu, 21 Jun 2018 12:12:28 +0530
> > Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
> >
> > > Add pl353 static memory controller devicetree binding information.
> > >
> > > Signed-off-by: Naga Sureshkumar Relli
> > > <naga.sureshkumar.relli@xilinx.com>
> > > ---
> > > Changes in v10:
> > >  - Corrected the typos like "should be" to "Must be" and nand to NAND=
 etc..
> > >  - Removed padding to describe size-cells and address-cells
> > >  - Removed timing parameters from DT, and added ->setup_data_interfac=
e() hook
> > >    to the driver to read the SDR timings
> > >  - Modified label name from "pl353smcc_0: pl353smcc@e000e000" to
> > >    "smcc: memory-controller@e000e000" as suggested by Miquel Changes
> > > in v9:
> > >  - Addressed below comments given by Randy Dunlap and Miquel Raynal
> > >  - Typos
> > >  - Added extra documentation that explains the HW ECC limitation with=
 SMC
> > >    (Comments given to v8: https://lkml.org/lkml/2018/3/22/23)
> > > Changes in v8:
> > >  - None
> > > Changes in v7:
> > >  - Corrected clocks description
> > >  - prefixed '#' for address and size cells Changes in v6:
> > >  - None
> > > Changes in v5:
> > >  - Removed timing properties
> > > Changes in v4:
> > >  - none
> > > Changes in v3:
> > >  - none
> > > Changes in v2:
> > >  - modified timing binding info as per onfi timing parameters
> > >  - add suffix nano second as timing unit
> > >  - modified the clock names as per the IP spec
> > > ---
> > >  .../bindings/memory-controllers/pl353-smc.txt      | 41
> > ++++++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> > > b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> > > new file mode 100644
> > > index 0000000..8b4c65e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc
> > > +++ .t
> > > +++ xt
> > > @@ -0,0 +1,41 @@
> > > +Device tree bindings for ARM PL353 static memory controller
> > > +
> > > +PL353 static memory controller supports two kinds of memory
> > > +interfaces.i.e NAND and SRAM/NOR interfaces.
> > > +The actual devices are instantiated from the child nodes of pl353 sm=
c node.
> > > +
> > > +Required properties:
> > > +- compatible		: Must be "arm,pl353-smc-r2p1"
> > > +- reg			: Controller registers map and length.
> > > +- clock-names		: List of input clock names - "ref_clk", "aper_clk"
> > > +			  (See clock bindings for details).
> > > +- clocks		: Clock phandles (see clock bindings for details).
> > > +- address-cells		: Must be 1.
> > > +- size-cells		: Must be 1.
> > > +
> > > +Child nodes:
> > > + For NAND the "arm,pl353-nand-r2p1" and for NOR the "cfi-flash"
> > > +drivers are supported as child nodes.
> > > +
> > > +for NAND partition information please refer the below file
> > > +Documentation/devicetree/bindings/mtd/partition.txt
> > > +
> > > +Example:
> > > +	smcc: memory-controller@e000e000
> > > +			compatible =3D "arm,pl353-smc-r2p1"
> > > +			clock-names =3D "memclk", "aclk";
> > > +			clocks =3D <&clkc 11>, <&clkc 44>;
> > > +			reg =3D <0xe000e000 0x1000>;
> > > +			#address-cells =3D <1>;
> > > +			#size-cells =3D <1>;
> > > +			ranges;
> > > +			nand_0: flash@e1000000 {
> > > +				compatible =3D "arm,pl353-nand-r2p1"
> > > +				reg =3D <0xe1000000 0x1000000>;
> > > +				(...)
> > > +			};
> > > +			nor0: flash@e2000000 {
> > > +				compatible =3D "cfi-flash";
> > > +				reg =3D <0xe2000000 0x2000000>;
> > > +			};
> > > +	};
> >
> > I had a look at the PL353 TRM, and the block diagram looks very
> > similar to the atmel EBI/SMC one. AHB/AXI memory ranges that are used
> > to interact with the memories are assigned CS ids, which can then be
> > used to configure the timings (and other kind of stuff). I think you
> > should have #address-cells =3D <2>, the first cell encoding the CS id, =
and the second one, the
> memory offset within the reserved range for this CS id.
> > See the atmel,ebi binding [1].
> >
> To my previous patch, as per your comments, I modified reading timing par=
ameters from dts
> To nand_setup_data_interface() hook, But I didn't see the CS implementati=
on as per atmel EBI
> driver.
> Sure, I will update like that and will send v11.

I have seen the atmel-ebi driver, it is doing more compare to PL353.
It works with=20
drivers/mfd/
drivers/mtd/
drivers/memory/
but if we compare that with PL353 SMC, then
In nand case, we have only one CS and for NOR/SRAM we have 2 CS.
i.e
PL353 SMC -> NAND (1CS)
		NOR/SRAM(2CS).
So just asking, will there be any advantage if we do like that?
Because, for NOR/SRAM interface, the generic cfi-probe will take care and
For NAND, PL353 has just one NAND, hence asking.

Could you please explain a bit more?

Thanks,
Naga Sureshkumar Relli
>=20
> Thanks,
> Naga Sureshkumar Relli
>=20
> > Regards,
> >
> > Boris
> >
> > [1]https://elixir.bootlin.com/linux/v4.18-
> > rc2/source/Documentation/devicetree/bindings/memory-controllers/atmel,
> > ebi.txt

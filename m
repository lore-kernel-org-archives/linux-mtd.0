Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fRBkZ-0004mq-E4
 for linux-mtd@lists.infradead.org; Fri, 08 Jun 2018 07:23:59 +0000
Date: Fri, 8 Jun 2018 09:23:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "wmw2@infradead.org"
 <wmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "mmayer@broadcom.com" <mmayer@broadcom.com>, "rogerq@ti.com"
 <rogerq@ti.com>, "ladis@linux-mips.org" <ladis@linux-mips.org>,
 "ada@thorsis.com" <ada@thorsis.com>, "honghui.zhang@mediatek.com"
 <honghui.zhang@mediatek.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>
Subject: Re: [LINUX PATCH v9 1/4] Devicetree: Add pl353 smc controller
 devicetree binding information
Message-ID: <20180608092342.2b589cc5@xps13>
In-Reply-To: <MWHPR02MB2623AA49F71D3D24B997C682AF7B0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1528271382-21690-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1528271382-21690-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180607174203.035f187d@xps13>
 <MWHPR02MB2623AA49F71D3D24B997C682AF7B0@MWHPR02MB2623.namprd02.prod.outlook.com>
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

On Fri, 8 Jun 2018 05:20:33 +0000, Naga Sureshkumar Relli
<nagasure@xilinx.com> wrote:

> Hi Miquel,
>=20
> Thanks for the review.
>=20
> > -----Original Message-----
> > From: Miquel Raynal [mailto:miquel.raynal@bootlin.com]
> > Sent: Thursday, June 7, 2018 9:12 PM
> > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > Cc: boris.brezillon@bootlin.com; richard@nod.at; wmw2@infradead.org;
> > computersforpeace@gmail.com; marek.vasut@gmail.com; f.fainelli@gmail.co=
m;
> > mmayer@broadcom.com; rogerq@ti.com; ladis@linux-mips.org; ada@thorsis.c=
om;
> > honghui.zhang@mediatek.com; linux-mtd@lists.infradead.org; linux-kernel=
@vger.kernel.org;
> > nagasureshkumarrelli@gmail.com
> > Subject: Re: [LINUX PATCH v9 1/4] Devicetree: Add pl353 smc controller =
devicetree
> > binding information
> >=20
> > Hi Naga,
> >=20
> > On Wed, 6 Jun 2018 13:19:39 +0530, Naga Sureshkumar Relli
> > <naga.sureshkumar.relli@xilinx.com> wrote:
> >  =20
> > > Add pl353 static memory controller devicetree binding information.
> > >
> > > Signed-off-by: Naga Sureshkumar Relli
> > > <naga.sureshkumar.relli@xilinx.com>
> > > ---
> > > Changes in v9:
> > >  - Addressed commens given by Randy Dunlap and Miquel Raynal =20
> >=20
> > Can you please be more specific in your next changelog? I don't remembe=
r what I suggested a
> > few months ago :) =20
> Ok, I will update.
>=20
> >  =20
> > > Changes in v8:
> > >  - None
> > > Changes in v7:
> > > - Corrected clocks description
> > > - prefixed '#' for address and size cells Changes in v6:
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
> > >  .../bindings/memory-controllers/pl353-smc.txt      | 53 =20
> > ++++++++++++++++++++++ =20
> > >  1 file changed, 53 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> > > b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> > > new file mode 100644
> > > index 0000000..551e66b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.t
> > > +++ xt
> > > @@ -0,0 +1,53 @@
> > > +Device tree bindings for ARM PL353 static memory controller
> > > +
> > > +PL353 static memory controller supports two kinds of memory
> > > +interfaces.i.e NAND and SRAM/NOR interfaces.
> > > +The actual devices are instantiated from the child nodes of pl353 sm=
c node.
> > > +
> > > +Required properties:
> > > +- compatible		: Should be "arm,pl353-smc-r2p1" =20
> >=20
> > I thing Rob prefers:
> >=20
> > - compatible: Must be one of:
> >   * arm, pl353-smc-r2p1 =20
> Are you suggesting any other compatibles?
> Or just a change from "should be to Must be one of"?
> >  =20

Just the rewording + making it a list in case we need to add new
compatibles in the future.

Thanks,
Miqu=C3=A8l

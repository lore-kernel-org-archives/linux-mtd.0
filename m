Received: from mail-eopbgr690049.outbound.protection.outlook.com
 ([40.107.69.49] helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs2rn-0002fZ-Oh
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 09:22:25 +0000
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
Date: Tue, 21 Aug 2018 09:22:07 +0000
Message-ID: <MWHPR02MB2623E78222225D1CE8167463AF310@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1534511964-20342-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180820143324.61af9027@bbrezillon>
 <MWHPR02MB2623F315C6D4C9775CDA08D8AF310@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20180821075948.28962170@bbrezillon>
In-Reply-To: <20180821075948.28962170@bbrezillon>
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
> Sent: Tuesday, August 21, 2018 11:30 AM
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
> On Tue, 21 Aug 2018 05:47:18 +0000
> Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
>=20
> > > > +Required properties:
> > > > +- compatible:		Should be "xlnx,zynqmp-nand" or "arasan,nfc-v3p10"
> > >
> > > In your example it's not an "or" since both are defined.
> > In our previous discussion
> > (https://lore.kernel.org/patchwork/patch/748901/)
> > We decided to have compatible strings like " compatible =3D "<soc-vendo=
r>,<ip-revision>",
> "arasan,<ip-revision>";"
> > So it should be either of these.
> > so I will write something like below
> > "Possible values are  "xlnx,zynqmp-nand"
> > 			"arasan,nfc-v3p10"
> > And in example I will mention any one compatible.
> > Is it ok?
>=20
> Hm, why do you need arasan,nfc-v3p10 at all if it's supposed to be overlo=
aded by a soc specific
> compat?
Actually we put these compatible strings based on the comments on v7 series=
.
Anyway I will just keep "xlnx,zynqmp-nand" as compatible.
>=20
> > > > +
> > > > +Optional properties:
> > > > +- arasan,has-mdma: Enables DMA support
> > >
> > > Can't you detect that based on the compatible (or thanks to a
> > > register). If it's something you choose when configuring the IP and c=
an't detect at
> runtime I guess it's fine.
> > There is no way to select DMA when configuring the IP.
> > But it has internal DMA and there is a register to select PIO or DMA wh=
ile starting a
> transfer.
> > So if user really don't want DMA, then we will never set DMA in the cod=
e based on DT
> property.
>=20
> If it's a purely SW choice, then is shouldn't be described in the DT.
> You can use a module param, but I'm not even sure why one would want to d=
isable DMA.
UBIFS doesn't work with DMA, hence we are using a DT property to operate th=
e driver in IO.
But as you pointed (use virt_is_valid()), with this we can switch our drive=
r to operate in PIO or DMA.
I will remove this from DT.

Thanks,
Naga Sureshkumar Relli.

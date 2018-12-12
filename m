Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX4PX-0005L8-Od
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2018 13:18:49 +0000
Date: Wed, 12 Dec 2018 14:18:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, "robh@kernel.org"
 <robh@kernel.org>, "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>, Michal Simek
 <michals@xilinx.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20181212141825.69711c57@xps13>
In-Reply-To: <MWHPR02MB2623EDA15BE59304795F3034AFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <MWHPR02MB26234433484426F333E9B60EAFDC0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181118204324.373ca9cc@bbrezillon>
 <MWHPR02MB2623AAEC160F40F061E23194AFD80@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181119090246.49060019@bbrezillon>
 <BN6PR02MB2610C7D048E4A192E041BE14AFD90@BN6PR02MB2610.namprd02.prod.outlook.com>
 <20181120120244.7d2442b5@bbrezillon>
 <20181120133624.3fa4742d@xps13>
 <MWHPR02MB26238A2271B33470ABFA1023AFD40@MWHPR02MB2623.namprd02.prod.outlook.com>
 <MWHPR02MB26239C2B2A7050310BEF1E9CAFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212091135.1d0cc9a6@xps13>
 <MWHPR02MB26236CEF8A2110B20C825198AFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212100931.149b0cac@xps13>
 <MWHPR02MB2623EDA15BE59304795F3034AFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
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

Naga Sureshkumar Relli <nagasure@xilinx.com> wrote on Wed, 12 Dec 2018
13:07:42 +0000:

> Hi Miquel,
>=20
> > -----Original Message-----
> > From: Miquel Raynal [mailto:miquel.raynal@bootlin.com]
> > Sent: Wednesday, December 12, 2018 2:40 PM
> > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > Cc: Boris Brezillon <boris.brezillon@bootlin.com>; robh@kernel.org; ric=
hard@nod.at; linux-
> > kernel@vger.kernel.org; marek.vasut@gmail.com; linux-mtd@lists.infradea=
d.org;
> > nagasuresh12@gmail.com; Michal Simek <michals@xilinx.com>;
> > computersforpeace@gmail.com; dwmw2@infradead.org
> > Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support fo=
r Arasan
> > NAND Flash Controller
> >=20
> > Hi Naga,
> >=20
> > Naga Sureshkumar Relli <nagasure@xilinx.com> wrote on Wed, 12 Dec 2018
> > 09:04:16 +0000:
> >  =20
> > > Hi Miquel,
> > > =20
> > > > -----Original Message-----
> > > > From: Miquel Raynal [mailto:miquel.raynal@bootlin.com]
> > > > Sent: Wednesday, December 12, 2018 1:42 PM
> > > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > > Cc: Boris Brezillon <boris.brezillon@bootlin.com>; robh@kernel.org;
> > > > richard@nod.at; linux- kernel@vger.kernel.org;
> > > > marek.vasut@gmail.com; linux-mtd@lists.infradead.org;
> > > > nagasuresh12@gmail.com; Michal Simek <michals@xilinx.com>;
> > > > computersforpeace@gmail.com; dwmw2@infradead.org
> > > > Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support
> > > > for Arasan NAND Flash Controller
> > > >
> > > > Hi Naga,
> > > >
> > > > Naga Sureshkumar Relli <nagasure@xilinx.com> wrote on Wed, 12 Dec
> > > > 2018
> > > > 05:27:03 +0000:
> > > > =20
> > > > > Hi Boris & Miquel,
> > > > >
> > > > > An update to my comments on thread https://lkml.org/lkml/2018/11/=
15/656.
> > > > > In this I said, will take a default error count value as 16 and
> > > > > during page read, will check the error count Register value with
> > > > > this and if it is equal to or greater than the default count(16) =
then I am checking for =20
> > Erased pages. =20
> > > > > But bit[7:0] in ECC_Error_Count_Register(0x38) will update for ea=
ch error occurred.
> > > > > Link:
> > > > > https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultr
> > > > > ascale- =20
> > > > registers.html and check for NAND module, ECC_Error_Count_Register.=
 =20
> > > > >
> > > > > I mean previously I dependent on Total error count value
> > > > > (bit[16:8]), but we can simply check for bit[7:0] To see the erro=
r occurred or not.
> > > > > I tried with this approach and I don't see any issues with that.
> > > > > I ran ubifs with this and I am able to see the bit[7:0] count is
> > > > > updated for erased page read and then will Use
> > > > > nand_chech_erased_ecc_chunk() to see the =20
> > > > bitflips. =20
> > > > >
> > > > > If it is ok, I will update the driver and will send new patch, but
> > > > > do you have any other =20
> > > > comments on v12?
> > > >
> > > > Is 'nandbiterrs -i' running correctly now? =20
> > > Yes, but with some changes in driver.
> > > I have added the log and changes done in https://lkml.org/lkml/2018/1=
1/23/705. =20
> >=20
> > No, I don't see a working nandbiterrs there, sorry. =20
> The log that I have attached is from mtd_nandbiterrs test
> So as per ARASAN controller ECC mechanism, it will correct upto 24-bit. A=
fter that the test will fail.

There is a distinction between:
1/ The driver fails to correct more than 24-bit and advertise the
   caller that the page read is somehow corrupted.
2/ The driver fails to correct more than 24-bit but does not complain
   about it. In our case, the caller (the test tool) will compare the
   page written and read: if it do not match it means the driver is
   broken because the driver reported a successful operation despite
   the fact that it returned a corrupted page.

You are in the second case, we expect the driver to behave like in 1/.

>=20
> I am running mtd-utils nandbiterr test now. Will let you know once I comp=
leted that.

Yes please, prefer using the userspace tools.


Thanks,
Miqu=C3=A8l

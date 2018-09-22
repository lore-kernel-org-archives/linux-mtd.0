Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3d2p-0002D9-4S
 for linux-mtd@lists.infradead.org; Sat, 22 Sep 2018 08:13:40 +0000
Date: Sat, 22 Sep 2018 10:13:26 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "absahu@codeaurora.org" <absahu@codeaurora.org>, "peterpandong@micron.com"
 <peterpandong@micron.com>, "frieder.schrempf@exceet.de"
 <frieder.schrempf@exceet.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>,
 "nagasureshkumarrelli@gmail.com" <nagasureshkumarrelli@gmail.com>
Subject: Re: [LINUX PATCH v10 2/2] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20180922101326.6f139da2@bbrezillon>
In-Reply-To: <20180922095340.4fe373f8@xps13>
References: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1534511964-20342-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180820184013.57fd7b5c@bbrezillon>
 <MWHPR02MB2623A761C40745AD4AE2A295AF040@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20180922095340.4fe373f8@xps13>
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

On Sat, 22 Sep 2018 09:53:40 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Naga,
>=20
> Naga Sureshkumar Relli <nagasure@xilinx.com> wrote on Tue, 11 Sep 2018
> 05:23:09 +0000:
>=20
> > Hi Boris,
> >  =20
> > > -----Original Message-----
> > > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > > Sent: Monday, August 20, 2018 10:10 PM
> > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > Cc: miquel.raynal@bootlin.com; richard@nod.at; dwmw2@infradead.org;
> > > computersforpeace@gmail.com; marek.vasut@gmail.com; kyungmin.park@sam=
sung.com;
> > > absahu@codeaurora.org; peterpandong@micron.com; frieder.schrempf@exce=
et.de; linux-
> > > mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Michal Simek <=
michals@xilinx.com>;
> > > nagasureshkumarrelli@gmail.com
> > > Subject: Re: [LINUX PATCH v10 2/2] mtd: rawnand: arasan: Add support =
for Arasan NAND
> > > Flash Controller
> > >=20
> > > Hi Naga,
> > >=20
> > > On Fri, 17 Aug 2018 18:49:24 +0530
> > > Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
> > >=20
> > >=20
> > > I haven't finished reviewing the driver but there are still a bunch o=
f things that look strange, for
> > > instance, your ->read/write_page() implementation looks suspicious. L=
et's discuss that before
> > > you send a new version.

Sorry, I've been too busy to finish my review :-/. Please submit the new
version as Miquel suggested.
=20
> > Could you please review the remaining stuff?
> > I have the changes ready with me which will address all your comments g=
iven to this series.
> >=20
> > Thanks,
> > Naga Sureshkumar Relli =20
>=20
> Please submit the new version that is ready, the rest of the review will
> come.
>=20
>=20
> Thanks,
> Miqu=C3=A8l

Received: from mail-sn1nam02on062f.outbound.protection.outlook.com
 ([2a01:111:f400:fe44::62f]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2Bq1-000802-Jj
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2018 08:58:31 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, naga suresh kumar
 <nagasureshkumarrelli@gmail.com>
CC: "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 =?iso-8859-2?Q?Marek_Va=B9ut?= <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [RFC PATCH 0/5] RFC for Zynq QSPI
Date: Tue, 18 Sep 2018 08:58:14 +0000
Message-ID: <MWHPR02MB2623014F6F8E7B8F78952834AF1D0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
 <BY2PR02MB14115B9E46B35A59AC6505D9AFB00@BY2PR02MB1411.namprd02.prod.outlook.com>
 <CALgLF9K=rZxVx_QXvV_LH3OhidTcguZ=K=p=Lf9AfFbk4H+8Zw@mail.gmail.com>
 <20180917170522.0312ae8c@bbrezillon>
 <CALgLF9JVweEcEm6L33HaHp4HtXhmsZL7J5FDe8+O11i0Q1nukg@mail.gmail.com>
 <20180918091712.2f97db80@bbrezillon>
In-Reply-To: <20180918091712.2f97db80@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
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
> Sent: Tuesday, September 18, 2018 12:47 PM
> To: naga suresh kumar <nagasureshkumarrelli@gmail.com>
> Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>; cyrille.pitchen@wedev4u=
.fr; Marek
> Va=B9ut <marek.vasut@gmail.com>; David Woodhouse <dwmw2@infradead.org>; B=
rian
> Norris <computersforpeace@gmail.com>; boris.brezillon@free-electrons.com;=
 linux-
> mtd@lists.infradead.org
> Subject: Re: [RFC PATCH 0/5] RFC for Zynq QSPI
>=20
> Hi Naga,
>=20
> On Tue, 18 Sep 2018 11:26:05 +0530
> naga suresh kumar <nagasureshkumarrelli@gmail.com> wrote:
>=20
> > Hi,
> >
> > Please see my reply inline by prefacing my name, currently i am facing
> > issues with my outlook. the reply looks not good but please don't mind.
>=20
> I do mind. Please find a way to fix that, 'cause I'm pretty sure others w=
ill soon complain about
> that too.
Its working now.
>=20
>=20
> > > > As i said, it needs tweaking the mtd->size and spi read/write addre=
sses.
> > >
> > > Can you elaborate a bit on why you think this is needed? Did you
> > > look at [1]? Maybe it will prevent us from exposing the flash size
> > > at the spi-mem level.
> > > [naga]: some example snippet below
> > >
> > > spi_nor_read () {
> > >
> > >    if (nor->isparallel =3D=3D 1)
> > >
> > >    {
> > >
> > >       offset /=3D 2; //byte stripping will happen here
> > >
> > >        nor->spi->master->flags |=3D SPI_DATA_STRIPE;
> > >
> > >        //By setting this flag even bits of data word located in
> > > lower memory and odd are in upper memory
> > >
> > >    }
> > >
> > >    if (nor->isstacked =3D=3D 1) {
> > >
> > >      stack_shift =3D 1;
> > >
> > >      if (offset >=3D (mtd->size / 2)) {
> > >
> > >      offset =3D offset - (mtd->size / 2);
> > >
> > >      nor->spi->master->flags |=3D SPI_MASTER_U_PAGE;
> > >
> > >      //We can access Upper memory or lower memory, by setting this
> > > flag in controller.
> > >
> > >   } else {
> > >
> > >         nor->spi->master->flags &=3D ~SPI_MASTER_U_PAGE;
> > >
> > >   }
> > >
> > >  }
> > >
> > > same for spi_nor_write() also.
>=20
> Let's put the stacked and parallel support on the side for now and focus =
on single die/chip
> support. Will find a clean way to handle that afterwards.
Ok
>=20
> > >
> > > Also in both dual parallel and stacked mode mtd->size should be sum
> > > of both flash device sizes
>=20
> Yes, but this information should stay at the spi-nor/mtd level.
>=20
> > >
> > > also status register read will change, it needs status from both devi=
ces.
> > > like that some changes
> > >
> > > will be needed in core.
>=20
> Which is why this needs to be handled in spi-nor.c. The spi-nor core need=
s to know about the
> parallel/stack setup and handle it differently (read both status bytes, r=
ead both IDs, ...).
Ok
>=20
> > > > Can somebody share your thoughts on this(Adding Zynq QSPI Dual
> > > > parallel
> > > and
> > > > stacked)?
> > >
> > > I always have a hard time with this naming. I guess stacked is when
> > > you have 2 chips sharing the same I/O bus, and parallel is when you
> > > have 2 chips with one taking all of the I/O and the other taking the
> > > other half. Is that correct?
> > > [naga]: Yes, you are correct, i have attached the diagrams for these =
mode.
> > >
> > > In parallel mode, with the help of controller STRIPE feature, even
> > > bits of
> > >
> > > data words are located in lower memory and odd bits are located in
> > > upper memory.
> > >
> > > Data management will be taken care by controller in both modes
>=20
> Ok. I need to think about it a bit more. In the meantime, I recommend tha=
t you submit a
> version of the driver that does not support parallel and stacked modes.
Ok sure.

Thanks,
Naga Sureshkumar Relli.
>=20
> Regards,
>=20
> Boris

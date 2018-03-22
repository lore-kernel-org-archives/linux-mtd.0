Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyugv-0003vT-Hw
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2018 07:31:20 +0000
Date: Thu, 22 Mar 2018 08:31:00 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: "nagasureshkumarrelli@gmail.com" <nagasureshkumarrelli@gmail.com>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Michal Simek <michals@xilinx.com>,
 "Punnaiah Choudary Kalluri" <punnaia@xilinx.com>
Subject: Re: [LINUX PATCH v8 1/2] Documentation: nand: pl353: Add
 documentation for controller and driver
Message-ID: <20180322083100.54c67c5f@xps13>
In-Reply-To: <BY2PR02MB1411BBD9FB5D17BB641D2B89AFA90@BY2PR02MB1411.namprd02.prod.outlook.com>
References: <1521024494-30632-1-git-send-email-nagasureshkumarrelli@gmail.com>
 <20180319220811.34a99c3d@xps13>
 <BY2PR02MB1411BBD9FB5D17BB641D2B89AFA90@BY2PR02MB1411.namprd02.prod.outlook.com>
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

I removed linux-kernel from the cc: list (linux-mtd is enough).

> > > +Since the controller expects that the chipselect bit should be
> > > +cleared for the =20
> >=20
> >                                          ^chip select   ^ would? is? =20
> Will correct in next patch.
> >  =20
> > > +last data transfer i.e last 4 data bytes, the existing nandbase page=
 =20
> >=20
> > What is nandbase? =20
> It is just nand page read/write, I will correct it,
> >  =20
> > > +read/write routines for soft ecc and ecc none modes will not work.
> > > +So, inorder =20
> >=20
> > s/ecc/ECC/                                                   in order^
> >  =20
> > > +to make this driver work, it always updates the ecc mode as HW ECC
> > > +and can =20
> >=20
> > s/ecc/ECC/ =20
> I will update.
> >  =20
> > > +implemented the page read/write functions for supporting the SW ECC.=
 =20
> >=20
> > s/can implemented/implements/? =20
> Will correct in next patch.
>=20
> >=20
> > I don't understand this paragraph, can you explain it please? I am not =
sure to
> > understand the limitation nor how you address it. =20
> There is a limitation in SMC, that we must set ECC LAST on last data phas=
e access,=20
> to tell ECC block not to expect any data further.
> Ex:  When number of ECC STEP are 4, then till 3 we will write to flash us=
ing SMC with HW ECC enabled.
> And for the last ECC STEP, we will subtract 4bytes from page size, and wi=
ll initiate a transfer.
> And the remaining 4 as one more transfer with ECC_LAST bit set in NAND Da=
ta phase register to notify
> ECC block not to expect any more data. The last block should be align wit=
h end of 512 byte block.
> Because of this limitation, we are not using core routines.

This is way more understandable, thanks. Can you adapt this
explanation into the documentation?

Otherwise I am still not convinced that you need special handlers for
SW ECC nor raw page accessors as they don't toggle the ECC/ECC_LAST bit
set, so please try to remove them from both the documentation and the
code.

> >  =20
> > > +
> > > +HW ECC mode:
> > > +	Upto 2K page size is supported and beyond that it retuns -ENOSUPPORT
> > > +error. If the flsh has ONDIE ecc controller then the =20
> >=20
> >     ^ -ENOTSUPP              ^flash   ^on-die ECC
> >  =20
> Will correct in next patch.
> > > +priority has given to the ONDIE ecc controller. Also the current =20
> >=20
> >             ^ is given?      ^on-die ECC
> >  =20
> Will correct in next patch.
> > > +implementation has support for upto 64 byte oob area =20
> >=20
> >                                   ^up to 64 bytes of OOB data.
> >  =20
> Will correct in next patch.
> > > +
> > > +SW ECC mode:
> > > +	It supports all the pgae sizes. But since, zynq soc bootrom uses =20
> >=20
> >                             ^ page                 ^Zync SOC
> >  =20
> Will correct in next patch.
> > > +HW ECC for the devices that have pgae size <=3D2K so, to avoid any e=
cc
> > > +related =20
> >=20
> >                                     ^ page <=3D 2K,               ECC^
> >  =20
> Will correct in next patch.
> > > +issues during boot, prefer HW ECC over SW ECC. =20
> >=20
> > I suppose this means that if no ECC mode is given ie. no nand-ecc-mode =
in the
> > DT, the driver will use HW ECC by default, right? =20
> Yes.

Then can you reword to make it clearer? I think you can drop the
"issues during boot" argument and stick to something simple like "When
the kernel is not aware of the ECC mode, use HW ECC by default.

> >  =20
> > > +
> > > +For devicetree binding information please refer the below dt binding
> > > +file Documentation/devicetree/bindings/memory-controllers/pl353-smc.=
txt. =20
> >=20
> > This file does not exist in my tree. =20
> Actually this driver has dependency with SMC driver.
> Recently I sent one more patch series, there we will find all these.
> This is for drivers/memory/
> Since SMC controller has two interfaces, Nand and Nor.
> So we have two drivers, one main driver is SMC and the second is NAND dri=
ver.
> https://www.spinics.net/lists/kernel/msg2748832.html
> https://www.spinics.net/lists/kernel/msg2748834.html
> https://www.spinics.net/lists/kernel/msg2748840.html

Ok, thanks for pointing the links.

>=20
> >=20
> >=20
> > Thanks for contributing this driver,
> > Miqu=C3=A8l
> >=20
> > --
> > Miquel Raynal, Bootlin (formerly Free Electrons) Embedded Linux and Ker=
nel
> > engineering https://bootlin.com =20
>=20
> Thanks,
> Naga Sureshkumar Relli.



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

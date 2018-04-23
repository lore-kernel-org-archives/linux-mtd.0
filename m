Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAVXq-0008SL-9l
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 07:05:52 +0000
Date: Mon, 23 Apr 2018 09:05:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Archit Taneja
 <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/9] mtd: nand: qcom: use the ecc strength from device
 parameter
Message-ID: <20180423090528.6e9d8b9c@xps13>
In-Reply-To: <689fa334d7105e251463e58e1aef3ec8@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-2-git-send-email-absahu@codeaurora.org>
 <20180406143133.67f33d33@xps13>
 <23c8330d00d4d9b62c4c1ab597cbb22b@codeaurora.org>
 <20180410094657.63ac7ec9@xps13> <20180410095558.34c4d91f@xps13>
 <20180410100745.625d66f8@bbrezillon>
 <c1cb40d0d24e50657308a40bb8398d35@codeaurora.org>
 <20180422183440.3ce7e7aa@xps13>
 <689fa334d7105e251463e58e1aef3ec8@codeaurora.org>
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

Hi Abhishek,

Reduced the cc: list.

On Mon, 23 Apr 2018 12:14:32 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-04-22 22:04, Miquel Raynal wrote:
> > Hi Abhishek, =20
> > > On Thu, 12 Apr 2018 15:29:48 +0530, Abhishek Sahu =20
> > <absahu@codeaurora.org> wrote: =20
> > >> On 2018-04-10 13:37, Boris Brezillon wrote:
> >> > On Tue, 10 Apr 2018 09:55:58 +0200
> >> > Miquel Raynal <miquel.raynal@bootlin.com> wrote: =20
> >> > >> > Hi Abhishek, =20
> >> >> >
> >> >> > On Tue, 10 Apr 2018 11:39:35 +0530, Abhishek Sahu
> >> >> > <absahu@codeaurora.org> wrote:
> >> >> > =20
> >> >> > > On 2018-04-06 18:01, Miquel Raynal wrote: =20
> >> >> > > > Hi Abhishek,
> >> >> > > >
> >> >> > > > On Wed,  4 Apr 2018 18:12:17 +0530, Abhishek Sahu
> >> >> > > > <absahu@codeaurora.org> wrote:
> >> >> > > > =20
> >> >> > > >> Currently the driver uses the ECC strength specified in
> >> >> > > >> device tree. The ONFI or JEDEC device parameter page
> >> >> > > >> contains the =E2=80=98ECC correctability=E2=80=99 field whic=
h indicates the
> >> >> > > >> number of bits that the host should be able to correct per
> >> >> > > >> 512 bytes of data. =20
> >> >> > > >
> >> >> > > > This is misleading. This field is not about the controller bu=
t rather
> >> >> > > > the chip requirements in terms of minimal strength for nomina=
l use.
> >> >> > > > =20
> >> >> > >
> >> >> > >   Thanks Miquel.
> >> >> > >
> >> >> > >   Yes. Its NAND chip requirement. I have used the description f=
or
> >> >> > >   NAND ONFI param page
> >> >> > >
> >> >> > >   5.6.1.24. Byte 112: Number of bits ECC correctability
> >> >> > >   This field indicates the number of bits that the host should =
be
> >> >> > >   able to correct per 512 bytes of data.
> >> >> > > =20
> >> >> > > >> The ecc correctability is assigned in
> >> >> > > >> chip parameter during device probe time. QPIC/EBI2 NAND
> >> >> > > >> supports 4/8-bit ecc correction. The Same kind of board
> >> >> > > >> can have different NAND parts so use the ecc strength
> >> >> > > >> from device parameter (if its non zero) instead of
> >> >> > > >> device tree. =20
> >> >> > > >
> >> >> > > > That is not what you do.
> >> >> > > >
> >> >> > > > What you do is forcing the strength to be 8-bit per ECC chunk=
 if the
> >> >> > > > NAND chip requires at least 8-bit/chunk strength.
> >> >> > > >
> >> >> > > > The DT property is here to force a strength. Otherwise, Linux=
 will
> >> >> > > > propose to the NAND controller to use the minimum strength re=
quired by
> >> >> > > > the chip (from either the ONFI/JEDEC parameter page or from a=
 static
> >> >> > > > table).
> >> >> > > > =20
> >> >> > >
> >> >> > >   The main problem is that the same kind of boards can have dif=
ferent
> >> >> > >   NAND parts.
> >> >> > >
> >> >> > >   Lets assume, we have following 2 cases.
> >> >> > >
> >> >> > >   1. Non ONFI/JEDEC device for which chip->ecc_strength_ds
> >> >> > >      will be zero. In this case, the ecc->strength from DT
> >> >> > >      will be used =20
> >> >> >
> >> >> > No, the strength from DT will always be used if the property is
> >> >> > present, no matter the type of chip.
> >> >> > =20
> >> >> > >   2. ONFI/JEDEC device for which chip->ecc_strength_ds > 8.
> >> >> > >      Since QCOM nand controller can not support
> >> >> > >      ECC correction greater than 8 bits so we can use 8 bit ECC
> >> >> > >      itself instead of failing NAND boot completely. =20
> >> >> >
> >> >> > I understand that. But this is still not what you do.
> >> >> > =20
> >> >> > > =20
> >> >> > > > IMHO, you have two solutions:
> >> >> > > > 1/ Remove these properties from the board DT (breaks DT backw=
ard
> >> >> > > > compatibility though); =20
> >> >> > >
> >> >> > >   - nand-ecc-strength: This is optional property in nand.txt and
> >> >> > >     Required property in qcom_nandc.txt. =20
> >> >> >
> >> >> > Well, this property is not controller specific but chip specific.=
 The
> >> >> > controller driver does not rely on it, so this property should no=
t be
> >> >> > required.
> >> >> > =20
> >> >> > > We can't remove since
> >> >> > >     if the device is Non ONFI/JEDEC, then ecc strength will come
> >> >> > >     from DT only. =20
> >> >> >
> >> >> > We can remove it and let the core handle this (as this is generic=
 to
> >> >> > all raw NANDs and not specific to this controller driver). Try it=
 out! =20
> >> >>   Thanks Boris and Miquel for your inputs.
> >> >>   Just want to confirm if already its implemented in core layer =20
> >>   or shall I explore regrading this option. =20
> >> >>   I checked by removing this property alone from dtsi and it was =20
> >>   failing with =20
> >> >>   "Driver must set ecc.strength when using hardware ECC"
> >> >>   I checked the code in nand_base.c also but couldn't get =20
> >>   anything related with this.
> > > I don't know exactly what you did but you should have a look at what =
=20
> > lead you to this path:
> > https://elixir.bootlin.com/linux/v4.17-rc1/source/drivers/mtd/nand/raw/=
nand_base.c#L6421
> >  =20
>   Our driver supports both ECC strength 4 bits and 8 bits
>   and normally till now, we need to specify the ecc strength in device tr=
ee.
>=20
>   Now, since same board can have different ECC strength chip so we
>   can't fix the ecc strength in device tree and we need to look
>   the required correction in ONFI param.
>=20
>   We can have some code in generic layer which
>=20
>   1. Provides the way to specify the supported strength in DT by NAND
>      controller (for our case, it is 4 and 8)

This is already the case, right? You use the DT to give the desired
strength. As discussed earlier, let's forget about this option and
focus on 2/ and 3/.

>   2. Read the chip ONFI/JEDEC Param and choose the configure to use
>      controller strength according to its requirement.
>   3. For Non ONFI/JEDEC devices, choose the maximum strength according
>      to OOB bytes.

Both of them are already handled. A lot of controller drivers rely on
this logic already. Remove both ECC strength and size DT properties and
add traces in the core to figure out why it rejected your chip.

We might help you if you provide more information.

Regards,
Miqu=C3=A8l

>=20
>   I just want to check if we have something like this already in place
>   or I can add the same in generic code so that this can be used by
>   other drivers also.
>=20
>   Thanks,
>   Abhishek



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

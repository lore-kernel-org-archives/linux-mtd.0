Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eO2Qd-0000uF-KI
 for linux-mtd@lists.infradead.org; Sun, 10 Dec 2017 14:18:06 +0000
Date: Sun, 10 Dec 2017 15:17:34 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Kasper
 Revsbech (KREV)" <krev@triax.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171210151734.7e1aac59@xps13>
In-Reply-To: <CAAEAJfBGG9wMVGnwSBfgr+tpr_E_weVBqTc=EvDGU6JUQveFQg@mail.gmail.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <CAAEAJfBGG9wMVGnwSBfgr+tpr_E_weVBqTc=EvDGU6JUQveFQg@mail.gmail.com>
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

Hi Ezequiel,

> >> [    2.296924] nand: device found, Manufacturer ID: 0x2c, Chip ID:
> >> 0xda [    2.303311] nand: Micron MT29F2G08ABAEAH4
> >> [    2.307334] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
> >> 2048, OOB size: 64
> >> [    2.314939] pxa3xx-nand f10d0000.flash: ECC strength 16, ECC
> >> step size 2048 =20
> >
> > In theory, Marvell NAND flash controller does support 16-bit
> > strength per 512 bytes over 2048 bytes pages. However, this
> > controller driver (pxa3xx_nand) does not. See [1] for the supported
> > configurations.=20
>=20
> Why do you say the driver does not support it?

My reading of the trace was incomplete as it is mentioned that the
16-bit correction applies on 2kiB chunks (a full page) while I was
referring to 512 bytes chunks.

Protecting 2kiB pages with BCH algorithm may prevent the flip of up to
16 bits per page, which may also be seen as 4 bits per 512 bytes.
Asking for 16-bit strength for 512 bytes (configuration I was referring
to) is supported by the controller but simply not implemented.

However, below code setting up ecc->strength to 16 while ecc_stepsize is
512 is, IMHO, wrong.

>=20
> It's automatically selecting this:
>=20
>         /*
>          * Required ECC: 4-bit correction per 512 bytes
>          * Select: 16-bit correction per 2048 bytes
>          */
>         } else if (strength =3D=3D 4 && ecc_stepsize =3D=3D 512 && page_s=
ize
> =3D=3D 2048) { info->ecc_bch =3D 1;
>                 info->chunk_size =3D 2048;
>                 info->spare_size =3D 32;
>                 info->ecc_size =3D 32;
>                 ecc->mode =3D NAND_ECC_HW;
>                 ecc->size =3D info->chunk_size;
>                 ecc->layout =3D &ecc_layout_2KB_bch4bit;
>                 ecc->strength =3D 16;
>=20
> Otherwise, you would have seen the "ECC strength ... at page size ...
> is not supported"
>=20
> > The ECC strength shown here is probably the best to use with this
> > type of NAND device but I suggest you try with 4b/512B by using
> > these two properties like in [2]:
> >
> >         nand-ecc-strength =3D <4>;
> >         nand-ecc-step-size =3D <512>;
> >
> >
> > Thanks,
> > Miqu=C3=A8l
> >
> > [1]
> > http://elixir.free-electrons.com/linux/v4.14/source/drivers/mtd/nand/px=
a3xx_nand.c#L1575
> >
> > [2]
> > http://elixir.free-electrons.com/linux/v4.14/source/arch/arm/boot/dts/a=
rmada-385-db-ap.dts#L172
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/ =20
>=20
>=20
>=20



--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

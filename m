Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eJxLG-0002yu-1i
 for linux-mtd@lists.infradead.org; Wed, 29 Nov 2017 08:03:40 +0000
Date: Wed, 29 Nov 2017 09:03:05 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: ezequiel.garcia@free-electrons.com, linux-mtd@lists.infradead.org,
 "Kasper Revsbech (KREV)" <krev@triax.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171129090305.0174246d@xps13>
In-Reply-To: <1e2bea86-e429-e3c4-a6e4-c2c82457a061@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <2d491047-cd55-5a0a-83ec-58365f3bf3ff@prevas.dk>
 <20171128150417.17d53b5a@xps13>
 <1e2bea86-e429-e3c4-a6e4-c2c82457a061@prevas.dk>
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

Hi Sean,

> >>>> [=C2=A0=C2=A0=C2=A0 2.314939] pxa3xx-nand f10d0000.flash: ECC streng=
th 16, ECC
> >>>> step size 2048 =20
> >>> In theory, Marvell NAND flash controller does support 16-bit
> >>> strength per 512 bytes over 2048 bytes pages. However, this
> >>> controller driver (pxa3xx_nand) does not. See [1] for the
> >>> supported configurations.
> >>>
> >>> The ECC strength shown here is probably the best to use with this
> >>> type of NAND device but I suggest you try with 4b/512B by using
> >>> these two properties like in [2]:
> >>>
> >>>           nand-ecc-strength =3D <4>;
> >>>           nand-ecc-step-size =3D <512>; =20
> >> My dts iscreated with great inspiration from the
> >> armada-385-dp-ap.dts
> >>
> >> &nand {
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "defaul=
t";
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&nand_pins=
>, <&nand_rb>;
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num-cs =3D <1>;
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nand-on-flash-bbt;
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nand-ecc-strength =3D <4>;
> >>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nand-ecc-step-size =3D <512>;
> >> }; =20
> > Just for testing purpose, could you also put the keep-config and
> > enable-arbiter properties ? =20
> Yes, but i don't think the arbiter have any affect in the nand
> controller. Bit 12 in NDCR register is marked reserved in the
> datasheet.

Be careful with that. I recently enabled 64-bit platforms featuring
this NAND controller. After hours of digging because it was not
working, I set this bit by adding this property like in any other device
tree and it worked. I am not telling that it will solve your issue,
mostly not, but this is something you should be careful about.

> > =20
> >> Why does the driver not set these values? =20
> > Perhaps you can add traces there [3] and see where it fails?
> >
> > [3]
> > http://elixir.free-electrons.com/linux/v4.14/source/drivers/mtd/nand/px=
a3xx_nand.c#L1721 =20
> See here [4] the driver is selecting 16 bit strength when we are=20
> specifying 4 bits in the dts.

That is right.

>=20
> [4]
> http://elixir.free-electrons.com/linux/v4.14/source/drivers/mtd/nand/pxa3=
xx_nand.c#L1595
> >> (I only see the timeouts if I remove the nand-on-flash-bbt) =20
> > The nand-on-flash-bbt will read some of the last pages in you NAND
> > chip where a bad block table is supposed to be and derive from that
> > whether a block is bad or not. So this does only one read. I guess
> > you should have at least one timeout there? =20
> Maybe, but the flash is fine we are running a rootfs in the NAND chip.

So you can safely use the content of the NAND chip? Without any timeout
neither with reads nor writes? Can you try the mtd-utils from [5]:
nanddump/nandwrite or nandpagetest?

Also, can you isolate the line that produces the timeouts?

[5] http://www.linux-mtd.infradead.org/

>=20
> > Without this property, the NAND core will read every bad block
> > marker (a few bytes at the beginning of the OOB area) and detect if
> > the block was marked bad. Each access seems to produce a timeout,
> > hence the big amount of errors you see. =20
> in the old thread I linked, they had the same issue and like me only=20
> when scanning for
> bad blocks.
>=20
> /Sean

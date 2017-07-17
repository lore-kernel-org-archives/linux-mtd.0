Date: Mon, 17 Jul 2017 19:48:09 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: Yang Wenyou <Wenyou.Yang@atmel.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mtd
 <linux-mtd@lists.infradead.org>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>
Subject: Re: Uncorrectable bitflips with Linux 4.12 on SAMA5D2
Message-ID: <20170717194809.4a080e0c@bbrezillon>
In-Reply-To: <CAMiSF3CtVY7G=ugt-bpsOOMqLcFrmx7hDstUag2_6H-KrN4yBg@mail.gmail.com>
References: <CAMiSF3CtVY7G=ugt-bpsOOMqLcFrmx7hDstUag2_6H-KrN4yBg@mail.gmail.com>
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

+Ludovic, Nicolas and Alexandre

Hi Romain,

Le Mon, 17 Jul 2017 18:11:26 +0200,
Romain Izard <romain.izard.pro@gmail.com> a =C3=A9crit :

> Hello,
>=20
> On a custom board based on Microchip's SAMA5D2 SoC, I am encountering
> ECC problems with the NAND Flash controller. The board is currently
> working with Linux v4.9.x, but it does not with Linux 4.12.
>=20
> Some pages on the NAND Flash memory chip of the device have bitflips.
> With Linux 4.9.x, the bitflips are fixed by the PMECC code, but with
> Linux 4.12, the errors are reported as uncorrectable.
>=20
> From my end, I updated the board's device tree to include the
> sama5d2.dtsi as it exists in Linux 4.12, but the rest of the file is
> the same as for Linux 4.9. From my understanding, it should be
> sufficient as the legacy DTB binding for the NAND controller is
> supported.

I know Ludovic add some problems with the NAND controller on sama5d2,
but it was with the new bindings (see the fixes here [1]).

Your problem seems a bit different since you're using the backward
compat code.

Could you dump PMECC/NFC regs when booting 4.9 and 4.12, and see if
there's a difference?

>=20
> The relevant extract is:
>=20
>         nand0: nand@80000000 {
>             pinctrl-names =3D "default";
>             pinctrl-0 =3D <&pinctrl_nand_default>;
>             status =3D "okay";
>             nand-ecc-mode =3D "hw";
>             atmel,pmecc-cap =3D <8>;
>             atmel,pmecc-sector-size =3D <512>;
>             /delete-property/ atmel,nand-has-dma;
>         };
>=20
> The attached files show the same block read through nanddump, with
> Linux 4.9 and Linux 4.12

Yep, the dumps show 2 identical pages except for the bitflip in ECC
block 2, but I can't tell from this dump why PMECC fails to correct
bitflips.

Really sorry that you have to debug this problem, but I don't have a
sama5d2 platform with a NAND on it and couldn't test my
modification on this platform :-/.

Thanks,

Boris

[1]https://lkml.org/lkml/2017/7/11/95

Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1egWXZ-000766-CH
 for linux-mtd@lists.infradead.org; Tue, 30 Jan 2018 14:05:43 +0000
Date: Tue, 30 Jan 2018 15:05:14 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, MTD Maling List <linux-mtd@lists.infradead.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: MTD_NAND_MARVELL should depend on HAS_DMA
Message-ID: <20180130150514.290bf0e9@xps13>
In-Reply-To: <CAMuHMdVZSBdGxRZfYRaNGH5Aygf3avuCu86dMJ0NsxxVp_yifg@mail.gmail.com>
References: <1517318601-14793-1-git-send-email-geert@linux-m68k.org>
 <20180130144647.73a44b8d@xps13>
 <20180130145626.7a108c64@bbrezillon>
 <CAMuHMdVZSBdGxRZfYRaNGH5Aygf3avuCu86dMJ0NsxxVp_yifg@mail.gmail.com>
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

On Tue, 30 Jan 2018 14:59:37 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> On Tue, Jan 30, 2018 at 2:56 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Tue, 30 Jan 2018 14:46:47 +0100
> > Miquel Raynal <miquel.raynal@free-electrons.com> wrote: =20
> >> On Tue, 30 Jan 2018 14:23:21 +0100
> >> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> =20
> >> > If NO_DMA=3Dy:
> >> >
> >> >     ERROR: "bad_dma_ops" [drivers/mtd/nand/marvell_nand.ko] undefine=
d!
> >> >
> >> > Add a dependency on HAS_DMA to fix this.
> >> >
> >> > Fixes: 02f26ecf8c772751 ("mtd: nand: add reworked Marvell NAND contr=
oller driver")
> >> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >> > ---
> >> >  drivers/mtd/nand/Kconfig | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> >> > index e6b8c59f2c0da7c0..736ac887303c88ba 100644
> >> > --- a/drivers/mtd/nand/Kconfig
> >> > +++ b/drivers/mtd/nand/Kconfig
> >> > @@ -328,7 +328,7 @@ config MTD_NAND_MARVELL
> >> >     tristate "NAND controller support on Marvell boards"
> >> >     depends on PXA3xx || ARCH_MMP || PLAT_ORION || ARCH_MVEBU || \
> >> >                COMPILE_TEST
> >> > -   depends on HAS_IOMEM
> >> > +   depends on HAS_IOMEM && HAS_DMA =20
> >>
> >> I think this is more a coding issue than a Kconfig issue. AFAIR, none
> >> of the ARCH_MVEBU SoCs use DMA in conjunction with the NAND controller.
> >> PXA SoCs may use DMA (NFCv1 only) but this is not a hard requirement a=
nd
> >> the driver is supposed to support PIO mode in all situations.
> >>
> >> Can you please share your setup, the SoC, the configuration,
> >> maybe also the DT? =20
> >
> > I don't think Geert is testing on a real board. He's just enabling
> > COMPILE_TEST and can then select your driver. Which means you really
> > need this depends on HAS_DMA. =20
>=20
> Correct.

My bad.

Ok then, it looks like this is the right fix.

Thanks Geert for reporting it.
Miqu=C3=A8l

>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds



--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

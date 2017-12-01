Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKgUL-0005Id-BA
 for linux-mtd@lists.infradead.org; Fri, 01 Dec 2017 08:16:03 +0000
Date: Fri, 1 Dec 2017 09:15:39 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171201091539.5d6b7572@xps13>
In-Reply-To: <5bc5d326-af1f-44d2-468a-d211212c4612@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <2d491047-cd55-5a0a-83ec-58365f3bf3ff@prevas.dk>
 <20171128150417.17d53b5a@xps13>
 <1e2bea86-e429-e3c4-a6e4-c2c82457a061@prevas.dk>
 <20171129090305.0174246d@xps13>
 <aeb06060-015e-85b4-5b6d-4427dfd1e11a@prevas.dk>
 <20171130181847.0bbc58b5@xps13>
 <5bc5d326-af1f-44d2-468a-d211212c4612@prevas.dk>
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

> >>>>>> (I only see the timeouts if I remove the nand-on-flash-bbt) =20
> >>>>> The nand-on-flash-bbt will read some of the last pages in you
> >>>>> NAND chip where a bad block table is supposed to be and derive
> >>>>> from that whether a block is bad or not. So this does only one
> >>>>> read. I guess you should have at least one timeout there? =20
> >>>> Maybe, but the flash is fine we are running a rootfs in the NAND
> >>>> chip. =20
> >>> So you can safely use the content of the NAND chip? Without any
> >>> timeout neither with reads nor writes? Can you try the mtd-utils
> >>> from [5]: nanddump/nandwrite or nandpagetest?
> >>>
> >>> Also, can you isolate the line that produces the timeouts?
> >>>
> >>> [5]http://www.linux-mtd.infradead.org/ =20
> >> Yes the NAND chip is working fine and stores our data.
> >>
> >> It is the command NAND_CMD_READOOB that causes it to timeout. =20
> > Ok, I had a look at the nand_cmdfunc() function which is, I suppose,
> > the one that is in use (because you are using 2k pages) but I could
> > not see anything obvious. Is your setup special in some way? =20
> Yes it's nand_cmdfunc()
> No a clean 4.14.0 kernel with a custom dts.
> >
> > Could you enable dynamic debug by adding "#define DEBUG" *before*
> > all #includes at the top of the pxa3xx_nand.c driver? It should
> > display all register accesses. Also, can you read the content of
> > NDCR and NDSR when it timeouts?
> > =20
> [=C2=A0=C2=A0 32.765604] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():=
605=20
> nand_writel(0x1, 0x0028)
> [=C2=A0=C2=A0 32.765609] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():=
625=20
> nand_writel(0xfff, 0x0014)
> [=C2=A0=C2=A0 32.765614] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():=
626=20
> nand_writel(0x0, 0x0000)
> [=C2=A0=C2=A0 32.765620] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():=
627=20
> nand_writel(0xd1078000, 0x0000)

This is a write command request.

> [=C2=A0=C2=A0 32.765627] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():82=
4=20
> nand_readl(0x0014) =3D 0x1
> [=C2=A0=C2=A0 32.765632] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():87=
4=20
> nand_writel(0x1, 0x0014)

The command is ready to be written in NDCB* registers (0x48).

> [=C2=A0=C2=A0 32.765637] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():88=
8=20
> nand_writel(0xd3000, 0x0048)
> [=C2=A0=C2=A0 32.765643] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():88=
9=20
> nand_writel(0x2060000, 0x0048)
> [=C2=A0=C2=A0 32.765648] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():89=
0=20
> nand_writel(0x0, 0x0048)
> [=C2=A0=C2=A0 32.765653] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():89=
4=20
> nand_writel(0x0, 0x0048)

"Command" registers are set:
- READ0/READSTART commands (double byte command)
- 5 address cycles: column is 0, page is 0x206 which is weird if this
  is a READOOB operation, where column should be something like 0x800
  (mtd->writesize).

> [=C2=A0=C2=A0 32.765677] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():82=
4=20
> nand_readl(0x0014) =3D 0x800
> [=C2=A0=C2=A0 32.765682] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():87=
4=20
> nand_writel(0x800, 0x0014)
> [=C2=A0=C2=A0 32.765797] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():82=
4=20
> nand_readl(0x0014) =3D 0x2
> [=C2=A0=C2=A0 32.765886] pxa3xx-nand f10d0000.flash:
> pxa3xx_nand_irq_thread():804 nand_writel(0x6, 0x0014)

Read data request received, the FIFO may be drawn.

> [=C2=A0=C2=A0 32.765893] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():82=
4=20
> nand_readl(0x0014) =3D 0x500
> [=C2=A0=C2=A0 32.765899] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():87=
4=20
> nand_writel(0x500, 0x0014)
> [=C2=A0=C2=A0 32.765950] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():=
609=20
> nand_writel(0x0, 0x0028)
> [=C2=A0=C2=A0 32.765956] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():=
625=20
> nand_writel(0xfff, 0x0014)

Command done received, it means data was read correctly.

And this is the start of another "action".

> [=C2=A0=C2=A0 32.765961] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():=
626=20
> nand_writel(0x0, 0x0000)
> [=C2=A0=C2=A0 32.765966] pxa3xx-nand f10d0000.flash: pxa3xx_nand_start():=
627=20
> nand_writel(0x91078000, 0x0000)
> [=C2=A0=C2=A0 32.765974] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():82=
4=20
> nand_readl(0x0014) =3D 0x1
> [=C2=A0=C2=A0 32.765979] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():87=
4=20
> nand_writel(0x1, 0x0014)

Same as before, command is ready to be written, single difference is
the use of the HW ECC engine. But, a few lines earlier, 0 was written
to NDECCCTRL (0x28), disabling BCH, which is weird because there we
will do an operation under Hamming ECC engine.

> [=C2=A0=C2=A0 32.765984] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():88=
8=20
> nand_writel(0xd3000, 0x0048)
> [=C2=A0=C2=A0 32.765989] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():88=
9=20
> nand_writel(0x2060000, 0x0048)
> [=C2=A0=C2=A0 32.765994] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():89=
0=20
> nand_writel(0x0, 0x0048)
> [=C2=A0=C2=A0 32.766000] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():89=
4=20
> nand_writel(0x0, 0x0048)

Same read operation as before.

> [=C2=A0=C2=A0 32.766022] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():82=
4=20
> nand_readl(0x0014) =3D 0x800
> [=C2=A0=C2=A0 32.766028] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():87=
4=20
> nand_writel(0x800, 0x0014)
> [=C2=A0=C2=A0 32.766143] pxa3xx-nand f10d0000.flash: pxa3xx_nand_irq():82=
4=20
> nand_readl(0x0014) =3D 0x2
> [=C2=A0=C2=A0 32.766233] pxa3xx-nand f10d0000.flash:
> pxa3xx_nand_irq_thread():804 nand_writel(0x6, 0x0014)

Read data request received, I guess there is some ioread32_rep here
which is not traced and finally:

> [=C2=A0=C2=A0 32.970203] pxa3xx-nand f10d0000.flash: Wait time out!!!

Next lines are the error path.

> *[=C2=A0=C2=A0 32.975535] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():=
636=20
> nand_readl(0x0014) =3D 0x0*
> *[=C2=A0=C2=A0 32.975540] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():=
637=20
> nand_readl(0x0000) =3D 0x91078000*
> [=C2=A0=C2=A0 32.975546] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():6=
39=20
> nand_readl(0x0000) =3D 0x91078000
> [=C2=A0=C2=A0 32.975552] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():6=
39=20
> nand_readl(0x0000) =3D 0x91078000
> [=C2=A0=C2=A0 32.975559] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():6=
39=20
> nand_readl(0x0000) =3D 0x91078000
> [=C2=A0=C2=A0 32.975565] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():6=
39=20
> nand_readl(0x0000) =3D 0x91078000
> [=C2=A0=C2=A0 32.975572] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():6=
45=20
> nand_writel(0x81078000, 0x0000)
> [=C2=A0=C2=A0 32.975577] pxa3xx-nand f10d0000.flash: pxa3xx_nand_stop():6=
51=20
> nand_writel(0xfff, 0x0014)
>=20
> I think I got one whole timeout sequence here :-)
> Register 0x0014 is NDSR and reg 0x0000 is NDCR, I have added a read
> of the NDSR register in the pxa3xx_nand_stop routine as highlighted
> above. It pussles me that the nand_start is called two times before
> the timeout, maybe it's okay.

Can you add traces there [1] to see which path is used ?

[1]
http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/pxa3x=
x_nand.c#L669


Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

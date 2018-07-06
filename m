Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbMdv-0002QX-Ds
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 09:03:27 +0000
Date: Fri, 6 Jul 2018 11:02:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Boris Brezillon
 <boris.brezillon@bootlin.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: marvell_nand driver fails to suspend
Message-ID: <20180706110255.5efda048@xps13>
In-Reply-To: <f3373d43-6018-f974-2249-a70bd0e720c3@zonque.org>
References: <68ab4512-58f2-1ade-6754-616de8d8c8d5@zonque.org>
 <9de339a6-01f9-d3a9-0271-f33933ede35b@zonque.org>
 <20180702092014.0006fee0@xps13>
 <01ca9c4b-dc20-47fa-ae3c-983b3f47b28d@zonque.org>
 <20180703090557.0ec5cd20@xps13>
 <98a6c329-d0a4-72c7-bb06-34b80738c475@zonque.org>
 <20180706102740.4e7558a2@xps13>
 <f3373d43-6018-f974-2249-a70bd0e720c3@zonque.org>
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

Hi Daniel,

Daniel Mack <daniel@zonque.org> wrote on Fri, 6 Jul 2018 10:41:35 +0200:

> Hi Miquel,
>=20
> On Friday, July 06, 2018 10:27 AM, Miquel Raynal wrote:
> > Daniel Mack <daniel@zonque.org> wrote on Thu, 5 Jul 2018 10:22:29 =20
> >> I can't easily, because I don't have the individual timing
> >> parameters at hand. I could of course re-engineer them from the
> >> NDTR0/NDTR1 values the bootloader sets, but that would only lead to
> >> these registers being restored to the same value as they currently
> >> have. And as they're read during probe() anyway and re-used in
> >> marvell_nfc_select_chip(), I don't think that's the problem.
> > > I do agree with the second part of your statement. However I don't > =
understand why you talk about re-engineering the timings. =20
>=20
> The timings were calculated when I wrote the bootloader some years back, =
and all I'm saying is that at least for now, the kernel doesn't need to do =
that again. It should instead just take whatever has been provided by the b=
ootloader.
>=20
> > This > "keep-config" DT property was just an ugly hack to avoid
> > implementing ->setup_data_interface() and rely on the Bootloader's
> > setup. While this work at the slowest speed, it is clearly not as
> > efficient as tuning the timings at probe time depending on the NAND
> > chip. I recently changed the DT NAND nodes to 1/ separate the
> > controller and the NAND chip and 2/ remove superfluous properties
> > like this one. =20
>=20
> Do you have patches ready for that?

They are in the official tree now, the one I pointed below does this
for armada-38x which is I think the SoC you use?

925d5e426861 ARM: dts: armada-38x: update NAND node with new bindings

>=20
> > If you are against NAND throughput, I suggest you to
> > test without it :) =20
>=20
> I have no problem adding the timing properties to DT,

I do :)

> but I don't expect that to improve the throughput. The bootloader is spec=
ifically written for this board, and it has optimized timing values already.

Ok, that was just an FYI.

>=20
> >> /* * Do not change the timing registers when using the DT property >> =
* marvell,nand-keep-config; in that case ->ndtr0 and ->ndtr1 from
> >> the * marvell_nand structure are supposedly empty. */ >> writel_relaxe=
d(marvell_nand->ndtr0, nfc->regs + NDTR0); >> writel_relaxed(marvell_nand->=
ndtr1, nfc->regs + NDTR1);
> > > This comment should not be there anymore. The logic described in the =
> first sentence is true and already handled in =20
> > marvell_nand_chip_init(). But at any moment ->ndtr[0|1] are clearly
> > not supposed to be empty (anymore). =20
>=20
> But it's okay to write them here, that's what you're saying?

It's not just "ok", it's needed!

BTW, when I say "->ndtr[0|1]" I mean "the ndtr fields in the driver
structure", not "the physical registers".

> For the resume case, this is actually exactly what's needed, as the NDTR =
registers contents are lost in low-power mode.

The way you handle the timings looks good. Having selected_chip to
NULL will force the next call of ->select_chip() (done by the core,
please check this happens with a printk) to rewrite the NDTR registers
with valid saved values.

>=20
> [...]
>=20
> >> The controller loses all its state after resume, but I don't see
> >> which register is not re-initialized after that, but I might miss
> >> something.
> > > I suppose you are good with the above hooks.
> > > Maybe you can add traces in the IRQ handler and also dump NDSR on > t=
imeout. Let's check: - If the IRQ is fired or not - If the right bit =20
> > is set or not =20
>=20
> Yes, I did that, and the ISR is never entered after resume.

Is the interrupt bit really enabled and the RB bit set or not on
timeout? Can you dump NDCR and NDSR for that purpose?

>=20
> > If it worked with the pxa3xx_nand.c driver, then it's probably a
> > driver issue... Can you test with the pxa3xx_nand.c driver with the
> > same kernel version? =20
>=20
> That's be my next attempt, yes. Thanks for pointing me to the right commi=
ts :)
>=20
> > I have some platforms with such controller but I never used > suspend/r=
esume on them, I'll have to check. =20
>=20
> It would be interesting to see if this works on other platforms, yes.
>=20
>=20
> Thanks,
> Daniel
>=20

Thanks,
Miqu=C3=A8l

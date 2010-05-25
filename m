From: Marek Vasut <marek.vasut@gmail.com>
To: Mike Rapoport <mike@compulab.co.il>
Subject: Re: [PATCH 01/20] mtd: pxa3xx_nand: refuse the flash definition get
	from platform
Date: Tue, 25 May 2010 14:18:21 +0200
References: <AANLkTinVBXhT77Zd-LNpufgJAl7WZdic0oxDFwvNkvJg@mail.gmail.com>
	<AANLkTil1mq5FBePSexz80DyT80DGqshqyJEi6Pfp0kV7@mail.gmail.com>
	<4BFBA4BA.9020502@compulab.co.il>
In-Reply-To: <4BFBA4BA.9020502@compulab.co.il>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201005251418.21630.marek.vasut@gmail.com>
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, Lei Wen <adrian.wenl@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dne =C3=9At 25. kv=C4=9Btna 2010 12:21:46 Mike Rapoport napsal(a):
> Lei Wen wrote:
> > On Mon, May 24, 2010 at 9:21 PM, Mike Rapoport <mike@compulab.co.il> wr=
ote:
> >> Lei Wen wrote:
> >>> Hi Mike,
> >>>=20
> >>> On Mon, May 24, 2010 at 7:00 PM, Mike Rapoport <mike@compulab.co.il>
> >>>=20
> >>> wrote:
> >>>> Hi Lei,
> >>>>=20
> >>>> Lei Wen wrote:
> >>>>> Hi Mike,
> >>>>=20
> >>>> 2) I don't like hadrcoding of NAND parameters into the driver. You
> >>>> remove *deprecetad* CONFIG_MTD_NAND_PXA3xx_BUILTIN configuration
> >>>> option and instead
> >>>> you enforce use of built-in definitions. The driver in its current
> >>>> state is
> >>>> robust enough to allow platforms to define optimized NAND timings
> >>>> either in
> >>>> the bootloader or in the kernel. If you don't like that multiple
> >>>> platforms
> >>>> define the same flash chip create an enumeration of built-in types a=
nd
> >>>> let
> >>>> platforms to use this enumeration to select the NAND chip. But,
> >>>> anyway, there should be a fallback mode that will support NAND chips
> >>>> that are not defined in the driver, probably with suboptimal timings.
> >>>=20
> >>> Original driver also use hardcoding. And in bootloader, this timing
> >>> parameter is also hard coding.
> >>> We cannot deduce a parameter set only from the nand id, that is why we
> >>> need a table to preset it.
> >>> If one nand chip is not listed in that table, the chip id would still
> >>> be printed out, so that we can do something for that.
> >>> If we encourage people to continue on this, we would not able to
> >>> really "driver" that nand.
> >>=20
> >> Currently pxa3xx-nand has three operational modes:
> >> - use NAND parameters supplied by the platform
> >> - use presets configured by the bootloader chain
> >> - use built-in NAND parameters, marked as deprecated in favor of the
> >> first two
> >> You remove the first two modes completely and require that each and
> >> every NAND chip used on pxa3xx based platform will be added to the
> >> driver. This way you make the driver less robust and harder to use for
> >> platform developers, not mentioning you're breaking the existing
> >> platforms. In my opinion, the driver *may* support built-in definitions
> >> for certain NAND flashes and *must* support configuration of the NAND
> >> parameters by the platform code and bootloader.
> >=20
> > Hi Mike,
> >=20
> > Well... I would submit another patch set which would reserve a way
> > that platform could pass its parameter setting.
> > Like specify the certain type of nand chip parameter for each chip
> > select. Is that ok for you?
> >=20
> > For bootloader pass parameter method, I think this way should be
> > dropped... For there is attributed which we could not tell from
> > registers...
> > What do you think of this?
>=20
> Can you please elaborate what are the attributes that cannot be detected?

MFPR drive strength maybe ? That's none of kernel's concern (as of now).
>=20
> > Thanks,
> > Lei

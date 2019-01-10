Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghVv0-0002Rj-AR
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2019 08:42:27 +0000
Date: Thu, 10 Jan 2019 09:42:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: rawnand: fsmc: Keep bank enable bit set
Message-ID: <20190110094223.2537527c@xps13>
In-Reply-To: <20190109231259.1ef5d31a@bbrezillon>
References: <20190109215144.15749-1-linus.walleij@linaro.org>
 <20190109231259.1ef5d31a@bbrezillon>
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

Hi Linus,

Please don't forget to Cc: me when it comes to NAND-related changes :)

Boris Brezillon <bbrezillon@kernel.org> wrote on Wed, 9 Jan 2019
23:12:59 +0100:

> On Wed,  9 Jan 2019 22:51:44 +0100
> Linus Walleij <linus.walleij@linaro.org> wrote:
>=20
> > Hammering the "bank enable" (PBKEN) bit on and off between
> > every command crashes the Nomadik NHK15 with this message:
> >=20
> > Scanning device for bad blocks
> > Unhandled fault: external abort on non-linefetch (0x008) at 0xcc95e000
> > pgd =3D (ptrval)
> > [cc95e000] *pgd=3D0b808811, *pte=3D40000653, *ppte=3D40000552
> > Internal error: : 8 [#1] PREEMPT ARM
> > Modules linked in:
> > CPU: 0 PID: 1 Comm: swapper Not tainted 4.20.0-rc2+ #72
> > Hardware name: Nomadik STn8815
> > PC is at fsmc_exec_op+0x194/0x204
> > (...)
> >=20
> > After a discussion we (me and Boris Brezillion) start to suspect =20
>=20
> 				      ^ Brezillon :-)
>=20
> > that this bit does not immediately control the chip select line
> > at all, it rather enables access to the bank and the hardware
> > will drive the CS autonomously. If there is a NAND chip connected,
> > we should keep this enabled.
> >=20
> > As fsmc_nand_setup() sets this bit, we can simply remove the
> > offending code.
> >=20
> > Fixes: 550b9fc4e3af ("mtd: rawnand: fsmc: Stop implementing ->select_ch=
ip()")
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org> =20
>=20
> Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
>=20
> Would be great if someone could validate our assumption with a scope.
> This being said, given the description of the FSMC logic, I have little
> doubt that this bit does not directly controls the CE line, otherwise
> concurrent accesses to different memories on the same bus wouldn't work
> or would require a lot more synchronization than we currently have in
> Linux.
>=20

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miqu=C3=A8l

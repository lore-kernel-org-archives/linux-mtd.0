Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gV02M-00083z-LB
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2018 20:14:20 +0000
Date: Thu, 6 Dec 2018 21:14:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: boris.brezillon@bootlin.com, jmkrzyszt@gmail.com, Stefan Agner
 <stefan@agner.ch>, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG BISECT] Missing MTD NAND partitions - mtd: rawnand: Move
 the ->exec_op() method to nand_controller_ops
Message-ID: <20181206211404.39cfe07c@xps13>
In-Reply-To: <CAJKOXPepDpdhz2yPmdBMcncJ8noRdNTyXqP6WbUZR4Cf=BnEFA@mail.gmail.com>
References: <CAJKOXPdPnha1-1dCRFaPZ-CGzS1OzNcFrxuOJmWstHJcRAMZwg@mail.gmail.com>
 <20181120113326.0d4f061e@xps13>
 <CAJKOXPcrVXdCXqmxffJca7HfEV3G3agkzjWu1rfsNDDbMzc_XQ@mail.gmail.com>
 <20181120130859.78d53da3@bbrezillon>
 <CAJKOXPfgyw9tFTC=eZFVHz8us1+6RxEcnmLUi-umO2+N9vRzDg@mail.gmail.com>
 <CAJKOXPepDpdhz2yPmdBMcncJ8noRdNTyXqP6WbUZR4Cf=BnEFA@mail.gmail.com>
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

Hi Krzysztof,

Krzysztof Kozlowski <krzk@kernel.org> wrote on Wed, 5 Dec 2018 17:10:38
+0100:

> On Tue, 20 Nov 2018 at 13:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Tue, 20 Nov 2018 at 13:09, Boris Brezillon
> > <boris.brezillon@bootlin.com> wrote: =20
> > >
> > > On Tue, 20 Nov 2018 12:48:46 +0100
> > > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > =20
> > > > On Tue, 20 Nov 2018 at 11:33, Miquel Raynal <miquel.raynal@bootlin.=
com> wrote: =20
> > > > >
> > > > > Hi Krzysztof,
> > > > >
> > > > > Krzysztof Koz=C5=82owski <k.kozlowski.k@gmail.com> wrote on Tue, =
20 Nov 2018
> > > > > 10:46:33 +0100:
> > > > > =20
> > > > > > Hi all,
> > > > > >
> > > > > > Since few days linux-next has problem on Freescale VF500 - MTD =
seems
> > > > > > to be broken.
> > > > > >
> > > > > > Bisect pointed me to commit 7c27338c728e39ef47c83d101959aa33250=
6969d
> > > > > > ("mtd: rawnand: Move the ->exec_op() method to nand_controller_=
ops")
> > > > > > as reason of failure to find MTD partitions.
> > > > > >
> > > > > > Toradex Colibri VF50 on Iris board (ARMv7, UP, Cortext-A5, NXP =
VF500,
> > > > > > 128 MB RAM, 128 MB NAND, Systemd: v232) booted from NFS root (N=
FSv4)
> > > > > > trying to mount UBIFS from NAND/MTD. Board uses VF610 NAND driv=
er.
> > > > > >
> > > > > > The MTD partitions are missing entirely (nothing under /dev/mtd=
).
> > > > > > In the logs you can also see:
> > > > > > [    1.232161] UBI error: cannot open mtd ubi2, error -2
> > > > > >
> > > > > > Attached - dmesg.log
> > > > > >
> > > > > > Let me know if you need defconfig or any other information. =20
> > > > >
> > > > > Thank you very much for testing and reporting the bug!
> > > > >
> > > > > Could you please test with this diff applied [1] please? We discu=
ssed
> > > > > with Boris and we think it should fix your setup (and all others =
also
> > > > > impacted).
> > > > >
> > > > > [1] http://code.bulix.org/r1m99i-509201 =20
> > > >
> > > > error: patch failed: drivers/mtd/nand/raw/nand_base.c:4399
> > > > error: drivers/mtd/nand/raw/nand_base.c: patch does not apply
> > > >
> > > > Maybe you have a git tree with this somewhere? =20
> > >
> > > Yep: https://github.com/bbrezillon/linux/tree/nand/next-fix =20
> >
> > Works fine now, thanks!
> > Tested-by: Krzysztof Kozlowski <krzk@kernel.org> =20
>=20
> Although the patch fixed the issue... but it seems it is not in
> linux-next. The next is broken since almost two weeks.
>=20
> Best regards,
> Krzysztof

Sorry for the huge delay, fixup applied.


Thanks,
Miqu=C3=A8l
=09

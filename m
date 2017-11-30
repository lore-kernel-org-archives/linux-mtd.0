Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKPDA-00082C-5C
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 13:49:09 +0000
Date: Thu, 30 Nov 2017 14:48:39 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 Antoine Tenart <antoine.tenart@free-electrons.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Stefan Agner <stefan@agner.ch>, Wenyou Yang
 <wenyou.yang@atmel.com>, Nadav Haklai <nadavh@marvell.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Rob Herring
 <robh+dt@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Ezequiel
 Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Han Xu <han.xu@nxp.com>, Brian Norris
 <computersforpeace@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Josh Wu <rainyfeeling@outlook.com>
Subject: Re: [RFC PATCH v2 1/6] mtd: nand: provide several helpers to do
 common NAND operations
Message-ID: <20171130144839.08b8b7ce@xps13>
In-Reply-To: <CAK7LNARFHqg+EE6m0pxx7Pbs+p-w+W0MMtu4kgXLNBhfeycXVA@mail.gmail.com>
References: <20171107145419.22717-1-miquel.raynal@free-electrons.com>
 <20171107145419.22717-2-miquel.raynal@free-electrons.com>
 <CAK7LNATWXZci_M8EqeU-8KSEviWzAT7p1KSdkuqAkSAuj-Zj6w@mail.gmail.com>
 <20171130091831.06781ce2@bbrezillon>
 <CAK7LNARFHqg+EE6m0pxx7Pbs+p-w+W0MMtu4kgXLNBhfeycXVA@mail.gmail.com>
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

Hi Sean, Boris,

> >> Theoretically, there could be three cases:
> >>   [1] INTR__ERASE_COMP interrupt is asserted
> >>   [2] INTR__ERASE_FAIL interrupt is asserted
> >>   [3] Nothing is asserted (bailout by timeout) =20
> >
> > Well, ideally we should have something like:
> >
> >         if (irq_status & INTR__ERASE_COMP)
> >                 return 0;
> >         else if (irq_status & INTR__ERASE_FAIL)
> >                 return -EIO;
> >
> >         return -ETIMEDOUT;
> >
> > But let's keep the existing behavior (return -EIO in case of
> > timeout).=20
>=20
>=20
> I agree with this change,
> but it should also be done in a separate work.
>=20
>=20

Ok, I will stick to Boris' first solution and put this aside.

Patches will come very soon.

Thank you both,
Miqu=C3=A8l
